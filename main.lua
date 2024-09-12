local execute = require(game:GetService("ReplicatedStorage"):WaitForChild("LuaState"))
local imgui = execute(game.ReplicatedStorage.RemoteFunction:InvokeServer("https://raw.githubusercontent.com/8q4h4/ABXEngine/main/imgui"))() --require(script.imgui)

local player = game:GetService("Players").LocalPlayer
local Mouse = player:GetMouse()
local Camera = game:GetService("Workspace").CurrentCamera
local uis = game:GetService("UserInputService")

local Drawing = execute(game.ReplicatedStorage.RemoteFunction:InvokeServer("https://raw.githubusercontent.com/8q4h4/ABXEngine/main/Drawing.lua"))()
local uielements = execute(game.ReplicatedStorage.RemoteFunction:InvokeServer("https://raw.githubusercontent.com/8q4h4/ABXEngine/main/UIElements.lua"))()("How many more funcs lmao smh")

local globals = {
	Aimbot = false,
	FOVCircle = false,
	VisibilityCheck = false,
	Target = "Head",
	Smoothness = 15,
	AimFov = 25,
	LockDelay = 50,
	Distance = 150,
	RecoilControl = false,
	NoSpread = false,
	
	ESP = false,
	Skeletons = false,
	Boxes = false,
	Health = false,
	ShowDistance = false,
	Usernames = false,
	PlayerDistance = false,
	PlayerChams = false,
	RoleDetection = false,
	DetectionMode = "Legit",
	ESPDistance = 300,
}
local espPlayers = {}
local espPlayers2 = {}

local function changeStatus(global, status)
	globals[global] = status
end

-- Sound init
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://5120879183"
sound.Volume = 2
sound.PlaybackSpeed = .65

repeat
	wait()
until uis:IsKeyDown(Enum.KeyCode.LeftControl) and uis:IsKeyDown(Enum.KeyCode.F8)

game:GetService("SoundService"):PlayLocalSound(sound)

wait(.5)

local window = imgui:Window({
	Text = "ABX v1.5.0",
})

-- TABS
local aimbotTab = window:Tab({Text = "Aimbot"})
local espTab = window:Tab({Text = "ESP"})
--local miscTab = window:Tab({Text = "Misc"})

-- SECTIONS
local aimSection = aimbotTab:Section({Text = "Aimbot", Side = "Left"})
local aimMiscSection = aimbotTab:Section({Text = "Misc", Side = "Right"})

local espPlayerSection = espTab:Section({Text = "Player ESP", Side = "Left"})
local espWorldSection = espTab:Section({Text = "World ESP", Side = "Right"})

-- AIMBOT SECTION

aimSection:Check({
	Text = "Aimbot",
	Callback = function(bool)
		changeStatus("Aimbot", bool)
	end,
})

aimSection:Check({
	Text = "FOV Circle",
	Callback = function(bool)
		changeStatus("FOVCircle", bool)
	end,
})

aimSection:Check({
	Text = "Visibility Check",
	Callback = function(bool)
		changeStatus("VisibilityCheck", bool)
	end,
})

aimSection:Dropdown({
	Text = "Target",
	List = {"Head", "Torso", "Random"},
	Callback = function(bool)
		changeStatus("Target", bool)
	end
})

aimSection:Slider({
	Text = "Smoothness",
	Minimum = 0,
	Default = 15,
	Maximum = 30,
	Postfix = "%",
	Callback = function(bool)
		changeStatus("Smoothness", bool)
	end,
})

aimSection:Slider({
	Text = "Aim Fov",
	Minimum = 0,
	Default = 25,
	Maximum = 360,
	Postfix = "",
	Callback = function(bool)
		changeStatus("AimFov", bool)
	end,
})

aimSection:Slider({
	Text = "Lock Delay",
	Minimum = 0,
	Default = 50,
	Maximum = 500,
	Postfix = "ms",
	Callback = function(bool)
		changeStatus("LockDelay", bool)
	end,
})

aimSection:Slider({
	Text = "Distance",
	Minimum = 0,
	Default = 150,
	Maximum = 1000,
	Postfix = "m",
	Callback = function(bool)
		changeStatus("Distance", bool)
	end,
})

