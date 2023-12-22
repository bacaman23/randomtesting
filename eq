function printGuiPath(gui, path)
    path = path .. "/" .. gui.Name
    print(path)

    for _, child in ipairs(gui:GetChildren()) do
        printGuiPath(child, path)
    end
end

-- Start from the root of the PlayerGui
local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
printGuiPath(playerGui, "")

