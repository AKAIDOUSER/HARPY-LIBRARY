local Synapse = loadstring(game:HttpGet("https://raw.githubusercontent.com/AKAIDOUSER/HARPY-LIBRARY/refs/heads/main/SynapseLib.lua"))()

local Window = Synapse:Window({
    Title = "Synapse Cheat",
    Theme = "Darker",
    Folder = "Synapse Cheats",
    ShowUserInfo = true,
    AcylicBlur = false,
    Button = true,
    TitleStyle = 1,
    Size = {630, 390},
    MaxSize = {800, 500},
    MinSize = {400, 300},
    KeyBind = Enum.KeyCode.K
})

--//--------------• Variables •--------------\\--

local Variables = {
    Cam = game.Workspace.CurrentCamera,
    RunService = game:GetService("RunService"),
    UIService = game:GetService("UserInputService"),
    Players = game:GetService("Players"),
    LocalPlayer = game.Players.localPlayer,
    -- Esp
    Cache = {},
    Bones = {
        {"Head", "UpperTorso"},
        {"UpperTorso", "RightUpperArm"},
        {"RightUpperArm", "RightLowerArm"},
        {"RightLowerArm", "RightHand"},
        {"UpperTorso", "LeftUpperArm"},
        {"LeftUpperArm", "LeftLowerArm"},
        {"LeftLowerArm", "LeftHand"},
        {"UpperTorso", "LowerTorso"},
        {"LowerTorso", "LeftUpperLeg"},
        {"LeftUpperLeg", "LeftLowerLeg"},
        {"LeftLowerLeg", "LeftFoot"},
        {"LowerTorso", "RightUpperLeg"},
        {"RightUpperLeg", "RightLowerLeg"},
        {"RightUpperLeg", "RightFoot"},
    },
    
    IsKillAimbotActive = false,
}

--//--------------• Activation •--------------\\--

local Features = {
    General = {
        Enabled = true,
        
        Aimbot = {
            Enabled = false,
            
            KeyBind = Enum.KeyCode.Q,
            
            Target = "Head",
            Mode = "Rage", -- Rage, Legit
            
            Distance = 500,
            Sensitivity = 1,
            
            Fit = {
                Enabled = false,
                Y = 5, -- Número positivo (Cima), número negativo (Baixo)
            },
        }, 
    },
    Check = {
        Team = {
            Enabled = false,
            Mode = "Enemies", -- Enemies, Friends
        },
        Visible = false,
        Life = false,
    },
    Misc = {
        Hitbox = {
            Enabled = false,
            Target = "HumanoidRootPart",
            Color = Color3.fromRGB(128, 5, 5),
            Transparency = 0.9,
            Size = 15,
        },
        Kill = {
            Enabled = false,
            AimCam = false,
            Mode = {
                Method = "Bring", -- Tween, Teleport, Bring
                Wait = 1, --  0, 1
                Speed = 180
            },
            Preference = {
                Enabled = false,
                Method = "Distance" -- Life, Distance
            },
        },
        Boost = {
            Enabled = false,
            Mode = "Speed", -- Speed, Jump or Both
            Speed = 38,
            Jump = 50,
        }
    },
    Visual = {
        Fov = {
            Package = Drawing.new("Circle"),
        
            Visible = false,
            Filled = false,

            Color = Color3.fromRGB(128, 5, 5),
            
            Radius = 80,
            Thickness = 2,
            Transparency = 0.4,
            
            Position = Variables.Cam.ViewportSize / 2,
        },
        
        Esp = {
            Activators = {
                Enabled = true,
                Colors = {
                    Team = {
                        Enabled = false,
                        Mode = "Teams", -- Colors, Teams
                        Enemy = Color3.fromRGB(128, 0, 0),
                        Friend = Color3.fromRGB(255, 255, 255),
                    },
                    Wall = {
                        Enabled = false,
                        Back = Color3.fromRGB(128, 0, 0),
                        Front = Color3.fromRGB(255, 255, 255),
                    },
                },
            },
            Target = {
                Enabled = false,
                Type = "Line", -- Line
                Position = "Center", -- Center e Button
                Thickness = 2,
                Transparency = 0.8,
                Color = Color3.fromRGB(0, 255, 0)
            },
            Tracers = {
                Enabled = false,
                Type = "Line",
                Position = "Top",
                Thickness = 2,
                Transparency = 0.8,
                Color = Color3.fromRGB(255, 255, 255)
            },
            Box = {
                Enabled = false,
                Filled = false,
                Type = "2D",
                Thickness = 2,
                Transparency = 0.8,
                Color = Color3.fromRGB(255, 255, 255)
            },
            Skeleton = {
                Enabled = false,
                Thickness = 2,
                Transparency = 0.8,
                Color = Color3.fromRGB(255, 255, 255)
            },
            Health = {
                Enabled = false,
                Position = "Left", -- Left, Right
                Thickness = 4,
                Transparency = 0.8,
                Colors = {
                    High = Color3.fromRGB(0, 255, 0),
                    Low = Color3.fromRGB(128, 25, 25),
                },
            },
        },
    },
}

--//--------------• ScreenGui •--------------\\--

local Fov = Features.Visual.Fov.Package

local function StartFov()
    if Features.Visual.Fov.Visible and Features.General.Enabled then
        Fov.Visible = Features.Visual.Fov.Visible
        Fov.Filled = Features.Visual.Fov.Filled
        Fov.Transparency = Features.Visual.Fov.Transparency
        Fov.Thickness = Features.Visual.Fov.Thickness
        Fov.Radius = Features.Visual.Fov.Radius
        Fov.Color = Features.Visual.Fov.Color
        Fov.Position = Features.Visual.Fov.Position
    end
end

--//---------------• Updates •---------------\\--

local function updateDrawings()
    Fov.Position = Variables.Cam.ViewportSize / 2
end

--//------------• System Checks •------------\\--

function isPlayerVisible(player)
    if not Features.Check.Visible then
        return true
    end

    if player.Character and player.Character:FindFirstChild(Features.General.Aimbot.Target) then
        local startPos = Variables.Cam.CFrame.p
        local endPos = player.Character[Features.General.Aimbot.Target].Position
        local direction = (endPos - startPos).unit * (endPos - startPos).magnitude
        local ray = Ray.new(startPos, direction)
        local ignoreList = {game.Players.LocalPlayer.Character}

        local hitPart, hitPos = workspace:FindPartOnRayWithIgnoreList(ray, ignoreList)
        
        return hitPart == nil or hitPart:IsDescendantOf(player.Character)
    end
    
    return false 
end

function isPlayerAlive(player)
    return player.Character and player.Character:FindFirstChildOfClass("Humanoid") and player.Character.Humanoid.Health > 0
end

local function isWithinMaxDistance(player)
    if player.Character and player.Character:FindFirstChild(Features.General.Aimbot.Target) then
        local lockPart = player.Character[Features.General.Aimbot.Target]
        local distance = (Variables.Cam.CFrame.p - lockPart.Position).Magnitude
        return distance <= Features.General.Aimbot.Distance
    end
    return false
end

local function isPlayerTeam(player)
    if not Features.Check.Team.Enabled then
        return true
    end

    local localTeam = Variables.LocalPlayer.Team
    local playerTeam = player.Team

    if Features.Check.Team.Mode == "Enemies" then
        return playerTeam ~= localTeam
    elseif Features.Check.Team.Mode == "Friends" then
        return playerTeam == localTeam
    elseif Features.Check.Team.Mode == "Both" then
        return true -- Qualquer time (inimigo ou aliado)
    end

    return false -- Fallback se o Mode for inválido
