function AF(FA)
    loadstring(game:HttpGet(FA))()
end

XG = 'https://raw.githubusercontent.com/shlexware/Orion/main/source'
local AN = AF(XG)
local user = game.Players.LocalPlayer
local Window = AN:MakeWindow({Name = "KeySystem", HidePremium = false, SaveConfig = true})
local IsAC = false
local AH = game:GetService("Players").LocalPlayer.Name
GA = "0"
GB = "10"
SSI = "content"
GC = "5"
CC = "1.0"
ABC = "Failed"
GD = "30"
SSD = ":"
GE = "100"
GF = "40"
SSG = "github"
SSF = "raw"
SSJ = ".com/"
GG = "125"
CD = AF(CZ)
SSX = "ps"
GH = "15"
SSK = "bacaman23"
GI = "35"
SYH = "."
SSH = "user"
GJ = "70"
SSL = "random"
SSM = "test".."ing"
SSN = "main"
SSE = "/"
SSA = "h"
SSO = "key"
SSZ = ".lua"
SSC = "t"
WWT = "https://raw.githubusercontent.com/bacaman23/randomtesting/main/Key.lua"
Gk = "150"
GL = "20"
GM = "95"
ZB = WWT
GN = "175"
SJO = "Ver".."sion"
GO = "45"
HUY = "44833"
HUI = "45998"
HUR = HUY..HUI
GP = "120"
HUQ = "rbxassetid"
YYY = HUQ..SSD..SSE..SSE..HUR
GQ = "90"
CR = YYY
GR = "25"
CZ = "https://raw.githubusercontent.com/bacaman23/randomtesting/main/Version.lua"
GS = "180"
GT = "50"
GU = "140"
ZC = "https://raw.githubusercontent.com/bacaman23/randomtesting/main/Version.lua"
GV = "60"
GW = "135"
CCT = " Of"
GX = "55"
GY = "130"
CCA = " Out"
GZ = "60"
BZ = AF(ZB)
PA = "170"
CCF = " Date"
PB = "65"
JU = "Hello"
PC = "105"
BZ = AF(ZB)
PD = "165"
CCC = "Version"
PE = "110"
RE = CCC..CCA..CCT..CCF
PF = "75"
PG = "80"
TYTY = "#6979"
RR = "Error"
PH = "160"
PI = "85"
BA = "string"
TT = true
FF = false
PJ = "155"
HTY = "Script"
HHM = "bacaman23"
KIO = "|"
HYY = " Hub"
HYU = " "
HYE = "By"
PK = "115"
AAA = HTY..HYY..HYU..KIO..HYU..HYE..HYU..HHM..TYTY
VV = "!"
UU = "key"
DD = UU..HYU.."System"
SY = "Correct "..UU
QQ = "Incorrect"..HYU..UU
PL = "145"
KI = "Enter"..HYU..UU
PM = "135"
SS = "Check"..HYU..UU
WP = {GA, GC, GB, GH, GL, GR, GD, GI, GF, GO, GT, GX, GZ, PB, GJ, PF, PG, PI, GQ, GM, GE, PC, PE, PK, GP, GG, GY, PM, GU, PL, Gk, PJ, PH, PD, PA, GN, GS}

if CC ~= CD then
    AN:MakeNotification({
        Name = RR,
        Content = RE,
        Image = CR,
        Time = 5
    })
    return
end

AN:MakeNotification({
	Name = JU,
	Content = AH .. VV,
	Image = CR,
	Time = 3
})

function AC()
    NY = "Set Blue Print"
    IA = "X"
    ABB = "No Structure Selected"
    II = "I"
    IC = "Y"
    IO = "A"
    IB = "Z"
    ABA = "Stuctures"
    ID = "Angles"
    IE = NY .. " " .. IA .. " " .. ID
    IJ = "nil"
    IF = NY .. " " .. IC .. " " .. ID
    IH = "Select Blue Print"
    IG = NY .. " " .. IB .. " " .. ID
    local AA = loadstring(game:HttpGet(XG))()
    IsAC = true
    local CA = AA:MakeWindow({Name = AAA, HidePremium = FF, SaveConfig = TT})
    local BA = CA:MakeTab({
        Name = ABA,
        Icon = CR,
        PremiumOnly = FF
    })
    BA:AddDropdown({
        Name = IH,
        Default = IJ,
        Options = {"Wall2Short", "Wall2", "Wall2ShortThin", "Wall2Thin", "Wall2Tall", "Wall2TallThin", "Wall2ShortCorner", "Wall2Corner", "Wall2TallCorner", "Wall1Short", "Wall1ShortThin", "Wall1", "Wall1Thin", "Wall1Tall", "Wall1TallThin", "Wall1ShortCorner", "Wall1Corner", "Wall1TallCorner", "Wall3", "Wall3Thin", "Wall3Tall", "Wall3TallThin", "Wall3Corner", "Wall3TallCorner", "Floor2Tiny", "Floor2Small", "Floor2", "Floor2Large", "Floor1Tiny", "Floor1Small", "Floor1", "Floor1Large", "Door1", "Door2", "Door3", "Table1", "Table2", "Chair1", "Ladder1", "Post"},
        Callback = function(Value)
            AB = Value
        end
    })
    BA:AddDropdown({
        Name = IE,
        Default = IJ,
        Options = WP,
        Callback = function(Value)
            BB = Value
        end
    })
    BA:AddDropdown({
        Name = IF,
        Default = IJ,
        Options = WP,
        Callback = function(Value)
            BQ = Value
        end
    })
    BA:AddDropdown({
        Name = IG,
        Default = IJ,
        Options = WP,
        Callback = function(Value)
            NN = Value
        end
    })
    BA:AddButton({
        Name = "Place",
        Callback = function()
            if BB == "nil" or BB == nil or BB == IJ then
                BB = 0
            end
            if BQ == "nil" or BQ == nil or BQ == IJ then
                BQ = 0
            end
            if NN == "nil" or NN == nil or NN == IJ then
                NN = 0
            end
            if AB == "nil" or AB == nil or AB == IJ then
                AA:MakeNotification({
                    Name = ABC,
                    Content = ABB,
                    Image = CR,
                    Time = 3
                })
                return
            end
            user.CharacterAdded:Wait()
            ABD = "HumanoidRootPart"
            local AD = user.Character:WaitForChild(ABD)
            local AC = AD.Position
            game:GetService("ReplicatedStorage").PlaceStructure.ClientPlacedBlueprint:FireServer(AB, CFrame.new(AC.x, AC.y, AC.z) * CFrame.Angles(BB, BQ, NN), game:GetService("Players").LocalPlayer)
        end
    })
end

function AA()
    AN:MakeNotification({
        Name = SY,
        Content = "",
        Image = CR,
        Time = 3
    })
end

function ZZ()
    AN:MakeNotification({
        Name = QQ,
        Content = "",
        Image = CR,
        Time = 3
    })
end

local Tab = Window:MakeTab({
	Name = DD,
	Icon = CR,
	PremiumOnly = FF
})

Tab:AddTextbox({
	Name = KI,
	Default = "",
	TextDisappear = TT,
	Callback = function(Value)
		BA = Value
	end
})

Tab:AddButton({
	Name = SS,
	Callback = function()
        if BA == BZ and not IsAC then
            AA()
            AN:Destroy()
            task.wait(2)
            AC()
            IsAC = TT
        else
            ZZ()
        end
  	end
})

AN:Init()
