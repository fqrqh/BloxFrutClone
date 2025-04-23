-- Création de l'interface graphique
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Créer une fenêtre pour l'UI
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Parent = screenGui

-- Bouton pour copier le niveau
local copyLevelButton = Instance.new("TextButton")
copyLevelButton.Size = UDim2.new(0, 200, 0, 50)
copyLevelButton.Position = UDim2.new(0.5, -100, 0.2, 0)
copyLevelButton.Text = "Copy Level"
copyLevelButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
copyLevelButton.Parent = frame

-- Bouton pour copier les Beli
local copyBeliButton = Instance.new("TextButton")
copyBeliButton.Size = UDim2.new(0, 200, 0, 50)
copyBeliButton.Position = UDim2.new(0.5, -100, 0.6, 0)
copyBeliButton.Text = "Copy Beli"
copyBeliButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
copyBeliButton.Parent = frame

-- Fonction pour copier le niveau du joueur
copyLevelButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local level = player:FindFirstChild("Data") and player.Data:FindFirstChild("Level")
    
    if level then
        local copiedLevel = level.Value
        print("Niveau copié : " .. copiedLevel)
        
        -- Appliquer le niveau à ton propre joueur ou à un autre joueur si nécessaire
        player.Data.Level.Value = copiedLevel
        print("Niveau appliqué : " .. player.Data.Level.Value)
    else
        warn("Le joueur n'a pas de niveau valide.")
    end
end)

-- Fonction pour copier les Beli du joueur
copyBeliButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local beli = player:FindFirstChild("Data") and player.Data:FindFirstChild("Beli")
    
    if beli then
        local copiedBeli = beli.Value
        print("Beli copié : " .. copiedBeli)
        
        -- Appliquer les Beli à ton propre joueur ou à un autre joueur si nécessaire
        player.Data.Beli.Value = copiedBeli
        print("Beli appliqué : " .. player.Data.Beli.Value)
    else
        warn("Le joueur n'a pas de Beli valide.")
    end
end)

-- Fonction pour supprimer l'interface (si nécessaire)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 100, 0, 50)
closeButton.Position = UDim2.new(0.5, -50, 0.9, 0)
closeButton.Text = "Close"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Parent = frame

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()  -- Ferme l'interface si besoin
end)
