local v0 = tonumber;
local v1 = string.byte;
local v2 = string.char;
local v3 = string.sub;
local v4 = string.gsub;
local v5 = string.rep;
local v6 = table.concat;
local v7 = table.insert;
local v8 = math.ldexp;
local v9 = getfenv or function()
	return _ENV;
end;
local v10 = setmetatable;
local v11 = pcall;
local v12 = select;
local v13 = unpack or table.unpack;
local v14 = tonumber;
local function v15(v16, v17, ...)
	local v18 = 1;
	local v19;
	v16 = v4(v3(v16, 5), "..", function(v30)
		if (v1(v30, 2) == 79) then
			v19 = v0(v3(v30, 1, 1));
			return "";
		else
			local v87 = v2(v0(v30, 16));
			if v19 then
				local v97 = v5(v87, v19);
				v19 = nil;
				return v97;
			else
				return v87;
			end
		end
	end);
	local function v20(v31, v32, v33)
		if v33 then
			local v88 = (v31 / (2 ^ (v32 - 1))) % (2 ^ (((v33 - 1) - (v32 - 1)) + 1));
			return v88 - (v88 % 1);
		else
			local v89 = 2 ^ (v32 - 1);
			return (((v31 % (v89 + v89)) >= v89) and 1) or 0;
		end
	end
	local function v21()
		local v34 = v1(v16, v18, v18);
		v18 = v18 + 1;
		return v34;
	end
	local function v22()
		local v35, v36 = v1(v16, v18, v18 + 2);
		v18 = v18 + 2;
		return (v36 * 256) + v35;
	end
	local function v23()
		local v37, v38, v39, v40 = v1(v16, v18, v18 + 3);
		v18 = v18 + 4;
		return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37;
	end
	local function v24()
		local v41 = v23();
		local v42 = v23();
		local v43 = 1;
		local v44 = (v20(v42, 1, 20) * (2 ^ 32)) + v41;
		local v45 = v20(v42, 21, 31);
		local v46 = ((v20(v42, 32) == 1) and -1) or 1;
		if (v45 == 0) then
			if (v44 == 0) then
				return v46 * 0;
			else
				v45 = 1;
				v43 = 0;
			end
		elseif (v45 == 2047) then
			return ((v44 == 0) and (v46 * (1 / 0))) or (v46 * NaN);
		end
		return v8(v46, v45 - 1023) * (v43 + (v44 / (2 ^ 52)));
	end
	local function v25(v47)
		local v48;
		if not v47 then
			v47 = v23();
			if (v47 == 0) then
				return "";
			end
		end
		v48 = v3(v16, v18, (v18 + v47) - 1);
		v18 = v18 + v47;
		local v49 = {};
		for v63 = 1, #v48 do
			v49[v63] = v2(v1(v3(v48, v63, v63)));
		end
		return v6(v49);
	end
	local v26 = v23;
	local function v27(...)
		return {...}, v12("#", ...);
	end
	local function v28()
		local v50 = {};
		local v51 = {};
		local v52 = {};
		local v53 = {v50,v51,nil,v52};
		local v54 = v23();
		local v55 = {};
		for v65 = 1, v54 do
			local v66 = v21();
			local v67;
			if (v66 == 1) then
				v67 = v21() ~= 0;
			elseif (v66 == 2) then
				v67 = v24();
			elseif (v66 == 3) then
				v67 = v25();
			end
			v55[v65] = v67;
		end
		v53[3] = v21();
		for v69 = 1, v23() do
			local v70 = v21();
			if (v20(v70, 1, 1) == 0) then
				local v93 = v20(v70, 2, 3);
				local v94 = v20(v70, 4, 6);
				local v95 = {v22(),v22(),nil,nil};
				if (v93 == 0) then
					v95[3] = v22();
					v95[4] = v22();
				elseif (v93 == 1) then
					v95[3] = v23();
				elseif (v93 == 2) then
					v95[3] = v23() - (2 ^ 16);
				elseif (v93 == 3) then
					v95[3] = v23() - (2 ^ 16);
					v95[4] = v22();
				end
				if (v20(v94, 1, 1) == 1) then
					v95[2] = v55[v95[2]];
				end
				if (v20(v94, 2, 2) == 1) then
					v95[3] = v55[v95[3]];
				end
				if (v20(v94, 3, 3) == 1) then
					v95[4] = v55[v95[4]];
				end
				v50[v69] = v95;
			end
		end
		for v71 = 1, v23() do
			v51[v71 - 1] = v28();
		end
		return v53;
	end
	local function v29(v57, v58, v59)
		local v60 = v57[1];
		local v61 = v57[2];
		local v62 = v57[3];
		return function(...)
			local v73 = v60;
			local v74 = v61;
			local v75 = v62;
			local v76 = v27;
			local v77 = 1;
			local v78 = -1;
			local v79 = {};
			local v80 = {...};
			local v81 = v12("#", ...) - 1;
			local v82 = {};
			local v83 = {};
			for v90 = 0, v81 do
				if (v90 >= v75) then
					v79[v90 - v75] = v80[v90 + 1];
				else
					v83[v90] = v80[v90 + 1];
				end
			end
			local v84 = (v81 - v75) + 1;
			local v85;
			local v86;
			while true do
				v85 = v73[v77];
				v86 = v85[1];
				if (v86 <= 32) then
					if (v86 <= 15) then
						if (v86 <= 7) then
							if (v86 <= 3) then
								if (v86 <= 1) then
									if (v86 > 0) then
										if not v83[v85[2]] then
											v77 = v77 + 1;
										else
											v77 = v85[3];
										end
									elseif (v83[v85[2]] == v83[v85[4]]) then
										v77 = v77 + 1;
									else
										v77 = v85[3];
									end
								elseif (v86 == 2) then
									local v114 = v74[v85[3]];
									local v115;
									local v116 = {};
									v115 = v10({}, {__index=function(v231, v232)
										local v233 = v116[v232];
										return v233[1][v233[2]];
									end,__newindex=function(v234, v235, v236)
										local v237 = v116[v235];
										v237[1][v237[2]] = v236;
									end});
									for v239 = 1, v85[4] do
										v77 = v77 + 1;
										local v240 = v73[v77];
										if (v240[1] == 4) then
											v116[v239 - 1] = {v83,v240[3]};
										else
											v116[v239 - 1] = {v58,v240[3]};
										end
										v82[#v82 + 1] = v116;
									end
									v83[v85[2]] = v29(v114, v115, v59);
								else
									local v118 = v85[2];
									local v119 = {v83[v118](v13(v83, v118 + 1, v78))};
									local v120 = 0;
									for v242 = v118, v85[4] do
										v120 = v120 + 1;
										v83[v242] = v119[v120];
									end
								end
							elseif (v86 <= 5) then
								if (v86 > 4) then
									local v121 = v85[2];
									local v122 = v85[4];
									local v123 = v121 + 2;
									local v124 = {v83[v121](v83[v121 + 1], v83[v123])};
									for v245 = 1, v122 do
										v83[v123 + v245] = v124[v245];
									end
									local v125 = v124[1];
									if v125 then
										v83[v123] = v125;
										v77 = v85[3];
									else
										v77 = v77 + 1;
									end
								else
									v83[v85[2]] = v83[v85[3]];
								end
							elseif (v86 == 6) then
								if (v83[v85[2]] == v85[4]) then
									v77 = v77 + 1;
								else
									v77 = v85[3];
								end
							else
								v59[v85[3]] = v83[v85[2]];
							end
						elseif (v86 <= 11) then
							if (v86 <= 9) then
								if (v86 == 8) then
									v83[v85[2]] = v83[v85[3]] + v83[v85[4]];
								else
									local v131 = v85[2];
									local v132 = v83[v131];
									local v133 = v85[3];
									for v248 = 1, v133 do
										v132[v248] = v83[v131 + v248];
									end
								end
							elseif (v86 > 10) then
								v59[v85[3]] = v83[v85[2]];
							else
								local v136 = v85[2];
								local v137, v138 = v76(v83[v136](v13(v83, v136 + 1, v85[3])));
								v78 = (v138 + v136) - 1;
								local v139 = 0;
								for v251 = v136, v78 do
									v139 = v139 + 1;
									v83[v251] = v137[v139];
								end
							end
						elseif (v86 <= 13) then
							if (v86 == 12) then
								if v83[v85[2]] then
									v77 = v77 + 1;
								else
									v77 = v85[3];
								end
							else
								v83[v85[2]] = v83[v85[3]][v85[4]];
							end
						elseif (v86 == 14) then
							v83[v85[2]][v85[3]] = v83[v85[4]];
						else
							local v144 = v85[2];
							local v145, v146 = v76(v83[v144](v83[v144 + 1]));
							v78 = (v146 + v144) - 1;
							local v147 = 0;
							for v254 = v144, v78 do
								v147 = v147 + 1;
								v83[v254] = v145[v147];
							end
						end
					elseif (v86 <= 23) then
						if (v86 <= 19) then
							if (v86 <= 17) then
								if (v86 == 16) then
									if not v83[v85[2]] then
										v77 = v77 + 1;
									else
										v77 = v85[3];
									end
								elseif (v83[v85[2]] == v85[4]) then
									v77 = v77 + 1;
								else
									v77 = v85[3];
								end
							elseif (v86 == 18) then
								local v148 = v74[v85[3]];
								local v149;
								local v150 = {};
								v149 = v10({}, {__index=function(v257, v258)
									local v259 = v150[v258];
									return v259[1][v259[2]];
								end,__newindex=function(v260, v261, v262)
									local v263 = v150[v261];
									v263[1][v263[2]] = v262;
								end});
								for v265 = 1, v85[4] do
									v77 = v77 + 1;
									local v266 = v73[v77];
									if (v266[1] == 4) then
										v150[v265 - 1] = {v83,v266[3]};
									else
										v150[v265 - 1] = {v58,v266[3]};
									end
									v82[#v82 + 1] = v150;
								end
								v83[v85[2]] = v29(v148, v149, v59);
							else
								v77 = v85[3];
							end
						elseif (v86 <= 21) then
							if (v86 == 20) then
								v83[v85[2]] = v83[v85[3]][v85[4]];
							else
								v83[v85[2]] = v85[3];
							end
						elseif (v86 > 22) then
							local v157 = v85[2];
							v83[v157] = v83[v157](v13(v83, v157 + 1, v78));
						else
							local v159 = v85[2];
							do
								return v13(v83, v159, v78);
							end
						end
					elseif (v86 <= 27) then
						if (v86 <= 25) then
							if (v86 == 24) then
								v83[v85[2]] = v59[v85[3]];
							else
								local v162 = v85[2];
								v83[v162](v13(v83, v162 + 1, v78));
							end
						elseif (v86 > 26) then
							local v163 = v85[2];
							v83[v163] = v83[v163]();
						else
							local v165 = v85[2];
							v83[v165](v13(v83, v165 + 1, v85[3]));
						end
					elseif (v86 <= 29) then
						if (v86 > 28) then
							local v166 = v85[2];
							local v167 = {v83[v166](v83[v166 + 1])};
							local v168 = 0;
							for v268 = v166, v85[4] do
								v168 = v168 + 1;
								v83[v268] = v167[v168];
							end
						else
							v83[v85[2]] = v83[v85[3]] + v83[v85[4]];
						end
					elseif (v86 <= 30) then
						local v170 = v85[2];
						v83[v170] = v83[v170](v83[v170 + 1]);
					elseif (v86 == 31) then
						local v295 = v85[2];
						local v296 = v83[v85[3]];
						v83[v295 + 1] = v296;
						v83[v295] = v296[v85[4]];
					else
						v77 = v85[3];
					end
				elseif (v86 <= 49) then
					if (v86 <= 40) then
						if (v86 <= 36) then
							if (v86 <= 34) then
								if (v86 == 33) then
									local v172 = v85[2];
									local v173 = v85[4];
									local v174 = v172 + 2;
									local v175 = {v83[v172](v83[v172 + 1], v83[v174])};
									for v271 = 1, v173 do
										v83[v174 + v271] = v175[v271];
									end
									local v176 = v175[1];
									if v176 then
										v83[v174] = v176;
										v77 = v85[3];
									else
										v77 = v77 + 1;
									end
								else
									v83[v85[2]] = {};
								end
							elseif (v86 > 35) then
								v83[v85[2]] = v85[3];
							else
								local v180 = v85[2];
								do
									return v83[v180](v13(v83, v180 + 1, v78));
								end
							end
						elseif (v86 <= 38) then
							if (v86 > 37) then
								local v181 = v85[2];
								do
									return v13(v83, v181, v78);
								end
							else
								v83[v85[2]] = v83[v85[3]];
							end
						elseif (v86 == 39) then
							local v184 = v85[2];
							local v185 = {v83[v184](v83[v184 + 1])};
							local v186 = 0;
							for v274 = v184, v85[4] do
								v186 = v186 + 1;
								v83[v274] = v185[v186];
							end
						else
							local v187 = v85[2];
							local v188, v189 = v76(v83[v187](v13(v83, v187 + 1, v85[3])));
							v78 = (v189 + v187) - 1;
							local v190 = 0;
							for v277 = v187, v78 do
								v190 = v190 + 1;
								v83[v277] = v188[v190];
							end
						end
					elseif (v86 <= 44) then
						if (v86 <= 42) then
							if (v86 == 41) then
								v83[v85[2]] = v58[v85[3]];
							else
								v83[v85[2]] = v85[3] ~= 0;
							end
						elseif (v86 == 43) then
							local v194 = v85[2];
							local v195 = v83[v194];
							for v280 = v194 + 1, v85[3] do
								v7(v195, v83[v280]);
							end
						else
							v83[v85[2]] = v85[3] ~= 0;
						end
					elseif (v86 <= 46) then
						if (v86 > 45) then
							v83[v85[2]][v85[3]] = v85[4];
						else
							local v199 = v85[2];
							local v200 = v83[v85[3]];
							v83[v199 + 1] = v200;
							v83[v199] = v200[v85[4]];
						end
					elseif (v86 <= 47) then
						local v204 = v85[2];
						v83[v204](v13(v83, v204 + 1, v85[3]));
					elseif (v86 == 48) then
						do
							return;
						end
					else
						v83[v85[2]][v85[3]] = v83[v85[4]];
					end
				elseif (v86 <= 57) then
					if (v86 <= 53) then
						if (v86 <= 51) then
							if (v86 > 50) then
								if (v83[v85[2]] == v83[v85[4]]) then
									v77 = v77 + 1;
								else
									v77 = v85[3];
								end
							else
								v83[v85[2]][v85[3]] = v85[4];
							end
						elseif (v86 == 52) then
							local v207 = v85[2];
							v83[v207] = v83[v207](v13(v83, v207 + 1, v85[3]));
						else
							v83[v85[2]] = v58[v85[3]];
						end
					elseif (v86 <= 55) then
						if (v86 > 54) then
							local v211 = v85[2];
							v83[v211](v13(v83, v211 + 1, v78));
						elseif v83[v85[2]] then
							v77 = v77 + 1;
						else
							v77 = v85[3];
						end
					elseif (v86 > 56) then
						local v212 = v85[2];
						v83[v212] = v83[v212](v13(v83, v212 + 1, v85[3]));
					else
						local v214 = v85[2];
						v83[v214] = v83[v214](v83[v214 + 1]);
					end
				elseif (v86 <= 61) then
					if (v86 <= 59) then
						if (v86 > 58) then
							v83[v85[2]] = {};
						else
							local v217 = v85[2];
							local v218, v219 = v76(v83[v217](v83[v217 + 1]));
							v78 = (v219 + v217) - 1;
							local v220 = 0;
							for v281 = v217, v78 do
								v220 = v220 + 1;
								v83[v281] = v218[v220];
							end
						end
					elseif (v86 > 60) then
						v83[v85[2]] = v59[v85[3]];
					else
						local v223 = v85[2];
						v83[v223] = v83[v223](v13(v83, v223 + 1, v78));
					end
				elseif (v86 <= 63) then
					if (v86 == 62) then
						local v225 = v85[2];
						do
							return v83[v225](v13(v83, v225 + 1, v78));
						end
					else
						local v226 = v85[2];
						local v227 = {v83[v226](v13(v83, v226 + 1, v78))};
						local v228 = 0;
						for v284 = v226, v85[4] do
							v228 = v228 + 1;
							v83[v284] = v227[v228];
						end
					end
				elseif (v86 <= 64) then
					local v229 = v85[2];
					v83[v229] = v83[v229]();
				elseif (v86 > 65) then
					do
						return;
					end
				else
					local v307 = v85[2];
					local v308 = v83[v307];
					local v309 = v85[3];
					for v314 = 1, v309 do
						v308[v314] = v83[v307 + v314];
					end
				end
				v77 = v77 + 1;
			end
		end;
	end
	return v29(v28(), {}, v17)(...);
end
return v15("LOL!153O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O7470476574033D3O00682O7470733A2O2F7261772E67697468756275736572636F6E74656E742E636F6D2F73686C6578776172652F4F72696F6E2F6D61696E2F736F75726365030A3O004D616B6557696E646F7703043O004E616D6503063O00536372697074030A3O0053617665436F6E666967010003063O00737472696E6703053O006C6F77657203083O00746F737472696E6703083O00746F6E756D62657203073O004D616B6554616203043O00506C6F7403043O0049636F6E03173O00726278612O73657469643A2O2F2O34382O3334352O3938030B3O005072656D69756D4F6E6C7903093O00412O6442752O746F6E03113O00547020546F2048692O64656E204261736503083O0043612O6C6261636B00233O0012183O00013O001218000100023O00202D000100010003001215000300044O000A000100034O003C5O00022O00403O0001000200202D00013O00052O003B00033O000200302E00030006000700302E0003000800092O00340001000300020012180002000A3O00200D00020002000B0012180003000C3O0012180004000D3O00060200053O000100012O00043O00033O00202D00060001000E2O003B00083O000300302E00080006000F00302E00080010001100302E0008001200092O003400060008000200202D0007000600132O003B00093O000200302E000900060014000602000A0001000100042O00043O00024O00043O00034O00048O00043O00053O00103100090015000A2O002F0007000900012O00303O00013O00023O00043O0003083O00746F6E756D62657203043O006773756203013O002C034O00010B3O001218000100014O003500026O002500036O003800020002000200202D000200020002001215000400033O001215000500044O000A000200054O002300016O001600016O00303O00017O00273O0003053O00706169727303093O00576F726B7370616365030A3O0050726F70657274696573030B3O004765744368696C6472656E030E3O0046696E6446697273744368696C6403053O004F776E657203053O0056616C7565030F3O00636869636B656E73616C73616D616E030C3O004F726967696E53717561726503083O00506F736974696F6E0003103O004D616B654E6F74696669636174696F6E03043O004E616D6503053O00452O726F7203073O00436F6E74656E7403133O004661696C656420546F2046696E6420506C6F7403053O00496D61676503173O00726278612O73657469643A2O2F2O34382O3334352O393803043O0054696D65026O00144003093O0057686974656C69737403093O00626163616D616E323303103O006C74326D6F6E65795F73746F7261676503113O006C74326D6F6E65795F73746F726167653103043O0067616D6503073O00506C6179657273030B3O004C6F63616C506C61796572030F3O004E6F742057686974654C697374656403093O0043686172616374657203083O0048756D616E6F696403083O00536561745061727403063O00506172656E7403143O005365745072696D61727950617274434672616D6503063O00434672616D652O033O006E657703013O005803013O005903093O00312C3O302C2O303203013O005A005F3O001218000100013O001218000200023O00200D00020002000300202D0002000200042O000F000200034O000300013O00030004133O0018000100202D000600050005001215000800064O00340006000800020006360006001800013O0004133O001800012O003500066O0035000700013O00200D00080005000600200D0008000800072O000F000700084O003C00063O000200260600060018000100080004133O0018000100202D000600050005001215000800094O003400060008000200200D3O0006000A00062100010007000100020004133O000700010026063O00240001000B0004133O002400012O0035000100023O00202D00010001000C2O003B00033O000400302E0003000D000E00302E0003000F001000302E00030011001200302E0003001300142O002F0001000300012O003B000100043O001215000200163O001215000300083O001215000400173O001215000500184O004100010004000100120B000100154O002A00015O001218000200013O001218000300154O00270002000200040004133O003E00012O0035000700014O0025000800064O00380007000200022O003500086O0035000900013O001218000A00193O00200D000A000A001A00200D000A000A001B00200D000A000A000D2O000F0009000A4O003C00083O00020006330007003E000100080004133O003E00012O002A000100013O00062100020030000100020004133O003000010006010001004B000100010004133O004B00012O0035000200023O00202D00020002000C2O003B00043O000400302E0004000D000E00302E0004000F001C00302E00040011001200302E0004001300142O002F0002000400012O00303O00013O001218000200193O00200D00020002001A00200D00020002001B00200D00020002001D00200D00020002001E00200D00020002001F00200D00020002002000202D000200020021001218000400223O00200D00040004002300200D00053O002400200D00063O00252O0035000700033O001215000800264O00380007000200022O001C00060006000700200D00073O00272O000A000400074O003700023O00012O00303O00017O00", v9(), ...);
