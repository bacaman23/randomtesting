local StrToNumber = tonumber;
local Byte = string.byte;
local Char = string.char;
local Sub = string.sub;
local Subg = string.gsub;
local Rep = string.rep;
local Concat = table.concat;
local Insert = table.insert;
local LDExp = math.ldexp;
local GetFEnv = getfenv or function()
	return _ENV;
end;
local Setmetatable = setmetatable;
local PCall = pcall;
local Select = select;
local Unpack = unpack or table.unpack;
local ToNumber = tonumber;
local function AA(ByteString, vmenv, ...)
	local DIP = 1;
	local repeatNext;
	ByteString = Subg(Sub(ByteString, 5), "..", function(byte)
		if (Byte(byte, 2) == 79) then
			repeatNext = StrToNumber(Sub(byte, 1, 1));
			return "";
		else
			local a = Char(StrToNumber(byte, 16));
			if repeatNext then
				local b = Rep(a, repeatNext);
				repeatNext = nil;
				return b;
			else
				return a;
			end
		end
	end);
	local function gBit(Bit, Start, End)
		if End then
			local Res = (Bit / (2 ^ (Start - 1))) % (2 ^ (((End - 1) - (Start - 1)) + 1));
			return Res - (Res % 1);
		else
			local Plc = 2 ^ (Start - 1);
			return (((Bit % (Plc + Plc)) >= Plc) and 1) or 0;
		end
	end
	local function gBits8()
		local a = Byte(ByteString, DIP, DIP);
		DIP = DIP + 1;
		return a;
	end
	local function gBits16()
		local a, b = Byte(ByteString, DIP, DIP + 2);
		DIP = DIP + 2;
		return (b * 256) + a;
	end
	local function gBits32()
		local a, b, c, d = Byte(ByteString, DIP, DIP + 3);
		DIP = DIP + 4;
		return (d * 16777216) + (c * 65536) + (b * 256) + a;
	end
	local function gFloat()
		local Left = gBits32();
		local Right = gBits32();
		local IsNormal = 1;
		local Mantissa = (gBit(Right, 1, 20) * (2 ^ 32)) + Left;
		local Exponent = gBit(Right, 21, 31);
		local Sign = ((gBit(Right, 32) == 1) and -1) or 1;
		if (Exponent == 0) then
			if (Mantissa == 0) then
				return Sign * 0;
			else
				Exponent = 1;
				IsNormal = 0;
			end
		elseif (Exponent == 2047) then
			return ((Mantissa == 0) and (Sign * (1 / 0))) or (Sign * NaN);
		end
		return LDExp(Sign, Exponent - 1023) * (IsNormal + (Mantissa / (2 ^ 52)));
	end
	local function gString(Len)
		local Str;
		if not Len then
			Len = gBits32();
			if (Len == 0) then
				return "";
			end
		end
		Str = Sub(ByteString, DIP, (DIP + Len) - 1);
		DIP = DIP + Len;
		local FStr = {};
		for Idx = 1, #Str do
			FStr[Idx] = Char(Byte(Sub(Str, Idx, Idx)));
		end
		return Concat(FStr);
	end
	local gInt = gBits32;
	local function _R(...)
		return {...}, Select("#", ...);
	end
	local function Deserialize()
		local Instrs = {};
		local Functions = {};
		local Lines = {};
		local Chunk = {Instrs,Functions,nil,Lines};
		local ConstCount = gBits32();
		local Consts = {};
		for Idx = 1, ConstCount do
			local Type = gBits8();
			local Cons;
			if (Type == 1) then
				Cons = gBits8() ~= 0;
			elseif (Type == 2) then
				Cons = gFloat();
			elseif (Type == 3) then
				Cons = gString();
			end
			Consts[Idx] = Cons;
		end
		Chunk[3] = gBits8();
		for Idx = 1, gBits32() do
			local Descriptor = gBits8();
			if (gBit(Descriptor, 1, 1) == 0) then
				local Type = gBit(Descriptor, 2, 3);
				local Mask = gBit(Descriptor, 4, 6);
				local Inst = {gBits16(),gBits16(),nil,nil};
				if (Type == 0) then
					Inst[3] = gBits16();
					Inst[4] = gBits16();
				elseif (Type == 1) then
					Inst[3] = gBits32();
				elseif (Type == 2) then
					Inst[3] = gBits32() - (2 ^ 16);
				elseif (Type == 3) then
					Inst[3] = gBits32() - (2 ^ 16);
					Inst[4] = gBits16();
				end
				if (gBit(Mask, 1, 1) == 1) then
					Inst[2] = Consts[Inst[2]];
				end
				if (gBit(Mask, 2, 2) == 1) then
					Inst[3] = Consts[Inst[3]];
				end
				if (gBit(Mask, 3, 3) == 1) then
					Inst[4] = Consts[Inst[4]];
				end
				Instrs[Idx] = Inst;
			end
		end
		for Idx = 1, gBits32() do
			Functions[Idx - 1] = Deserialize();
		end
		return Chunk;
	end
	local function Wrap(Chunk, Upvalues, Env)
		local Instr = Chunk[1];
		local Proto = Chunk[2];
		local Params = Chunk[3];
		return function(...)
			local Instr = Instr;
			local Proto = Proto;
			local Params = Params;
			local _R = _R;
			local VIP = 1;
			local Top = -1;
			local Vararg = {};
			local Args = {...};
			local PCount = Select("#", ...) - 1;
			local Lupvals = {};
			local Stk = {};
			for Idx = 0, PCount do
				if (Idx >= Params) then
					Vararg[Idx - Params] = Args[Idx + 1];
				else
					Stk[Idx] = Args[Idx + 1];
				end
			end
			local Varargsz = (PCount - Params) + 1;
			local Inst;
			local Enum;
			while true do
				Inst = Instr[VIP];
				Enum = Inst[1];
				if (Enum <= 35) then
					if (Enum <= 17) then
						if (Enum <= 8) then
							if (Enum <= 3) then
								if (Enum <= 1) then
									if (Enum == 0) then
										local A = Inst[2];
										Stk[A] = Stk[A](Unpack(Stk, A + 1, Inst[3]));
									else
										Stk[Inst[2]] = Stk[Inst[3]] * Stk[Inst[4]];
									end
								elseif (Enum > 2) then
									if (Stk[Inst[2]] == Stk[Inst[4]]) then
										VIP = VIP + 1;
									else
										VIP = Inst[3];
									end
								elseif (Stk[Inst[2]] ~= Inst[4]) then
									VIP = VIP + 1;
								else
									VIP = Inst[3];
								end
							elseif (Enum <= 5) then
								if (Enum == 4) then
									Stk[Inst[2]] = Wrap(Proto[Inst[3]], nil, Env);
								else
									local A = Inst[2];
									local Results, Limit = _R(Stk[A](Unpack(Stk, A + 1, Inst[3])));
									Top = (Limit + A) - 1;
									local Edx = 0;
									for Idx = A, Top do
										Edx = Edx + 1;
										Stk[Idx] = Results[Edx];
									end
								end
							elseif (Enum <= 6) then
								local A = Inst[2];
								Stk[A] = Stk[A](Stk[A + 1]);
							elseif (Enum > 7) then
								local A = Inst[2];
								Stk[A](Stk[A + 1]);
							else
								local A = Inst[2];
								Stk[A] = Stk[A]();
							end
						elseif (Enum <= 12) then
							if (Enum <= 10) then
								if (Enum > 9) then
									local A = Inst[2];
									Stk[A](Unpack(Stk, A + 1, Inst[3]));
								else
									Stk[Inst[2]][Inst[3]] = Inst[4];
								end
							elseif (Enum == 11) then
								do
									return;
								end
							else
								local A = Inst[2];
								Stk[A] = Stk[A](Stk[A + 1]);
							end
						elseif (Enum <= 14) then
							if (Enum == 13) then
								Stk[Inst[2]] = Upvalues[Inst[3]];
							else
								Stk[Inst[2]] = Stk[Inst[3]][Stk[Inst[4]]];
							end
						elseif (Enum <= 15) then
							Env[Inst[3]] = Stk[Inst[2]];
						elseif (Enum == 16) then
							if (Stk[Inst[2]] == Inst[4]) then
								VIP = VIP + 1;
							else
								VIP = Inst[3];
							end
						else
							local A = Inst[2];
							Stk[A] = Stk[A](Unpack(Stk, A + 1, Top));
						end
					elseif (Enum <= 26) then
						if (Enum <= 21) then
							if (Enum <= 19) then
								if (Enum > 18) then
									Upvalues[Inst[3]] = Stk[Inst[2]];
								else
									local A = Inst[2];
									local B = Stk[Inst[3]];
									Stk[A + 1] = B;
									Stk[A] = B[Inst[4]];
								end
							elseif (Enum > 20) then
								local A = Inst[2];
								local C = Inst[4];
								local CB = A + 2;
								local Result = {Stk[A](Stk[A + 1], Stk[CB])};
								for Idx = 1, C do
									Stk[CB + Idx] = Result[Idx];
								end
								local R = Result[1];
								if R then
									Stk[CB] = R;
									VIP = Inst[3];
								else
									VIP = VIP + 1;
								end
							else
								Stk[Inst[2]] = Inst[3];
							end
						elseif (Enum <= 23) then
							if (Enum > 22) then
								Stk[Inst[2]] = Wrap(Proto[Inst[3]], nil, Env);
							else
								local B = Inst[3];
								local K = Stk[B];
								for Idx = B + 1, Inst[4] do
									K = K .. Stk[Idx];
								end
								Stk[Inst[2]] = K;
							end
						elseif (Enum <= 24) then
							local A = Inst[2];
							local Results = {Stk[A](Unpack(Stk, A + 1, Top))};
							local Edx = 0;
							for Idx = A, Inst[4] do
								Edx = Edx + 1;
								Stk[Idx] = Results[Edx];
							end
						elseif (Enum > 25) then
							local A = Inst[2];
							local Results, Limit = _R(Stk[A](Stk[A + 1]));
							Top = (Limit + A) - 1;
							local Edx = 0;
							for Idx = A, Top do
								Edx = Edx + 1;
								Stk[Idx] = Results[Edx];
							end
						else
							for Idx = Inst[2], Inst[3] do
								Stk[Idx] = nil;
							end
						end
					elseif (Enum <= 30) then
						if (Enum <= 28) then
							if (Enum == 27) then
								Stk[Inst[2]] = Env[Inst[3]];
							else
								for Idx = Inst[2], Inst[3] do
									Stk[Idx] = nil;
								end
							end
						elseif (Enum == 29) then
							local A = Inst[2];
							Stk[A] = Stk[A](Unpack(Stk, A + 1, Inst[3]));
						else
							Upvalues[Inst[3]] = Stk[Inst[2]];
						end
					elseif (Enum <= 32) then
						if (Enum == 31) then
							local A = Inst[2];
							local C = Inst[4];
							local CB = A + 2;
							local Result = {Stk[A](Stk[A + 1], Stk[CB])};
							for Idx = 1, C do
								Stk[CB + Idx] = Result[Idx];
							end
							local R = Result[1];
							if R then
								Stk[CB] = R;
								VIP = Inst[3];
							else
								VIP = VIP + 1;
							end
						else
							local A = Inst[2];
							Stk[A] = Stk[A]();
						end
					elseif (Enum <= 33) then
						Env[Inst[3]] = Stk[Inst[2]];
					elseif (Enum > 34) then
						local A = Inst[2];
						Stk[A](Unpack(Stk, A + 1, Top));
					else
						Stk[Inst[2]][Inst[3]] = Stk[Inst[4]];
					end
				elseif (Enum <= 53) then
					if (Enum <= 44) then
						if (Enum <= 39) then
							if (Enum <= 37) then
								if (Enum == 36) then
									do
										return;
									end
								else
									Stk[Inst[2]] = Upvalues[Inst[3]];
								end
							elseif (Enum == 38) then
								Stk[Inst[2]] = Stk[Inst[3]][Stk[Inst[4]]];
							else
								VIP = Inst[3];
							end
						elseif (Enum <= 41) then
							if (Enum > 40) then
								Stk[Inst[2]] = Stk[Inst[3]][Inst[4]];
							else
								local NewProto = Proto[Inst[3]];
								local NewUvals;
								local Indexes = {};
								NewUvals = Setmetatable({}, {__index=function(_, Key)
									local Val = Indexes[Key];
									return Val[1][Val[2]];
								end,__newindex=function(_, Key, Value)
									local Val = Indexes[Key];
									Val[1][Val[2]] = Value;
								end});
								for Idx = 1, Inst[4] do
									VIP = VIP + 1;
									local Mvm = Instr[VIP];
									if (Mvm[1] == 71) then
										Indexes[Idx - 1] = {Stk,Mvm[3]};
									else
										Indexes[Idx - 1] = {Upvalues,Mvm[3]};
									end
									Lupvals[#Lupvals + 1] = Indexes;
								end
								Stk[Inst[2]] = Wrap(NewProto, NewUvals, Env);
							end
						elseif (Enum <= 42) then
							Stk[Inst[2]][Inst[3]] = Stk[Inst[4]];
						elseif (Enum > 43) then
							Stk[Inst[2]] = Stk[Inst[3]][Inst[4]];
						elseif Stk[Inst[2]] then
							VIP = VIP + 1;
						else
							VIP = Inst[3];
						end
					elseif (Enum <= 48) then
						if (Enum <= 46) then
							if (Enum > 45) then
								Stk[Inst[2]] = Inst[3] ~= 0;
							else
								Stk[Inst[2]] = Inst[3] ~= 0;
							end
						elseif (Enum > 47) then
							local A = Inst[2];
							local Results = {Stk[A](Unpack(Stk, A + 1, Top))};
							local Edx = 0;
							for Idx = A, Inst[4] do
								Edx = Edx + 1;
								Stk[Idx] = Results[Edx];
							end
						elseif not Stk[Inst[2]] then
							VIP = VIP + 1;
						else
							VIP = Inst[3];
						end
					elseif (Enum <= 50) then
						if (Enum > 49) then
							if Stk[Inst[2]] then
								VIP = VIP + 1;
							else
								VIP = Inst[3];
							end
						else
							Stk[Inst[2]][Inst[3]] = Inst[4];
						end
					elseif (Enum <= 51) then
						Stk[Inst[2]] = Inst[3];
					elseif (Enum == 52) then
						local A = Inst[2];
						Stk[A](Unpack(Stk, A + 1, Inst[3]));
					else
						VIP = Inst[3];
					end
				elseif (Enum <= 62) then
					if (Enum <= 57) then
						if (Enum <= 55) then
							if (Enum > 54) then
								local A = Inst[2];
								local Results, Limit = _R(Stk[A](Stk[A + 1]));
								Top = (Limit + A) - 1;
								local Edx = 0;
								for Idx = A, Top do
									Edx = Edx + 1;
									Stk[Idx] = Results[Edx];
								end
							elseif (Stk[Inst[2]] == Inst[4]) then
								VIP = VIP + 1;
							else
								VIP = Inst[3];
							end
						elseif (Enum > 56) then
							local A = Inst[2];
							Stk[A] = Stk[A](Unpack(Stk, A + 1, Top));
						else
							local NewProto = Proto[Inst[3]];
							local NewUvals;
							local Indexes = {};
							NewUvals = Setmetatable({}, {__index=function(_, Key)
								local Val = Indexes[Key];
								return Val[1][Val[2]];
							end,__newindex=function(_, Key, Value)
								local Val = Indexes[Key];
								Val[1][Val[2]] = Value;
							end});
							for Idx = 1, Inst[4] do
								VIP = VIP + 1;
								local Mvm = Instr[VIP];
								if (Mvm[1] == 71) then
									Indexes[Idx - 1] = {Stk,Mvm[3]};
								else
									Indexes[Idx - 1] = {Upvalues,Mvm[3]};
								end
								Lupvals[#Lupvals + 1] = Indexes;
							end
							Stk[Inst[2]] = Wrap(NewProto, NewUvals, Env);
						end
					elseif (Enum <= 59) then
						if (Enum > 58) then
							local A = Inst[2];
							local Results, Limit = _R(Stk[A](Unpack(Stk, A + 1, Inst[3])));
							Top = (Limit + A) - 1;
							local Edx = 0;
							for Idx = A, Top do
								Edx = Edx + 1;
								Stk[Idx] = Results[Edx];
							end
						else
							Stk[Inst[2]] = {};
						end
					elseif (Enum <= 60) then
						if (Stk[Inst[2]] == Stk[Inst[4]]) then
							VIP = VIP + 1;
						else
							VIP = Inst[3];
						end
					elseif (Enum > 61) then
						if not Stk[Inst[2]] then
							VIP = VIP + 1;
						else
							VIP = Inst[3];
						end
					else
						Stk[Inst[2]] = {};
					end
				elseif (Enum <= 66) then
					if (Enum <= 64) then
						if (Enum > 63) then
							if (Stk[Inst[2]] ~= Inst[4]) then
								VIP = VIP + 1;
							else
								VIP = Inst[3];
							end
						else
							Stk[Inst[2]] = Stk[Inst[3]];
						end
					elseif (Enum > 65) then
						local A = Inst[2];
						local B = Stk[Inst[3]];
						Stk[A + 1] = B;
						Stk[A] = B[Inst[4]];
					else
						local A = Inst[2];
						Stk[A](Unpack(Stk, A + 1, Top));
					end
				elseif (Enum <= 68) then
					if (Enum == 67) then
						local B = Inst[3];
						local K = Stk[B];
						for Idx = B + 1, Inst[4] do
							K = K .. Stk[Idx];
						end
						Stk[Inst[2]] = K;
					else
						local A = Inst[2];
						Stk[A](Stk[A + 1]);
					end
				elseif (Enum <= 69) then
					Stk[Inst[2]] = Stk[Inst[3]] * Stk[Inst[4]];
				elseif (Enum > 70) then
					Stk[Inst[2]] = Stk[Inst[3]];
				else
					Stk[Inst[2]] = Env[Inst[3]];
				end
				VIP = VIP + 1;
			end
		end;
	end
	return Wrap(Deserialize(), {}, vmenv)(...);
end
return AA("LOL!1F3O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O7470476574033D3O00682O7470733A2O2F7261772E67697468756275736572636F6E74656E742E636F6D2F73686C6578776172652F4F72696F6E2F6D61696E2F736F75726365030A3O004D616B6557696E646F7703043O004E616D65030B3O00546573742D536372697074030A3O0053617665436F6E6669670100030A3O004B69636B506C6179657203073O004D616B655461622O033O004B657903043O0049636F6E03173O00726278612O73657469643A2O2F2O34382O3334352O3938030B3O005072656D69756D4F6E6C79030C3O00506C617965725F5461626C6503053O007061697273030A3O004765745365727669636503073O00506C6179657273030B3O004765744368696C6472656E03053O007461626C6503063O00696E7365727403083O00746F737472696E67030B3O00412O6444726F70646F776E03083O0044726F70646F776E03073O0044656661756C742O033O006E696C03073O004F7074696F6E7303083O0043612O6C6261636B03093O00412O6442752O746F6E03043O006B69636B003C3O0012463O00013O001246000100023O002042000100010003001233000300044O003B000100034O00395O00022O00073O0001000200204200013O00052O003D00033O00020030310003000600070030310003000800094O0001000300022O001C000200023O00020400035O00120F0003000A3O00204200030001000B2O003D00053O000300303100050006000C0030310005000D000E0030310005000F00094O0003000500022O003D00045O00120F000400103O001246000400113O001246000500023O002042000500050012001233000700136O0005000700020020420005000500142O0037000500064O001800043O00060004353O00270001001246000900153O00202C000900090016001246000A00103O001246000B00173O00202C000C000800062O0037000B000C4O002300093O000100061500040020000100020004353O002000010020420004000300182O003D00063O00040030310006000600190030310006001A001B001246000700103O00102A0006001C000700062800070001000100012O00473O00023O00102A0006001D00072O000A00040006000100204200040003001E2O003D00063O000200303100060006001F00062800070002000100022O00473O00024O00477O00102A0006001D00072O000A0004000600012O00243O00013O00033O00313O0003053O00706169727303093O00576F726B7370616365030A3O0050726F70657274696573030B3O004765744368696C6472656E030E3O0046696E6446697273744368696C6403053O004F776E657203053O0056616C756503043O0067616D6503073O00706C6179657273030B3O004C6F63616C506C6179657203043O004E616D65030C3O004F726967696E53717561726503083O00506F736974696F6E0003053O007072696E7403073O006E6F20706C6F7403073O00506C617965727303093O0043686172616374657203083O0048756D616E6F696403083O005365617450617274030A3O006E6F7420696E2063617203083O00746F737472696E67030A3O004765745365727669636503063O0055736572496403113O005265706C69636174656453746F72616765030B3O00496E746572616374696F6E03123O005570646174655573657253652O74696E6773030A3O0046697265536572766572030E3O00557365725065726D692O73696F6E03053O0056697369742O033O0053697403043O007461736B03043O0077616974029A5O99A93F029A5O99C93F03063O00506172656E7403143O005365745072696D61727950617274434672616D6503043O004865616403063O00434672616D6503103O0048756D616E6F6964522O6F745061727403063O00416E676C657303043O006D6174682O033O00726164025O00806640028O0003013O005803013O005903013O005A026O00F03F01B93O001246000200013O001246000300023O00202C0003000300030020420003000300042O0037000300044O001800023O00040004353O00180001002042000700060005001233000900066O0007000900020006320007001800013O0004353O0018000100202C00070006000600202C000700070007001246000800083O00202C00080008000900202C00080008000A00202C00080008000B00060300070018000100080004353O001800010020420007000600050012330009000C6O00070009000200202C00010007000D00061500020007000100020004353O00070001002610000100200001000E0004353O002000010012460002000F3O001233000300104O00440002000200012O00243O00013O001246000200083O00202C00020002001100202C00020002000A00202C00020002001200202C00020002001300202C00020002001400062F0002002C000100010004353O002C00010012460002000F3O001233000300154O00440002000200012O00243O00013O001246000200163O001246000300083O002042000300030017001233000500116O0003000500022O000E000300033O00202C0003000300182O0006000200020002001246000300083O002042000300030017001233000500196O00030005000200202C00030003001A00202C00030003001B00204200030003001C0012330005001D4O003F000600023O0012330007001E4O002D00086O000A000300080001001246000300083O002042000300030017001233000500196O00030005000200202C00030003001A00202C00030003001B00204200030003001C0012330005001D4O003F000600023O0012330007001F4O002D000800014O000A000300080001001246000300203O00202C000300030021001233000400224O0044000300020001001246000300203O00202C000300030021001233000400234O0044000300020001001246000300083O00202C00030003001100202C00030003000A00202C00030003001200202C00030003001300202C00030003001400202C000300030024002042000300030025001246000500083O00202C0005000500112O000E000500053O00202C00050005001200202C00050005002600202C000500050027001246000600083O00202C00060006001100202C00060006000A00202C00060006001200202C0006000600282O000A000300060001001246000300083O00202C00030003001100202C00030003000A00202C00030003001200202C00030003001300202C00030003001400202C000300030024002042000300030025001246000500083O00202C00050005001100202C00050005000A00202C00050005001200202C00050005001300202C00050005001400202C000500050027001246000600273O00202C0006000600290012460007002A3O00202C00070007002B0012330008002C4O00060007000200020012330008002D3O0012330009002D6O0006000900022O00450005000500062O000A000300050001001246000300083O00202C0003000300112O000E000300033O00202C00030003001200202C00030003001300202C0003000300140006320003005000013O0004353O00500001001246000300083O00202C00030003001100202C00030003000A00202C00030003001200202C00030003001300202C00030003001400202C00030003002400204200030003002500202C00050001002E00202C00060001002F00202C000700010030001246000800083O00202C00080008001100202C00080008000A00202C00080008001200202C0008000800282O000A000300080001001246000300203O00202C000300030021001233000400224O0044000300020001001246000300083O002042000300030017001233000500196O00030005000200202C00030003001A00202C00030003001B00204200030003001C0012330005001D4O003F000600023O0012330007001F4O002D00086O000A000300080001001246000300203O00202C000300030021001233000400314O0044000300020001001246000300083O002042000300030017001233000500116O0003000500020020420003000300052O003F00058O000300050002002610000300400001000E0004353O004000012O00243O00017O00013O0003083O00746F737472696E6701053O001246000100014O003F00026O00060001000200022O001E00016O00243O00017O000E4O002O033O006E696C03103O004D616B654E6F74696669636174696F6E03043O004E616D6503053O00452O726F7203073O00436F6E74656E7403103O004E6F20557365722053656C656374656403053O00496D61676503173O00726278612O73657469643A2O2F2O34382O3334352O393803043O0054696D65026O00144003043O004B69636B030B3O0053746172746564206F6E20030A3O004B69636B506C61796572001E4O000D7O0026023O0006000100010004353O000600012O000D7O0026103O000F000100020004353O000F00012O000D3O00013O0020425O00032O003D00023O00040030310002000400050030310002000600070030310002000800090030310002000A000B2O000A3O000200012O00243O00014O000D3O00013O0020425O00032O003D00023O000400303100020004000C0012330003000D4O000D00046O001600030003000400102A0002000600030030310002000800090030310002000A000B2O000A3O000200010012463O000E4O000D00016O00443O000200012O00243O00017O00", GetFEnv(), ...);