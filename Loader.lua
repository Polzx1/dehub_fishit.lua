--// DeHub Loader (Final)

local url = "https://raw.githubusercontent.com/USERNAME/REPO/main/DeHubMain.lua"

pcall(function()
    loadstring(game:HttpGet(url))()
end)