-- OTHER AIM SECTION
aimMiscSection:Slider({
	Text = "Recoil Control",
	Minimum = 0,
	Default = 100,
	Maximum = 100,
	Postfix = "",
	Callback = function(bool)
		changeStatus("RecoilControl", bool)
	end,
})

aimMiscSection:Check({
	Text = "No Spread",
	Callback = function(bool)
		changeStatus("NoSpread", bool)
	end,
})

aimMiscSection:Check({
	Text = "No Reload (Risky)",
	Callback = function(bool)
		changeStatus("NoReload", bool)
	end,
})

-- ESP TAB

-- ESP Player Section

espPlayerSection:Check({
	Text = "ESP",
	Callback = function(bool)
		changeStatus("ESP", bool)
	end,
})

espPlayerSection:Check({
	Text = "Skeletons",
	Callback = function(bool)
		changeStatus("Skeletons", bool)
	end,
})

espPlayerSection:Check({
	Text = "Boxes",
	Callback = function(bool)
		changeStatus("Boxes", bool)
	end,
})

espPlayerSection:Check({
	Text = "Health",
	Callback = function(bool)
		changeStatus("Health", bool)
	end,
})

espPlayerSection:Check({
	Text = "Show Distance",
	Callback = function(bool)
		changeStatus("ShowDistance", bool)
	end,
})

espPlayerSection:Check({
	Text = "Usernames",
	Callback = function(bool)
		changeStatus("Usernames", bool)
	end,
})

espPlayerSection:Check({
	Text = "Player Distance",
	Callback = function(bool)
		changeStatus("PlayerDistance", bool)
	end,
})

espPlayerSection:Check({
	Text = "Player Chams",
	Callback = function(bool)
		changeStatus("PlayerChams", bool)
	end,
})

espPlayerSection:Check({
	Text = "Role Detection",
	Callback = function(bool)
		changeStatus("RoleDetection", bool)
	end,
})

espPlayerSection:Dropdown({
	Text = "Detection Mode",
	List = {"Legit", "Blatant", "Forced"},
	Callback = function(bool)
		changeStatus("DetectionMode", bool)
	end
})

espPlayerSection:Slider({
	Text = "ESP Distance",
	Minimum = 0,
	Default = 300,
	Maximum = 1000,
	Postfix = "",
	Callback = function(bool)
		changeStatus("ESPDistance", bool)
	end,
})

-- ESP World Section

espWorldSection:Check({
	Text = "Coin Chams",
	Callback = function(bool)
		changeStatus("Coin Chams", bool)
	end,
})

espWorldSection:Check({
	Text = "Terminal Chams",
	Callback = function(bool)
		changeStatus("Terminal Chams", bool)
	end,
})

espWorldSection:Check({
	Text = "Knife Chams",
	Callback = function(bool)
		changeStatus("Knife Chams", bool)
	end,
})

aimbotTab:Select()

local abc = game:GetService("ReplicatedStorage").abc:Clone()
abc.Parent = player:WaitForChild("PlayerGui")

local function DrawLine()
	local l = Drawing.new("Line")
	l.Visible = false
	l.From = Vector2.new(0, 0)
	l.To = Vector2.new(1, 1)
	l.Color = Color3.fromRGB(255, 0, 0)
	l.Thickness = 1
	l.Transparency = 1
	return l
end