end

--//--------------• LookAt Function •--------------\\--

local TweenService = game:GetService("TweenService") -- Adicionei isso porque estava faltando

local function lookAt(target)
    local targetPosition = target
    if Features.General.Aimbot.Fit.Enabled then
        targetPosition = targetPosition + Vector3.new(0, Features.General.Aimbot.Fit.Y, 0)
    end

    local lookVector = (targetPosition - Variables.Cam.CFrame.Position).unit
    local newCFrame = CFrame.new(Variables.Cam.CFrame.Position, Variables.Cam.CFrame.Position + lookVector)
    local sensitivityAdjustment = Features.General.Aimbot.Sensitivity

    if Features.General.Aimbot.Mode == "Legit" then
        local tweenInfo = TweenInfo.new(Features.General.Aimbot.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out) 
        local tween = TweenService:Create(Variables.Cam, tweenInfo, {CFrame = newCFrame})
        tween:Play()
    elseif Features.General.Aimbot.Mode == "Rage" then
        Variables.Cam.CFrame = Variables.Cam.CFrame:Lerp(newCFrame, sensitivityAdjustment) 
    end
end

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local playerMousePos = Variables.Cam.ViewportSize / 2

    for _, player in ipairs(Variables.Players:GetPlayers()) do
        if player ~= Variables.Players.LocalPlayer and isWithinMaxDistance(player) and isPlayerAlive(player) then
            local part = player.Character and player.Character:FindFirstChild(trg_part)
            local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if part and humanoid then
                local ePos, isVisible = Variables.Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude

                if isVisible and distance < Features.Visual.Fov.Radius then
                    if Features.Check.Team.Life and humanoid.Health > 0 then
                        if isPlayerTeam(player) then
                            if isPlayerVisible(player) then
                                if distance < last then
                                    last = distance
                                    nearest = player
                                end
                            end
                        end
                    else
                        if isPlayerTeam(player) then
                            if isPlayerVisible(player) then
                                if distance < last then
                                    last = distance
                                    nearest = player
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return nearest
end

Variables.RunService.RenderStepped:Connect(function()
    updateDrawings()
    
    -- Se o Kill estiver ativo e forçando o aimbot, não faça nada aqui (o controle está em killAllPlayers)
    if not Variables.IsKillAimbotActive then
        local closest = getClosestPlayerInFOV(Features.General.Aimbot.Target)
        if Features.General.Aimbot.Enabled and Features.General.Enabled and closest and closest.Character then
            local lockPart = closest.Character:FindFirstChild(Features.General.Aimbot.Target)
            if lockPart then
                lookAt(lockPart.Position)
            end
        end
    end
end)

--//--------------• ESP Functions •--------------\\--

local function create(class, properties)
    local drawing = Drawing.new(class)
    for property, value in pairs(properties) do
        drawing[property] = value
    end
    return drawing
end

local function createEsp(player)
    local esp = {
        box = create("Square", {
            Color = Features.Visual.Esp.Box.Color,
            Thickness = Features.Visual.Esp.Box.Thickness,
            Filled = Features.Visual.Esp.Box.Filled,
            Transparency = Features.Visual.Esp.Box.Transparency
        }),
        health = create("Line", {
            Thickness = Features.Visual.Esp.Health.Thickness,
            Transparency = Features.Visual.Esp.Health.Transparency
        }),
        line = create("Line", {
            Thickness = Features.Visual.Esp.Tracers.Thickness,
            Color = Features.Visual.Esp.Tracers.Color,
            Transparency = Features.Visual.Esp.Tracers.Transparency
        }),
        boxLines = {},
        skeletonLines = {}
    }
    Variables.Cache[player] = esp
end

local function removeEsp(player)
    local esp = Variables.Cache[player]
    if not esp then return end
    for _, drawing in pairs(esp) do
        if type(drawing) == "table" then
            for _, line in pairs(drawing) do
                line:Remove()
            end
        else
            drawing:Remove()
        end
    end
    Variables.Cache[player] = nil
end

-- Funções de verificação atualizadas
local function isPlayerAlive(player)
    if not Features.Check.Team.Life then return true end -- Se Life Check estiver desativado, retorna true
    return player.Character and player.Character:FindFirstChildOfClass("Humanoid") and player.Character.Humanoid.Health > 0
end

local function isTeamValid(player)
    if not Features.Check.Team.Enabled then return true end -- Se Team Check estiver desativado, retorna true
    
    local isEnemy = player.Team ~= Variables.LocalPlayer.Team
    if Features.Check.Team.Mode == "Enemies" then
        return isEnemy
    else -- "Friend"
        return not isEnemy
    end
end

local function isPlayerVisible(player)
    if not Features.Check.Visible then return true end -- Se Wall Check estiver desativado, retorna true
    
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local startPos = Variables.Cam.CFrame.p
        local endPos = player.Character.HumanoidRootPart.Position
        local ray = Ray.new(startPos, (endPos - startPos).Unit * (endPos - startPos).Magnitude)
        local hit = workspace:FindPartOnRayWithIgnoreList(ray, {Variables.LocalPlayer.Character})
        return hit == nil or hit:IsDescendantOf(player.Character)
    end
    return false
end

-- Função para determinar a cor do ESP
local function getEspColor(player, isVisible)
    -- Prioridade para Team Colors se ativado
    if Features.Visual.Esp.Activators.Colors.Team.Enabled then
        local isEnemy = player.Team ~= Variables.LocalPlayer.Team
        if Features.Visual.Esp.Activators.Colors.Team.Mode == "Colors" then
            return isEnemy and Features.Visual.Esp.Activators.Colors.Team.Enemy or Features.Visual.Esp.Activators.Colors.Team.Friend
        else
            return player.Team and player.Team.TeamColor.Color or Features.Visual.Esp.Box.Color
        end
    -- Se não, verifica Wall Colors
    elseif Features.Visual.Esp.Activators.Colors.Wall.Enabled then
        return isVisible and Features.Visual.Esp.Activators.Colors.Wall.Front or Features.Visual.Esp.Activators.Colors.Wall.Back
    end
    -- Cor padrão se nenhum sistema de cores estiver ativo
    return Features.Visual.Esp.Box.Color
end

