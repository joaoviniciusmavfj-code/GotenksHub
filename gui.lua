local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Espera pelo personagem e pela interface
local character = player.Character or player.CharacterAdded:Wait()
local playerGui = player:WaitForChild("PlayerGui")

-- Função para criar a interface principal
local function criarInterface()
    local gui = Instance.new("ScreenGui")
    gui.Name = "SpeedGui"
    gui.ResetOnSpawn = false
    gui.Parent = playerGui

    -- Fundo laranja escuro
    local fundo = Instance.new("Frame")
    fundo.Size = UDim2.new(0, 300, 0, 180)
    fundo.Position = UDim2.new(0.5, -150, 0.5, -90)
    fundo.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
    fundo.BorderSizePixel = 0
    fundo.Parent = gui

    -- Título decorativo
    local titulo = Instance.new("TextLabel")
    titulo.Size = UDim2.new(1, 0, 0, 30)
    titulo.Position = UDim2.new(0, 0, 0, 0)
    titulo.Text = "⚡ GotenksHub ⚡"
    titulo.TextColor3 = Color3.fromRGB(255, 255, 255)
    titulo.BackgroundTransparency = 1
    titulo.Font = Enum.Font.Fantasy
    titulo.TextScaled = true
    titulo.Parent = fundo

    -- Caixa de texto
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0, 200, 0, 30)
    textBox.Position = UDim2.new(0, 50, 0, 50)
    textBox.PlaceholderText = "Digite a velocidade"
    textBox.Text = ""
    textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    textBox.Parent = fundo

    -- Botão aplicar velocidade
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 30)
    button.Position = UDim2.new(0, 50, 0, 90)
    button.Text = "Aplicar Velocidade"
    button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = fundo

    button.MouseButton1Click:Connect(function()
        local speed = tonumber(textBox.Text)
        if speed and character:FindFirstChild("Humanoid") then
            character.Humanoid.WalkSpeed = speed
        else
            textBox.Text = "Digite um número válido!"
        end
    end)

    -- Botão X para fechar
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -35, 0, 5)
    closeButton.Text = "X"
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Parent = fundo

    closeButton.MouseButton1Click:Connect(function()
        gui:Destroy()
        criarBotaoReabrir()
    end)
end

-- Função para criar botão circular com imagem
function criarBotaoReabrir()
    local gui = Instance.new("ScreenGui")
    gui.Name = "ReabrirSpeedGui"
    gui.ResetOnSpawn = false
    gui.Parent = playerGui

    local botao = Instance.new("ImageButton")
    botao.Size = UDim2.new(0, 60, 0, 60)
    botao.Position = UDim2.new(0, 20, 0.5, -30)
    botao.Image = "rbxassetid://5150174308"
    botao.BackgroundTransparency = 1
    botao.Parent = gui

    botao.MouseButton1Click:Connect(function()
        gui:Destroy()
        criarInterface()
    end)
end

-- Verifica se está em ambiente jogável
if player and playerGui and character then
    criarInterface()
else
    warn("Interface não pôde ser carregada. Ambiente inválido.")
end