local function DrawESP(char)
	repeat wait() until char ~= nil and char:FindFirstChild("Humanoid") ~= nil
	local limbs = {}
	local R15 = (char.Humanoid.RigType == Enum.HumanoidRigType.R15) and true or false
	if R15 then 
		limbs = {
			-- Spine
			Head_UpperTorso = DrawLine(),
			UpperTorso_LowerTorso = DrawLine(),
			-- Left Arm
			UpperTorso_LeftUpperArm = DrawLine(),
			LeftUpperArm_LeftLowerArm = DrawLine(),
			LeftLowerArm_LeftHand = DrawLine(),
			-- Right Arm
			UpperTorso_RightUpperArm = DrawLine(),
			RightUpperArm_RightLowerArm = DrawLine(),
			RightLowerArm_RightHand = DrawLine(),
			-- Left Leg
			LowerTorso_LeftUpperLeg = DrawLine(),
			LeftUpperLeg_LeftLowerLeg = DrawLine(),
			LeftLowerLeg_LeftFoot = DrawLine(),
			-- Right Leg
			LowerTorso_RightUpperLeg = DrawLine(),
			RightUpperLeg_RightLowerLeg = DrawLine(),
			RightLowerLeg_RightFoot = DrawLine(),
		}
	else 
		limbs = {
			Head_Spine = DrawLine(),
			Spine = DrawLine(),
			LeftArm = DrawLine(),
			LeftArm_UpperTorso = DrawLine(),
			RightArm = DrawLine(),
			RightArm_UpperTorso = DrawLine(),
			LeftLeg = DrawLine(),
			LeftLeg_LowerTorso = DrawLine(),
			RightLeg = DrawLine(),
			RightLeg_LowerTorso = DrawLine()
		}
	end
	local function Visibility(state)
		for i, v in pairs(limbs) do
			v.Visible = state
		end
	end

	local function Colorize(color)
		for i, v in pairs(limbs) do
			v.Color = color
		end
	end

	local function UpdaterR15()
		local connection
		connection = game:GetService("RunService").RenderStepped:Connect(function()
			local mag = (workspace.CurrentCamera.CFrame.Position - char:FindFirstChild("HumanoidRootPart").Position).Magnitude
			if mag <= globals.ESPDistance and char ~= nil and char:FindFirstChild("Humanoid") ~= nil and char:FindFirstChild("HumanoidRootPart") ~= nil and char.Humanoid.Health > 0 then
				local HUM, vis = Camera:WorldToViewportPoint(char.HumanoidRootPart.Position)
				if vis then
					-- Head
					local H = Camera:WorldToViewportPoint(char.Head.Position)
					if limbs.Head_UpperTorso.From ~= Vector2.new(H.X, H.Y) then
						--Spine
						local UT = Camera:WorldToViewportPoint(char.UpperTorso.Position)
						local LT = Camera:WorldToViewportPoint(char.LowerTorso.Position)
						-- Left Arm
						local LUA = Camera:WorldToViewportPoint(char.LeftUpperArm.Position)
						local LLA = Camera:WorldToViewportPoint(char.LeftLowerArm.Position)
						local LH = Camera:WorldToViewportPoint(char.LeftHand.Position)
						-- Right Arm
						local RUA = Camera:WorldToViewportPoint(char.RightUpperArm.Position)
						local RLA = Camera:WorldToViewportPoint(char.RightLowerArm.Position)
						local RH = Camera:WorldToViewportPoint(char.RightHand.Position)
						-- Left leg
						local LUL = Camera:WorldToViewportPoint(char.LeftUpperLeg.Position)
						local LLL = Camera:WorldToViewportPoint(char.LeftLowerLeg.Position)
						local LF = Camera:WorldToViewportPoint(char.LeftFoot.Position)
						-- Right leg
						local RUL = Camera:WorldToViewportPoint(char.RightUpperLeg.Position)
						local RLL = Camera:WorldToViewportPoint(char.RightLowerLeg.Position)
						local RF = Camera:WorldToViewportPoint(char.RightFoot.Position)

						--Head
						limbs.Head_UpperTorso.From = Vector2.new(H.X, H.Y)
						limbs.Head_UpperTorso.To = Vector2.new(UT.X, UT.Y)

						--Spine
						limbs.UpperTorso_LowerTorso.From = Vector2.new(UT.X, UT.Y)
						limbs.UpperTorso_LowerTorso.To = Vector2.new(LT.X, LT.Y)

						-- Left Arm
						limbs.UpperTorso_LeftUpperArm.From = Vector2.new(UT.X, UT.Y)
						limbs.UpperTorso_LeftUpperArm.To = Vector2.new(LUA.X, LUA.Y)

						limbs.LeftUpperArm_LeftLowerArm.From = Vector2.new(LUA.X, LUA.Y)
						limbs.LeftUpperArm_LeftLowerArm.To = Vector2.new(LLA.X, LLA.Y)

						limbs.LeftLowerArm_LeftHand.From = Vector2.new(LLA.X, LLA.Y)
						limbs.LeftLowerArm_LeftHand.To = Vector2.new(LH.X, LH.Y)

						-- Right Arm
						limbs.UpperTorso_RightUpperArm.From = Vector2.new(UT.X, UT.Y)
						limbs.UpperTorso_RightUpperArm.To = Vector2.new(RUA.X, RUA.Y)

						limbs.RightUpperArm_RightLowerArm.From = Vector2.new(RUA.X, RUA.Y)
						limbs.RightUpperArm_RightLowerArm.To = Vector2.new(RLA.X, RLA.Y)

						limbs.RightLowerArm_RightHand.From = Vector2.new(RLA.X, RLA.Y)
						limbs.RightLowerArm_RightHand.To = Vector2.new(RH.X, RH.Y)

						-- Left Leg
						limbs.LowerTorso_LeftUpperLeg.From = Vector2.new(LT.X, LT.Y)
						limbs.LowerTorso_LeftUpperLeg.To = Vector2.new(LUL.X, LUL.Y)

						limbs.LeftUpperLeg_LeftLowerLeg.From = Vector2.new(LUL.X, LUL.Y)
						limbs.LeftUpperLeg_LeftLowerLeg.To = Vector2.new(LLL.X, LLL.Y)

						limbs.LeftLowerLeg_LeftFoot.From = Vector2.new(LLL.X, LLL.Y)
						limbs.LeftLowerLeg_LeftFoot.To = Vector2.new(LF.X, LF.Y)

						-- Right Leg
						limbs.LowerTorso_RightUpperLeg.From = Vector2.new(LT.X, LT.Y)
						limbs.LowerTorso_RightUpperLeg.To = Vector2.new(RUL.X, RUL.Y)

						limbs.RightUpperLeg_RightLowerLeg.From = Vector2.new(RUL.X, RUL.Y)
						limbs.RightUpperLeg_RightLowerLeg.To = Vector2.new(RLL.X, RLL.Y)

						limbs.RightLowerLeg_RightFoot.From = Vector2.new(RLL.X, RLL.Y)
						limbs.RightLowerLeg_RightFoot.To = Vector2.new(RF.X, RF.Y)
					end

					if limbs.Head_UpperTorso.Visible ~= true then
						Visibility(true)
					end
				else 
					if limbs.Head_UpperTorso.Visible ~= false then
						Visibility(false)
					end
				end
			else 
				if limbs.Head_UpperTorso.Visible ~= false then
					Visibility(false)
				end
				if game.Players:FindFirstChild(plr.Name) == nil then 
					for i, v in pairs(limbs) do
						v:Remove()
					end
					connection:Disconnect()
				end
			end
		end)
	end

	local function UpdaterR6()
		local connection
		connection = game:GetService("RunService").RenderStepped:Connect(function()
			local mag = (workspace.CurrentCamera.CFrame.Position - char:FindFirstChild("HumanoidRootPart").Position).Magnitude
			if mag <= globals.ESPDistance and char ~= nil and char:FindFirstChild("Humanoid") ~= nil and char:FindFirstChild("HumanoidRootPart") ~= nil and char.Humanoid.Health > 0 then
				local HUM, vis = Camera:WorldToViewportPoint(char.HumanoidRootPart.Position)
				if vis then
					local H = Camera:WorldToViewportPoint(char.Head.Position)
					if limbs.Head_Spine.From ~= Vector2.new(H.X, H.Y) then
						local T_Height = char.Torso.Size.Y/2 - 0.2
						local UT = Camera:WorldToViewportPoint((char.Torso.CFrame * CFrame.new(0, T_Height, 0)).p)
						local LT = Camera:WorldToViewportPoint((char.Torso.CFrame * CFrame.new(0, -T_Height, 0)).p)

						local LA_Height = char["Left Arm"].Size.Y/2 - 0.2
						local LUA = Camera:WorldToViewportPoint((char["Left Arm"].CFrame * CFrame.new(0, LA_Height, 0)).p)
						local LLA = Camera:WorldToViewportPoint((char["Left Arm"].CFrame * CFrame.new(0, -LA_Height, 0)).p)

						local RA_Height = char["Right Arm"].Size.Y/2 - 0.2
						local RUA = Camera:WorldToViewportPoint((char["Right Arm"].CFrame * CFrame.new(0, RA_Height, 0)).p)
						local RLA = Camera:WorldToViewportPoint((char["Right Arm"].CFrame * CFrame.new(0, -RA_Height, 0)).p)

						local LL_Height = char["Left Leg"].Size.Y/2 - 0.2
						local LUL = Camera:WorldToViewportPoint((char["Left Leg"].CFrame * CFrame.new(0, LL_Height, 0)).p)
						local LLL = Camera:WorldToViewportPoint((char["Left Leg"].CFrame * CFrame.new(0, -LL_Height, 0)).p)

						local RL_Height = char["Right Leg"].Size.Y/2 - 0.2
						local RUL = Camera:WorldToViewportPoint((char["Right Leg"].CFrame * CFrame.new(0, RL_Height, 0)).p)
						local RLL = Camera:WorldToViewportPoint((char["Right Leg"].CFrame * CFrame.new(0, -RL_Height, 0)).p)

						-- Head
						limbs.Head_Spine.From = Vector2.new(H.X, H.Y)
						limbs.Head_Spine.To = Vector2.new(UT.X, UT.Y)

						--Spine
						limbs.Spine.From = Vector2.new(UT.X, UT.Y)
						limbs.Spine.To = Vector2.new(LT.X, LT.Y)

						--Left Arm
						limbs.LeftArm.From = Vector2.new(LUA.X, LUA.Y)
						limbs.LeftArm.To = Vector2.new(LLA.X, LLA.Y)

						limbs.LeftArm_UpperTorso.From = Vector2.new(UT.X, UT.Y)
						limbs.LeftArm_UpperTorso.To = Vector2.new(LUA.X, LUA.Y)

						--Right Arm
						limbs.RightArm.From = Vector2.new(RUA.X, RUA.Y)
						limbs.RightArm.To = Vector2.new(RLA.X, RLA.Y)

						limbs.RightArm_UpperTorso.From = Vector2.new(UT.X, UT.Y)
						limbs.RightArm_UpperTorso.To = Vector2.new(RUA.X, RUA.Y)

						--Left Leg
						limbs.LeftLeg.From = Vector2.new(LUL.X, LUL.Y)
						limbs.LeftLeg.To = Vector2.new(LLL.X, LLL.Y)

						limbs.LeftLeg_LowerTorso.From = Vector2.new(LT.X, LT.Y)
						limbs.LeftLeg_LowerTorso.To = Vector2.new(LUL.X, LUL.Y)

						--Right Leg
						limbs.RightLeg.From = Vector2.new(RUL.X, RUL.Y)
						limbs.RightLeg.To = Vector2.new(RLL.X, RLL.Y)

						limbs.RightLeg_LowerTorso.From = Vector2.new(LT.X, LT.Y)
						limbs.RightLeg_LowerTorso.To = Vector2.new(RUL.X, RUL.Y)
					end

					if limbs.Head_Spine.Visible ~= true then
						Visibility(true)
					end
				else 
					if limbs.Head_Spine.Visible ~= false then
						Visibility(false)
					end
				end
			else 
				if limbs.Head_Spine.Visible ~= false then
					Visibility(false)
				end
				if game.Players:FindFirstChild(char.Name) == nil then 
					for i, v in pairs(limbs) do
						v:Remove()
					end
					connection:Disconnect()
				end
			end
		end)
	end

	UpdaterR15()

	espPlayers[char] = limbs


	--[[
	if R15 then
		coroutine.wrap(UpdaterR15)()
	else 
		coroutine.wrap(UpdaterR6)()
	end]]
