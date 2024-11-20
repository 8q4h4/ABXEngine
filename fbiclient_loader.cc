getfenv().getfenv().currentLoader = "fbiclient";

local execute = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("LuaState"))
local network = require(game:GetService("ReplicatedStorage"):WaitForChild("Network"))

execute(network:fetch("6e956c817dc5893f59d059b", "https://raw.githubusercontent.com/8q4h4/ABXEngine/refs/heads/main/lloader"))()
