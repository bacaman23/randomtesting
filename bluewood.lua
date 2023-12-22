local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    	Title = "INFO",
    	Text = "Code Loaded",
    	Icon = "rbxassetid://6238540373",
    	Duration = 2,
})
_G.Tree = nil
while _G.Tree == nil do
	wait(2)
	for i, v in pairs(workspace:GetChildren()) do
		if v.Name == "TreeRegion" then
			for k, l in pairs(v:GetChildren()) do
				if l:FindFirstChild("TreeClass") and l:FindFirstChild("WoodSection") and l:FindFirstChild("Owner") then
					if (l.TreeClass.Value == "BlueSpruce") then
						_G.Tree = l
					end
				end
			end
		end
	end
end
if _G.Tree ~= nil then
	local treePosition = _G.Tree["WoodSection"].CFrame
	local offset = Vector3.new(0, 25, 0) -- Offset of 25 studs above the tree
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(treePosition.p + offset)
	StarterGui:SetCore("SendNotification", {
    		Title = "V2322",
    		Text = "Found Tree Type[BlueSpruce]",
    		Icon = "rbxassetid://6238540373",
    		Duration = 2,
	})
end
