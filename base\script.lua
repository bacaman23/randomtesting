local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33) if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21() local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22() local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23() local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24() local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47) local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59) local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...) local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=30) then if (v86<=14) then if (v86<=6) then if (v86<=2) then if (v86<=0) then local v114=v85[2];local v115,v116=v76(v83[v114](v13(v83,v114 + 1 ,v85[3])));v78=(v116 + v114) -1 ;local v117=0;for v118=v114,v78 do v117=v117 + 1 ;v83[v118]=v115[v117];end elseif (v86==1) then v83[v85[2]]=v59[v85[3]];else local v123=v85[2];local v124=v83[v85[3]];v83[v123 + 1 ]=v124;v83[v123]=v124[v85[4]];end elseif (v86<=4) then if (v86==3) then local v128=v85[2];v83[v128]=v83[v128](v13(v83,v128 + 1 ,v78));elseif (v83[v85[2]]==v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end elseif (v86==5) then v83[v85[2]]=v85[3];else local v132=v85[2];v83[v132](v13(v83,v132 + 1 ,v85[3]));end elseif (v86<=10) then if (v86<=8) then if (v86==7) then local v133=v85[2];v83[v133](v13(v83,v133 + 1 ,v85[3]));else local v134=v85[2];local v135=v85[4];local v136=v134 + 2 ;local v137={v83[v134](v83[v134 + 1 ],v83[v136])};for v241=1,v135 do v83[v136 + v241 ]=v137[v241];end local v138=v137[1];if v138 then v83[v136]=v138;v77=v85[3];else v77=v77 + 1 ;end end elseif (v86>9) then v77=v85[3];else local v140=v85[2];local v141={v83[v140](v13(v83,v140 + 1 ,v78))};local v142=0;for v244=v140,v85[4] do v142=v142 + 1 ;v83[v244]=v141[v142];end end elseif (v86<=12) then if (v86==11) then local v143=v85[2];v83[v143](v13(v83,v143 + 1 ,v78));else local v144=v85[2];local v145,v146=v76(v83[v144](v83[v144 + 1 ]));v78=(v146 + v144) -1 ;local v147=0;for v247=v144,v78 do v147=v147 + 1 ;v83[v247]=v145[v147];end end elseif (v86>13) then if (v83[v85[2]]==v85[4]) then v77=v77 + 1 ;else v77=v85[3];end else local v148=v85[2];local v149=v83[v148];for v250=v148 + 1 ,v85[3] do v7(v149,v83[v250]);end end elseif (v86<=22) then if (v86<=18) then if (v86<=16) then if (v86>15) then v83[v85[2]]=v83[v85[3]];else local v152=v85[2];local v153,v154=v76(v83[v152](v83[v152 + 1 ]));v78=(v154 + v152) -1 ;local v155=0;for v251=v152,v78 do v155=v155 + 1 ;v83[v251]=v153[v155];end end elseif (v86>17) then if (v83[v85[2]]==v85[4]) then v77=v77 + 1 ;else v77=v85[3];end else v83[v85[2]]=v85[3]~=0 ;end elseif (v86<=20) then if (v86==19) then local v157=v85[2];v83[v157]=v83[v157](v13(v83,v157 + 1 ,v85[3]));else local v159=v85[2];local v160=v83[v159];local v161=v85[3];for v254=1,v161 do v160[v254]=v83[v159 + v254 ];end end elseif (v86==21) then if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else v83[v85[2]]=v83[v85[3]];end elseif (v86<=26) then if (v86<=24) then if (v86>23) then v83[v85[2]]={};else local v165=v74[v85[3]];local v166;local v167={};v166=v10({},{__index=function(v257,v258) local v259=v167[v258];return v259[1][v259[2]];end,__newindex=function(v260,v261,v262) local v263=v167[v261];v263[1][v263[2]]=v262;end});for v265=1,v85[4] do v77=v77 + 1 ;local v266=v73[v77];if (v266[1]==16) then v167[v265-1 ]={v83,v266[3]};else v167[v265-1 ]={v58,v266[3]};end v82[ #v82 + 1 ]=v167;end v83[v85[2]]=v29(v165,v166,v59);end elseif (v86>25) then v83[v85[2]][v85[3]]=v85[4];else local v171=v85[2];v83[v171]=v83[v171]();end elseif (v86<=28) then if (v86==27) then if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end elseif v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end elseif (v86>29) then v83[v85[2]]=v58[v85[3]];else do return;end end elseif (v86<=46) then if (v86<=38) then if (v86<=34) then if (v86<=32) then if (v86>31) then v83[v85[2]]=v85[3];else local v177=v85[2];local v178=v83[v85[3]];v83[v177 + 1 ]=v178;v83[v177]=v178[v85[4]];end elseif (v86==33) then v83[v85[2]]=v83[v85[3]][v85[4]];else v83[v85[2]]=v59[v85[3]];end elseif (v86<=36) then if (v86==35) then local v186=v85[2];local v187=v85[4];local v188=v186 + 2 ;local v189={v83[v186](v83[v186 + 1 ],v83[v188])};for v268=1,v187 do v83[v188 + v268 ]=v189[v268];end local v190=v189[1];if v190 then v83[v188]=v190;v77=v85[3];else v77=v77 + 1 ;end else local v191=v85[2];v83[v191]=v83[v191](v13(v83,v191 + 1 ,v78));end elseif (v86>37) then if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else local v193=v85[2];v83[v193](v13(v83,v193 + 1 ,v78));end elseif (v86<=42) then if (v86<=40) then if (v86==39) then v59[v85[3]]=v83[v85[2]];else local v196=v85[2];local v197=v83[v196];local v198=v85[3];for v271=1,v198 do v197[v271]=v83[v196 + v271 ];end end elseif (v86==41) then if (v83[v85[2]]==v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end else local v199=v85[2];v83[v199]=v83[v199](v83[v199 + 1 ]);end elseif (v86<=44) then if (v86>43) then v83[v85[2]]=v83[v85[3]] + v85[4] ;else local v202=v85[2];local v203,v204=v76(v83[v202](v13(v83,v202 + 1 ,v85[3])));v78=(v204 + v202) -1 ;local v205=0;for v274=v202,v78 do v205=v205 + 1 ;v83[v274]=v203[v205];end end elseif (v86==45) then v83[v85[2]][v85[3]]=v85[4];else v83[v85[2]]=v83[v85[3]][v85[4]];end elseif (v86<=54) then if (v86<=50) then if (v86<=48) then if (v86>47) then v83[v85[2]][v85[3]]=v83[v85[4]];else local v212=v85[2];local v213={v83[v212](v83[v212 + 1 ])};local v214=0;for v277=v212,v85[4] do v214=v214 + 1 ;v83[v277]=v213[v214];end end elseif (v86==49) then v59[v85[3]]=v83[v85[2]];else local v217=v85[2];local v218={v83[v217](v83[v217 + 1 ])};local v219=0;for v280=v217,v85[4] do v219=v219 + 1 ;v83[v280]=v218[v219];end end elseif (v86<=52) then if (v86>51) then v83[v85[2]]=v85[3]~=0 ;else local v221=v85[2];v83[v221]=v83[v221](v13(v83,v221 + 1 ,v85[3]));end elseif (v86==53) then v83[v85[2]][v85[3]]=v83[v85[4]];else v83[v85[2]]=v83[v85[3]] + v85[4] ;end elseif (v86<=58) then if (v86<=56) then if (v86==55) then local v226=v85[2];v83[v226]=v83[v226](v83[v226 + 1 ]);else v83[v85[2]]=v58[v85[3]];end elseif (v86==57) then local v230=v74[v85[3]];local v231;local v232={};v231=v10({},{__index=function(v283,v284) local v285=v232[v284];return v285[1][v285[2]];end,__newindex=function(v286,v287,v288) local v289=v232[v287];v289[1][v289[2]]=v288;end});for v291=1,v85[4] do v77=v77 + 1 ;local v292=v73[v77];if (v292[1]==16) then v232[v291-1 ]={v83,v292[3]};else v232[v291-1 ]={v58,v292[3]};end v82[ #v82 + 1 ]=v232;end v83[v85[2]]=v29(v230,v231,v59);else do return;end end elseif (v86<=60) then if (v86==59) then local v234=v85[2];local v235={v83[v234](v13(v83,v234 + 1 ,v78))};local v236=0;for v294=v234,v85[4] do v236=v236 + 1 ;v83[v294]=v235[v236];end else v77=v85[3];end elseif (v86==61) then local v238=v85[2];v83[v238]=v83[v238]();else v83[v85[2]]={};end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end return v15("LOL!163O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O7470476574033D3O00682O7470733A2O2F7261772E67697468756275736572636F6E74656E742E636F6D2F73686C6578776172652F4F72696F6E2F6D61696E2F736F75726365030A3O004D616B6557696E646F7703043O004E616D6503063O00536372697074030A3O0053617665436F6E666967010003063O00737472696E6703053O006C6F77657203083O00746F737472696E6703083O00746F6E756D62657203073O004D616B6554616203043O00506C6F7403043O0049636F6E03173O00726278612O73657469643A2O2F2O34382O3334352O3938030B3O005072656D69756D4F6E6C7903093O00412O6442752O746F6E03113O00547020546F2048692O64656E204261736503083O0043612O6C6261636B030A3O00547020546F20506C6F7400293O0012013O00013O001201000100023O002002000100010003001205000300046O000100034O00035O00022O003D3O0001000200200200013O00052O001800033O000200302D00030006000700302D0003000800092O00130001000300020012010002000A3O00202E00020002000B0012010003000C3O0012010004000D3O00200200050001000E2O001800073O000300302D00070006000F00302D00070010001100302D0007001200092O00130005000700020020020006000500132O001800083O000200302D00080006001400063900093O000100032O00103O00024O00103O00034O00107O0010300008001500092O00070006000800010020020006000500132O001800083O000200302D00080006001600063900090001000100032O00103O00024O00103O00034O00107O0010300008001500092O00070006000800012O001D3O00013O00023O00273O0003053O00706169727303093O00576F726B7370616365030A3O0050726F70657274696573030B3O004765744368696C6472656E030E3O0046696E6446697273744368696C6403053O004F776E657203053O0056616C7565030F3O00636869636B656E73616C73616D616E030C3O004F726967696E53717561726503083O00506F736974696F6E0003103O004D616B654E6F74696669636174696F6E03043O004E616D6503053O00452O726F7203073O00436F6E74656E7403133O004661696C656420546F2046696E6420506C6F7403053O00496D61676503173O00726278612O73657469643A2O2F2O34382O3334352O393803043O0054696D65026O00144003093O0057686974656C69737403093O00626163616D616E323303103O006C74326D6F6E65795F73746F7261676503113O006C74326D6F6E65795F73746F726167653103043O0067616D6503073O00506C6179657273030B3O004C6F63616C506C61796572030F3O004E6F742057686974654C697374656403093O0043686172616374657203083O0048756D616E6F696403083O00536561745061727403063O00506172656E7403143O005365745072696D61727950617274434672616D6503063O00434672616D652O033O006E657703013O005803013O0059024O00A8840E4103013O005A005C3O001201000100013O001201000200023O00202E0002000200030020020002000200042O000F000200034O003B00013O000300043C3O00180001002002000600050005001205000800064O00130006000800020006150006001800013O00043C3O001800012O001E00066O001E000700013O00202E00080005000600202E0008000800072O000F000700084O000300063O0002002612000600180001000800043C3O00180001002002000600050005001205000800094O001300060008000200202E3O0006000A000623000100070001000200043C3O000700010026123O00240001000B00043C3O002400012O001E000100023O00200200010001000C2O001800033O000400302D0003000D000E00302D0003000F001000302D00030011001200302D0003001300142O00070001000300012O0018000100043O001205000200163O001205000300083O001205000400173O001205000500184O0014000100040001001227000100154O001100015O001201000200013O001201000300154O002F00020002000400043C3O003E00012O001E000700014O0016000800064O002A0007000200022O001E00086O001E000900013O001201000A00193O00202E000A000A001A00202E000A000A001B00202E000A000A000D2O000F0009000A4O000300083O00020006040007003E0001000800043C3O003E00012O0011000100013O000623000200300001000200043C3O0030000100061B0001004B0001000100043C3O004B00012O001E000200023O00200200020002000C2O001800043O000400302D0004000D000E00302D0004000F001C00302D00040011001200302D0004001300142O00070002000400012O001D3O00013O001201000200193O00202E00020002001A00202E00020002001B00202E00020002001D00202E00020002001E00202E00020002001F00202E000200020020002002000200020021001201000400223O00202E00040004002300202E00053O002400202E00063O002500203600060006002600202E00073O00274O000400074O000B00023O00012O001D3O00017O00263O0003053O00706169727303093O00576F726B7370616365030A3O0050726F70657274696573030B3O004765744368696C6472656E030E3O0046696E6446697273744368696C6403053O004F776E657203053O0056616C7565030F3O00636869636B656E73616C73616D616E030C3O004F726967696E53717561726503083O00506F736974696F6E0003103O004D616B654E6F74696669636174696F6E03043O004E616D6503053O00452O726F7203073O00436F6E74656E7403133O004661696C656420546F2046696E6420506C6F7403053O00496D61676503173O00726278612O73657469643A2O2F2O34382O3334352O393803043O0054696D65026O00144003093O0057686974656C69737403093O00626163616D616E323303103O006C74326D6F6E65795F73746F7261676503113O006C74326D6F6E65795F73746F726167653103043O0067616D6503073O00506C6179657273030B3O004C6F63616C506C61796572030F3O004E6F742057686974654C697374656403093O0043686172616374657203083O0048756D616E6F696403083O00536561745061727403063O00506172656E7403143O005365745072696D61727950617274434672616D6503063O00434672616D652O033O006E657703013O005803013O005903013O005A005C3O001201000100013O001201000200023O00202E0002000200030020020002000200042O000F000200034O003B00013O000300043C3O00180001002002000600050005001205000800064O00130006000800020006150006001800013O00043C3O001800012O001E00066O001E000700013O00202E00080005000600202E0008000800072O000F000700084O000300063O0002002612000600180001000800043C3O00180001002002000600050005001205000800094O001300060008000200202E3O0006000A000623000100070001000200043C3O000700010026123O00240001000B00043C3O002400012O001E000100023O00200200010001000C2O001800033O000400302D0003000D000E00302D0003000F001000302D00030011001200302D0003001300142O00070001000300012O0018000100043O001205000200163O001205000300083O001205000400173O001205000500184O0014000100040001001227000100154O001100015O001201000200013O001201000300154O002F00020002000400043C3O003E00012O001E000700014O0016000800064O002A0007000200022O001E00086O001E000900013O001201000A00193O00202E000A000A001A00202E000A000A001B00202E000A000A000D2O000F0009000A4O000300083O00020006040007003E0001000800043C3O003E00012O0011000100013O000623000200300001000200043C3O0030000100061B0001004B0001000100043C3O004B00012O001E000200023O00200200020002000C2O001800043O000400302D0004000D000E00302D0004000F001C00302D00040011001200302D0004001300142O00070002000400012O001D3O00013O001201000200193O00202E00020002001A00202E00020002001B00202E00020002001D00202E00020002001E00202E00020002001F00202E000200020020002002000200020021001201000400223O00202E00040004002300202E00053O002400202E00063O002500203600060006001400202E00073O00264O000400074O000B00023O00012O001D3O00017O00",v9(),...);
