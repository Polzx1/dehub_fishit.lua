--// ===============================
--//   DeHub Fish It GUI (FINAL)
--//   Made by DeHub
--// ===============================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

-- Colors
local BLUE = Color3.fromRGB(180,220,255)
local WHITE = Color3.fromRGB(255,255,255)
local DARK = Color3.fromRGB(230,240,255)

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
ScreenGui.Name = "DeHubFishIt"
ScreenGui.ResetOnSpawn = false

-- Floating Button
local OpenBtn = Instance.new("TextButton", ScreenGui)
OpenBtn.Size = UDim2.new(0,50,0,50)
OpenBtn.Position = UDim2.new(0,10,0.5,-25)
OpenBtn.Text = "DH"
OpenBtn.BackgroundColor3 = BLUE
OpenBtn.TextColor3 = WHITE
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.TextSize = 14
OpenBtn.BorderSizePixel = 0
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1,0)

-- Main Frame
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0,340,0,280)
Main.Position = UDim2.new(0.5,-170,1.2,0)
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.BackgroundColor3 = WHITE
Main.BorderSizePixel = 0
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,12)

-- Logo
local Logo = Instance.new("ImageLabel", Main)
Logo.Size = UDim2.new(0,32,0,32)
Logo.Position = UDim2.new(0,8,0,4)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://LOGO_ID" -- GANTI DENGAN ID LOGO DEHUB
Logo.ScaleType = Enum.ScaleType.Fit

-- Title
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1,0,0,40)
Title.Position = UDim2.new(0,20,0,0)
Title.BackgroundTransparency = 1
Title.Text = "DeHub | Fish It"
Title.TextColor3 = Color3.fromRGB(80,140,255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

-- Tab Bar
local TabBar = Instance.new("Frame", Main)
TabBar.Size = UDim2.new(1,0,0,40)
TabBar.Position = UDim2.new(0,0,0,40)
TabBar.BackgroundColor3 = DARK
TabBar.BorderSizePixel = 0

-- Content Frame
local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1,0,1,-80)
Content.Position = UDim2.new(0,0,0,80)
Content.BackgroundTransparency = 1

-- Create Tab Button
local function createTab(text, x)
	local b = Instance.new("TextButton", TabBar)
	b.Size = UDim2.new(0.33,0,1,0)
	b.Position = UDim2.new(x,0,0,0)
	b.Text = text
	b.BackgroundTransparency = 1
	b.TextColor3 = Color3.fromRGB(80,140,255)
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	return b
end

local TabMain = createTab("Main",0)
local TabTP = createTab("Teleport",0.33)
local TabSet = createTab("Settings",0.66)

-- Pages
local PageMain = Instance.new("Frame", Content)
PageMain.Size = UDim2.new(1,0,1,0)
PageMain.BackgroundTransparency = 1

local PageTP = PageMain:Clone()
PageTP.Parent = Content
PageTP.Visible = false

local PageSet = PageMain:Clone()
PageSet.Parent = Content
PageSet.Visible = false

-- Button with Icon
local function createButton(parent, text, y, iconId)
	local btn = Instance.new("TextButton", parent)
	btn.Size = UDim2.new(0.85,0,0,40)
	btn.Position = UDim2.new(0.075,0,0,y)
	btn.BackgroundColor3 = BLUE
	btn.Text = "   "..text
	btn.TextColor3 = WHITE
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14
	btn.BorderSizePixel = 0
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

	local icon = Instance.new("ImageLabel", btn)
	icon.Size = UDim2.new(0,24,0,24)
	icon.Position = UDim2.new(0,8,0.5,-12)
	icon.BackgroundTransparency = 1
	icon.Image = iconId or "rbxassetid://7072725342"

	return btn
end

-- Buttons
local AutoFish = createButton(PageMain,"Auto Fish (Demo)",20,"rbxassetid://7072725342")
local AutoSell = createButton(PageMain,"Auto Sell (Demo)",70,"rbxassetid://7072719338")
local TP1 = createButton(PageTP,"Teleport Spot (Demo)",20,"rbxassetid://7072723953")
local CloseBtn = createButton(PageSet,"Close UI",20,"rbxassetid://7072719338")

-- Tween
local openTween = TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
local closeTween = TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In)

OpenBtn.MouseButton1Click:Connect(function()
	Main.Visible = true
	TweenService:Create(Main,openTween,{Position=UDim2.new(0.5,-170,0.5,-140)}):Play()
end)

CloseBtn.MouseButton1Click:Connect(function()
	local t = TweenService:Create(Main,closeTween,{Position=UDim2.new(0.5,-170,1.2,0)})
	t:Play()
	t.Completed:Wait()
	Main.Visible = false
end)

-- Tab Logic
local function showPage(page)
	PageMain.Visible=false
	PageTP.Visible=false
	PageSet.Visible=false
	page.Visible=true
end

TabMain.MouseButton1Click:Connect(function() showPage(PageMain) end)
TabTP.MouseButton1Click:Connect(function() showPage(PageTP) end)
TabSet.MouseButton1Click:Connect(function() showPage(PageSet) end)

-- Demo actions
AutoFish.MouseButton1Click:Connect(function()
	AutoFish.Text="   Auto Fish : ON (Demo)"
end)

AutoSell.MouseButton1Click:Connect(function()
	AutoSell.Text="   Auto Sell : ON (Demo)"
end)

TP1.MouseButton1Click:Connect(function()
	TP1.Text="   Teleport Clicked (Demo)"
end)

-- Logo Animation (pulse)
task.spawn(function()
	while true do
		TweenService:Create(Logo,TweenInfo.new(1),{Size=UDim2.new(0,36,0,36)}):Play()
		task.wait(1)
		TweenService:Create(Logo,TweenInfo.new(1),{Size=UDim2.new(0,32,0,32)}):Play()
		task.wait(1)
	end
end)
