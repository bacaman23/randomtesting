print("code loading")
_G.Tree = nil
local StarterGui = game:GetService("StarterGui")
while _G.Tree == nil
	wait(2)
	for i, v in pairs(workspace:GetChildren()) do
		if v.Name == "TreeRegion" then
			for k, l in pairs(v:GetChildren()) do
				if l:FindFirstChild("TreeClass") and l:FindFirstChild("WoodSection") and l:FindFirstChild("Owner") then
					if (l.TreeClass.Value == "BlueSpruce") and l.Owner.Value == nil then
						_G.Tree = l
					end
				end
			end
		end
	end
end
if _G.Tree > 0 or _G.Tree ~= nil then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Tree["WoodSection"].CFrame
	StarterGui:SetCore("SendNotification", {
    	Title = "V2322",
    	Text = "Found Tree Type[BlueSpruce]",
    	Icon = "rbxassetid://6238540373",
    	Duration = 2,
	})
end
