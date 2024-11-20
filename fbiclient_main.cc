local execute = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("LuaState"))
local network = require(game:GetService("ReplicatedStorage"):WaitForChild("Network"))

local library = execute(network:fetch("6e956c817dc5893f59d059b", "https://raw.githubusercontent.com/8q4h4/ABXEngine/refs/heads/main/fbiclient_lib.cc"))()

local Aimbot = library:CreateSection("Aimbot");
Aimbot:Toggle("Aimbot");
Aimbot:Toggle("Visibility Check");
Aimbot:Dropdown("Bone Target", {"Head", "Torso", "Leg"});
Aimbot:Slider("Aimbot FOV", {min = 0, max = 360})
Aimbot:Dropdown("Aim Type", {"Aimbot", "Silent Aim (Client)", "PSilent (Server) [RISKY]"});

local ESP = library:CreateSection("ESP");
ESP:Toggle("ESP");
ESP:Toggle("Boxes");
ESP:Toggle("Skeletons");
ESP:Toggle("Health");
ESP:Toggle("Names");
ESP:Toggle("Distance");
ESP:Toggle("Snaplines");
ESP:Toggle("Enemies Only");
ESP:Toggle("Visible Only");

local Saver = library:CreateSection("Saver");
Saver:Dropdown("Saving Slot", {"Gun", "Knife"});
Saver:Dropdown("Weapon Skin", {"Neptune", "Watergun"});
Saver:Button("Save Weapon Skins");

Saver:Dropdown("Knife Effect", {"Dark Matter", "Fire", "Poison"});
Saver:Button("Save Weapon Effects");

local Misc = library:CreateSection("Misc");
Misc:Toggle("Unlock All");
Misc:Toggle("Spoof Premium");


library:Ready();