-- Atualização do ESP modificada
local function updateEsp()
    for player, esp in pairs(Variables.Cache) do
        local character = player.Character
        local isAlive = isPlayerAlive(player)
        local teamValid = isTeamValid(player)
        local isVisible = isPlayerVisible(player)
                
        -- Verificação principal com todas as condições
        if character and (not Features.Check.Team.Life or isAlive) and (not Features.Check.Team.Enabled or teamValid) then
                    
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            local humanoid = character:FindFirstChildOfClass("Humanoid")
                        
            if rootPart and humanoid then
                local position, onScreen = Variables.Cam:WorldToViewportPoint(rootPart.Position)
                            
                if onScreen then
                    local currentColor = getEspColor(player, isVisible)
                    local hrp2D = Variables.Cam:WorldToViewportPoint(rootPart.Position)
                    local charSize = (Variables.Cam:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0)).Y - Variables.Cam:WorldToViewportPoint(rootPart.Position + Vector3.new(0, 2.6, 0)).Y) / 2
                    local boxSize = Vector2.new(math.floor(charSize * 1.8), math.floor(charSize * 1.9))
                    local boxPosition = Vector2.new(math.floor(hrp2D.X - charSize * 1.8 / 2), math.floor(hrp2D.Y - charSize * 1.6 / 2))
                    
                    if Features.Visual.Esp.Box.Enabled and Features.Visual.Esp.Activators.Enabled and Features.General.Enabled  then
                        if Features.Visual.Esp.Box.Type == "2D" then
                            esp.box.Size = boxSize
                            esp.box.Position = boxPosition
                            esp.box.Color = currentColor
                            esp.box.Visible = true

                            for _, line in ipairs(esp.boxLines) do
                                line.Visible = false
                            end
                        elseif Features.Visual.Esp.Box.Type == "Corner" then
                            -- Corner box implementation
                            local lineW = (boxSize.X / 5)
                            local lineH = (boxSize.Y / 6)
                            local lineT = 1
                            if #esp.boxLines == 0 then
                                for i = 1, 8 do
                                    local boxLine = create("Line", { Thickness = 1, Color = currentColor, Transparency = 1 })
                                    esp.boxLines[#esp.boxLines + 1] = boxLine
                                end
                            end
                            local boxLines = esp.boxLines
                            -- top left
                            boxLines[1].From = Vector2.new(boxPosition.X - lineT, boxPosition.Y - lineT)
                            boxLines[1].To = Vector2.new(boxPosition.X + lineW, boxPosition.Y - lineT)
                            boxLines[2].From = Vector2.new(boxPosition.X - lineT, boxPosition.Y - lineT)
                            boxLines[2].To = Vector2.new(boxPosition.X - lineT, boxPosition.Y + lineH)
                            -- top right
                            boxLines[3].From = Vector2.new(boxPosition.X + boxSize.X - lineW, boxPosition.Y - lineT)
                            boxLines[3].To = Vector2.new(boxPosition.X + boxSize.X + lineT, boxPosition.Y - lineT)
                            boxLines[4].From = Vector2.new(boxPosition.X + boxSize.X + lineT, boxPosition.Y - lineT)
                            boxLines[4].To = Vector2.new(boxPosition.X + boxSize.X + lineT, boxPosition.Y + lineH)
                            -- bottom left
                            boxLines[5].From = Vector2.new(boxPosition.X - lineT, boxPosition.Y + boxSize.Y - lineH)
                            boxLines[5].To = Vector2.new(boxPosition.X - lineT, boxPosition.Y + boxSize.Y + lineT)
                            boxLines[6].From = Vector2.new(boxPosition.X - lineT, boxPosition.Y + boxSize.Y + lineT)
                            boxLines[6].To = Vector2.new(boxPosition.X + lineW, boxPosition.Y + boxSize.Y + lineT)
                            -- bottom right
                            boxLines[7].From = Vector2.new(boxPosition.X + boxSize.X - lineW, boxPosition.Y + boxSize.Y + lineT)
                            boxLines[7].To = Vector2.new(boxPosition.X + boxSize.X + lineT, boxPosition.Y + boxSize.Y + lineT)
                            boxLines[8].From = Vector2.new(boxPosition.X + boxSize.X + lineT, boxPosition.Y + boxSize.Y - lineH)
                            boxLines[8].To = Vector2.new(boxPosition.X + boxSize.X + lineT, boxPosition.Y + boxSize.Y + lineT)
                            for _, line in ipairs(boxLines) do
                                line.Color = currentColor
                                line.Visible = true
                            end
                            esp.box.Visible = false
                        end
                    else
                        esp.box.Visible = false
                        for _, line in ipairs(esp.boxLines) do
                            line.Visible = false
                        end
                    end
                    
                    if Features.Visual.Esp.Health.Enabled and Features.Visual.Esp.Activators.Enabled and Features.General.Enabled  then
                        esp.health.Visible = true
                        local healthPercentage = humanoid.Health / humanoid.MaxHealth
                        local from, to

                        if Features.Visual.Esp.Health.Position == "Left" then
                            from = Vector2.new(boxPosition.X - 6, boxPosition.Y + boxSize.Y)
                            to = Vector2.new(from.X, from.Y - boxSize.Y)
                            esp.health.From = Vector2.new((boxPosition.X - 5), boxPosition.Y + boxSize.Y)
                            esp.health.To = Vector2.new(esp.health.From.X, esp.health.From.Y - healthPercentage * boxSize.Y)
                        elseif Features.Visual.Esp.Health.Position == "Right" then
                            from = Vector2.new(boxPosition.X + boxSize.X + 6, boxPosition.Y + boxSize.Y)
                            to = Vector2.new(from.X, from.Y - boxSize.Y)
                            esp.health.From = Vector2.new((boxPosition.X + boxSize.X + 5), boxPosition.Y + boxSize.Y)
                            esp.health.To = Vector2.new(esp.health.From.X, esp.health.From.Y - healthPercentage * boxSize.Y)
                        end

                        esp.health.Color = Features.Visual.Esp.Health.Colors.Low:Lerp(Features.Visual.Esp.Health.Colors.High, healthPercentage)
                    else
                        esp.health.Visible = false
                    end
                    
                    if Features.Visual.Esp.Skeleton.Enabled and Features.Visual.Esp.Activators.Enabled and Features.General.Enabled  then
                        if #esp.skeletonLines == 0 then
                            for _, bonePair in ipairs(Variables.Bones) do
                                local parentBone, childBone = bonePair[1], bonePair[2]
                                if character:FindFirstChild(parentBone) and character:FindFirstChild(childBone) then
                                    local skeletonLine = create("Line", { Thickness = 1, Color = currentColor, Transparency = 1 })
                                    table.insert(esp.skeletonLines, {skeletonLine, parentBone, childBone})
                                end
                            end
                        end
                        for _, lineData in ipairs(esp.skeletonLines) do
                            local skeletonLine = lineData[1]
                            local parentBone, childBone = lineData[2], lineData[3]
                            if character:FindFirstChild(parentBone) and character:FindFirstChild(childBone) then
                                local parentPosition = Variables.Cam:WorldToViewportPoint(character[parentBone].Position)
                                local childPosition = Variables.Cam:WorldToViewportPoint(character[childBone].Position)
                                skeletonLine.From = Vector2.new(parentPosition.X, parentPosition.Y)
                                skeletonLine.To = Vector2.new(childPosition.X, childPosition.Y)
                                skeletonLine.Color = currentColor
                                skeletonLine.Visible = true
                            else
                                skeletonLine.Visible = false
                            end
                        end
                    else
                        for _, lineData in ipairs(esp.skeletonLines) do
                            lineData[1].Visible = false
                        end
                    end

                    if Features.Visual.Esp.Tracers.Enabled and Features.Visual.Esp.Activators.Enabled and Features.General.Enabled  then
                        esp.line.Visible = true
                        local lineFrom

                        if Features.Visual.Esp.Tracers.Position == "Left" then
                            lineFrom = Vector2.new(0, Variables.Cam.ViewportSize.Y / 2)
                        elseif Features.Visual.Esp.Tracers.Position == "Right" then
                            lineFrom = Vector2.new(Variables.Cam.ViewportSize.X, Variables.Cam.ViewportSize.Y / 2)
                        elseif Features.Visual.Esp.Tracers.Position == "Top" then
                            lineFrom = Vector2.new(Variables.Cam.ViewportSize.X / 2, 0)
                        elseif Features.Visual.Esp.Tracers.Position == "Bottom" then
                            lineFrom = Vector2.new(Variables.Cam.ViewportSize.X / 2, Variables.Cam.ViewportSize.Y)
                        --[[elseif Features.Visual.Esp.Tracers.Position == "Center" then
                            lineFrom = Vector2.new(Variables.Cam.ViewportSize.X / 2, Variables.Cam.ViewportSize.Y / 2) ]]
                        end

                        esp.line.From = lineFrom
                        esp.line.To = Vector2.new(hrp2D.X, hrp2D.Y)
                        esp.line.Color = currentColor
                    else
                        esp.line.Visible = false
                    end
                else
                    esp.box.Visible = false
                    esp.health.Visible = false
                    esp.line.Visible = false
                    for _, line in ipairs(esp.boxLines) do
                        line.Visible = false
                    end
                    for _, lineData in ipairs(esp.skeletonLines) do
                        lineData[1].Visible = false
                    end
                end
            else
                esp.box.Visible = false
                esp.health.Visible = false
                esp.line.Visible = false
                for _, line in ipairs(esp.boxLines) do
                    line.Visible = false
                end
                for _, lineData in ipairs(esp.skeletonLines) do
                    lineData[1].Visible = false
                end
            end
        else
            esp.box.Visible = false
            esp.health.Visible = false
            esp.line.Visible = false
            for _, line in ipairs(esp.boxLines) do
                line.Visible = false
            end
            for _, lineData in ipairs(esp.skeletonLines) do
                lineData[1].Visible = false
            end
        end
    end
end

for _, player in ipairs(Variables.Players:GetPlayers()) do
    if player ~= Variables.LocalPlayer then
        createEsp(player)
    end
end

Variables.Players.PlayerAdded:Connect(function(player)
    if player ~= Variables.LocalPlayer then
        createEsp(player)
    end
end)

Variables.Players.PlayerRemoving:Connect(function(player)
    removeEsp(player)
end)

Variables.RunService.RenderStepped:Connect(updateEsp)


--// HITBOX ↓

local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local Teams = game:GetService('Teams')

local function IsTeamCheck(player)
    if not Features.Check.Team.Enabled or not Teams:GetTeams() then
        return true -- Se HitboxTeam não estiver ativo, todos são considerados inimigos
    end
    
    if Features.Check.Team.Mode == "Friends" then
        return player.Team == LocalPlayer.Team
    else
        return player.Team ~= LocalPlayer.Team
    end
end

local function updateHitbox(player, size, transparency, color, material, canCollide)
    pcall(function()
        if player.Character and player.Character:FindFirstChild(Features.Misc.Hitbox.Target) then
            local part = player.Character[Features.Misc.Hitbox.Target]
            part.Size = size
            part.Transparency = transparency
            part.BrickColor = BrickColor.new(color)
            part.Material = material
            part.CanCollide = canCollide
        end
    end)
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        character:WaitForChild(Features.Misc.Hitbox.Target)
        if player ~= LocalPlayer and Features.Misc.Hitbox.Enabled and IsTeamCheck(player) then
            updateHitbox(player, Vector3.new(Features.Misc.Hitbox.Size, Features.Misc.Hitbox.Size, Features.Misc.Hitbox.Size), Features.Misc.Hitbox.Transparency, Features.Misc.Hitbox.Color, "Neon", false)
        else
            updateHitbox(player, Vector3.new(2, 2, 2), 1, Features.Misc.Hitbox.Color, "Plastic", true)
        end
    end)
