--// DeHub Loader
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

local Gui = Instance.new("ScreenGui", game.CoreGui)
Gui.Name = "DeHubLoader"
Gui.ResetOnSpawn = false

local Frame = Instance.new("Frame", Gui)
Frame.Size = UDim2.new(0,300,0,180)
Frame.Position = UDim2.new(0.5,-150,0.5,-90)
Frame.AnchorPoint = Vector2.new(0.5,0.5)
Frame.BackgroundColor3 = Color3.fromRGB(240,250,255)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,16)

local Logo = Instance.new("TextLabel", Frame)
Logo.Size = UDim2.new(1,0,0,60)
Logo.Position = UDim2.new(0,0,0,10)
Logo.Text = "💠 DeHub"
Logo.Font = Enum.Font.GothamBold
Logo.TextSize = 26
Logo.TextColor3 = Color3.fromRGB(0,170,255)
Logo.BackgroundTransparency = 1

local Info = Instance.new("TextLabel", Frame)
Info.Size = UDim2.new(1,0,0,40)
Info.Position = UDim2.new(0,0,0,70)
Info.Text = "Loading Fish It Script..."
Info.Font = Enum.Font.Gotham
Info.TextSize = 14
Info.TextColor3 = Color3.fromRGB(100,100,100)
Info.BackgroundTransparency = 1

local BarBG = Instance.new("Frame", Frame)
BarBG.Size = UDim2.new(0,240,0,10)
BarBG.Position = UDim2.new(0.5,-120,1,-40)
BarBG.BackgroundColor3 = Color3.fromRGB(220,220,220)
BarBG.BorderSizePixel = 0
Instance.new("UICorner", BarBG).CornerRadius = UDim.new(1,0)

local Bar = Instance.new("Frame", BarBG)
Bar.Size = UDim2.new(0,0,1,0)
Bar.BackgroundColor3 = Color3.fromRGB(0,170,255)
Bar.BorderSizePixel = 0
Instance.new("UICorner", Bar).CornerRadius = UDim.new(1,0)

TweenService:Create(Bar, TweenInfo.new(2), {Size = UDim2.new(1,0,1,0)}):Play()
task.wait(2.2)

Gui:Destroy()

-- GANTI LINK RAW MAIN LUA DI SINI
loadstring(game:HttpGet("https://raw.githubusercontent.com/Polzx1/dehub_fishit.lua/refs/heads/main/Main.lua"))()
