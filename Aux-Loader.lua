local SUPPORTED_GAMES = {
    [84316229168229] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Clone%20Chaos.lua",
    [126849358937279] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Merge%20Gubby.lua", 
    [135170308040342] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Grow%20Every%20Bite.lua",
    [111452220770252] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Beat%20Up%20gubby%20on%20his%20own%20Home.lua",
    [15407368046] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Trampoline%20Battle%20Simulator.lua",
    [13675842775] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Get%20Big%20Simulator.lua",
    [116495829188952] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Dead%20Rails.lua",
    [14157644155] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Money%20Grab%20Simulator.lua",
    [15506010437] = "https://raw.githubusercontent.com/Aux-Developm3nt/Open-Source-/main/Fun%20Squid%20game!%20Glass%20Bridge%202.lua",
    [4577486879] = "https://raw.githubusercontent.com/dark-Age3/Open-Source-/refs/heads/main/MM2%20duels.lua", -- MM2 Duels
    [4924922222] = "https://raw.githubusercontent.com/dark-Age3/Open-Source-/refs/heads/main/Brookhaven.lua", -- Brookhaven RP
    [8665470667] = "https://raw.githubusercontent.com/dark-Age3/Open-Source-/refs/heads/main/5v5%20MM2%20Milbase.lua", -- 5v5 MM2 Milbase
    [5715080538] = "https://raw.githubusercontent.com/dark-Age3/Open-Source-/refs/heads/main/Kill%20bomb%20OP.lua", -- Red vs Blue Gun Battle
    [94279945101354] = "https://raw.githubusercontent.com/dark-Age3/Open-Source-/refs/heads/main/Morph%20tower%20OP.lua", -- UPD Morph Tower
}

local function createLoadingScreen()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AuxHubLoader"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local background = Instance.new("Frame")
    background.Name = "Background"
    background.Size = UDim2.new(1, 0, 1, 0)
    background.Position = UDim2.new(0, 0, 0, 0)
    background.BackgroundTransparency = 1
    background.BorderSizePixel = 0
    background.Parent = screenGui
    
    local container = Instance.new("Frame")
    container.Name = "Container"
    container.Size = UDim2.new(0, 350, 0, 200)
    container.Position = UDim2.new(0.5, -175, 0.5, -100)
    container.BackgroundTransparency = 1
    container.BorderSizePixel = 0
    container.Parent = background
    
    local containerImage = Instance.new("ImageLabel")
    containerImage.Name = "ContainerImage"
    containerImage.Size = UDim2.new(1, 0, 1, 0)
    containerImage.Position = UDim2.new(0, 0, 0, 0)
    containerImage.BackgroundTransparency = 1
    containerImage.Image = "rbxassetid://10552144814"
    containerImage.ScaleType = Enum.ScaleType.Stretch
    containerImage.Parent = container
    
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 12)
    containerCorner.Parent = containerImage
    
    local containerStroke = Instance.new("UIStroke")
    containerStroke.Color = Color3.fromRGB(45, 45, 55)
    containerStroke.Thickness = 1
    containerStroke.Parent = containerImage

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Position = UDim2.new(0, 0, 0, 20)
    title.BackgroundTransparency = 1
    title.Text = "Aux Hub"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 28
    title.TextScaled = false
    title.Font = Enum.Font.GothamBold
    title.Parent = containerImage

    local statusText = Instance.new("TextLabel")
    statusText.Name = "StatusText"
    statusText.Size = UDim2.new(1, -40, 0, 30)
    statusText.Position = UDim2.new(0, 20, 0, 80)
    statusText.BackgroundTransparency = 1
    statusText.Text = "Please wait........"
    statusText.TextColor3 = Color3.fromRGB(180, 180, 190)
    statusText.TextSize = 16
    statusText.TextScaled = false
    statusText.Font = Enum.Font.Gotham
    statusText.TextXAlignment = Enum.TextXAlignment.Left
    statusText.Parent = containerImage

    local loadingBarBg = Instance.new("Frame")
    loadingBarBg.Name = "LoadingBarBg"
    loadingBarBg.Size = UDim2.new(1, -40, 0, 4)
    loadingBarBg.Position = UDim2.new(0, 20, 0, 130)
    loadingBarBg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    loadingBarBg.BorderSizePixel = 0
    loadingBarBg.Parent = containerImage
    
    local loadingBarCorner = Instance.new("UICorner")
    loadingBarCorner.CornerRadius = UDim.new(0, 2)
    loadingBarCorner.Parent = loadingBarBg
    
    local loadingBar = Instance.new("Frame")
    loadingBar.Name = "LoadingBar"
    loadingBar.Size = UDim2.new(0, 0, 1, 0)
    loadingBar.Position = UDim2.new(0, 0, 0, 0)
    loadingBar.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    loadingBar.BorderSizePixel = 0
    loadingBar.Parent = loadingBarBg
    
    local loadingBarFillCorner = Instance.new("UICorner")
    loadingBarFillCorner.CornerRadius = UDim.new(0, 2)
    loadingBarFillCorner.Parent = loadingBar
    
    return screenGui, statusText, loadingBar
end

local function animateLoadingBar(loadingBar, duration)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = game:GetService("TweenService"):Create(loadingBar, tweenInfo, {Size = UDim2.new(1, 0, 1, 0)})
    tween:Play()
    return tween
end

local function fadeIn(container)
    container.Size = UDim2.new(0, 300, 0, 180)
    container.Position = UDim2.new(0.5, -150, 0.5, -90)
    
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    local tween = game:GetService("TweenService"):Create(container, tweenInfo, {
        Size = UDim2.new(0, 350, 0, 200),
        Position = UDim2.new(0.5, -175, 0.5, -100)
    })
    tween:Play()
    return tween
end

local function fadeOut(container)
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = game:GetService("TweenService"):Create(container, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })
    tween:Play()
    return tween
end

local function showResult(screenGui, statusText, message, isSuccess, container)
    statusText.Text = message
    if isSuccess then
        statusText.TextColor3 = Color3.fromRGB(100, 255, 150)
    else
        statusText.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
    
    wait(6)
    local fadeOutTween = fadeOut(container)
    fadeOutTween.Completed:Wait()
    screenGui:Destroy()
end

local screenGui, statusText, loadingBar = createLoadingScreen()
local container = screenGui.Background.Container

local fadeInTween = fadeIn(container)
fadeInTween.Completed:Wait()

local loadingTween = animateLoadingBar(loadingBar, 2)

wait(1)

local scriptURL = SUPPORTED_GAMES[game.PlaceId]

if scriptURL then
    statusText.Text = "Loading script........"
    loadingTween.Completed:Wait()
    
    local success, err = pcall(function()
        loadstring(game:HttpGet(scriptURL))()
    end)
    
    if success then
        showResult(screenGui, statusText, "Game supported.\nScript loaded successfully.", true, container)
    else
        showResult(screenGui, statusText, "Script loading failed.\nPlease try again.", false, container)
        warn("Failed to load script:", err)
    end
else
    loadingTween:Cancel()
    showResult(screenGui, statusText, "Game not supported.\nAre you sure you are in the right game?", false, container)
end
