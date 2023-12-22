function search(starterGui)
    for _, obj in ipairs(starterGui:GetDescendants()) do
        -- If the object is a Frame, skip the rest of this loop iteration
        if not obj:IsA("Frame") then
            if obj.Name == "V2330" or obj.Name == "version" then
                print(obj:GetFullName())
            elseif obj:IsA("ValueBase") then
                local value = obj.Value
                if value == "v2330" or value == "V2330" or value == 2330 or 
                   (obj:IsA("StringValue") and (value == "V2330" or value == "v2330")) then
                    print(obj:GetFullName())
                end
            elseif obj:IsA("GuiObject") and obj.Text and (obj.Text == "V2330" or obj.Text == "v2330" or obj.Text == "2330") then
                print(obj:GetFullName())
            end
        end
    end
end

search(game:GetService("StarterGui"))
