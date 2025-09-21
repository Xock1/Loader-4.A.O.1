--[[ Make your own loader skidd





]]
-- // Script Loader \\ --
local games = { -- // Supported \\
    [84316229168229] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Clone%20Chaos.lua",
    [126849358937279] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Merge%20Gubby.lua", 
    [135170308040342] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Grow%20Every%20Bite.lua",
    [111452220770252] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Beat%20Up%20gubby%20on%20his%20own%20Home.lua",
    [15407368046] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Trampoline%20Battle%20Simulator.lua",
    [13675842775] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Get%20Big%20Simulator.lua",
    [116495829188952] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Dead%20Rails.lua",
    [14157644155] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Money%20Grab%20Simulator.lua",
    [15506010437] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Fun%20Squid%20game!%20Glass%20Bridge%202.lua",
    [4577486879] = "https://raw.githubusercontent.com/dark-Age3/Open-Source-/refs/heads/main/MM2%20duels.lua",
    [4924922222] = "https://raw.githubusercontent.com/dark-Age3/Open-Source-/refs/heads/main/Brookhaven.lua",
    [8665470667] = "https://raw.githubusercontent.com/dark-Age3/Open-Source-/refs/heads/main/5v5%20MM2%20Milbase.lua",
    [5715080538] = "https://raw.githubusercontent.com/dark-Age3/Open-Source-/refs/heads/main/Kill%20bomb%20OP.lua",
    [94279945101354] = "https://raw.githubusercontent.com/dark-Age3/Open-Source-/refs/heads/main/Morph%20tower%20OP.lua",
}

local plr = game.Players.LocalPlayer
local gui = plr:WaitForChild("PlayerGui")

-- // G creation \\ --
local screen = Instance.new("ScreenGui")
screen.Name = "AuxLoader"
screen.Parent = gui

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundTransparency = 1
bg.Parent = screen

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 350, 0, 200)
main.Position = UDim2.new(0.5, -175, 0.5, -100)
main.BackgroundTransparency = 1
main.Parent = bg

local img = Instance.new("ImageLabel")
img.Size = UDim2.new(1, 0, 1, 0)
img.BackgroundTransparency = 1
img.Image = "rbxassetid://10552144814" 
img.Parent = main

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = img

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(45, 45, 55)
stroke.Thickness = 1
stroke.Parent = img

-- // Txt \\ --
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 20)
title.BackgroundTransparency = 1
title.Text = "Aux Hub"
title.TextColor3 = Color3.white
title.TextSize = 28
title.Font = Enum.Font.GothamBold
title.Parent = img

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -40, 0, 30)
status.Position = UDim2.new(0, 20, 0, 80)
status.BackgroundTransparency = 1
status.Text = "Please wait........"
status.TextColor3 = Color3.fromRGB(180, 180, 190)
status.TextSize = 16
status.Font = Enum.Font.Gotham
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = img

-- // Bar \\ --
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(1, -40, 0, 4)
barBg.Position = UDim2.new(0, 20, 0, 130)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
barBg.BorderSizePixel = 0
barBg.Parent = img

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 2)
barCorner.Parent = barBg

local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
bar.BorderSizePixel = 0
bar.Parent = barBg

local barFillCorner = Instance.new("UICorner")
barFillCorner.CornerRadius = UDim.new(0, 2)
barFillCorner.Parent = bar

-- // Main Animation \\ --
local ts = game:GetService("TweenService")

-- // Animation \\ --
main.Size = UDim2.new(0, 300, 0, 180)
main.Position = UDim2.new(0.5, -150, 0.5, -90)

local fadeIn = ts:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 350, 0, 200),
    Position = UDim2.new(0.5, -175, 0.5, -100)
})
fadeIn:Play()
fadeIn.Completed:Wait()

-- // bar \\ --
local loadAnim = ts:Create(bar, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Size = UDim2.new(1, 0, 1, 0)
})

wait(1)
loadAnim:Play()

local url = games[game.PlaceId]

if url then
    status.Text = "Loading script........"
    loadAnim.Completed:Wait()
    
    local ok = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    
    if ok then
        status.Text = "Game supported.\nScript loaded successfully."
        status.TextColor3 = Color3.fromRGB(100, 255, 150)
    else
        status.Text = "Script loading failed.\nPlease try again."
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
else
    loadAnim:Cancel()
    status.Text = "Game not supported.\nAre you sure you are in the right game?"
    status.TextColor3 = Color3.fromRGB(255, 100, 100)
end

-- // Animation \\ --
wait(6)
local fadeOut = ts:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
    Size = UDim2.new(0, 0, 0, 0),
    Position = UDim2.new(0.5, 0, 0.5, 0)
})
fadeOut:Play()
fadeOut.Completed:Wait()
screen:Destroy()
