--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.9.17) ~  Much Love, Ferib 

]]--
p
local v0 = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))();
local v1 = game.Players.LocalPlayer;
local v2 = v0:MakeWindow({Name="KeySystem",HidePremium=false,SaveConfig=true});
local v3 = nil or false;
local v4 = game:GetService("Players").LocalPlayer.Name;
local v5 = game:GetService("Players");
local v6 = 33304491;
local v7 = v5.LocalPlayer;
_G.Key_Bypass = false;
local v8, v9 = pcall(function()
	if v7:IsInGroup(v6) then
		local v29 = v7:GetRankInGroup(v6);
		if (v29 == 225) then
			_G.Key_Bypass = true;
		end
	else
		_G.Key_Bypass = false;
	end
end);
if not v8 then
	print("Error: " .. v9);
	_G.Key_Bypass = false;
end
if (game.Players.LocalPlayer.Name == "LT2money_storage") then
	_G.Key_Bypass = true;
end
v0:MakeNotification({Name="Hello",Content=(v4 .. "!"),Image="rbxassetid://4483345998",Time=3});
_G.Key = loadstring(game:HttpGet("https://raw.githubusercontent.com/bacaman23/randomtesting/main/Key.lua"))();
_G.KeyInput = "string";
function Open()
	local v12 = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))();
	v3 = true;
	local v13 = v12:MakeWindow({Name="Script Hub | By bacaman23#6979",HidePremium=false,SaveConfig=true});
	local v14 = v13:MakeTab({Name="Blue Print",Icon="rbxassetid://4483345998",PremiumOnly=false});
	v14:AddDropdown({Name="Select Blue Print",Default="nil",Options={"Wall2Short","Wall2","Wall2ShortThin","Wall2Thin","Wall2Tall","Wall2TallThin","Wall2ShortCorner","Wall2Corner","Wall2TallCorner","Wall1Short","Wall1ShortThin","Wall1","Wall1Thin","Wall1Tall","Wall1TallThin","Wall1ShortCorner","Wall1Corner","Wall1TallCorner","Wall3","Wall3Thin","Wall3Tall","Wall3TallThin","Wall3Corner","Wall3TallCorner","Floor2Tiny","Floor2Small","Floor2","Floor2Large","Floor1Tiny","Floor1Small","Floor1","Floor1Large","Door1","Door2","Door3","Table1","Table2","Chair1","Ladder1","Post"},Callback=function(v17)
		_G.Structure = v17;
	end});
	v14:AddDropdown({Name="Set Blue Print X Angles",Default="nil",Options={"0","5","10","15","20","25","30","35","40","45","50","55","60","65","70","75","80","85","90","95","100","105","110","115","120","125","130","135","140","145","150","155","160","165","170","175","180"},Callback=function(v18)
		_G.Angle_X = v18;
	end});
	v14:AddDropdown({Name="Set Blue Print Y Angles",Default="nil",Options={"0","5","10","15","20","25","30","35","40","45","50","55","60","65","70","75","80","85","90","95","100","105","110","115","120","125","130","135","140","145","150","155","160","165","170","175","180"},Callback=function(v19)
		_G.Angle_Y = v19;
	end});
	v14:AddDropdown({Name="Set Blue Print Z Angles",Default="nil",Options={"0","5","10","15","20","25","30","35","40","45","50","55","60","65","70","75","80","85","90","95","100","105","110","115","120","125","130","135","140","145","150","155","160","165","170","175","180"},Callback=function(v20)
		_G.Angle_Z = v20;
	end});
	v14:AddButton({Name="Place",Callback=function()
		if ((_G.Angle_X == "nil") or (_G.Angle_X == nil)) then
			_G.Angle_X = 0;
		end
		if ((_G.Angle_Y == "nil") or (_G.Angle_Y == nil)) then
			_G.Angle_Y = 0;
		end
		if ((_G.Angle_Y == "nil") or (_G.Angle_Y == nil)) then
			_G.Angle_Y = 0;
		end
		if ((_G.Structure == "nil") or (_G.Structure == nil)) then
			v12:MakeNotification({Name="Failed",Content="No Structure Selected",Image="rbxassetid://4483345998",Time=3});
			return;
		end
		_G.Angle_X = tonumber(_G.Angle_X);
		_G.Angle_Y = tonumber(_G.Angle_Y);
		_G.Angle_Z = tonumber(_G.Angle_Z);
		v1.CharacterAdded:Wait();
		local v21 = v1.Character:WaitForChild("HumanoidRootPart");
		local v22 = v21.Position;
		game:GetService("ReplicatedStorage").PlaceStructure.ClientPlacedBlueprint:FireServer(_G.Structure, CFrame.new(v22.x, v22.y, v22.z) * CFrame.Angles(_G.Angle_X, _G.Angle_Y, _G.Angle_Z), game:GetService("Players").LocalPlayer);
		_G.Angle_X = nil;
		_G.Angle_Y = nil;
		_G.Angle_Z = nil;
		_G.Structure = nil;
		v12:Init();
	end});
	local v15 = v13:MakeTab({Name="Glass",Icon="rbxassetid://4483345998",PremiumOnly=false});
	v15:AddDropdown({Name="Select Glass",Default="nil",Options={"Glass1","Glass2","Glass3","Glass4","GlassDoor1"},Callback=function(v23)
		GlassType = v23;
	end});
	v15:AddDropdown({Name="Set Glass X Angles",Default="nil",Options={"0","5","10","15","20","25","30","35","40","45","50","55","60","65","70","75","80","85","90","95","100","105","110","115","120","125","130","135","140","145","150","155","160","165","170","175","180"},Callback=function(v24)
		Angle_X = v24;
	end});
	v15:AddDropdown({Name="Set Glass Y Angles",Default="nil",Options={"0","5","10","15","20","25","30","35","40","45","50","55","60","65","70","75","80","85","90","95","100","105","110","115","120","125","130","135","140","145","150","155","160","165","170","175","180"},Callback=function(v25)
		Angle_Y = v25;
	end});
	v15:AddDropdown({Name="Set Glass Z Angles",Default="nil",Options={"0","5","10","15","20","25","30","35","40","45","50","55","60","65","70","75","80","85","90","95","100","105","110","115","120","125","130","135","140","145","150","155","160","165","170","175","180"},Callback=function(v26)
		Angle_Z = v26;
	end});
	v15:AddButton({Name="Place Glass",Callback=function()
		if ((Angle_X == "nil") or (Angle_X == nil)) then
			Angle_X = 0;
		end
		if ((Angle_Y == "nil") or (Angle_Y == nil)) then
			Angle_Y = 0;
		end
		if ((Angle_Z == "nil") or (Angle_Z == nil)) then
			Angle_Z = 0;
		end
		if ((GlassType ~= "Glass1") and (GlassType ~= "Glass2") and (GlassType ~= "Glass3") and (GlassType ~= "Glass4") and (GlassType ~= "GlassDoor1")) then
			v12:MakeNotification({Name="Failed",Content="No Glass Selected",Image="rbxassetid://4483345998",Time=3});
			return;
		end
		if ((GlassType == "nil") or (GlassType == nil)) then
			v12:MakeNotification({Name="Failed",Content="No Glass Selected",Image="rbxassetid://4483345998",Time=3});
			return;
		end
		Angle_X = tonumber(Angle_X);
		Angle_Y = tonumber(Angle_Y);
		Angle_Z = tonumber(Angle_Z);
		v1.CharacterAdded:Wait();
		local v27 = v1.Character:WaitForChild("HumanoidRootPart");
		local v28 = v27.Position;
		function getNil(v30, v31)
			for v32, v33 in pairs(getnilinstances()) do
				if ((v33.ClassName == v31) and (v33.Name == v30)) then
					return v33;
				end
			end
		end
		game:GetService("ReplicatedStorage").PlaceStructure.ClientPlacedStructure:FireServer(GlassType, Cframe.new(v28.x, v28.y, v28.z) * CFrame.Angles(Angle_X, Angle_Y, Angle_Z), game:GetService("Players").LocalPlayer, getNil(GlassType, "Model"), false, true);
		GlassType = nil;
		Angle_X = nil;
		Angle_Y = nil;
		Angle_Z = nil;
	end});
