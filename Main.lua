--// =========================
--//   DeHub | Fish It ULTIMATE
--// =========================

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Player = Players.LocalPlayer

if game.CoreGui:FindFirstChild("DeHub") then
    game.CoreGui.DeHub:Destroy()
end

-- BLUR
local Blur = Instance.new("BlurEffect", Lighting)
Blur.Size = 0

-- GUI
local Gui = Instance.new("ScreenGui", game.CoreGui)
Gui.Name = "DeHub"
Gui.ResetOnSpawn = false

-- THEMES
local Themes = {
    Light = {
        BG = Color3.fromRGB(235,248,255),
        PANEL = Color3.fromRGB(255,255,255),
        ACCENT = Color3.fromRGB(0,170,255),
        TEXT = Color3.fromRGB(30,30,30),
        SUB = Color3.fromRGB(120,120,120)
    },
    Dark = {
        BG = Color3.fromRGB(18,18,25),
        PANEL = Color3.fromRGB(28,28,38),
        ACCENT = Color3.fromRGB(0,170,255),
        TEXT = Color3.fromRGB(255,255,255),
        SUB = Color3.fromRGB(180,180,180)
    }
}
local Theme = Themes.Light

-- MAIN
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,650,0,380)
Main.Position = UDim2.new(0.5,-325,0.5,-190)
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.BackgroundColor3 = Theme.PANEL
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,16)

-- TOP BAR
local Top = Instance.new("Frame", Main)
Top.Size = UDim2.new(1,0,0,42)
Top.BackgroundColor3 = Theme.ACCENT
Top.BorderSizePixel = 0
Instance.new("UICorner", Top).CornerRadius = UDim.new(0,16)

local Logo = Instance.new("TextLabel", Top)
Logo.Size = UDim2.new(0,120,1,0)
Logo.Text = "💠 DeHub"
Logo.Font = Enum.Font.GothamBold
Logo.TextSize = 15
Logo.TextColor3 = Color3.new(1,1,1)
Logo.BackgroundTransparency = 1

local Close = Instance.new("TextButton", Top)
Close.Size = UDim2.new(0,32,0,32)
Close.Position = UDim2.new(1,-38,0.5,-16)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.TextColor3 = Color3.new(1,1,1)
Close.BackgroundColor3 = Color3.fromRGB(255,80,80)
Close.BorderSizePixel = 0
Instance.new("UICorner", Close).CornerRadius = UDim.new(1,0)

Close.MouseButton1Click:Connect(function()
    Blur.Size = 0
    Gui:Destroy()
end)

-- SIDEBAR
local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0,180,1,-42)
Side.Position = UDim2.new(0,0,0,42)
Side.BackgroundColor3 = Theme.BG
Side.BorderSizePixel = 0

local List = Instance.new("UIListLayout", Side)
List.Padding = UDim.new(0,6)

local function MakeTab(text)
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1,-12,0,36)
    b.Position = UDim2.new(0,6,0,0)
    b.Text = text
    b.Font = Enum.Font.Gotham
    b.TextSize = 13
    b.TextColor3 = Theme.TEXT
    b.BackgroundColor3 = Theme.PANEL
    b.BorderSizePixel = 0
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
    return b
end

local Tabs = {
    Home = MakeTab("🏠 Home"),
    Auto = MakeTab("🎣 Auto Fish"),
    Teleport = MakeTab("🗺 Teleport"),
    Sell = MakeTab("💰 Auto Sell"),
    Settings = MakeTab("⚙ Settings"),
    About = MakeTab("ℹ About")
}

-- CONTENT
local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1,-180,1,-42)
Content.Position = UDim2.new(0,180,0,42)
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
    t.TextColor3 = Theme.TEXT
    t.Font = Enum.Font.GothamBold
    t.TextSize = 16
    t.BackgroundTransparency = 1

    Pages[name] = f
end

for _,n in ipairs({"Home","Auto Fish","Teleport","Auto Sell","Settings","About"}) do
    MakePage(n)
end

local function Show(name)
    for _,v in pairs(Pages) do v.Visible = false end
    Pages[name].Visible = true
end
Show("Home")

Tabs.Home.MouseButton1Click:Connect(function() Show("Home") end)
Tabs.Auto.MouseButton1Click:Connect(function() Show("Auto Fish") end)
Tabs.Teleport.MouseButton1Click:Connect(function() Show("Teleport") end)
Tabs.Sell.MouseButton1Click:Connect(function() Show("Auto Sell") end)
Tabs.Settings.MouseButton1Click:Connect(function() Show("Settings") end)
Tabs.About.MouseButton1Click:Connect(function() Show("About") end)

-- NOTIFICATION
local function Notify(txt)
    game.StarterGui:SetCore("SendNotification",{Title="DeHub",Text=txt,Duration=2})
