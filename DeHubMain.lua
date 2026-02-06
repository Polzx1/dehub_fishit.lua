--// =========================
--//   DeHub | Fish It (Final)
--// =========================

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")

if game.CoreGui:FindFirstChild("DeHub") then
    game.CoreGui.DeHub:Destroy()
end

local Gui = Instance.new("ScreenGui", game.CoreGui)
Gui.Name = "DeHub"
Gui.ResetOnSpawn = false

-- COLORS
local BG = Color3.fromRGB(230,245,255)
local PANEL = Color3.fromRGB(255,255,255)
local ACCENT = Color3.fromRGB(0,170,255)
local TEXT = Color3.fromRGB(20,20,20)
local SUB = Color3.fromRGB(80,80,80)

-- MAIN
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,350,0,260)
Main.Position = UDim2.new(0.5,0,0.5,0)
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.BackgroundColor3 = BG
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,12)

-- TOP BAR
local Top = Instance.new("Frame", Main)
Top.Size = UDim2.new(1,0,0,35)
Top.BackgroundColor3 = ACCENT
Top.BorderSizePixel = 0
Instance.new("UICorner", Top).CornerRadius = UDim.new(0,12)

local Title = Instance.new("TextLabel", Top)
Title.Size = UDim2.new(1,0,1,0)
Title.BackgroundTransparency = 1
Title.Text = "DeHub | Fish It"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextColor3 = Color3.fromRGB(255,255,255)

-- SIDEBAR
local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0,120,1,-35)
Side.Position = UDim2.new(0,0,0,35)
Side.BackgroundColor3 = PANEL
Side.BorderSizePixel = 0

local List = Instance.new("UIListLayout", Side)
List.Padding = UDim.new(0,4)

local function MakeTab(name)
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1,-8,0,32)
    b.Position = UDim2.new(0,4,0,0)
    b.Text = name
    b.Font = Enum.Font.Gotham
    b.TextSize = 12
    b.TextColor3 = TEXT
    b.BackgroundColor3 = BG
    b.BorderSizePixel = 0
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,6)
    return b
end

local Tabs = {
    Home = MakeTab("🏠 Home"),
    Auto = MakeTab("🎣 Auto Fish"),
    Teleport = MakeTab("🗺 Teleport"),
    Sell = MakeTab("💰 Auto Sell"),
    About = MakeTab("ℹ About")
}

-- CONTENT
local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1,-120,1,-35)
Content.Position = UDim2.new(0,120,0,35)
Content.BackgroundTransparency = 1

local Pages = {}

local function MakePage(name)
    local f = Instance.new("Frame", Content)
    f.Size = UDim2.new(1,0,1,0)
    f.Visible = false
    f.BackgroundTransparency = 1

    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(1,0,0,30)
    t.Text = name
    t.TextColor3 = TEXT
    t.Font = Enum.Font.GothamBold
    t.TextSize = 14
    t.BackgroundTransparency = 1

    Pages[name] = f
end

MakePage("Home")
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

Show("Home")

Tabs.Home.MouseButton1Click:Connect(function() Show("Home") end)
Tabs.Auto.MouseButton1Click:Connect(function() Show("Auto Fish") end)
Tabs.Teleport.MouseButton1Click:Connect(function() Show("Teleport") end)
Tabs.Sell.MouseButton1Click:Connect(function() Show("Auto Sell") end)
Tabs.About.MouseButton1Click:Connect(function() Show("About") end)

-- HOME
local HomeTxt = Instance.new("TextLabel", Pages["Home"])
HomeTxt.Size = UDim2.new(1,0,0,60)
HomeTxt.Position = UDim2.new(0,0,0,40)
HomeTxt.Text = "Welcome to DeHub\nFish It Script"
HomeTxt.TextColor3 = SUB
HomeTxt.Font = Enum.Font.Gotham
HomeTxt.TextSize = 13
HomeTxt.BackgroundTransparency = 1

-- AUTO FISH
local AutoBtn = Instance.new("TextButton", Pages["Auto Fish"])
AutoBtn.Size = UDim2.new(0,160,0,35)
AutoBtn.Position = UDim2.new(0,10,0,40)
AutoBtn.Text = "Auto Fish : OFF"
AutoBtn.BackgroundColor3 = ACCENT
AutoBtn.TextColor3 = Color3.fromRGB(255,255,255)
AutoBtn.Font = Enum.Font.GothamBold
AutoBtn.TextSize = 12
AutoBtn.BorderSizePixel = 0
Instance.new("UICorner", AutoBtn).CornerRadius = UDim.new(0,6)

local AutoFish = false
AutoBtn.MouseButton1Click:Connect(function()
    AutoFish = not AutoFish
    AutoBtn.Text = AutoFish and "Auto Fish : ON" or "Auto Fish : OFF"

    task.spawn(function()
        while AutoFish do
            task.wait(1)
            local r = RS:FindFirstChild("FishRemote", true)
            if r then
                r:FireServer()
            end
        end
    end)
end)

-- AUTO SELL
local SellBtn = Instance.new("TextButton", Pages["Auto Sell"])
SellBtn.Size = UDim2.new(0,160,0,35)
SellBtn.Position = UDim2.new(0,10,0,40)
SellBtn.Text = "Auto Sell : OFF"
SellBtn.BackgroundColor3 = ACCENT
SellBtn.TextColor3 = Color3.fromRGB(255,255,255)
SellBtn.Font = Enum.Font.GothamBold
SellBtn.TextSize = 12
SellBtn.BorderSizePixel = 0
Instance.new("UICorner", SellBtn).CornerRadius = UDim.new(0,6)

local AutoSell = false
SellBtn.MouseButton1Click:Connect(function()
    AutoSell = not AutoSell
    SellBtn.Text = AutoSell and "Auto Sell : ON" or "Auto Sell : OFF"

    task.spawn(function()
        while AutoSell do
            task.wait(2)
            local r = RS:FindFirstChild("SellRemote", true)
            if r then
                r:FireServer()
            end
        end
    end)
end)

-- TELEPORT
local TpBtn = Instance.new("TextButton", Pages["Teleport"])
TpBtn.Size = UDim2.new(0,160,0,35)
TpBtn.Position = UDim2.new(0,10,0,40)
TpBtn.Text = "Teleport Shop"
TpBtn.BackgroundColor3 = ACCENT
TpBtn.TextColor3 = Color3.fromRGB(255,255,255)
TpBtn.Font = Enum.Font.GothamBold
TpBtn.TextSize = 12
TpBtn.BorderSizePixel = 0
Instance.new("UICorner", TpBtn).CornerRadius = UDim.new(0,6)

TpBtn.MouseButton1Click:Connect(function()
    local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = CFrame.new(0,10,0)
    end
end)

-- ABOUT
local About = Instance.new("TextLabel", Pages["About"])
About.Size = UDim2.new(1,0,0,60)
About.Position = UDim2.new(0,0,0,40)
About.Text = "DeHub\nFish It Hub\nBy Polzx"
About.TextColor3 = SUB
About.Font = Enum.Font.Gotham
About.TextSize = 12
About.BackgroundTransparency = 1