end
function OpenNotification()
	v0:MakeNotification({Name="Correct Key",Content="",Image="rbxassetid://4483345998",Time=3});
end
function IncorrectKey()
	v0:MakeNotification({Name="Incorrect Key",Content="",Image="rbxassetid://4483345998",Time=3});
end
function NoAccess()
	v0:MakeNotification({Name="Failed",Content="Incorrect Permissions",Image="rbxassetid://4483345998",Time=3});
end
local v10 = v2:MakeTab({Name="Key System",Icon="rbxassetid://4483345998",PremiumOnly=false});
local v11 = v2:MakeTab({Name="Anti Ban",Icon="rbxassetid://4483345998",PremiumOnly=false});
v11:AddButton({Name="Disable Banning",Callback=function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/bacaman23/roblox/main/Lt2_AntiBan.lua"))();
end});
v10:AddTextbox({Name="Enter Key",Default="",TextDisappear=true,Callback=function(v16)
	_G.KeyInput = v16;
end});
v10:AddButton({Name="Check Key",Callback=function()
	if ((_G.KeyInput == _G.Key) and not v3) then
		OpenNotification();
		v0:Destroy();
		task.wait(2);
		Open();
		v3 = true;
	else
		IncorrectKey();
	end
end});
v10:AddButton({Name="Skip Key",Callback=function()
	if (_G.Key_Bypass and not v3) then
		OpenNotification();
		v0:Destroy();
		task.wait(2);
		Open();
		v3 = true;
	else
		NoAccess();
	end
end});
v0:Init();
