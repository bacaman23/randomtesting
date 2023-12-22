print("code loading")
local Tree
local StarterGui = game:GetService("StarterGui")
for i, v in pairs(workspace:GetChildren()) do
	if v.Name == "TreeRegion" then
		for k, l in pairs(v:GetChildren()) do
			if l:FindFirstChild("TreeClass") and l:FindFirstChild("WoodSection") and l:FindFirstChild("Owner") then
				if (l.TreeClass.Value == "BlueSpruce") and l.Owner.Value == nil then
					Tree = l
				end
			end
		end
	end
end
if Tree == nil then
	return
end
repeat
	wait()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Tree["WoodSection"].CFrame
	game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(Tree)
until Tree["Owner"].Value == game.Players.LocalPlayer
StarterGui:SetCore("SendNotification", {
    Title = "V2322",
    Text = "Found Tree Type[BlueSpruce]",
    Icon = "rbxassetid://6238540373",
    Duration = 2,
})