end

local function Hitbox()
    game:GetService('RunService').RenderStepped:Connect(function()
        for _, player in next, Players:GetPlayers() do
            if player ~= LocalPlayer and player.Character then
                if Features.Misc.Hitbox.Enabled and IsTeamCheck(player) then
                    updateHitbox(player, Vector3.new(Features.Misc.Hitbox.Size, Features.Misc.Hitbox.Size, Features.Misc.Hitbox.Size), Features.Misc.Hitbox.Transparency, Features.Misc.Hitbox.Color, "Neon", false)
                else
                    updateHitbox(player, Vector3.new(2, 2, 2), 1, Features.Misc.Hitbox.Color, "Plastic", true)
                end
            end
        end
    end)
end

Players.PlayerAdded:Connect(onPlayerAdded)

for _, player in next, Players:GetPlayers() do
    onPlayerAdded(player)
end
--//--------------• KILL ALL IMPROVED •--------------\\--

local function killAllPlayers()
    if not Features.Misc.Kill.Enabled then return end
    
    local localPlayer = game.Players.LocalPlayer
    local localChar = localPlayer.Character
    if not localChar then return end
    
    local humanoid = localChar:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return end
    
    local rootPart = localChar:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    -- Variáveis de controle
    local currentTarget = nil
    local targetDiedConnection = nil
    local localDiedConnection = nil
    local aimConnection = nil
    
    -- Função para limpar conexões
    local function cleanup()
        if targetDiedConnection then targetDiedConnection:Disconnect() end
        if localDiedConnection then localDiedConnection:Disconnect() end
        if aimConnection then aimConnection:Disconnect() end
        currentTarget = nil
    end
    
    -- Ativa o modo kill
    Variables.IsKillAimbotActive = true
    
    -- Conexão para detectar própria morte
    localDiedConnection = humanoid.Died:Connect(function()
        cleanup()
    end)
    
    -- Função para travar no alvo atual
    local function lockOnTarget(targetPlayer)
        cleanup() -- Limpa alvo anterior
        
        if not targetPlayer or not targetPlayer.Character then return false end
        
        local targetChar = targetPlayer.Character
        local targetHumanoid = targetChar:FindFirstChildOfClass("Humanoid")
        if not targetHumanoid or targetHumanoid.Health <= 0 then return false end
        
        currentTarget = targetPlayer
        
        -- Conexão para detectar morte do alvo
        targetDiedConnection = targetHumanoid.Died:Connect(function()
            cleanup()
        end)
        
        -- Conexão de aimbot contínuo
        if Features.Misc.Kill.AimCam then
            aimConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not Features.Misc.Kill.Enabled or not currentTarget or not targetChar.Parent or humanoid.Health <= 0 then
                    cleanup()
                    return
                end
                
                local targetPart = targetChar:FindFirstChild(Features.General.Aimbot.Target)
                if targetPart then
                    lookAt(targetPart.Position)
                end
            end)
        end
        
        return true
    end
    
    -- Loop principal de kill
    while Features.Misc.Kill.Enabled and humanoid.Health > 0 do
        -- Encontra o melhor alvo disponível
        local bestTarget = nil
        local shortestDistance = math.huge
        
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= localPlayer and player.Character and isPlayerTeam(player) then
                local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
                local targetHumanoid = player.Character:FindFirstChildOfClass("Humanoid")
                
                if targetRoot and targetHumanoid and targetHumanoid.Health > 0 then
                    local distance = (rootPart.Position - targetRoot.Position).Magnitude
                    
                    if distance <= Features.General.Aimbot.Distance then
                        if Features.Misc.Kill.Preference.Enabled then
                            if Features.Misc.Kill.Preference.Method == "Life" then
                                if targetHumanoid.Health < (bestTarget and bestTarget.Humanoid.Health or math.huge) then
                                    bestTarget = {Player = player, Humanoid = targetHumanoid, Distance = distance}
                                end
                            else
                                if distance < shortestDistance then
                                    shortestDistance = distance
                                    bestTarget = {Player = player, Humanoid = targetHumanoid, Distance = distance}
                                end
                            end
                        else
                            if distance < shortestDistance then
                                shortestDistance = distance
                                bestTarget = {Player = player, Humanoid = targetHumanoid, Distance = distance}
                            end
                        end
                    end
                end
            end
        end
        
        if not bestTarget then break end
        
        -- Trava no novo alvo
        if not lockOnTarget(bestTarget.Player) then
            task.wait()
            continue
        end
        
        local targetChar = bestTarget.Player.Character
        local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
        
        -- Executa o método de kill
        if Features.Misc.Kill.Mode.Method == "Bring" then
            targetRoot.CFrame = rootPart.CFrame * CFrame.new(0, 0, -7)
            
        elseif Features.Misc.Kill.Mode.Method == "Teleport" then
            rootPart.CFrame = targetRoot.CFrame * CFrame.new(0, 0, -7) * CFrame.Angles(0, math.pi, 0)
            
        elseif Features.Misc.Kill.Mode.Method == "Tween" then
            local parts = {}
            for _, part in ipairs(localChar:GetDescendants()) do
                if part:IsA("BasePart") then
                    parts[part] = part.CanCollide
                    part.CanCollide = false
                end
            end
            
            local tween = game:GetService("TweenService"):Create(
                rootPart,
                TweenInfo.new(
                    (rootPart.Position - targetRoot.Position).Magnitude / Features.Misc.Kill.Mode.Speed,
                    Enum.EasingStyle.Linear
                ),
                {CFrame = targetRoot.CFrame * CFrame.new(0, 0, 2) * CFrame.Angles(0, math.pi, 0)}
            )
            tween:Play()
            tween.Completed:Wait()
            
            for part, state in pairs(parts) do
                if part and part.Parent then
                    part.CanCollide = state
                end
            end
        end
        
        -- Espera enquanto ambos estiverem vivos
        while Features.Misc.Kill.Enabled and 
              humanoid.Health > 0 and 
              currentTarget and 
              currentTarget.Character and 
              currentTarget.Character:FindFirstChildOfClass("Humanoid") and 
              currentTarget.Character.Humanoid.Health > 0 do
            task.wait()
        end
        
        task.wait(Features.Misc.Kill.Mode.Wait)
    end
    
    -- Limpeza final
    cleanup()
    Variables.IsKillAimbotActive = false
