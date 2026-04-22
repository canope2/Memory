-- [[ AUTHENTICATION CHECK ]] --
local player = game:GetService("Players").LocalPlayer

-- Give the loader 2 seconds to set the variable before kicking
task.wait(2) 

if not _G.Alen12345 then
    player:Kick("Unauthorized Execution: Please use the official Key System to run Advanced Studio Elite")
    return
end

-- [[ ADVANCED STUDIO ELITE V12 - FULLY OPTIMIZED ]] --

local function BootLog()
    print("--------------------------------------------------")
    warn("!! ADVANCED STUDIO: ELITE V12 LOADED !!")
    print("STATUS: Rebirth & Step Power Synchronized")
    print("--------------------------------------------------")
end

task.spawn(function()
    local VIM = game:GetService("VirtualInputManager")
    VIM:SendKeyEvent(true, Enum.KeyCode.F9, false, game)
    VIM:SendKeyEvent(false, Enum.KeyCode.F9, false, game)
    BootLog()
    task.wait(0.5)
    VIM:SendKeyEvent(true, Enum.KeyCode.F9, false, game)
    VIM:SendKeyEvent(false, Enum.KeyCode.F9, false, game)
end)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local pGui = player:WaitForChild("PlayerGui")

-- [[ SETTINGS ]]
_G.AutoSteps = false
_G.AutoRebirth = false
_G.AutoFarm15 = false
_G.AntiAFK = true
_G.StepAmount = 500

-- [[ THE OPTIMIZED ENGINE ]]
task.spawn(function()
    local Remotes = ReplicatedStorage:WaitForChild("Remotes")
    local GetExp = Remotes:WaitForChild("GetStepExperience") 
    local AddStep = Remotes:FindFirstChild("AddStep") or Remotes:FindFirstChild("StepTaken")
    local RebirthRem = Remotes:FindFirstChild("RequestRebirth")

    local lastRebirth = 0

    while true do
        task.wait(0.01) -- Stable frequency to prevent crashes
        
        -- Handle Step Farming
        if _G.AutoSteps then
            pcall(function() GetExp:InvokeServer() end)
            if AddStep then
                AddStep:FireServer(_G.StepAmount)
            end
        end

        -- Handle Rebirth Logic (Decoupled & Debounced)
        if _G.AutoRebirth and RebirthRem then
            if tick() - lastRebirth > 0.8 then -- 0.8s delay prevents remote-spam kicks
                pcall(function()
                    RebirthRem:FireServer("free") 
                end)
                lastRebirth = tick()
            end
        end
    end
end)

-- [[ UI CONSTRUCTION ]]
if pGui:FindFirstChild("Advanced_Studio_Elite_V12") then pGui.Advanced_Studio_Elite_V12:Destroy() end
local Hub = Instance.new("ScreenGui", pGui)
Hub.Name = "Advanced_Studio_Elite_V12"
Hub.ResetOnSpawn = false

local function ApplyDesign(obj, radius, isMain)
    local corner = Instance.new("UICorner", obj)
    corner.CornerRadius = UDim.new(0, radius)
    if isMain then
        local gradient = Instance.new("UIGradient", obj)
        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 25)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 10))
        })
    end
end

-- MINI DASHBOARD
local Show = Instance.new("Frame", Hub)
Show.Size = UDim2.new(0, 220, 0, 110)
Show.Position = UDim2.new(0.02, 0, 0.4, 0)
Show.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
ApplyDesign(Show, 12, true)

local DashTitle = Instance.new("TextLabel", Show)
DashTitle.Size = UDim2.new(1, 0, 0.3, 0)
DashTitle.BackgroundTransparency = 1
DashTitle.Text = "ADVANCED <font color='#00FFFF'>STUDIO</font>"
DashTitle.RichText = true
DashTitle.TextColor3 = Color3.new(1, 1, 1)
DashTitle.Font = Enum.Font.GothamBold
DashTitle.TextSize = 18

local DashTime = Instance.new("TextLabel", Show)
DashTime.Size = UDim2.new(1, 0, 0.3, 0)
DashTime.Position = UDim2.new(0, 0, 0.35, 0)
DashTime.BackgroundTransparency = 1
DashTime.TextColor3 = Color3.fromRGB(255, 255, 255)
DashTime.Font = Enum.Font.Code
DashTime.TextSize = 18
DashTime.Text = "00:00:00"

local ToggleBtn = Instance.new("TextButton", Show)
ToggleBtn.Size = UDim2.new(0.85, 0, 0.25, 0)
ToggleBtn.Position = UDim2.new(0.075, 0, 0.7, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 255)
ToggleBtn.Text = "CORE_PANEL: ACTIVE"
ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 11
ApplyDesign(ToggleBtn, 6)

-- MAIN PANEL
local Main = Instance.new("Frame", Hub)
Main.Size = UDim2.new(0, 320, 0, 420)
Main.Position = UDim2.new(0.5, -160, 0.5, -210)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
ApplyDesign(Main, 15, true)