end

print(globals)

while wait() do
	for i, v in pairs(workspace:GetDescendants()) do
		if v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
			--if game:GetService("Players"):GetPlayerFromCharacter(v) and not espPlayers2[v.Name] then--or #v.Name == 64 and not espPlayers2[v.Name] then
			if not espPlayers2[v.Name] then
				espPlayers2[v.Name] = {
					Player = v,--game:GetService("Players"):GetPlayerFromCharacter(v),
					Character = v,
					ESPUI = nil,
				}
			end
			--end
		end
	end
	
	if globals.FOVCircle then
		if abc:FindFirstChild("FOVCircle") then
			abc:FindFirstChild("FOVCircle").Visible = true

			abc:FindFirstChild("FOVCircle").Size = UDim2.new(globals.AimFov / 100, 0, globals.AimFov / 100, 0)
		end
	else
		if abc:FindFirstChild("FOVCircle") then
			abc:FindFirstChild("FOVCircle").Visible = false
		end
	end	
	
	if globals.ESP and game.PlaceVersion == 0 then
		if globals.Skeletons then
			for i, v in pairs(workspace:GetDescendants()) do
				if v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
					if not espPlayers[v] then
						DrawESP(v)
					end
				end
			end
		else
			for i, v in pairs(espPlayers) do
				for _, limb in pairs(v) do
					limb:Remove()
				end
				espPlayers[i] = nil;
			end
		end

		for i, v in pairs(espPlayers2) do
			if v.ESPUI then
				local UI = v.ESPUI
				local pos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(v.Character:FindFirstChild("HumanoidRootPart").Position) 
				local mag = (workspace.CurrentCamera.CFrame.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude

				if onScreen and mag <= globals.ESPDistance then
					local nameString = "%s%s"

					if not v.Character:IsDescendantOf(workspace) then
						espPlayers2[i] = nil;
						UI:Destroy()
					end

					if globals.Health then
						UI:FindFirstChild("HealthBar").Visible = true
						UI:FindFirstChild("HealthBar").Health.Size = UDim2.new(1, 0, v.Character:FindFirstChild("Humanoid").Health / 100, 0)
					else
						UI:FindFirstChild("HealthBar").Visible = false
					end

					if globals.ShowDistance then
						nameString = nameString:format("%s", (" (%sm)"):format(math.floor(mag)))
					else
						nameString = nameString:format("%s", "")
					end

					if globals.Usernames then
						nameString = nameString:format(v.Character:FindFirstChild("Humanoid").DisplayName or "BOT")

						UI:FindFirstChild("ESPName").TextColor3 = Color3.fromRGB(255, 0, 0)
						UI:FindFirstChild("ESPName").Text = nameString
					else
						UI:FindFirstChild("ESPName").Text = nameString:format("")
					end

					if globals.Boxes then
						UI:FindFirstChild("UIStroke").Color = Color3.fromRGB(255, 0, 0)
						UI:FindFirstChild("UIStroke").Enabled = true
					else
						UI:FindFirstChild("UIStroke").Enabled = false
					end

					if globals.PlayerChams then
						UI.Highlight.Adornee = v.Character
						UI.Highlight.FillColor = Color3.fromRGB(255, 0, 255)
						UI.Highlight.Enabled = true
						
						for i, v in pairs(v.Character:GetDescendants()) do
							if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
								v.Transparency = .99
							end
						end
						v.Character:FindFirstChild("Head"):FindFirstChild("face").Transparency = 1
					else
						UI.Highlight.Enabled = false
						for i, v in pairs(v.Character:GetDescendants()) do
							if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
								v.Transparency = 0
							end
						end
						v.Character:FindFirstChild("Head"):FindFirstChild("face").Transparency = 0
					end

					UI.Visible = true;
					UI.Size = UDim2.new(0, 2000 / mag, 0, 3000 / mag)
					UI.Position = UDim2.new(0, pos.X, 0, pos.Y)
				else
					if globals.PlayerChams then
						UI.Highlight.Enabled = false
						for i, v in pairs(v.Character:GetDescendants()) do
							if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
								v.Transparency = 0
							end
						end
						
						v.Character:FindFirstChild("Head"):FindFirstChild("face").Transparency = 0
					end
					UI.Visible = false
				end
			else
				local espClone = abc:FindFirstChild("ESPTemplate"):Clone()

				espClone.Name = "ESPObject"
				espClone.Parent = abc
				espPlayers2[i].ESPUI = espClone
			end
		end
	else
		for i, v in pairs(espPlayers2) do
			if v.ESPUI then
				v.ESPUI:Destroy()
				espPlayers2[i].ESPUI = nil;
			end
		end
	end
end