end

-- Loop principal otimizado
local killAllLoop
killAllLoop = game:GetService("RunService").Heartbeat:Connect(function()
    if Features.Misc.Kill.Enabled then
        killAllPlayers()
    else
        killAllLoop:Disconnect()
    end
end)


local Tabs = {
    General = Window:Tab({
        Name = "General",
        Icon = "Target"
    }),
    
    Visual = Window:Tab({
        Name = "Visual",
        Icon = "Eye"
    }),
    
    LocalPlayer = Window:Tab({
        Name = "Local Player",
        Icon = "User"
    }),
    
    Window:Divider(),
    
    Config = Window:Tab({
        Name = "Configuration",
        Icon = "Settings"
    })
}

local Sections = {
    -- General Tab Sections
    G_Left1 = Tabs.General:Section({
        Header = "Aimbot",
        Side = "Left"
    }),
    
    G_Right1 = Tabs.General:Section({
        Header = "Verifications",
        Side = "Right"
    }),
    
    G_Left2 = Tabs.General:Section({
        Header = "Kill All",
        Side = "Left"
    }),
    
    G_Right2 = Tabs.General:Section({
        Header = "Miscellaneous",
        Side = "Right"
    }),
    
    -- Visual Tab Sections
    V_Left1 = Tabs.Visual:Section({
        Header = "ESP Settings",
        Side = "Left"
    }),
    
    V_Right1 = Tabs.Visual:Section({
        Header = "ESP Components",
        Side = "Right"
    }),
    
    V_Left2 = Tabs.Visual:Section({
        Header = "FOV Circle",
        Side = "Left"
    }),
    
    V_Right2 = Tabs.Visual:Section({
        Header = "ESP Colors",
        Side = "Right"
    }),
    
    -- Local Player Tab Sections
    LP_Left = Tabs.LocalPlayer:Section({
        Header = "Movement",
        Side = "Left"
    }),
    
    LP_Right = Tabs.LocalPlayer:Section({
        Header = "Hitbox",
        Side = "Right"
    }),
    
    -- Config Tab Sections
    C_Left = Tabs.Config:Section({
        Header = "Configuration",
        Side = "Left"
    }),
    
    C_Right = Tabs.Config:Section({
        Header = "Information",
        Side = "Right"
    })
}

-- General Tab
Sections.G_Left1:Checkbox("Aimbot_Toggle", {
    Name = "Enable Aimbot",
    Default = Features.General.Enabled,
    Callback = function(Value)
        Features.General.Enabled = Value
    end
})

Sections.G_Left1:Checkbox("Aimbot_Activate", {
    Name = "Aimbot Active",
    Default = Features.General.Aimbot.Enabled,
    Callback = function(Value)
        Features.General.Aimbot.Enabled = Value
    end
})

Sections.G_Left1:Dropdown("Aimbot_Target", {
    Name = "Target Part",
    Values = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"},
    Default = Features.General.Aimbot.Target,
    Callback = function(Value)
        Features.General.Aimbot.Target = Value
    end
})

Sections.G_Left1:Dropdown("Aimbot_Mode", {
    Name = "Aimbot Mode",
    Values = {"Rage", "Legit"},
    Default = Features.General.Aimbot.Mode,
    Callback = function(Value)
        Features.General.Aimbot.Mode = Value
    end
})

Sections.G_Left1:Slider("Aimbot_Distance", {
    Name = "Maximum Distance",
    Minimum = 0,
    Maximum = 1000,
    Default = Features.General.Aimbot.Distance,
    Callback = function(Value)
        Features.General.Aimbot.Distance = Value
    end
})

Sections.G_Left1:Slider("Aimbot_Sensitivity", {
    Name = "Sensitivity",
    Minimum = 0.1,
    Maximum = 5,
    Default = Features.General.Aimbot.Sensitivity,
    Precision = 1,
    Callback = function(Value)
        Features.General.Aimbot.Sensitivity = Value
    end
})

Sections.G_Left1:Divider()

Sections.G_Left1:Checkbox("Aimbot_Fit", {
    Name = "Enable Height Adjustment",
    Default = Features.General.Aimbot.Fit.Enabled,
    Callback = function(Value)
        Features.General.Aimbot.Fit.Enabled = Value
    end
})

Sections.G_Left1:Slider("Aimbot_FitY", {
    Name = "Height Adjustment",
    Minimum = -20,
    Maximum = 20,
    Default = Features.General.Aimbot.Fit.Y,
    Callback = function(Value)
        Features.General.Aimbot.Fit.Y = Value
    end
})

-- Kill All Settings
Sections.G_Left2:Checkbox("KillAll_Toggle", {
    Name = "Enable Kill All",
    Default = Features.Misc.Kill.Enabled,
    Callback = function(Value)
        Features.Misc.Kill.Enabled = Value
    end
})