local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 55)
Header.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, -20, 0, 30)
Title.Position = UDim2.new(0, 15, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "ADVANCED STUDIO"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

local Scroll = Instance.new("ScrollingFrame", Main)
Scroll.Size = UDim2.new(1, -20, 1, -75)
Scroll.Position = UDim2.new(0, 10, 0, 65)
Scroll.BackgroundTransparency = 1
Scroll.ScrollBarThickness = 0
local Layout = Instance.new("UIListLayout", Scroll)
Layout.Padding = UDim.new(0, 10)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local function CreateToggle(name, startOn, callback)
    local Frame = Instance.new("Frame", Scroll)
    Frame.Size = UDim2.new(0.95, 0, 0, 45)
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    ApplyDesign(Frame, 8)
    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(0.6, 0, 1, 0)
    Label.Position = UDim2.new(0, 15, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name:upper()
    Label.TextColor3 = Color3.new(1, 1, 1)
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 11
    Label.TextXAlignment = Enum.TextXAlignment.Left
    local SwitchBG = Instance.new("Frame", Frame)
    SwitchBG.Size = UDim2.new(0, 40, 0, 20)
    SwitchBG.Position = UDim2.new(1, -55, 0.5, -10)
    SwitchBG.BackgroundColor3 = startOn and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(40, 40, 50)
    ApplyDesign(SwitchBG, 10)
    local Ball = Instance.new("Frame", SwitchBG)
    Ball.Size = UDim2.new(0, 14, 0, 14)
    Ball.Position = startOn and UDim2.new(1, -18, 0.5, -7) or UDim2.new(0, 4, 0.5, -7)
    Ball.BackgroundColor3 = Color3.new(1, 1, 1)
    ApplyDesign(Ball, 10)
    local Clicker = Instance.new("TextButton", Frame)
    Clicker.Size = UDim2.new(1, 0, 1, 0)
    Clicker.BackgroundTransparency = 1
    Clicker.Text = ""
    local enabled = startOn
    Clicker.MouseButton1Click:Connect(function()
        enabled = not enabled
        local targetPos = enabled and UDim2.new(1, -18, 0.5, -7) or UDim2.new(0, 4, 0.5, -7)
        local targetColor = enabled and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(40, 40, 50)
        TweenService:Create(Ball, TweenInfo.new(0.25), {Position = targetPos}):Play()
        TweenService:Create(SwitchBG, TweenInfo.new(0.25), {BackgroundColor3 = targetColor}):Play()
        callback(enabled)
    end)
    callback(startOn)
end

-- STEP INPUT FIELD
local StepFrame = Instance.new("Frame", Scroll)
StepFrame.Size = UDim2.new(0.95, 0, 0, 45)
StepFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
ApplyDesign(StepFrame, 8)
local StepText = Instance.new("TextLabel", StepFrame)
StepText.Size = UDim2.new(0.5, 0, 1, 0)
StepText.Position = UDim2.new(0, 15, 0, 0)
StepText.BackgroundTransparency = 1
StepText.Text = "STEP POWER:"
StepText.TextColor3 = Color3.fromRGB(0, 255, 255)
StepText.Font = Enum.Font.GothamBold
StepText.TextSize = 10
StepText.TextXAlignment = Enum.TextXAlignment.Left

local StepInput = Instance.new("TextBox", StepFrame)
StepInput.Size = UDim2.new(0, 100, 0, 25)
StepInput.Position = UDim2.new(1, -115, 0.5, -12)
StepInput.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
StepInput.Text = tostring(_G.StepAmount)
StepInput.TextColor3 = Color3.new(1, 1, 1)
StepInput.Font = Enum.Font.Code
StepInput.TextSize = 12
ApplyDesign(StepInput, 4)

StepInput:GetPropertyChangedSignal("Text"):Connect(function()
    local n = tonumber(StepInput.Text)
    if n then _G.StepAmount = n end
end)

-- [[ AUTO CASH 15 ]]
RunService.Stepped:Connect(function()
    if _G.AutoFarm15 and player.Character then
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = CFrame.new(-1.13, 11.85, -9075.98)
            hrp.Velocity = Vector3.new(0,0,0)
            local btn15 = Workspace:FindFirstChild("ReturnButtons") and Workspace.ReturnButtons:FindFirstChild("Button15")
            if btn15 then
                local col = btn15:FindFirstChild("Collider") or btn15:FindFirstChild("TouchPart")
                if col then
                    firetouchinterest(hrp, col, 0)
                    firetouchinterest(hrp, col, 1)
                end
            end
        end
    end
end)

-- [[ UI DRAGGING ]]
local function EnableDragging(frame, handle)
    local dragging, dragInput, dragStart, startPos
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
    end)
    RunService.RenderStepped:Connect(function()
        if dragging and dragInput then
            local delta = dragInput.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

EnableDragging(Main, Header)
EnableDragging(Show, DashTitle)

-- [[ INITIALIZE ]]
CreateToggle("Auto Cash", false, function(v) _G.AutoFarm15 = v end)
CreateToggle("Auto Steps", false, function(v) _G.AutoSteps = v end)
CreateToggle("Auto Rebirth", false, function(v) _G.AutoRebirth = v end)
CreateToggle("Anti-AFK System", true, function(v) _G.AntiAFK = v end)

task.spawn(function() while task.wait(1) do DashTime.Text = os.date("%X") end end)
ToggleBtn.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
    ToggleBtn.Text = Main.Visible and "CORE_PANEL: ACTIVE" or "CORE_PANEL: HIDDEN"
end)
