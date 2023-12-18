local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local OpenOrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local user = game.Players.LocalPlayer
local Window = OrionLib:MakeWindow({Name = "KeySystem", HidePremium = false, SaveConfig = true})
local IsOpen = false
local Username = game:GetService("Players").LocalPlayer.Name
local Players = game:GetService("Players")
local GroupId = 33304491
local Player = Players.LocalPlayer
_G.Key_Bypass = false

local Group_success, message = pcall(function()
    if Player:IsInGroup(GroupId) then
        local rank = Player:GetRankInGroup(GroupId)
        if rank == 225 then
            _G.Key_Bypass = true
        end
    else
        _G.Key_Bypass = false
    end
end)

if not Group_success then
    print("Error: " .. message)
    _G.Key_Bypass = false
end
if game.Players.LocalPlayer.Name == "LT2money_storage" then
    _G.Key_Bypass = true
end

OrionLib:MakeNotification({
	Name = "Hello",
	Content = Username .. "!",
	Image = "rbxassetid://4483345998",
	Time = 3
})

_G.Key = loadstring(game:HttpGet("https://raw.githubusercontent.com/bacaman23/randomtesting/main/Key.lua"))()
_G.KeyInput = "string"

function Open()
    IsOpen = true
    local OpenWindow = OpenOrionLib:MakeWindow({Name = "Script Hub | By bacaman23#6979", HidePremium = false, SaveConfig = true})
    local StucturesTab = OpenWindow:MakeTab({
        Name = "Blue Print",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    StucturesTab:AddDropdown({
        Name = "Select Blue Print",
        Default = "nil",
        Options = {"Wall2Short", "Wall2", "Wall2ShortThin", "Wall2Thin", "Wall2Tall", "Wall2TallThin", "Wall2ShortCorner", "Wall2Corner", "Wall2TallCorner", "Wall1Short", "Wall1ShortThin", "Wall1", "Wall1Thin", "Wall1Tall", "Wall1TallThin", "Wall1ShortCorner", "Wall1Corner", "Wall1TallCorner", "Wall3", "Wall3Thin", "Wall3Tall", "Wall3TallThin", "Wall3Corner", "Wall3TallCorner", "Floor2Tiny", "Floor2Small", "Floor2", "Floor2Large", "Floor1Tiny", "Floor1Small", "Floor1", "Floor1Large", "Door1", "Door2", "Door3", "Table1", "Table2", "Chair1", "Ladder1", "Post"},
        Callback = function(Value)
            _G.Structure = Value
        end
    })
    StucturesTab:AddDropdown({
        Name = "Set Blue Print X Angles",
        Default = "nil",
        Options = {"0", "5", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55", "60", "65", "70", "75", "80", "85", "90", "95", "100", "105", "110", "115", "120", "125", "130", "135", "140", "145", "150", "155", "160", "165", "170", "175", "180"},
        Callback = function(Value)
            _G.Angle_X = Value
        end
    })
    StucturesTab:AddDropdown({
        Name = "Set Blue Print Y Angles",
        Default = "nil",
        Options = {"0", "5", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55", "60", "65", "70", "75", "80", "85", "90", "95", "100", "105", "110", "115", "120", "125", "130", "135", "140", "145", "150", "155", "160", "165", "170", "175", "180"},
        Callback = function(Value)
            _G.Angle_Y = Value
        end
    })
    StucturesTab:AddDropdown({
        Name = "Set Blue Print Z Angles",
        Default = "nil",
        Options = {"0", "5", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55", "60", "65", "70", "75", "80", "85", "90", "95", "100", "105", "110", "115", "120", "125", "130", "135", "140", "145", "150", "155", "160", "165", "170", "175", "180"},
        Callback = function(Value)
            _G.Angle_Z = Value
        end
    })
    StucturesTab:AddButton({
        Name = "Place",
        Callback = function()
            if (_G.Angle_X == "nil" or _G.Angle_X == nil) then
                _G.Angle_X = 0
            end
            if (_G.Angle_Y == "nil" or _G.Angle_Y == nil) then
                _G.Angle_Y = 0
            end
            if (_G.Angle_Y == "nil" or _G.Angle_Y == nil) then
                _G.Angle_Y = 0
            end
            if (_G.Structure == "nil" or _G.Structure == nil) then
                OpenOrionLib:MakeNotification({
                    Name = "Failed",
                    Content = "No Structure Selected",
                    Image = "rbxassetid://4483345998",
                    Time = 3
                })
                return
            end
            _G.Angle_X = tonumber(_G.Angle_X)
            _G.Angle_Y = tonumber(_G.Angle_Y)
            _G.Angle_Z = tonumber(_G.Angle_Z)
            user.CharacterAdded:Wait()
            local humanoidRootPart = user.Character:WaitForChild("HumanoidRootPart")
            local Playerpos = humanoidRootPart.Position
            game:GetService("ReplicatedStorage").PlaceStructure.ClientPlacedBlueprint:FireServer(_G.Structure, CFrame.new(Playerpos.x, Playerpos.y, Playerpos.z) * CFrame.Angles(_G.Angle_X, _G.Angle_Y, _G.Angle_Z), game:GetService("Players").LocalPlayer)
            _G.Angle_X = nil
            _G.Angle_Y = nil
            _G.Angle_Z = nil
            _G.Structure = nil
        end
    })
    --#region
    --
    --#region
    local GlassTab = OpenWindow:MakeTab({
        Name = "Glass",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    GlassTab:AddDropdown({
        Name = "Select Glass",
        Default = "nil",
        Options = {"Glass1", "Glass2", "Glass3", "Glass4", "GlassDoor1"},
        Callback = function(Value)
            GlassType = Value
        end
    })
    GlassTab:AddDropdown({
        Name = "Set Glass X Angles",
        Default = "nil",
        Options = {"0", "5", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55", "60", "65", "70", "75", "80", "85", "90", "95", "100", "105", "110", "115", "120", "125", "130", "135", "140", "145", "150", "155", "160", "165", "170", "175", "180"},
        Callback = function(Value)
            Angle_X = Value
        end
    })
    GlassTab:AddDropdown({
        Name = "Set Glass Y Angles",
        Default = "nil",
        Options = {"0", "5", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55", "60", "65", "70", "75", "80", "85", "90", "95", "100", "105", "110", "115", "120", "125", "130", "135", "140", "145", "150", "155", "160", "165", "170", "175", "180"},
        Callback = function(Value)
            Angle_Y = Value
        end
    })
    GlassTab:AddDropdown({
        Name = "Set Glass Z Angles",
        Default = "nil",
        Options = {"0", "5", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55", "60", "65", "70", "75", "80", "85", "90", "95", "100", "105", "110", "115", "120", "125", "130", "135", "140", "145", "150", "155", "160", "165", "170", "175", "180"},
        Callback = function(Value)
            Angle_Z = Value
        end
    })
    GlassTab:AddButton({
        Name = "Place Glass",
        Callback = function()
            if (Angle_X == "nil" or Angle_X == nil) then
                Angle_X = 0
            end
            if (Angle_Y == "nil" or Angle_Y == nil) then
                Angle_Y = 0
            end
            if (Angle_Z == "nil" or Angle_Z == nil) then
                Angle_Z = 0
            end
            if GlassType ~= "Glass1" and GlassType ~= "Glass2" and GlassType ~= "Glass3" and GlassType ~= "Glass4" and GlassType ~= "GlassDoor1" then
                OpenOrionLib:MakeNotification({
                    Name = "Failed",
                    Content = "No Glass Selected",
                    Image = "rbxassetid://4483345998",
                    Time = 3
                })
                return
            end
            if (GlassType == "nil" or GlassType == nil) then
                OpenOrionLib:MakeNotification({
                    Name = "Failed",
                    Content = "No Glass Selected",
                    Image = "rbxassetid://4483345998",
                    Time = 3
                })
                return
            end
            Angle_X = tonumber(Angle_X)
            Angle_Y = tonumber(Angle_Y)
            Angle_Z = tonumber(Angle_Z)
            user.CharacterAdded:Wait()
            local humanoidRootPart = user.Character:WaitForChild("HumanoidRootPart")
            local Playerpos = humanoidRootPart.Position
            function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
            game:GetService("ReplicatedStorage").PlaceStructure.ClientPlacedStructure:FireServer(GlassType, Cframe.new(Playerpos.x, Playerpos.y, Playerpos.z) * CFrame.Angles(Angle_X, Angle_Y, Angle_Z), game:GetService("Players").LocalPlayer, getNil(GlassType, "Model"), false, true)
            GlassType = nil
            Angle_X = nil
            Angle_Y = nil
            Angle_Z = nil
        end
    })
end

function OpenNotification()
    OrionLib:MakeNotification({
        Name = "Correct Key",
        Content = "",
        Image = "rbxassetid://4483345998",
        Time = 3
    })
end

function IncorrectKey()
    OrionLib:MakeNotification({
        Name = "Incorrect Key",
        Content = "",
        Image = "rbxassetid://4483345998",
        Time = 3
    })
end

function NoAccess()
    OrionLib:MakeNotification({
        Name = "Failed",
        Content = "Incorrect Permissions",
        Image = "rbxassetid://4483345998",
        Time = 3
    })
end

local Tab = Window:MakeTab({
	Name = "Key System",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local AntiBanTab = Window:MakeTab({
    Name = "Anti Ban",
    Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

AntiBanTab:AddButton({
    Name = "Disable Banning",
    Callback = function ()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bacaman23/roblox/main/Lt2_AntiBan.lua"))()
    end
})

Tab:AddTextbox({
	Name = "Enter Key",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		_G.KeyInput = Value
	end
})

Tab:AddButton({
	Name = "Check Key",
	Callback = function()
        if (_G.KeyInput == _G.Key) and not IsOpen then
            OpenNotification()
            OrionLib:Destroy()
            task.wait(2)
            Open()
            IsOpen = true
        else
            IncorrectKey()
        end
  	end
})

Tab:AddButton({
	Name = "Skip Key",
	Callback = function()
        if _G.Key_Bypass and not IsOpen then
            OpenNotification()
            OrionLib:Destroy()
            task.wait(2)
            Open()
            IsOpen = true
        else
            NoAccess()
        end
  	end
})
OrionLib:Init()
OpenOrionLib:Init()