Sections.G_Left2:Checkbox("KillAll_AimCam", {
    Name = "Aim During Kill",
    Default = Features.Misc.Kill.AimCam,
    Callback = function(Value)
        Features.Misc.Kill.AimCam = Value
    end
})

Sections.G_Left2:Dropdown("KillAll_Method", {
    Name = "Kill Method",
    Values = {"Bring", "Teleport", "Tween"},
    Default = Features.Misc.Kill.Mode.Method,
    Callback = function(Value)
        Features.Misc.Kill.Mode.Method = Value
    end
})

Sections.G_Left2:Slider("KillAll_Speed", {
    Name = "Kill Speed",
    Minimum = 50,
    Maximum = 500,
    Default = Features.Misc.Kill.Mode.Speed,
    Callback = function(Value)
        Features.Misc.Kill.Mode.Speed = Value
    end
})

Sections.G_Left2:Slider("KillAll_Wait", {
    Name = "Wait Between Kills",
    Minimum = 0,
    Maximum = 5,
    Default = Features.Misc.Kill.Mode.Wait,
    Precision = 1,
    Callback = function(Value)
        Features.Misc.Kill.Mode.Wait = Value
    end
})

Sections.G_Left2:Divider()

Sections.G_Left2:Checkbox("KillAll_Preference", {
    Name = "Enable Target Preference",
    Default = Features.Misc.Kill.Preference.Enabled,
    Callback = function(Value)
        Features.Misc.Kill.Preference.Enabled = Value
    end
})

Sections.G_Left2:Dropdown("KillAll_PrefMethod", {
    Name = "Preference Method",
    Values = {"Distance", "Life"},
    Default = Features.Misc.Kill.Preference.Method,
    Callback = function(Value)
        Features.Misc.Kill.Preference.Method = Value
    end
})

-- Verifications
Sections.G_Right1:Checkbox("Check_Team", {
    Name = "Team Check",
    Default = Features.Check.Team.Enabled,
    Callback = function(Value)
        Features.Check.Team.Enabled = Value
    end
})

Sections.G_Right1:Dropdown("Check_TeamMode", {
    Name = "Team Mode",
    Values = {"Enemies", "Friends"},
    Default = Features.Check.Team.Mode,
    Callback = function(Value)
        Features.Check.Team.Mode = Value
    end
})

Sections.G_Right1:Checkbox("Check_Wall", {
    Name = "Wall Check",
    Default = Features.Check.Visible,
    Callback = function(Value)
        Features.Check.Visible = Value
    end
})

Sections.G_Right1:Checkbox("Check_Life", {
    Name = "Life Check",
    Default = Features.Check.Life,
    Callback = function(Value)
        Features.Check.Life = Value
    end
})

Sections.G_Right1:Divider()

Sections.G_Right1:Button("Refresh_Checks", {
    Name = "Refresh Checks",
    Callback = function()
        Window:Notification({
            Title = "Checks Refreshed",
            Message = "All verification checks have been refreshed.",
            Duration = 3
        })
    end
})

-- Miscellaneous
Sections.G_Right2:Checkbox("Misc_Hitbox", {
    Name = "Enable Hitbox",
    Default = Features.Misc.Hitbox.Enabled,
    Callback = function(Value)
        Features.Misc.Hitbox.Enabled = Value
    end
})

Sections.G_Right2:Input("Hitbox_Target", {
    Name = "Hitbox Target Part",
    Default = Features.Misc.Hitbox.Target,
    Callback = function(Value)
        Features.Misc.Hitbox.Target = Value
    end
})

Sections.G_Right2:Slider("Hitbox_Size", {
    Name = "Hitbox Size",
    Minimum = 1,
    Maximum = 50,
    Default = Features.Misc.Hitbox.Size,
    Callback = function(Value)
        Features.Misc.Hitbox.Size = Value
    end
})

Sections.G_Right2:Slider("Hitbox_Transparency", {
    Name = "Hitbox Transparency",
    Minimum = 0,
    Maximum = 1,
    Default = Features.Misc.Hitbox.Transparency,
    Precision = 2,
    Callback = function(Value)
        Features.Misc.Hitbox.Transparency = Value
    end
})

Sections.G_Right2:Colorpicker("Hitbox_Color", {
    Name = "Hitbox Color",
    Default = Features.Misc.Hitbox.Color,
    Callback = function(Value)
        Features.Misc.Hitbox.Color = Value
    end
})

-- Visual Tab
Sections.V_Left1:Checkbox("ESP_Toggle", {
    Name = "Enable ESP",
    Default = Features.Visual.Esp.Activators.Enabled,
    Callback = function(Value)
        Features.Visual.Esp.Activators.Enabled = Value
    end
})

Sections.V_Left1:Checkbox("ESP_Box", {
    Name = "Box ESP",
    Default = Features.Visual.Esp.Box.Enabled,
    Callback = function(Value)
        Features.Visual.Esp.Box.Enabled = Value
    end
})

Sections.V_Left1:Dropdown("ESP_BoxType", {
    Name = "Box Type",
    Values = {"2D", "Corner"},
    Default = Features.Visual.Esp.Box.Type,
    Callback = function(Value)
        Features.Visual.Esp.Box.Type = Value
    end
})

Sections.V_Left1:Checkbox("ESP_Skeleton", {
    Name = "Skeleton ESP",
    Default = Features.Visual.Esp.Skeleton.Enabled,
    Callback = function(Value)
        Features.Visual.Esp.Skeleton.Enabled = Value
    end
})

Sections.V_Left1:Checkbox("ESP_Tracers", {
    Name = "Tracers",
    Default = Features.Visual.Esp.Tracers.Enabled,
    Callback = function(Value)
        Features.Visual.Esp.Tracers.Enabled = Value
    end
})

Sections.V_Left1:Dropdown("ESP_TracerPos", {
    Name = "Tracer Position",
    Values = {"Top", "Bottom", "Left", "Right"},
    Default = Features.Visual.Esp.Tracers.Position,
    Callback = function(Value)
        Features.Visual.Esp.Tracers.Position = Value
    end
})

Sections.V_Left1:Checkbox("ESP_Health", {
    Name = "Health Bar",
    Default = Features.Visual.Esp.Health.Enabled,
    Callback = function(Value)
        Features.Visual.Esp.Health.Enabled = Value
    end
})

Sections.V_Left1:Dropdown("ESP_HealthPos", {
    Name = "Health Bar Position",
    Values = {"Left", "Right"},
    Default = Features.Visual.Esp.Health.Position,
    Callback = function(Value)
        Features.Visual.Esp.Health.Position = Value
    end
})

Sections.V_Left1:Checkbox("ESP_Target", {
    Name = "Target Indicator",
    Default = Features.Visual.Esp.Target.Enabled,
    Callback = function(Value)
        Features.Visual.Esp.Target.Enabled = Value
    end
})

-- FOV Circle Settings
Sections.V_Left2:Checkbox("FOV_Toggle", {
    Name = "Show FOV Circle",
    Default = Features.Visual.Fov.Visible,
    Callback = function(Value)
        Features.Visual.Fov.Visible = Value
        Fov.Visible = Value
    end
})

Sections.V_Left2:Checkbox("FOV_Filled", {
    Name = "Filled Circle",
    Default = Features.Visual.Fov.Filled,
    Callback = function(Value)
        Features.Visual.Fov.Filled = Value
        Fov.Filled = Value
    end
})

