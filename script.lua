local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- UI de base (popup)
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "DataSpy"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 250, 0, 250)
Frame.Position = UDim2.new(0.5, -125, 0.5, -125)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "🧳 Data Spy"
Title.Font = Enum.Font.Code
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 18

local InfoLabel = Instance.new("TextLabel", Frame)
InfoLabel.Position = UDim2.new(0, 0, 0, 35)
InfoLabel.Size = UDim2.new(1, 0, 1, -35)
InfoLabel.Text = ""
InfoLabel.TextColor3 = Color3.new(1, 1, 1)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Font = Enum.Font.Code
InfoLabel.TextSize = 14
InfoLabel.TextWrapped = true
InfoLabel.TextYAlignment = Enum.TextYAlignment.Top

local CloneButton = Instance.new("TextButton", Frame)
CloneButton.Size = UDim2.new(1, 0, 0, 30)
CloneButton.Position = UDim2.new(0, 0, 1, -60)
CloneButton.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
CloneButton.Text = "Cloner le Backpack"
CloneButton.TextColor3 = Color3.new(1, 1, 1)
CloneButton.Font = Enum.Font.Code
CloneButton.TextSize = 16

local CloseButton = Instance.new("TextButton", Frame)
CloseButton.Size = UDim2.new(0.5, 0, 0, 30)
CloseButton.Position = UDim2.new(0, 0, 1, -30)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
CloseButton.Text = "Fermer"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Font = Enum.Font.Code
CloseButton.TextSize = 16

-- Fonction pour cloner le backpack d'un joueur dans le vôtre
local function CloneBackpack(playerName)
    local targetPlayer = Players:FindFirstChild(playerName)
    if not targetPlayer then
        InfoLabel.Text = "Joueur introuvable 😭"
        return
    end

    local targetBackpack = targetPlayer:FindFirstChild("Backpack")
    if not targetBackpack then
        InfoLabel.Text = "Pas de backpack visible 🪫"
        return
    end

    -- Cloner les objets et les ajouter dans le backpack du joueur local
    for _, item in pairs(targetBackpack:GetChildren()) do
        local clonedItem = item:Clone() -- Clonage de l'item
        clonedItem.Parent = LocalPlayer.Backpack -- Ajouter l'item cloné à notre propre backpack
    end

    InfoLabel.Text = "Items clonés dans ton backpack! 🎉"
end

-- Action quand le bouton "Cloner le Backpack" est cliqué
CloneButton.MouseButton1Click:Connect(function()
    local playerName = "Hichemsabri93"  -- Remplacez par le nom du joueur dont vous voulez cloner le backpack
    CloneBackpack(playerName)
end)

-- Action quand le bouton "Fermer" est cliqué
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
