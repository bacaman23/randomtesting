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
if Path_1 then
	Path_1:Destroy()
	print("Destroyed "..Path_1)
end
if Path_2 then
	Path_2:Destroy()
	print("Destroyed "..Path_2)
end
if Path_3 then
	Path_3:Destroy()
	print("Destroyed "..Path_3)
end
if Path_4 then
	Path_4:Destroy()
	print("Destroyed "..Path_4)
end
if Path_5 then
	Path_5:Destroy()
	print("Destroyed "..Path_5)
end
if Path_6 then
	Path_6:Destroy()
	print("Destroyed "..Path_6)
end
if Path_7 then
	Path_7:Destroy()
	print("Destroyed "..Path_7)
end
if Path_8 then
	Path_8:Destroy()
	print("Destroyed "..Path_8)
end
if Path_9 then
	Path_9:Destroy()
	print("Destroyed "..Path_9)
end
if Path_10 then
	Path_10:Destroy()
	print("Destroyed "..Path_10)
end
if Path_11 then
	Path_11:Destroy()
	print("Destroyed "..Path_11)
end

