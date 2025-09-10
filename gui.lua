local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Espera pelo personagem e pela interface
local character = player.Character or player.CharacterAdded:Wait()
local playerGui = player:WaitForChild("PlayerGui")

-- Criar GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SpeedGui"
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Caixa de texto para digitar a velocidade
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 200, 0, 30)
textBox.Position = UDim2.new(0.5, -100, 0.5, -60)
textBox.PlaceholderText = "Digite a velocidade"
textBox.Text = ""
textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textBox.Parent = gui

-- Botão para aplicar a velocidade
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 30)
button.Position = UDim2.new(0.5, -100, 0.5, -20)
button.Text = "Aplicar Velocidade"
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.Parent = gui

-- Função ao clicar no botão
button.MouseButton1Click:Connect(function()
    local speed = tonumber(textBox.Text)
    if speed and character:FindFirstChild("Humanoid") then
        character.Humanoid.WalkSpeed = speed
    else
        textBox.Text = "Digite um número válido!"
    end
end)
