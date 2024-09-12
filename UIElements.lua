return function()
	-- Gui to Lua
	-- Version: 3.2

	-- Instances:

	local abc = Instance.new("ScreenGui")
	local ESPTemplate = Instance.new("Frame")
	local ESPName = Instance.new("TextLabel")
	local HealthBar = Instance.new("Frame")
	local Health = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local FOVCircle = Instance.new("Frame")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local UICorner = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local UIStroke2 = Instance.new("UIStroke")
	local Highlight = Instance.new("Highlight")

	--Properties:

	abc.Name = "abc"
	abc.Parent = game:GetService("ReplicatedStorage")
	abc.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	ESPTemplate.Name = "ESPTemplate"
	ESPTemplate.Parent = abc
	ESPTemplate.AnchorPoint = Vector2.new(0.5, 0.5)
	ESPTemplate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ESPTemplate.BackgroundTransparency = 1.000
	ESPTemplate.BorderColor3 = Color3.fromRGB(255, 0, 0)
	ESPTemplate.BorderSizePixel = 0
	ESPTemplate.Position = UDim2.new(0.5, 0, 0.5, 0)
	ESPTemplate.Size = UDim2.new(0, 200, 0, 316)
	ESPTemplate.Visible = false

	ESPName.Name = "ESPName"
	ESPName.Parent = ESPTemplate
	ESPName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ESPName.BackgroundTransparency = 1.000
	ESPName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ESPName.BorderSizePixel = 0
	ESPName.Position = UDim2.new(0, 0, -0.0886075944, 0)
	ESPName.Size = UDim2.new(1, 0, 0.0632911399, 0)
	ESPName.Font = Enum.Font.GothamBold
	ESPName.Text = ""
	ESPName.TextColor3 = Color3.fromRGB(255, 0, 0)
	ESPName.TextScaled = true
	ESPName.TextSize = 14.000
	ESPName.TextWrapped = true

	HealthBar.Name = "HealthBar"
	HealthBar.Parent = ESPTemplate
	HealthBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	HealthBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HealthBar.BorderSizePixel = 0
	HealthBar.Position = UDim2.new(-0.075000003, 0, 0, 0)
	HealthBar.Size = UDim2.new(0.0399999991, 0, 1, 0)
	HealthBar.Visible = false

	Health.Name = "Health"
	Health.Parent = HealthBar
	Health.BackgroundColor3 = Color3.fromRGB(58, 170, 75)
	Health.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Health.BorderSizePixel = 0
	Health.Position = UDim2.new(0, 0, 0.493670881, 0)
	Health.Size = UDim2.new(1, 0, 0.506329119, 0)

	UIListLayout.Parent = HealthBar
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom

	FOVCircle.Name = "FOVCircle"
	FOVCircle.Parent = abc
	FOVCircle.AnchorPoint = Vector2.new(0.5, 0.5)
	FOVCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FOVCircle.BackgroundTransparency = 1.000
	FOVCircle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FOVCircle.BorderSizePixel = 0
	FOVCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
	FOVCircle.Size = UDim2.new(0.100000001, 0, 0.100000001, 0)
	FOVCircle.Visible = false

	UIAspectRatioConstraint.Parent = FOVCircle

	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = FOVCircle
	
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Parent = FOVCircle
	
	UIStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke2.Parent = ESPTemplate
	
	Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	Highlight.FillTransparency = .5
	Highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
	Highlight.OutlineTransparency = .75
	Highlight.Parent = ESPTemplate
end