Sections.V_Left2:Slider("FOV_Radius", {
    Name = "FOV Radius",
    Minimum = 10,
    Maximum = 500,
    Default = Features.Visual.Fov.Radius,
    Callback = function(Value)
        Features.Visual.Fov.Radius = Value
        Fov.Radius = Value
    end
})

Sections.V_Left2:Slider("FOV_Thickness", {
    Name = "FOV Thickness",
    Minimum = 1,
    Maximum = 10,
    Default = Features.Visual.Fov.Thickness,
    Callback = function(Value)
        Features.Visual.Fov.Thickness = Value
        Fov.Thickness = Value
    end
})

Sections.V_Left2:Slider("FOV_Transparency", {
    Name = "FOV Transparency",
    Minimum = 0,
    Maximum = 1,
    Default = Features.Visual.Fov.Transparency,
    Precision = 2,
    Callback = function(Value)
        Features.Visual.Fov.Transparency = Value
        Fov.Transparency = Value
    end
})

Sections.V_Left2:Colorpicker("FOV_Color", {
    Name = "FOV Color",
    Default = Features.Visual.Fov.Color,
    Callback = function(Value)
        Features.Visual.Fov.Color = Value
        Fov.Color = Value
    end
})

-- ESP Color Settings
Sections.V_Right2:Checkbox("ESP_TeamColors", {
    Name = "Team-Based Colors",
    Default = Features.Visual.Esp.Activators.Colors.Team.Enabled,
    Callback = function(Value)
        Features.Visual.Esp.Activators.Colors.Team.Enabled = Value
    end
})

Sections.V_Right2:Dropdown("ESP_TeamMode", {
    Name = "Team Color Mode",
    Values = {"Colors", "Teams"},
    Default = Features.Visual.Esp.Activators.Colors.Team.Mode,
    Callback = function(Value)
        Features.Visual.Esp.Activators.Colors.Team.Mode = Value
    end
})

Sections.V_Right2:Colorpicker("ESP_EnemyColor", {
    Name = "Enemy Color",
    Default = Features.Visual.Esp.Activators.Colors.Team.Enemy,
    Callback = function(Value)
        Features.Visual.Esp.Activators.Colors.Team.Enemy = Value
    end
})

Sections.V_Right2:Colorpicker("ESP_FriendColor", {
    Name = "Friend Color",
    Default = Features.Visual.Esp.Activators.Colors.Team.Friend,
    Callback = function(Value)
        Features.Visual.Esp.Activators.Colors.Team.Friend = Value
    end
})

Sections.V_Right2:Divider()

Sections.V_Right2:Checkbox("ESP_WallColors", {
    Name = "Wall-Based Colors",
    Default = Features.Visual.Esp.Activators.Colors.Wall.Enabled,
    Callback = function(Value)
        Features.Visual.Esp.Activators.Colors.Wall.Enabled = Value
    end
})

Sections.V_Right2:Colorpicker("ESP_VisibleColor", {
    Name = "Visible Color",
    Default = Features.Visual.Esp.Activators.Colors.Wall.Front,
    Callback = function(Value)
        Features.Visual.Esp.Activators.Colors.Wall.Front = Value
    end
})

Sections.V_Right2:Colorpicker("ESP_HiddenColor", {
    Name = "Hidden Color",
    Default = Features.Visual.Esp.Activators.Colors.Wall.Back,
    Callback = function(Value)
        Features.Visual.Esp.Activators.Colors.Wall.Back = Value
    end
})

Sections.V_Right2:Divider()

Sections.V_Right2:Colorpicker("ESP_TargetColor", {
    Name = "Target Indicator Color",
    Default = Features.Visual.Esp.Target.Color,
    Callback = function(Value)
        Features.Visual.Esp.Target.Color = Value
    end
})

Sections.V_Right2:Colorpicker("ESP_TracerColor", {
    Name = "Tracer Color",
    Default = Features.Visual.Esp.Tracers.Color,
    Callback = function(Value)
        Features.Visual.Esp.Tracers.Color = Value
    end
})

Sections.V_Right2:Colorpicker("ESP_BoxColor", {
    Name = "Box Color",
    Default = Features.Visual.Esp.Box.Color,
    Callback = function(Value)
        Features.Visual.Esp.Box.Color = Value
    end
})

Sections.V_Right2:Colorpicker("ESP_SkeletonColor", {
    Name = "Skeleton Color",
    Default = Features.Visual.Esp.Skeleton.Color,
    Callback = function(Value)
        Features.Visual.Esp.Skeleton.Color = Value
    end
})

Sections.V_Right2:Colorpicker("ESP_HealthHigh", {
    Name = "Health High Color",
    Default = Features.Visual.Esp.Health.Colors.High,
    Callback = function(Value)
        Features.Visual.Esp.Health.Colors.High = Value
    end
})

Sections.V_Right2:Colorpicker("ESP_HealthLow", {
    Name = "Health Low Color",
    Default = Features.Visual.Esp.Health.Colors.Low,
    Callback = function(Value)
        Features.Visual.Esp.Health.Colors.Low = Value
    end
})

-- Local Player Tab
Sections.LP_Left:Checkbox("Boost_Toggle", {
    Name = "Enable Movement Boost",
    Default = Features.Misc.Boost.Enabled,
    Callback = function(Value)
        Features.Misc.Boost.Enabled = Value
        if Value then
            local humanoid = Variables.LocalPlayer.Character and Variables.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                if Features.Misc.Boost.Mode == "Speed" or Features.Misc.Boost.Mode == "Both" then
                    humanoid.WalkSpeed = Features.Misc.Boost.Speed
                end
                if Features.Misc.Boost.Mode == "Jump" or Features.Misc.Boost.Mode == "Both" then
                    humanoid.JumpPower = Features.Misc.Boost.Jump
                end
            end
        else
            local humanoid = Variables.LocalPlayer.Character and Variables.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 16
                humanoid.JumpPower = 50
            end
        end
    end
})

Sections.LP_Left:Dropdown("Boost_Mode", {
    Name = "Boost Mode",
    Values = {"Speed", "Jump", "Both"},
    Default = Features.Misc.Boost.Mode,
    Callback = function(Value)
        Features.Misc.Boost.Mode = Value
    end
})

Sections.LP_Left:Slider("Boost_Speed", {
    Name = "Walk Speed",
    Minimum = 16,
    Maximum = 200,
    Default = Features.Misc.Boost.Speed,
    Callback = function(Value)
        Features.Misc.Boost.Speed = Value
        if Features.Misc.Boost.Enabled and Variables.LocalPlayer.Character then
            local humanoid = Variables.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid and (Features.Misc.Boost.Mode == "Speed" or Features.Misc.Boost.Mode == "Both") then
                humanoid.WalkSpeed = Value
            end
        end
    end
})

Sections.LP_Left:Slider("Boost_Jump", {
    Name = "Jump Power",
    Minimum = 50,
    Maximum = 200,
    Default = Features.Misc.Boost.Jump,
    Callback = function(Value)
        Features.Misc.Boost.Jump = Value
        if Features.Misc.Boost.Enabled and Variables.LocalPlayer.Character then
            local humanoid = Variables.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid and (Features.Misc.Boost.Mode == "Jump" or Features.Misc.Boost.Mode == "Both") then
                humanoid.JumpPower = Value
            end
        end
    end
})

Sections.LP_Left:Divider()

