function search(workspace)
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "V2330" or obj.Name == "version" or 
           obj.Value == "v2330" or obj.Value == "V2330" or obj.Value == 2330 or 
           (obj:IsA("StringValue") and (obj.Value == "V2330" or obj.Value == "v2330")) then
            print(obj:GetFullName())
        end
    end
end
search(game.Workspace)
