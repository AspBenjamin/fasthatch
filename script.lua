local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")

local gui = Instance.new("ScreenGui")
gui.Name = "RSpamGui"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 150, 0, 40)
button.Position = UDim2.new(0, 0.4, 0, 0.4)
button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
button.TextColor3 = Color3.new(1, 1, 1)
button.Text = "Start R Spam"
button.Font = Enum.Font.SourceSansBold
button.TextSize = 20
button.Parent = gui

local spamming = false
local connection

button.MouseButton1Click:Connect(function()
    spamming = not spamming
    button.Text = spamming and "Stop R Spam" or "Start R Spam"

    if spamming then
        connection = RunService.RenderStepped:Connect(function()
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.R, false, game)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.R, false, game)
            wait(0.001)
        end)
    else
        if connection then
            connection:Disconnect()
        end
    end
end)
