local Path_1 = game.ReplicatedStorage.StaffTablet_Remotes.TabletEvents
local Path_2 = game.ReplicatedStorage.StaffTablet_Remotes
local Path_3 = game.ReplicatedStorage.vocovo
local Path_4 = game.ReplicatedStorage.Communication.Functions
local Path_5 = game.ReplicatedStorage.Communication.Events
local Path_6 = game.ReplicatedStorage.GlobalEvent
local Path_7 = game.ReplicatedStorage.TSP.TSP_GET
local Path_8 = game.ReplicatedStorage.TSP.TSP_POST
local Path_9 = game.ReplicatedStorage.Events.Thorium
local Path_10 = game.ReplicatedStorage.Events.DeviceType
local Path_11 = game.ReplicatedStorage.Events.Xeptus

local getgenv, getnamecallmethod, hookmetamethod, newcclosure, checkcaller, stringlower = getgenv, getnamecallmethod, hookmetamethod, newcclosure, checkcaller, string.lower
if getgenv().AntiKick then
	return
end
local Players, StarterGui, OldNamecall = game:GetService("Players"), game:GetService("StarterGui")
getgenv().AntiKick = {
	Enabled = true,
	SendNotifications = true,
	CheckCaller = false
}
OldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
	if (getgenv().AntiKick.CheckCaller and not checkcaller() or true) and stringlower(getnamecallmethod()) == "kick" and AntiKick.Enabled then
		if getgenv().AntiKick.SendNotifications then
			StarterGui:SetCore("SendNotification", {
				Title = "Menu",
				Text = "Anti Kick triggered",
				Icon = "rbxassetid://6238540373",
				Duration = 2,
			})
		end

		return nil
	end

	return OldNamecall(...)
end))

Path_1:Destroy()
Path_3:Destroy()
Path_4:Destroy()
Path_5:Destroy()
Path_6:Destroy()
Path_7:Destroy()
Path_8:Destroy()
Path_9:Destroy()
Path_10:Destroy()
Path_11:Destroy()

if Path_2 then
    Path_2:Destroy()
end