end

-- HOME
local HomeText = Instance.new("TextLabel", Pages["Home"])
HomeText.Size = UDim2.new(1,0,0,80)
HomeText.Position = UDim2.new(0,0,0,60)
HomeText.Text = "Welcome to DeHub Fish It\nUltimate Script"
HomeText.TextColor3 = Theme.SUB
HomeText.Font = Enum.Font.Gotham
HomeText.TextSize = 14
HomeText.BackgroundTransparency = 1

-- AUTO FISH
local AutoFish=false
local AutoBtn = Instance.new("TextButton", Pages["Auto Fish"])
AutoBtn.Size = UDim2.new(0,220,0,40)
AutoBtn.Position = UDim2.new(0,20,0,60)
AutoBtn.Text="Auto Fish : OFF"
AutoBtn.BackgroundColor3=Theme.ACCENT
AutoBtn.TextColor3=Color3.new(1,1,1)
AutoBtn.Font=Enum.Font.GothamBold
AutoBtn.TextSize=14
Instance.new("UICorner",AutoBtn).CornerRadius=UDim.new(0,8)

local function FireRemote(key)
    for _,v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") and v.Name:lower():find(key) then
            pcall(function() v:FireServer() end)
        end
    end
end

AutoBtn.MouseButton1Click:Connect(function()
    AutoFish=not AutoFish
    AutoBtn.Text=AutoFish and "Auto Fish : ON" or "Auto Fish : OFF"
    Notify(AutoFish and "Auto Fish ON" or "Auto Fish OFF")
    task.spawn(function()
        while AutoFish do
            task.wait(0.6)
            FireRemote("cast")
            FireRemote("reel")
            FireRemote("fish")
            FireRemote("collect")
        end
    end)
end)

-- AUTO SELL
local AutoSell=false
local SellBtn=Instance.new("TextButton",Pages["Auto Sell"])
SellBtn.Size=UDim2.new(0,220,0,40)
SellBtn.Position=UDim2.new(0,20,0,60)
SellBtn.Text="Auto Sell : OFF"
SellBtn.BackgroundColor3=Theme.ACCENT
SellBtn.TextColor3=Color3.new(1,1,1)
SellBtn.Font=Enum.Font.GothamBold
SellBtn.TextSize=14
Instance.new("UICorner",SellBtn).CornerRadius=UDim.new(0,8)

SellBtn.MouseButton1Click:Connect(function()
    AutoSell=not AutoSell
    SellBtn.Text=AutoSell and "Auto Sell : ON" or "Auto Sell : OFF"
    Notify(AutoSell and "Auto Sell ON" or "Auto Sell OFF")
    task.spawn(function()
        while AutoSell do
            task.wait(2)
            FireRemote("sell")
        end
    end)
end)

-- TELEPORT LIST
local Tp1=Instance.new("TextButton",Pages["Teleport"])
Tp1.Size=UDim2.new(0,220,0,40)
Tp1.Position=UDim2.new(0,20,0,60)
Tp1.Text="Teleport Shop"
Tp1.BackgroundColor3=Theme.ACCENT
Tp1.TextColor3=Color3.new(1,1,1)
Instance.new("UICorner",Tp1).CornerRadius=UDim.new(0,8)

Tp1.MouseButton1Click:Connect(function()
    local hrp=Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if hrp then hrp.CFrame=CFrame.new(0,10,0) end
end)

-- SETTINGS
local ThemeBtn=Instance.new("TextButton",Pages["Settings"])
ThemeBtn.Size=UDim2.new(0,220,0,40)
ThemeBtn.Position=UDim2.new(0,20,0,60)
ThemeBtn.Text="Toggle Theme"
ThemeBtn.BackgroundColor3=Theme.ACCENT
ThemeBtn.TextColor3=Color3.new(1,1,1)
Instance.new("UICorner",ThemeBtn).CornerRadius=UDim.new(0,8)

ThemeBtn.MouseButton1Click:Connect(function()
    Theme = (Theme==Themes.Light and Themes.Dark or Themes.Light)
    Notify("Restart script to apply theme")
end)

-- ABOUT
local About=Instance.new("TextLabel",Pages["About"])
About.Size=UDim2.new(1,0,0,80)
About.Position=UDim2.new(0,0,0,60)
About.Text="DeHub Fish It Ultimate\nUI + Auto Fish"
About.TextColor3=Theme.SUB
About.Font=Enum.Font.Gotham
About.TextSize=14
About.BackgroundTransparency=1

-- KEYBIND
UIS.InputBegan:Connect(function(i,g)
    if not g and i.KeyCode==Enum.KeyCode.RightShift then
        Main.Visible=not Main.Visible
        Blur.Size = Main.Visible and 12 or 0
    end
end)

Blur.Size = 12
Notify("DeHub Loaded")
