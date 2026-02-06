--// =========================
--//   DeHub | Fish It (Final)
--// =========================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

if game.CoreGui:FindFirstChild("DeHub") then
    game.CoreGui.DeHub:Destroy()
end

local Gui = Instance.new("ScreenGui", game.CoreGui)
Gui.Name = "DeHub"
Gui.ResetOnSpawn = false

-- COLORS
local BG = Color3.fromRGB(18,18,25)
local PANEL = Color3.fromRGB(28,28,38)
local ACCENT = Color3.fromRGB(0,170,255)
local TEXT = Color3.fromRGB(255,255,255)
local SUB = Color3.fromRGB(180,180,180)

-- MAIN
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,720,0,420)
Main.Position = UDim2.new(0.5,-360,0.5,-210)
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.BackgroundColor3 = BG
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,12)

-- TOP BAR
local Top = Instance.new("Frame", Main)
Top.Size = UDim2.new(1,0,0,45)
Top.BackgroundColor3 = PANEL
Top.BorderSizePixel = 0
Instance.new("UICorner", Top).CornerRadius = UDim.new(0,12)

local Title = Instance.new("TextLabel", Top)
Title.Size = UDim2.new(1,0,1,0)
Title.BackgroundTransparency = 1
Title.Text = "DeHub | Fish It"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextColor3 = TEXT

-- SIDEBAR
local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0,190,1,-45)
Side.Position = UDim2.new(0,0,0,45)
Side.BackgroundColor3 = PANEL
Side.BorderSizePixel = 0

local List = Instance.new("UIListLayout", Side)
List.Padding = UDim.new(0,6)

local function MakeTab(name)
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1,-12,0,40)
    b.Position = UDim2.new(0,6,0,0)
    b.Text = name
    b.Font = Enum.Font.Gotham
    b.TextSize = 13
    b.TextColor3 = TEXT
    b.BackgroundColor3 = PANEL
    b.BorderSizePixel = 0
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
    return b
end

local Tabs = {
    Home = MakeTab("🏠 Dashboard"),
    Auto = MakeTab("🎣 Auto Fish"),
    Teleport = MakeTab("🗺 Teleport"),
    Sell = MakeTab("💰 Auto Sell"),
    About = MakeTab("ℹ About")
}

-- CONTENT
local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1,-190,1,-45)
Content.Position = UDim2.new(0,190,0,45)
Content.BackgroundTransparency = 1

local Pages = {}

local function MakePage(name)
    local f = Instance.new("Frame", Content)
    f.Size = UDim2.new(1,0,1,0)
    f.Visible = false
    f.BackgroundTransparency = 1

    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(1,0,0,40)
    t.Text = name
    t.TextColor3 = TEXT
    t.Font = Enum.Font.GothamBold
    t.TextSize = 16
    t.BackgroundTransparency = 1

    Pages[name] = f
end

MakePage("Dashboard")
MakePage("Auto Fish")
MakePage("Teleport")
MakePage("Auto Sell")
MakePage("About")

local function Show(name)
    for _,v in pairs(Pages) do
        v.Visible = false
    end
    Pages[name].Visible = true
end

Show("Dashboard")

Tabs.Home.MouseButton1Click:Connect(function() Show("Dashboard") end)
Tabs.Auto.MouseButton1Click:Connect(function() Show("Auto Fish") end)
Tabs.Teleport.MouseButton1Click:Connect(function() Show("Teleport") end)
Tabs.Sell.MouseButton1Click:Connect(function() Show("Auto Sell") end)
Tabs.About.MouseButton1Click:Connect(function() Show("About") end)

-- DASHBOARD
local Dash = Instance.new("TextLabel", Pages["Dashboard"])
Dash.Size = UDim2.new(1,0,0,60)
Dash.Position = UDim2.new(0,0,0,60)
Dash.Text = "Welcome to DeHub\nFish It Hub"
Dash.TextColor3 = SUB
Dash.Font = Enum.Font.Gotham
Dash.TextSize = 14
Dash.BackgroundTransparency = 1

-- AUTO FISH
local AutoBtn = Instance.new("TextButton", Pages["Auto Fish"])
AutoBtn.Size = UDim2.new(0,200,0,40)
AutoBtn.Position = UDim2.new(0,20,0,60)
AutoBtn.Text = "Auto Fish : OFF"
AutoBtn.BackgroundColor3 = ACCENT
AutoBtn.TextColor3 = TEXT
AutoBtn.Font = Enum.Font.GothamBold
AutoBtn.TextSize = 14
AutoBtn.BorderSizePixel = 0
Instance.new("UICorner", AutoBtn).CornerRadius = UDim.new(0,8)

local AutoFish = false
AutoBtn.MouseButton1Click:Connect(function()
    AutoFish = not AutoFish
    AutoBtn.Text = AutoFish and "Auto Fish : ON" or "Auto Fish : OFF"
    while AutoFish do
        task.wait(1)
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("RemoteEvent") and v.Name:lower():find("fish") then
                v:FireServer()
            end
        end
    end
end)

-- AUTO SELL
local SellBtn = Instance.new("TextButton", Pages["Auto Sell"])
SellBtn.Size = UDim2.new(0,200,0,40)
SellBtn.Position = UDim2.new(0,20,0,60)
SellBtn.Text = "Auto Sell : OFF"
SellBtn.BackgroundColor3 = ACCENT
SellBtn.TextColor3 = TEXT
SellBtn.Font = Enum.Font.GothamBold
SellBtn.TextSize = 14
SellBtn.BorderSizePixel = 0
Instance.new("UICorner", SellBtn).CornerRadius = UDim.new(0,8)

local AutoSell = false
SellBtn.MouseButton1Click:Connect(function()
    AutoSell = not AutoSell
    SellBtn.Text = AutoSell and "Auto Sell : ON" or "Auto Sell : OFF"
    while AutoSell do
        task.wait(2)
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("RemoteEvent") and v.Name:lower():find("sell") then
                v:FireServer()
            end
        end
    end
end)

-- TELEPORT
local TpBtn = Instance.new("TextButton", Pages["Teleport"])
TpBtn.Size = UDim2.new(0,200,0,40)
TpBtn.Position = UDim2.new(0,20,0,60)
TpBtn.Text = "Teleport to Shop"
TpBtn.BackgroundColor3 = ACCENT
TpBtn.TextColor3 = TEXT
TpBtn.Font = Enum.Font.GothamBold
TpBtn.TextSize = 14
TpBtn.BorderSizePixel = 0
Instance.new("UICorner", TpBtn).CornerRadius = UDim.new(0,8)

TpBtn.MouseButton1Click:Connect(function()
    local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = CFrame.new(0,10,0) -- ganti ke koordinat shop
    end
end)

-- ABOUT
local About = Instance.new("TextLabel", Pages["About"])
About.Size = UDim2.new(1,0,0,60)
About.Position = UDim2.new(0,0,0,60)
About.Text = "DeHub\nFish It Hub\nBy You"
About.TextColor3 = SUB
About.Font = Enum.Font.Gotham
About.TextSize = 14
About.BackgroundTransparency = 1