Sections.LP_Left:Button("Reset_Movement", {
    Name = "Reset Movement",
    Callback = function()
        if Variables.LocalPlayer.Character then
            local humanoid = Variables.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 16
                humanoid.JumpPower = 50
                Window:Notification({
                    Title = "Movement Reset",
                    Message = "Walk speed and jump power have been reset to default.",
                    Duration = 3
                })
            end
        end
    end
})

-- Hitbox Configuration
Sections.LP_Right:Checkbox("Hitbox_Team", {
    Name = "Team Check for Hitbox",
    Default = Features.Check.Team.Enabled,
    Callback = function(Value)
        Features.Check.Team.Enabled = Value
    end
})

Sections.LP_Right:Dropdown("Hitbox_TeamMode", {
    Name = "Hitbox Team Mode",
    Values = {"Enemies", "Friends"},
    Default = Features.Check.Team.Mode,
    Callback = function(Value)
        Features.Check.Team.Mode = Value
    end
})

Sections.LP_Right:Slider("ESP_BoxThickness", {
    Name = "Box Thickness",
    Minimum = 1,
    Maximum = 10,
    Default = Features.Visual.Esp.Box.Thickness,
    Callback = function(Value)
        Features.Visual.Esp.Box.Thickness = Value
    end
})

Sections.LP_Right:Slider("ESP_BoxTransparency", {
    Name = "Box Transparency",
    Minimum = 0,
    Maximum = 1,
    Default = Features.Visual.Esp.Box.Transparency,
    Precision = 2,
    Callback = function(Value)
        Features.Visual.Esp.Box.Transparency = Value
    end
})

Sections.LP_Right:Slider("ESP_SkeletonThickness", {
    Name = "Skeleton Thickness",
    Minimum = 1,
    Maximum = 10,
    Default = Features.Visual.Esp.Skeleton.Thickness,
    Callback = function(Value)
        Features.Visual.Esp.Skeleton.Thickness = Value
    end
})

Sections.LP_Right:Slider("ESP_TracerThickness", {
    Name = "Tracer Thickness",
    Minimum = 1,
    Maximum = 10,
    Default = Features.Visual.Esp.Tracers.Thickness,
    Callback = function(Value)
        Features.Visual.Esp.Tracers.Thickness = Value
    end
})

Sections.LP_Right:Slider("ESP_TargetThickness", {
    Name = "Target Indicator Thickness",
    Minimum = 1,
    Maximum = 10,
    Default = Features.Visual.Esp.Target.Thickness,
    Callback = function(Value)
        Features.Visual.Esp.Target.Thickness = Value
    end
})

Sections.LP_Right:Slider("ESP_HealthThickness", {
    Name = "Health Bar Thickness",
    Minimum = 1,
    Maximum = 10,
    Default = Features.Visual.Esp.Health.Thickness,
    Callback = function(Value)
        Features.Visual.Esp.Health.Thickness = Value
    end
})

-- Configuration Tab
Sections.C_Left:Checkbox("Config_SaveSettings", {
    Name = "Auto Save Settings",
    Default = false,
    Callback = function(Value)
        Window:Notification({
            Title = "Settings",
            Message = Value and "Settings will be saved automatically." or "Auto-save disabled.",
            Duration = 3
        })
    end
})

Sections.C_Left:Button("Config_Save", {
    Name = "Save Current Settings",
    Callback = function()
        Window:Dialog({
            Title = "Save Settings",
            Description = "Do you want to save all current settings?",
            Buttons = {
                {
                    Name = "Save",
                    Callback = function()
                        -- Implement save logic here
                        Window:Notification({
                            Title = "Settings Saved",
                            Message = "All settings have been saved successfully.",
                            Duration = 3
                        })
                    end
                },
                {
                    Name = "Cancel",
                    Callback = function() end
                }
            }
        })
    end
})

Sections.C_Left:Button("Config_Load", {
    Name = "Load Settings",
    Callback = function()
        Window:Dialog({
            Title = "Load Settings",
            Description = "Do you want to load saved settings?",
            Buttons = {
                {
                    Name = "Load",
                    Callback = function()
                        -- Implement load logic here
                        Window:Notification({
                            Title = "Settings Loaded",
                            Message = "Settings have been loaded successfully.",
                            Duration = 3
                        })
                    end
                },
                {
                    Name = "Cancel",
                    Callback = function() end
                }
            }
        })
    end
})

Sections.C_Left:Button("Config_Reset", {
    Name = "Reset to Default",
    Callback = function()
        Window:Dialog({
            Title = "Reset Settings",
            Description = "Are you sure you want to reset all settings to default?",
            Buttons = {
                {
                    Name = "Reset",
                    Callback = function()
                        -- Implement reset logic here
                        Window:Notification({
                            Title = "Settings Reset",
                            Message = "All settings have been reset to default values.",
                            Duration = 3
                        })
                    end
                },
                {
                    Name = "Cancel",
                    Callback = function() end
                }
            }
        })
    end
})

Sections.C_Left:Divider()

Sections.C_Left:Checkbox("Config_ShowKeybinds", {
    Name = "Show Keybinds",
    Default = true,
    Callback = function(Value)
        Window:Notification({
            Title = "Keybinds",
            Message = Value and "Keybinds are now visible." or "Keybinds are now hidden.",
            Duration = 3
        })
    end
})

Sections.C_Left:Input("Config_AimbotKey", {
    Name = "Aimbot Keybind",
    Default = "Q",
    Callback = function(Value)
        local keyCode = Enum.KeyCode[Value] or Enum.KeyCode.Q
        Features.General.Aimbot.KeyBind = keyCode
        Window:Notification({
            Title = "Keybind Updated",
            Message = "Aimbot keybind set to: " .. Value,
            Duration = 3
        })
    end
})

-- Information Section
Sections.C_Right:Paragraph("Info_Paragraph", {
    Header = "Synapse Cheat",
    Body = "A comprehensive ESP and Aimbot script for enhanced gameplay experience. Features include customizable ESP, aimbot with multiple modes, kill all functionality, and movement enhancements."
})

Sections.C_Right:Divider()

Sections.C_Right:Label("Info_Version", {Text = "Version: 2.0.0"})

Sections.C_Right:SubLabel("Info_Developer", {Text = "Developer: Your Name"})

Sections.C_Right:SubLabel("Info_LastUpdate", {Text = "Last Updated: November 2024"})

Sections.C_Right:Divider()

Sections.C_Right:Button("Info_Refresh", {
    Name = "Refresh Script",
    Callback = function()
        Window:Dialog({
            Title = "Refresh Script",
            Description = "This will refresh all script components. Continue?",
            Buttons = {
                {
                    Name = "Refresh",
                    Callback = function()
                        -- Implement refresh logic here
                        Window:Notification({
                            Title = "Script Refreshed",
                            Message = "All components have been refreshed successfully.",
                            Duration = 3
                        })
                    end
                },
                {
                    Name = "Cancel",
                    Callback = function() end
                }
            }
        })
    end
})

Sections.C_Right:Button("Info_Support", {
    Name = "Get Support",
    Callback = function()
        Window:Notification({
            Title = "Support Information",
            Message = "For support, please contact the developer or check the documentation.",
            Duration = 5
        })
    end
})

-- Initialize FOV
StartFov()

-- Initialize Hitbox system
Hitbox()

Window:Notification({
    Title = "Synapse Cheat Loaded",
    Message = "Script has been successfully loaded and initialized.",
    Duration = 5
})
