local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local user = game.players.LocalPlayer
local Window = OrionLib:MakeWindow({Name = "KeySystem", HidePremium = false, SaveConfig = true})
local IsOpen = false
local Players = game:GetService("Players")
local name = game.players.LocalPlayer.Name

CurrentVersion = "1.0"
NewestVersion = loadstring(game:HttpGet("https://raw.githubusercontent.com/bacaman23/randomtesting/main/Version.lua"))()

if CurrentVersion ~= NewestVersion then
    OrionLib:MakeNotification({
        Name = "Error",
        Content = "Version Out Of Date",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
    return
end

OrionLib:MakeNotification({
	Name = "Hello",
	Content = name .. "!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

_G.Key = loadstring(game:HttpGet("https://raw.githubusercontent.com/bacaman23/randomtesting/main/Key.lua"))()
_G.KeyInput = "string"

function Open()
    IsOpen = true
    local OpenWindow = OrionLib:MakeWindow({Name = "Script Hub", HidePremium = false, SaveConfig = true})
    local StucturesTab = OpenWindow:MakeTab({
        Name = "Stuctures",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    StucturesTab:AddButton({
        Name = "Place Large Glass At 45",
        Callback = function()
            user.CharacterAdded:Wait()
            local humanoidRootPart = user.Character:WaitForChild("HumanoidRootPart")
            local position = humanoidRootPart.Position
            local PlayerX, PlayerY, PlayerZ = position.X, position.Y, position.Z
            function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
            local GlassArgs45 = {
            [1] = "GlassPane4",
            [2] = CFrame.new(PlayerX, PlayerY, PlayerZ) * CFrame.Angles(-0, 45, -0),
            [3] = game:GetService("Players").LocalPlayer,
            [5] = getNil("GlassPane4", "Model"),
            [6] = false,
            [7] = true
        }
        game:GetService("ReplicatedStorage").PlaceStructure.ClientPlacedStructure:FireServer(unpack(GlassArgs45))
    end
    })
end

function OpenNotification()
    OrionLib:MakeNotification({
        Name = "Correct Key",
        Content = "",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

function IncorrectKey()
    OrionLib:MakeNotification({
        Name = "Incorrect Key",
        Content = "",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

local Tab = Window:MakeTab({
	Name = "Key System",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddTextbox({
	Name = "Key System",
	Default = "Enter Key",
	TextDisappear = true,
	Callback = function(Value)
		_G.KeyInput = Value
	end
})

Tab:AddButton({
	Name = "Check Key",
	Callback = function()
        if _G.KeyInput == _G.Key and not IsOpen then
            OpenNotification()
            OrionLib:Destroy()
            Open()
            IsOpen = true
        else
            IncorrectKey()
        end
  	end
})




OrionLib:Init()
