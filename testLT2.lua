--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.9.16) ~  Much Love, Ferib 

]]--

local TABLE_TableIndirection = {};
TABLE_TableIndirection["obf_stringchar%0"] = string.char;
TABLE_TableIndirection["obf_stringbyte%0"] = string.byte;
TABLE_TableIndirection["obf_stringsub%0"] = string.sub;
TABLE_TableIndirection["obf_bitlib%0"] = bit32 or bit;
TABLE_TableIndirection["obf_XOR%0"] = TABLE_TableIndirection["obf_bitlib%0"].bxor;
TABLE_TableIndirection["obf_tableconcat%0"] = table.concat;
TABLE_TableIndirection["obf_tableinsert%0"] = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	TABLE_TableIndirection["result%0"] = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		TABLE_TableIndirection["obf_tableinsert%0"](TABLE_TableIndirection["result%0"], TABLE_TableIndirection["obf_stringchar%0"](TABLE_TableIndirection["obf_XOR%0"](TABLE_TableIndirection["obf_stringbyte%0"](TABLE_TableIndirection["obf_stringsub%0"](LUAOBFUSACTOR_STR, i, i + 1)), TABLE_TableIndirection["obf_stringbyte%0"](TABLE_TableIndirection["obf_stringsub%0"](LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return TABLE_TableIndirection["obf_tableconcat%0"](TABLE_TableIndirection["result%0"]);
end
TABLE_TableIndirection["obf_bitlib%1"] = bit32 or bit;
TABLE_TableIndirection["obf_XOR%1"] = TABLE_TableIndirection["obf_bitlib%1"].bxor;
TABLE_TableIndirection["obf_OR%0"] = TABLE_TableIndirection["obf_bitlib%1"].bor;
TABLE_TableIndirection["obf_AND%0"] = TABLE_TableIndirection["obf_bitlib%1"].band;
TABLE_TableIndirection["v0%0"] = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))();
TABLE_TableIndirection["v1%0"] = game[LUAOBFUSACTOR_DECRYPT_STR_0("\193\207\218\60\227\169\212", "\126\177\163\187\69\134\219\167")][LUAOBFUSACTOR_DECRYPT_STR_0("\15\194\41\196\240\19\193\43\220\249\49", "\156\67\173\74\165")];
TABLE_TableIndirection["v2%0"] = TABLE_TableIndirection["v0%0"]:MakeWindow({[LUAOBFUSACTOR_DECRYPT_STR_0("\26\182\68\19", "\38\84\215\41\118\220\70")]=LUAOBFUSACTOR_DECRYPT_STR_0("\123\19\59\33\231\67\2\39\31", "\158\48\118\66\114"),[LUAOBFUSACTOR_DECRYPT_STR_0("\131\45\20\51\67\183\254\166\45\5\59", "\155\203\68\112\86\19\197")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\117\220\32\249\99\119\235\254\79\218", "\152\38\189\86\156\32\24\133")]=true});
TABLE_TableIndirection["v3%0"] = false;
TABLE_TableIndirection["v4%0"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\204\91\166\95\249\69\180", "\38\156\55\199"));
CurrentVersion = LUAOBFUSACTOR_DECRYPT_STR_0("\249\51\44", "\35\200\29\28\72\115\20\154");
NewestVersion = loadstring(game:HttpGet("https://raw.githubusercontent.com/bacaman23/randomtesting/main/Version.lua"))();
if (CurrentVersion ~= NewestVersion) then
	TABLE_TableIndirection["v0%0"]:MakeNotification({[LUAOBFUSACTOR_DECRYPT_STR_0("\55\190\220\218", "\84\121\223\177\191\237\76")]=LUAOBFUSACTOR_DECRYPT_STR_0("\158\68\219\175\40", "\161\219\54\169\192\90\48\80"),[LUAOBFUSACTOR_DECRYPT_STR_0("\106\77\14\49\76\76\20", "\69\41\34\96")]=LUAOBFUSACTOR_DECRYPT_STR_0("\138\198\197\25\11\36\178\131\248\31\22\107\147\197\151\46\3\63\185", "\75\220\163\183\106\98"),[LUAOBFUSACTOR_DECRYPT_STR_0("\43\183\138\48\220", "\185\98\218\235\87")]="rbxassetid://4483345998",[LUAOBFUSACTOR_DECRYPT_STR_0("\255\53\42\227", "\202\171\92\71\134\190")]=(932 - (TABLE_TableIndirection["obf_AND%0"](214, 713) + TABLE_TableIndirection["obf_OR%0"](214, 713)))});
	return;
end
TABLE_TableIndirection["v0%0"]:MakeNotification({[LUAOBFUSACTOR_DECRYPT_STR_0("\7\192\33\141", "\232\73\161\76")]=LUAOBFUSACTOR_DECRYPT_STR_0("\147\220\78\81\17", "\126\219\185\34\61"),[LUAOBFUSACTOR_DECRYPT_STR_0("\47\193\80\102\123\121\231", "\135\108\174\62\18\30\23\147")]=("" .. TABLE_TableIndirection["v1%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\184\232\39\206", "\167\214\137\74\171\120\206\83")] .. "!"),[LUAOBFUSACTOR_DECRYPT_STR_0("\162\253\51\90\253", "\199\235\144\82\61\152")]="rbxassetid://4483345998",[LUAOBFUSACTOR_DECRYPT_STR_0("\51\31\180\46", "\75\103\118\217")]=(15 - 10)});
_G[LUAOBFUSACTOR_DECRYPT_STR_0("\236\81\105", "\126\167\52\16\116\217")] = loadstring(game:HttpGet("https://raw.githubusercontent.com/bacaman23/randomtesting/main/Key.lua"))();
_G[LUAOBFUSACTOR_DECRYPT_STR_0("\227\43\57\169\186\9\233\220", "\156\168\78\64\224\212\121")] = LUAOBFUSACTOR_DECRYPT_STR_0("\20\250\183\199\9\233", "\174\103\142\197");
function Open()
	TABLE_TableIndirection["v3%0"] = true;
	TABLE_TableIndirection["v6%0"] = TABLE_TableIndirection["v0%0"]:MakeWindow({[LUAOBFUSACTOR_DECRYPT_STR_0("\120\41\82\61", "\152\54\72\63\88\69\62")]=LUAOBFUSACTOR_DECRYPT_STR_0("\231\199\252\85\196\208\174\116\193\198", "\60\180\164\142"),[LUAOBFUSACTOR_DECRYPT_STR_0("\112\87\1\44\23\255\23\85\87\16\36", "\114\56\62\101\73\71\141")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\139\232\205\193\155\230\213\194\177\238", "\164\216\137\187")]=true});
	TABLE_TableIndirection["v7%0"] = TABLE_TableIndirection["v6%0"]:MakeTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\252\231\60\183", "\107\178\134\81\210\198\158")]=LUAOBFUSACTOR_DECRYPT_STR_0("\11\26\151\197\190\45\28\135\213", "\202\88\110\226\166"),[LUAOBFUSACTOR_DECRYPT_STR_0("\234\12\141\249", "\170\163\111\226\151")]="rbxassetid://4483345998",[LUAOBFUSACTOR_DECRYPT_STR_0("\33\34\183\53\71\34\36\62\62\190\33", "\73\113\80\210\88\46\87")]=false});
	TABLE_TableIndirection["v7%0"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\175\45\192\23", "\135\225\76\173\114")]=LUAOBFUSACTOR_DECRYPT_STR_0("\42\225\185\179\169\253\139\27\255\191\181\236\154\171\27\254\171\240\141\169\231\78\184", "\199\122\141\216\208\204\221"),[LUAOBFUSACTOR_DECRYPT_STR_0("\142\220\28\252\122\247\174\214", "\150\205\189\112\144\24")]=function()
		TABLE_TableIndirection["v1%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\6\140\190\94\5\139\5\21\55\165\187\72\1\140", "\112\69\228\223\44\100\232\113")]:Wait();
		TABLE_TableIndirection["v9%0"] = TABLE_TableIndirection["v1%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\247\23\6\193\183\127\146\209\13", "\230\180\127\103\179\214\28")]:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\164\16\82\71\234\78\233\136\55\80\73\240\113\225\158\17", "\128\236\101\63\38\132\33"));
		TABLE_TableIndirection["v10%0"] = TABLE_TableIndirection["v9%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\156\166\2\77\162\226\192\162", "\175\204\201\113\36\214\139")];
		local v11, v12, v13 = TABLE_TableIndirection["v10%0"]['X'], TABLE_TableIndirection["v10%0"]['Y'], TABLE_TableIndirection["v10%0"]['Z'];
		function getNil(v15, v16)
			for v17, v18 in pairs(getnilinstances()) do
				if ((v18[LUAOBFUSACTOR_DECRYPT_STR_0("\100\192\52\207\23\105\205\56\217", "\100\39\172\85\188")] == v16) and (v18[LUAOBFUSACTOR_DECRYPT_STR_0("\131\121\180\133", "\83\205\24\217\224")] == v15)) then
					return v18;
				end
			end
		end
		TABLE_TableIndirection["v14%0"] = {[2 - 1]=LUAOBFUSACTOR_DECRYPT_STR_0("\193\201\204\46\245\245\204\51\227\145", "\93\134\165\173"),[3 - 1]=(CFrame.new(v11, v12, v13) * CFrame.Angles(LUAOBFUSACTOR_DECRYPT_STR_0("\243\162", "\30\222\146\161\162\90\174\210"), 45, LUAOBFUSACTOR_DECRYPT_STR_0("\168\30", "\106\133\46\16"))),[7 - 4]=game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\104\44\114\229\95\82\75", "\32\56\64\19\156\58"))[LUAOBFUSACTOR_DECRYPT_STR_0("\118\199\230\87\86\194\140\91\209\224\68", "\224\58\168\133\54\58\146")],[1642 - (TABLE_TableIndirection["obf_AND%0"](1523, 114) + TABLE_TableIndirection["obf_OR%0"](1523, 114))]=getNil(LUAOBFUSACTOR_DECRYPT_STR_0("\126\90\74\238\102\182\134\5\92\2", "\107\57\54\43\157\21\230\231"), LUAOBFUSACTOR_DECRYPT_STR_0("\246\132\21\240\181", "\175\187\235\113\149\217\188")),[6]=false,[626 - (TABLE_TableIndirection["obf_AND%0"](555, 64) + TABLE_TableIndirection["obf_OR%0"](555, 64))]=true};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\14\170\145\64\234\122\121\40\170\133\127\247\118\106\61\168\132", "\24\92\207\225\44\131\25"))[LUAOBFUSACTOR_DECRYPT_STR_0("\123\223\185\79\30\78\95\193\173\79\15\104\89\214", "\29\43\179\216\44\123")][LUAOBFUSACTOR_DECRYPT_STR_0("\158\213\41\73\179\205\16\64\188\218\37\72\142\205\50\89\190\205\53\94\184", "\44\221\185\64")]:FireServer(unpack(TABLE_TableIndirection["v14%0"]));
	end});
end
function OpenNotification()
	TABLE_TableIndirection["v0%0"]:MakeNotification({[LUAOBFUSACTOR_DECRYPT_STR_0("\47\230\69\90", "\19\97\135\40\63")]=LUAOBFUSACTOR_DECRYPT_STR_0("\141\83\33\41\42\50\186\28\24\62\54", "\81\206\60\83\91\79"),[LUAOBFUSACTOR_DECRYPT_STR_0("\109\164\222\102\42\205\89", "\196\46\203\176\18\79\163\45")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\145\47\127\25\33", "\143\216\66\30\126\68\155")]="rbxassetid://4483345998",[LUAOBFUSACTOR_DECRYPT_STR_0("\158\193\0\206", "\129\202\168\109\171\165\195\183")]=(936 - (TABLE_TableIndirection["obf_AND%0"](857, 74) + TABLE_TableIndirection["obf_OR%0"](857, 74)))});
end
function IncorrectKey()
	TABLE_TableIndirection["v0%0"]:MakeNotification({[LUAOBFUSACTOR_DECRYPT_STR_0("\12\89\58\221", "\134\66\56\87\184\190\116")]=LUAOBFUSACTOR_DECRYPT_STR_0("\21\63\10\180\11\249\36\54\40\113\34\190\0", "\85\92\81\105\219\121\139\65"),[LUAOBFUSACTOR_DECRYPT_STR_0("\222\188\94\81\121\209\233", "\191\157\211\48\37\28")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\246\18\245\27\63", "\90\191\127\148\124")]="rbxassetid://4483345998",[LUAOBFUSACTOR_DECRYPT_STR_0("\76\142\35\18", "\119\24\231\78")]=(573 - (367 + 201))});
end
TABLE_TableIndirection["v5%0"] = TABLE_TableIndirection["v2%0"]:MakeTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\172\44\168\79", "\113\226\77\197\42\188\32")]=LUAOBFUSACTOR_DECRYPT_STR_0("\17\19\237\245\9\15\231\161\63\27", "\213\90\118\148"),[LUAOBFUSACTOR_DECRYPT_STR_0("\114\45\187\88", "\45\59\78\212\54")]="rbxassetid://4483345998",[LUAOBFUSACTOR_DECRYPT_STR_0("\32\68\134\134\143\59\160\223\30\90\154", "\144\112\54\227\235\230\78\205")]=false});
TABLE_TableIndirection["v5%0"]:AddTextbox({[LUAOBFUSACTOR_DECRYPT_STR_0("\157\41\2\249", "\59\211\72\111\156\176")]=LUAOBFUSACTOR_DECRYPT_STR_0("\101\130\250\109\125\158\240\57\75\138", "\77\46\231\131"),[LUAOBFUSACTOR_DECRYPT_STR_0("\158\81\176\65\175\88\162", "\32\218\52\214")]=LUAOBFUSACTOR_DECRYPT_STR_0("\107\25\37\173\227\240\110\95\87", "\58\46\119\81\200\145\208\37"),[LUAOBFUSACTOR_DECRYPT_STR_0("\31\137\40\184\141\180\37\42\156\32\169\168\175", "\86\75\236\80\204\201\221")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\81\64\123\137\252\138\113\74", "\235\18\33\23\229\158")]=function(v8)
	_G[LUAOBFUSACTOR_DECRYPT_STR_0("\123\191\216\146\94\170\212\175", "\219\48\218\161")] = v8;
end});
TABLE_TableIndirection["v5%0"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\202\112\113\76", "\128\132\17\28\41\187\47")]=LUAOBFUSACTOR_DECRYPT_STR_0("\34\58\3\57\86\65\25\3\35", "\61\97\82\102\90"),[LUAOBFUSACTOR_DECRYPT_STR_0("\143\47\167\71\197\86\29\2", "\105\204\78\203\43\167\55\126")]=function()
	if ((_G[LUAOBFUSACTOR_DECRYPT_STR_0("\142\175\58\55\29\20\210\69", "\49\197\202\67\126\115\100\167")] == _G[LUAOBFUSACTOR_DECRYPT_STR_0("\28\94\198", "\62\87\59\191\73\224\54")]) and not TABLE_TableIndirection["v3%0"]) then
		OpenNotification();
		TABLE_TableIndirection["v0%0"]:Destroy();
		Open();
		TABLE_TableIndirection["v3%0"] = true;
	else
		IncorrectKey();
	end
end});
TABLE_TableIndirection["v0%0"]:Init();
