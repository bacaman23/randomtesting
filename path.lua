function printScripts(parent, path)
    path = path and path.."/"..parent.Name or parent.Name
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("LocalScript") or child:IsA("Script") or child:IsA("ModuleScript") then
            print(path.."/"..child.Name)
        end
        printScripts(child, path)
    end
end
printScripts(game.Workspace)
