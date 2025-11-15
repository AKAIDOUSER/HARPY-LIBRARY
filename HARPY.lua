local IconsSystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/AKAIDOUSER/HARPY-LIBRARY/refs/heads/main/Load%20Icons.lua"))()
IconsSystem:LoadIcons("https://raw.githubusercontent.com/AKAIDOUSER/HARPY-LIBRARY/refs/heads/main/Icons.lua")

local Lib = {
    Options = {}, 
	Folder = "HarpyLib", 
	
    Themes = {
        Darker = {
            Colors = {
                Background = Color3.fromRGB(20, 20, 20),
                Primary = Color3.fromRGB(15, 15, 15),
                Secondary = Color3.fromRGB(18, 18, 18),
                Active = Color3.fromRGB(15, 15, 15),
                Stroke = Color3.fromRGB(37, 37, 37),
                Image = Color3.fromRGB(210, 210, 210),
                Title = Color3.fromRGB(255, 255, 255),
                Text = Color3.fromRGB(210, 210, 210),
                SubText = Color3.fromRGB(190, 190, 190),
                
                On = Color3.fromRGB(60, 60, 60),
                Off = Color3.fromRGB(40, 40, 40),
                
                Ball = Color3.fromRGB(190, 190, 190),
                LineFill = Color3.fromRGB(180, 180, 180),
                BgLine = Color3.fromRGB(25, 25, 25),
            },
            Features = {
                -- Fonts
                FTitle = Enum.Font.Sarpanch,
                FNormal = Enum.Font.Code,
                
                --Enum.Font.Michroma
                
                -- Size Texts
                Thickness = 1,
                STitle = 14,
                SNormal = 14,
            },
        },
    },

	GetService = function(service)
		return cloneref and cloneref(game:GetService(service)) or game:GetService(service)
	end
}

local TweenService = Lib.GetService("TweenService")
local RunService = Lib.GetService("RunService")
local HttpService = Lib.GetService("HttpService")
local ContentProvider = Lib.GetService("ContentProvider")
local UserInputService = Lib.GetService("UserInputService")
local Lighting = Lib.GetService("Lighting")
local Players = Lib.GetService("Players")

local isStudio = RunService:IsStudio()
local LocalPlayer = Players.LocalPlayer

local assets = {
	interFont = "rbxassetid://12187365364",
	userInfoBlurred = "rbxassetid://18824089198",
	toggleBackground = "rbxassetid://18772190202",
	togglerHead = "rbxassetid://18772309008",
	buttonImage = "rbxassetid://10709791437",
	searchIcon = "rbxassetid://86737463322606",
	colorWheel = "rbxassetid://2849458409",
	colortarget = "rbxassetid://73265255323268",
	grid = "rbxassetid://121484455191370",
	globe = "rbxassetid://108952102602834",
	transform = "rbxassetid://90336395745819",
	dropdown = "rbxassetid://18865373378",
	sliderbar = "rbxassetid://18772615246",
	sliderhead = "rbxassetid://18772834246",
	shadow = "rbxassetid://6014261993",
	check = "rbxassetid://7733715400",
	tab = "rbxassetid://90991999539475",
	hide = "rbxassetid://92186614586776",
	minimize = "rbxassetid://11255032783"
}

function Lib:GetThemeConfig(themeName)
    return self.Themes[themeName] or self.Themes.Darker 
end

function GetGui()
	local newGui = Instance.new("ScreenGui")
	newGui.ScreenInsets = Enum.ScreenInsets.None
	newGui.ResetOnSpawn = false
	newGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	newGui.DisplayOrder = 2147483647

	local parent = RunService:IsStudio() 
		and LocalPlayer:FindFirstChild("PlayerGui")
		or (gethui and gethui())
		or (cloneref and cloneref(Lib.GetService("CoreGui")) or Lib.GetService("CoreGui"))

	newGui.Parent = parent
	return newGui
end

function CreateElement(type, properties)
	local element = Instance.new(type)
	for prop, value in pairs(properties) do
		element[prop] = value
	end
	return element
end

function addShadow(parent)
    local DropShadow = CreateElement("Frame", {
		Name = "DropShadow",
		Size = UDim2.new(1, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(15, 15, 15),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = parent.ZIndex - 1,
		Visible = true,
		ClipsDescendants = false,
		Parent = parent
	})
	
	local UiDropShadow = CreateElement("UICorner", {
		CornerRadius = UDim.new(0, 20),
		Parent = DropShadow
	})
	
	local ImgDropShadow = CreateElement("ImageLabel", {
		Name = "ImgDropShadow",
		Parent = DropShadow,
		Active = false,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1.000,
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 47, 1, 47),
		Image = assets.shadow,
		ImageColor3 = Color3.fromRGB(0, 0, 0),
		ImageTransparency = 0.500,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(49, 49, 450, 450),
	})
end

function addAppleBalls(Size, Parent)
    local HolderBalls_F = CreateElement("Frame", {
    	Name = "HolderBalls_F",
    	Size = UDim2.new(0, 0, 0, 0), -- Tamanho automático (0, 0)
    	AutomaticSize = Enum.AutomaticSize.XY, -- Expande automaticamente em X e Y
    	AnchorPoint = Vector2.new(0, 0.5),
    	Position = UDim2.new(0, 10, 0.5, 0),
    	BackgroundTransparency = 1,
    	BorderSizePixel = 0,
    	Visible = true,
    	ClipsDescendants = true,
    	Parent = Parent
    })
	
	local UIListLayout = CreateElement("UIListLayout", {
    	Name = "UIListLayout",
    	FillDirection = Enum.FillDirection.Horizontal,
    	HorizontalAlignment = Enum.HorizontalAlignment.Left,
    	VerticalAlignment = Enum.VerticalAlignment.Center,
    	SortOrder = Enum.SortOrder.LayoutOrder,
    	Padding = UDim.new(0, 5),
    	Parent = HolderBalls_F
    })
    
    local Ball_Red = CreateElement("Frame", {
		Name = "Ball_Red",
		Size = UDim2.fromOffset(unpack(Size)),
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 79, 79),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = HolderBalls_F
	})
	
	CreateElement("UICorner", {
		CornerRadius = UDim.new(1, 0),
		Parent = Ball_Red
	})
	
	local Ball_Yellow = CreateElement("Frame", {
		Name = "Ball_Yellow",
		Size = UDim2.fromOffset(unpack(Size)),
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(227, 232, 95),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = HolderBalls_F
	})
	
	CreateElement("UICorner", {
		CornerRadius = UDim.new(1, 0),
		Parent = Ball_Yellow
	})
	
	local Ball_Green = CreateElement("Frame", {
		Name = "Ball_Green",
		Size = UDim2.fromOffset(unpack(Size)),
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(96, 181, 65),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = HolderBalls_F
	})
	
	CreateElement("UICorner", {
		CornerRadius = UDim.new(1, 0),
		Parent = Ball_Green
	})
end

local NotificationHolder = nil
local ActiveNotifications = {}
local NotificationZIndex = 100

-- Função para criar o holder uma única vez
function GetNotificationHolder()
    if NotificationHolder then
        return NotificationHolder
    end
    
    local ScreenGui = GetGui()
    
    NotificationHolder = CreateElement("Frame", {
        Name = "NotificationHolder",
        Size = UDim2.new(0, 300, 1, 0),
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -20, 0, 20),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Visible = true,
        Active = false,
        ClipsDescendants = true,
        ZIndex = NotificationZIndex,
        Parent = ScreenGui
    })
    
    local UIListLayout_01 = CreateElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 12),
        Parent = NotificationHolder
    })
    
    CreateElement("UIPadding", {
        PaddingLeft = UDim.new(0, 0),
        PaddingRight = UDim.new(0, 0),
        PaddingTop = UDim.new(0, 0),
        PaddingBottom = UDim.new(0, 0),
        Parent = NotificationHolder
    })
    
    return NotificationHolder
end

-- Função para calcular a duração
function GetDuration(durationType)
    local durations = {
        Short = 3,
        Normal = 5,
        Long = 8,
        Persistent = 0
    }
    return durations[durationType] or durations.Normal
end

-- Função para verificar se já existe notificação com mesmo título
function HasNotificationWithTitle(title)
    for _, notification in pairs(ActiveNotifications) do
        if notification.Title == title then
            return true
        end
    end
    return false
end

-- Função para remover notificação
function RemoveNotification(containerFrame, notificationFrame, title)
    ActiveNotifications[containerFrame] = nil
    
    -- Animação de saída (Slide Out)
    TweenService:Create(notificationFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(3, 0, 0, 0)
    }):Play()
    
    wait(0.5)
    if containerFrame and containerFrame.Parent then
        containerFrame:Destroy()
    end
end

-- Função principal de notificação
function Lib:Notification(Options)
    Options.Name = Options.Name or "Title"
    Options.Content = Options.Content or "Notification content... what will it say??"
    Options.Icon = Options.Icon or ""
    Options.Duration = Options.Duration or "Normal"
    Options.Position = Options.Position or "Top Right"
    Options.Behavior = Options.Behavior or "Stack"
    
    local Themes = self:GetThemeConfig(Options.Theme)
    local Holder_Notify = GetNotificationHolder()
    
    -- Verificar comportamento Single
    if Options.Behavior == "Single" and HasNotificationWithTitle(Options.Name) then
        return nil
    end
    
    -- Container invisível (frame pai)
    local Container = CreateElement("Frame", {
        Name = "NotificationContainer_" .. Options.Name,
        Size = UDim2.new(0, 280, 0, 0),
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(0, 0, 0, 0), -- Posição final
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Visible = true,
        Active = false,
        ClipsDescendants = true,
        ZIndex = NotificationZIndex + 1,
        Parent = Holder_Notify
    })
    
    -- Frame principal da notificação (que será animado)
    local Main_Notify = CreateElement("Frame", {
        Name = "Notification_" .. Options.Name,
        Size = UDim2.new(1, 0, 1, 0),
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.new(3, 300, 0, 0), -- Começa fora da tela (lado esquerdo)
        BackgroundColor3 = Themes.Colors.Background,
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Visible = true,
        Active = true,
        ClipsDescendants = true,
        ZIndex = NotificationZIndex + 2,
        Parent = Container
    })
    
    CreateElement("Frame", {
        Size = UDim2.new(0, 10, 1, 0),
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, 0, 0, 0), -- Começa fora da tela (lado esquerdo)
        BackgroundColor3 = Themes.Colors.Background,
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Visible = true,
        Active = false,
        ClipsDescendants = true,
        Parent = Main_Notify
    })
    
    CreateElement("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = Main_Notify
    })
    
    addShadow(Main_Notify)
    
    -- Top bar da notificação
    local Top = CreateElement("Frame", {
        Size = UDim2.new(1, 0, 0, 25),
        BackgroundColor3 = Color3.fromRGB(10, 10, 10),
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Visible = true,
        ClipsDescendants = true,
        ZIndex = NotificationZIndex + 3,
        Parent = Main_Notify
    })
    
    CreateElement("UICorner", {
        CornerRadius = UDim.new(0, 9),
        Parent = Top
    })
    
    CreateElement("Frame", {
        Size = UDim2.new(1, 0, 0, 10),
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(10, 10, 10),
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Visible = true,
        ClipsDescendants = true,
        Parent = Top
    })
    
    CreateElement("Frame", {
        Size = UDim2.new(0, 10, 1, 0),
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(10, 10, 10),
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Visible = true,
        ClipsDescendants = true,
        Parent = Top
    })
    
    -- Linha divisória
    CreateElement("Frame", {
        Size = UDim2.new(1, 0, 0, 1),
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = Themes.Colors.Stroke,
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Visible = true,
        ZIndex = NotificationZIndex + 3,
        Parent = Top
    })
    
    local Title_F = CreateElement("Frame", {
        Name = "Title_F",
        Size = UDim2.new(1, 0, 1, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 0, 0.5, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Visible = true,
        ZIndex = NotificationZIndex + 4,
        Parent = Top
    })
    
    local Title = CreateElement("TextLabel", {
        Name = "Title_Label",
        Size = UDim2.new(1, -40, 1, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Visible = true,
        ClipsDescendants = true,
        Text = Options.Name,
        TextColor3 = Themes.Colors.Title,
        TextTransparency = 0,
        TextScaled = false,
        TextSize = 12,
        Font = Enum.Font.GothamSemibold,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        ZIndex = NotificationZIndex + 4,
        Parent = Title_F
    })
    
    -- Ícone ou Apple Balls
    if Options.Icon ~= "" then
        local iconIddd = IconsSystem:GetIcon(Options.Icon)
        local Icon = CreateElement("ImageLabel", {
            Name = "Icon",
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            ImageColor3 = Themes.Colors.Image,
            Image = "rbxassetid://" .. tostring(iconIddd),
            ImageTransparency = 0,
            Size = UDim2.fromOffset(16, 16),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 8, 0.5, 0),
            ZIndex = NotificationZIndex + 4,
            Parent = Title_F,
        })
        
        Title.Position = UDim2.new(0, 30, 0.5, 0)
        Title.Size = UDim2.new(1, -38, 0, 13)
    else
        addAppleBalls({8, 8}, Title_F)
        Title.Position = UDim2.new(0, 54, 0.5, 0)
    end
    
    -- Botão de fechar
    local CloseButton = CreateElement("ImageButton", {
        Name = "CloseButton",
        Size = UDim2.fromOffset(17, 17),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -8, 0.5, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "rbxassetid://4536216511",
        ImageColor3 = Themes.Colors.Image,
        ImageTransparency = 0.4,
        ScaleType = Enum.ScaleType.Fit,
        ZIndex = NotificationZIndex + 4,
        Parent = Title_F
    })
    
    -- Conteúdo da notificação
    local Content = CreateElement("Frame", {
        Size = UDim2.new(1, -20, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 37),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Visible = true,
        ClipsDescendants = true,
        AutomaticSize = Enum.AutomaticSize.Y,
        ZIndex = NotificationZIndex + 3,
        Parent = Main_Notify
    })
    
    local ContentText = CreateElement("TextLabel", {
        Name = "ContentText",
        Size = UDim2.new(1, 0, 0, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Visible = true,
        AutomaticSize = Enum.AutomaticSize.Y,
        Text = Options.Content,
        TextColor3 = Themes.Colors.Text,
        TextTransparency = 0.2,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        ZIndex = NotificationZIndex + 3,
        Parent = Content
    })
    
    -- Calcular altura total
    local textSize = game:GetService("TextService"):GetTextSize(Options.Content, 11, Enum.Font.Gotham, Vector2.new(260, 1000))
    local contentHeight = math.max(20, textSize.Y)
    local totalHeight = 37 + contentHeight + 10
    
    -- Ajustar tamanhos
    Container.Size = UDim2.new(0, 280, 0, totalHeight)
    Content.Size = UDim2.new(1, -20, 0, contentHeight)
    ContentText.Size = UDim2.new(1, 0, 0, contentHeight)
    
    -- Armazenar dados da notificação
    ActiveNotifications[Container] = {
        Title = Options.Name,
        Duration = GetDuration(Options.Duration),
        StartTime = tick()
    }
    
    -- Função de fechar
    function CloseNotification()
        RemoveNotification(Container, Main_Notify, Options.Name)
    end
    
    -- Eventos
    CloseButton.MouseButton1Click:Connect(CloseNotification)
    
    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.15), {
            ImageTransparency = 0
        }):Play()
    end)
    
    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.15), {
            ImageTransparency = 0.4
        }):Play()
    end)
    
    -- Animação de entrada (Slide In do lado esquerdo)
    TweenService:Create(Main_Notify, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0, 0)
    }):Play()
    
    -- Sistema de duração automática
    if Options.Duration ~= "Persistent" then
        local duration = GetDuration(Options.Duration)
        
        delay(duration, function()
            if Container and Container.Parent then
                CloseNotification()
            end
        end)
    end
    
    return {
        Close = CloseNotification,
        ExtendTime = function(extraTime)
            if ActiveNotifications[Container] then
                ActiveNotifications[Container].Duration = ActiveNotifications[Container].Duration + extraTime
            end
        end
    }
end

-- Funções auxiliares para tipos específicos
function Lib:SuccessNotification(title, content, duration)
    return self:Notification({
        Name = title,
        Content = content,
        Icon = "Check", -- Ícone de check
        Duration = duration or "Normal",
        Behavior = "Stack"
    })
end

function Lib:ErrorNotification(title, content, duration)
    return self:Notification({
        Name = title,
        Content = content,
        Icon = "Error", -- Ícone de erro
        Duration = duration or "Long",
        Behavior = "Stack"
    })
end

function Lib:WarningNotification(title, content, duration)
    return self:Notification({
        Name = title,
        Content = content,
        Icon = "Warning", -- Ícone de aviso
        Duration = duration or "Normal",
        Behavior = "Stack"
    })
end
 
function Lib:InfoNotification(title, content, duration)
    return self:Notification({
        Name = title,
        Content = content,
        Icon = "Info", -- Ícone de informação
        Duration = duration or "Short",
        Behavior = "Stack"
    })
end

-- SISTEMA DE CONFIGURAÇÕES ATUALIZADO E CORRIGIDO
local ConfigSystem = {
    Folder = "HarpyLib",
    Options = Lib.Options
}

-- Função para construir a árvore de pastas
function BuildFolderTree()
    if isStudio or not (isfolder and makefolder) then return end

    local paths = {
        ConfigSystem.Folder,
        ConfigSystem.Folder .. "/settings"
    }

    for i = 1, #paths do
        local str = paths[i]
        if not isfolder(str) then
            makefolder(str)
        end
    end
end

-- Parser para diferentes tipos de elementos (COMPLETAMENTE CORRIGIDO)
local ClassParser = {
    ["Toggle"] = {
        Save = function(flag, data)
            return {
                type = "Toggle", 
                flag = flag, 
                state = data:GetState() or false
            }
        end,
        Load = function(flag, data)
            if ConfigSystem.Options[flag] and data.state ~= nil then
                if ConfigSystem.Options[flag].SetState then
                    ConfigSystem.Options[flag]:SetState(data.state, true)
                end
                if ConfigSystem.Options[flag].Options and ConfigSystem.Options[flag].Options.Callback then
                    task.spawn(function()
                        wait(0.05)
                        ConfigSystem.Options[flag].Options.Callback(data.state)
                    end)
                end
            end
        end
    },
    ["Checkbox"] = {
        Save = function(flag, data)
            return {
                type = "Checkbox", 
                flag = flag, 
                state = data:GetState() or false
            }
        end,
        Load = function(flag, data)
            if ConfigSystem.Options[flag] and data.state ~= nil then
                if ConfigSystem.Options[flag].SetState then
                    ConfigSystem.Options[flag]:SetState(data.state, true)
                end
                if ConfigSystem.Options[flag].Options and ConfigSystem.Options[flag].Options.Callback then
                    task.spawn(function()
                        wait(0.05)
                        ConfigSystem.Options[flag].Options.Callback(data.state)
                    end)
                end
            end
        end
    },
    ["Slider"] = {
        Save = function(flag, data)
            return {
                type = "Slider", 
                flag = flag, 
                value = data:GetValue() or data.Options.Default
            }
        end,
        Load = function(flag, data)
            if ConfigSystem.Options[flag] and data.value then
                local numValue = tonumber(data.value)
                if ConfigSystem.Options[flag].SetValue then
                    ConfigSystem.Options[flag]:SetValue(numValue)
                end
                if ConfigSystem.Options[flag].Options and ConfigSystem.Options[flag].Options.Callback then
                    task.spawn(function()
                        wait(0.05)
                        ConfigSystem.Options[flag].Options.Callback(numValue)
                    end)
                end
            end
        end
    },
    ["KeyBind"] = {
        Save = function(flag, data)
            local value, keyCode = data:GetKey()
            return {
                type = "KeyBind", 
                flag = flag, 
                bind = (typeof(keyCode) == "EnumItem" and keyCode.Name) or value
            }
        end,
        Load = function(flag, data)
            if ConfigSystem.Options[flag] and data.bind then
                if ConfigSystem.Options[flag].SetKey then
                    ConfigSystem.Options[flag]:SetKey(data.bind)
                end
                if ConfigSystem.Options[flag].Options and ConfigSystem.Options[flag].Options.Callback then
                    task.spawn(function()
                        wait(0.05)
                        local _, currentKey = ConfigSystem.Options[flag]:GetKey()
                        ConfigSystem.Options[flag].Options.Callback(data.bind, currentKey)
                    end)
                end
            end
        end
    },
    ["Dropdown"] = {
        Save = function(flag, data)
            local value = data:GetValue()
            -- Para MultiSelection, garantir que é uma string
            if data.Options.MultiSelection then
                if type(value) == "table" then
                    value = table.concat(value, ", ")
                end
            end
            return {
                type = "Dropdown", 
                flag = flag, 
                value = value or ""
            }
        end,
        Load = function(flag, data)
            if ConfigSystem.Options[flag] and data.value then
                if ConfigSystem.Options[flag].SetValue then
                    ConfigSystem.Options[flag]:SetValue(data.value)
                end
                if ConfigSystem.Options[flag].Options and ConfigSystem.Options[flag].Options.Callback then
                    task.spawn(function()
                        wait(0.05)
                        ConfigSystem.Options[flag].Options.Callback(data.value)
                    end)
                end
            end
        end
    },
    ["Colorpicker"] = {
        Save = function(flag, data)
            local colorValue
            if data.GetValue then
                colorValue = data:GetValue()
            elseif data.GetColor then
                local color = data:GetColor()
                colorValue = string.format("Color3.fromRGB(%d, %d, %d)", 
                    math.floor(color.R * 255), 
                    math.floor(color.G * 255), 
                    math.floor(color.B * 255))
            else
                colorValue = "Color3.fromRGB(255, 255, 255)"
            end
            
            return {
                type = "Colorpicker", 
                flag = flag, 
                color = colorValue
            }
        end,
        Load = function(flag, data)
            if ConfigSystem.Options[flag] and data.color then
                -- Converter string "Color3.fromRGB(r,g,b)" para Color3
                local r, g, b = data.color:match("Color3%.fromRGB%((%d+),%s*(%d+),%s*(%d+)%)")
                if r and g and b then
                    local color = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
                    if ConfigSystem.Options[flag].SetValue then
                        ConfigSystem.Options[flag]:SetValue(color)
                    elseif ConfigSystem.Options[flag].SetColor then
                        ConfigSystem.Options[flag]:SetColor(color)
                    end
                    
                    if ConfigSystem.Options[flag].Options and ConfigSystem.Options[flag].Options.Callback then
                        task.spawn(function()
                            wait(0.05)
                            ConfigSystem.Options[flag].Options.Callback(color)
                        end)
                    end
                end
            end
        end
    },
    ["RadioButton"] = {
        Save = function(flag, data)
            local value = ""
            if data.GetValue then
                value = data:GetValue() or ""
            end
            return {
                type = "RadioButton", 
                flag = flag, 
                value = value
            }
        end,
        Load = function(flag, data)
            if ConfigSystem.Options[flag] and data.value and data.value ~= "" then
                if ConfigSystem.Options[flag].SetValue then
                    ConfigSystem.Options[flag]:SetValue(data.value)
                elseif ConfigSystem.Options[flag].SetRadio then
                    ConfigSystem.Options[flag]:SetRadio(data.value)
                end
                
                if ConfigSystem.Options[flag].Options and ConfigSystem.Options[flag].Options.Callback then
                    task.spawn(function()
                        wait(0.05)
                        ConfigSystem.Options[flag].Options.Callback(data.value)
                    end)
                end
            end
        end
    },
    ["Input"] = {
        Save = function(flag, data)
            return {
                type = "Input", 
                flag = flag, 
                value = data:GetValue() or data.Options.Default or ""
            }
        end,
        Load = function(flag, data)
            if ConfigSystem.Options[flag] and data.value then
                if ConfigSystem.Options[flag].SetValue then
                    ConfigSystem.Options[flag]:SetValue(data.value)
                end
                if ConfigSystem.Options[flag].Options and ConfigSystem.Options[flag].Options.Callback then
                    task.spawn(function()
                        wait(0.05)
                        ConfigSystem.Options[flag].Options.Callback(data.value)
                    end)
                end
            end
        end
    }
}

-- Função para determinar o tipo do elemento (MELHORADA)
function GetElementType(option)
    if option.SetState and option.GetState then
        if option.Activate and option.Deactivate then
            return "Toggle"
        else
            return "Checkbox"
        end
    elseif option.SetValue and option.GetValue then
        if option.DisplayMethod then
            return "Slider"
        elseif option.SetRadio then
            return "RadioButton"
        elseif option.SetColor then
            return "Colorpicker"
        elseif option.SetKey then
            return "KeyBind"
        else
            if option.Options and (option.Options.Placeholder or option.Options.ClearText ~= nil) then
                return "Input"
            else
                return "Dropdown"
            end
        end
    elseif option.SetRadio and option.GetValue then
        return "RadioButton"
    elseif option.SetColor and option.GetColor then
        return "Colorpicker"
    end
    return nil
end

-- Função para salvar configuração (CORRIGIDA)
function ConfigSystem:SaveConfig(configName)
    if isStudio or not writefile then 
        Lib:ErrorNotification("Config System", "Config system unavailable")
        return false
    end

    if not configName or configName == "" then
        Lib:WarningNotification("Config System", "Please enter a config name")
        return false
    end

    BuildFolderTree()

    local fullPath = self.Folder .. "/settings/" .. configName .. ".json"

    local data = {
        objects = {},
        timestamp = os.time(),
        version = "1.3"
    }

    for flag, option in pairs(self.Options) do
        local optionType = GetElementType(option)
        
        if optionType and ClassParser[optionType] then
            local success, result = pcall(function()
                return ClassParser[optionType].Save(flag, option)
            end)
            
            if success and result then
                table.insert(data.objects, result)
            end
        end
    end

    local success, encoded = pcall(HttpService.JSONEncode, HttpService, data)
    if not success then
        Lib:ErrorNotification("Config System", "Error saving config")
        return false
    end

    writefile(fullPath, encoded)
    Lib:SuccessNotification("Config System", "Config '" .. configName .. "' saved!")
    return true
end

-- Função para carregar configuração (CORRIGIDA)
function ConfigSystem:LoadConfig(configName)
    if isStudio or not (isfile and readfile) then 
        Lib:ErrorNotification("Config System", "Config system unavailable")
        return false
    end

    if not configName or configName == "" then
        Lib:WarningNotification("Config System", "Please select a config")
        return false
    end

    local file = self.Folder .. "/settings/" .. configName .. ".json"
    if not isfile(file) then 
        Lib:ErrorNotification("Config System", "Config not found")
        return false
    end

    local success, decoded = pcall(HttpService.JSONDecode, HttpService, readfile(file))
    if not success then 
        Lib:ErrorNotification("Config System", "Error loading config")
        return false
    end

    local loadedCount = 0
    for _, optionData in pairs(decoded.objects or {}) do
        if ClassParser[optionData.type] then
            local success = pcall(function()
                ClassParser[optionData.type].Load(optionData.flag, optionData)
                loadedCount = loadedCount + 1
            end)
        end
    end

    Lib:SuccessNotification("Config System", "Config '" .. configName .. "' loaded!")
    return true
end

-- Função para obter lista de configurações
function ConfigSystem:GetConfigList()
    if isStudio or not (isfolder and listfiles) then return {} end

    local folderPath = self.Folder .. "/settings"
    if not isfolder(folderPath) then return {} end

    local fileList = listfiles(folderPath)
    local configList = {}

    for _, filePath in ipairs(fileList) do
        if filePath:sub(-5) == ".json" then
            local fileName = filePath:match("([^/\\]+)%.json$")
            if fileName then
                table.insert(configList, fileName)
            end
        end
    end

    return configList
end

-- Função para deletar configuração
function ConfigSystem:DeleteConfig(configName)
    if isStudio or not (delfile) then 
        Lib:ErrorNotification("Config System", "Config system unavailable")
        return false
    end

    if not configName or configName == "" then
        Lib:WarningNotification("Config System", "Please select a config")
        return false
    end

    local file = self.Folder .. "/settings/" .. configName .. ".json"
    if not isfile(file) then 
        Lib:ErrorNotification("Config System", "Config not found")
        return false
    end

    delfile(file)
    Lib:SuccessNotification("Config System", "Config '" .. configName .. "' deleted!")
    return true
end

-- Adicionar sistema de configurações à Library
Lib.ConfigSystem = ConfigSystem

function Lib:Window(Options)
    Options.Title = Options.Title or "HARPY LIBRARY"
    Options.Theme = Options.Theme or "Darker"
    Options.KeyBind = Options.KeyBind or "K"
    Options.Size = Options.Size or {630, 430}
    Options.Acrylic = Options.Acrylic or false
    Options.Button = Options.Button or false

	local StorageTabs = {
	    CurrentTab = nil,
        FirstTab = true
	}
    
    local ScreenGui = GetGui()
    local Themes = self:GetThemeConfig(Options.Theme)
    
    local Main = CreateElement("Frame", {
		Name = Options.Title,
		Size = UDim2.fromOffset(unpack(Options.Size)),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = Themes.Colors.Background,
		BackgroundTransparency = Options.Acrylic and 0.080 or 0,
		BorderSizePixel = 0,
		Visible = true,
		Active = true,
		Draggable = false,
		ClipsDescendants = false,
		Parent = ScreenGui
	})

	CreateElement("UICorner", {
		CornerRadius = UDim.new(0, 10),
		Parent = Main
	})
	
	addShadow(Main)
    
    local Left_F = CreateElement("Frame", {
		Name = "Left_F",
		Size = UDim2.new(0, 170, 1, 0),
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(10, 10, 10),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = Main
	})
	
	CreateElement("UICorner", {
		CornerRadius = UDim.new(0, 9),
		Parent = Left_F
	})
	
	CreateElement("Frame", {
		Name = "Hide_01",
		Size = UDim2.new(0, 10, 1, 0),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(10, 10, 10),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = Left_F
	})
	
	local Line_01 = CreateElement("Frame", {
		Name = "Line_01",
		Size = UDim2.new(0, 1, 1, 0),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Themes.Colors.Stroke,
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = Left_F
	})
	
	local Title_F = CreateElement("Frame", {
		Name = "Title_F",
		Size = UDim2.new(1, 0, 0, 40),
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = Themes.Colors.Background,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = true,
		Active = true,
		ClipsDescendants = true,
		Parent = Left_F
	})
	
	addAppleBalls({8, 8}, Title_F)
	
	local Title_Label = CreateElement("TextLabel", {
	    Name = "Title_Label",
    	Size = UDim2.new(1, - 50, 0, 13),
    	AnchorPoint = Vector2.new(1, 0.5),
    	Position = UDim2.new(1, -10, 0.5, 0),
    	BackgroundTransparency = 1,
    	BorderSizePixel = 0,
    	Visible = true,
    	ClipsDescendants = true,
    
    	Text = Options.Title,
    	TextColor3 = Themes.Colors.Title,
    	TextTransparency = 0,
    	TextScaled = true,
    	TextSize = 10,
    	Font = Enum.Font.Gotham,
    	TextWrapped = true,
    	TextXAlignment = Enum.TextXAlignment.Right,
    	TextYAlignment = Enum.TextYAlignment.Center,
    	
    	Parent = Title_F
    })
	
	local Line_02 = CreateElement("Frame", {
		Name = "Line_02",
		Size = UDim2.new(1, 0, 0, 1),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Themes.Colors.Stroke,
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = Title_F
	})
	
	local Search_Holder = CreateElement("Frame", {
		Name = "Search_Holder",
		Size = UDim2.new(1, 0, 0, 45),
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, 41),
		BackgroundColor3 = Themes.Colors.Background,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = Left_F
	})
	
	local Search_F = CreateElement("Frame", {
		Name = "Search_F",
		Size = UDim2.new(1, -20, 0, 28),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = Themes.Colors.Background,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = Search_Holder
	})
	
	CreateElement("UIPadding", {
    	PaddingLeft = UDim.new(0, 0),
    	PaddingRight = UDim.new(0, 8),
    	PaddingTop = UDim.new(0, 0),
    	PaddingBottom = UDim.new(0, 0),
    	Parent = Search_F
    })
	
	CreateElement("UICorner", {
		CornerRadius = UDim.new(0, 8),
		Parent = Search_F
	})
	
	CreateElement("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Thickness = 1,
        Color = Themes.Colors.Stroke,
        Parent = Search_F,
    })
    
    local iconIdd = IconsSystem:GetIcon("Search")
    
    local Icon = CreateElement("ImageLabel", {
        Name = "Icon",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        ImageColor3 = Themes.Colors.Image,
        Image = "rbxassetid://" .. tostring(iconIdd),
        ImageTransparency = 0, -- Começa transparente
        Size = UDim2.fromOffset(17, 17),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 8, 0.5, 0),
        Parent = Search_F,
    })
    
    local EditText = CreateElement("TextBox", {
        Name = "EditText",
        Size = UDim2.new(1, - 50, 1, 0),
        Position = UDim2.new(0, 33, 0, 0),
        BackgroundColor3 = Themes.Colors.Secondary,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        
        Text = "",
        TextColor3 = Themes.Colors.Text,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        
        PlaceholderText = "Search...",
        PlaceholderColor3 = Themes.Colors.Text,
        
        ClearTextOnFocus = false,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        
        Parent = Search_F
    })
	
	local Line_03 = CreateElement("Frame", {
		Name = "Line_03",
		Size = UDim2.new(1, 0, 0, 1),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Themes.Colors.Stroke,
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = Search_Holder
	})
	
	local HolderTab_F = CreateElement("Frame", {
		Name = "HolderTab_F",
		Size = UDim2.new(1, 0, 1, - 130),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, - 46),
		BackgroundColor3 = Themes.Colors.Background,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = Left_F
	})
	
	local ScrollingFrame = CreateElement("ScrollingFrame", {
    	Name = "ScrollingFrame",
    	Size = UDim2.new(1, 0, 1, 0),
    	AnchorPoint = Vector2.new(0.5, 0.5),
    	Position = UDim2.new(0.5, 0, 0.5, 0),
    	BackgroundColor3 = Themes.Colors.Background,
    	BackgroundTransparency = 1,
    	BorderSizePixel = 0,
    	Visible = true,
    	ClipsDescendants = true,
    	
    	-- Propriedades da ScrollBar
    	CanvasSize = UDim2.new(0, 0, 0, 0),
    	ScrollBarThickness = 0,
    	ScrollBarImageColor3 = Themes.Colors.Stroke,
    	ScrollBarImageTransparency = 0,
    	ScrollingDirection = Enum.ScrollingDirection.Y,
    	VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right,
    	
    	Parent = HolderTab_F
    })
    
    local UIListLayout = CreateElement("UIListLayout", {
    	FillDirection = Enum.FillDirection.Vertical,
    	HorizontalAlignment = Enum.HorizontalAlignment.Center,
    	VerticalAlignment = Enum.VerticalAlignment.Top,
    	SortOrder = Enum.SortOrder.LayoutOrder,
    	Padding = UDim.new(0, 10), -- 5 pixels de distância
    	
    	Parent = ScrollingFrame
    })
    
    CreateElement("UIPadding", {
    	PaddingLeft = UDim.new(0, 10),
    	PaddingRight = UDim.new(0, 10),
    	PaddingTop = UDim.new(0, 10),
    	PaddingBottom = UDim.new(0, 10),
    	Parent = ScrollingFrame
    })
    
    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
    end)
	
	local Player_F = CreateElement("Frame", {
		Name = "Player_F",
		Size = UDim2.new(1, 0, 0, 45),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Themes.Colors.Background,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = Left_F
	})
	
	local Line_04 = CreateElement("Frame", {
		Name = "Line_04",
		Size = UDim2.new(1, 0, 0, 1),
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = Themes.Colors.Stroke,
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = Player_F
	})
	
	local userId = LocalPlayer.UserId
    local thumbType = Enum.ThumbnailType.AvatarBust
    local thumbSize = Enum.ThumbnailSize.Size48x48
    local headshotImage = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
    
    local Headshot = CreateElement("ImageLabel", {
        Name = "Headshot",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Image = headshotImage,
        Size = UDim2.fromOffset(32, 32),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 10, 0.5, 0),
        Parent = Player_F,
    })
    
    CreateElement("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = Headshot
    })
    
    CreateElement("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Thickness = 1,
        Color = Themes.Colors.Stroke,
        Parent = Headshot,
    })
    
    local NameAndDisplay = CreateElement("Frame", {
        Name = "NameAndDisplay",
        Parent = Player_F,
        ClipsDescendants = true,
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        Size = UDim2.new(1, -52, 0, 0),
    })
    
    local UiList = CreateElement("UIListLayout", {
        Parent = NameAndDisplay,
        Padding = UDim.new(0, 2),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    
    local displayName = CreateElement("TextLabel", {
        Name = "DisplayName",
        FontFace = Font.new(
            assets.interFont,
            Enum.FontWeight.SemiBold,
            Enum.FontStyle.Normal
        ),
        TextColor3 = Color3.fromRGB(230, 230, 230),
        TextSize = 13,
        TextTransparency = 0.1,
        TextTruncate = Enum.TextTruncate.SplitWord,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Parent = NameAndDisplay,
        Size = UDim2.fromScale(1, 0),
        Text = LocalPlayer.DisplayName
    })
    
    local username = CreateElement("TextLabel", {
        Name = "Username",
        FontFace = Font.new(
            assets.interFont,
            Enum.FontWeight.SemiBold,
            Enum.FontStyle.Normal
        ),
        TextColor3 = Color3.fromRGB(190, 190, 190),
        TextSize = 12,
        TextTransparency = 0.7,
        TextTruncate = Enum.TextTruncate.SplitWord,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        LayoutOrder = 1,
        Parent = NameAndDisplay,
        Size = UDim2.fromScale(1, 0),
        Text = "@" .. LocalPlayer.Name
    })
    
    local Rigth_F = CreateElement("Frame", {
		Name = "Rigth_F",
		Size = UDim2.new(1, -170, 1, 0),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Themes.Colors.Background,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = Main
	})
	
	CreateElement("UIPadding", {
    	PaddingLeft = UDim.new(0, 8),
    	PaddingRight = UDim.new(0, 8),
    	PaddingTop = UDim.new(0, 8),
    	PaddingBottom = UDim.new(0, 8),
    	Parent = Rigth_F
    })
    
    -- Sistema de arrastar suave
    local dragging = false
    local dragInput, dragStart, startPos
    
    function updateDrag(input)
        if not dragging then return end
        
        local delta = input.Position - dragStart
        local newPos = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X,
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
        
        TweenService:Create(Main, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = newPos
        }):Play()
    end
    
    Title_F.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    Title_F.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateDrag(input)
        end
    end)

    local keyBindEnabled = true
    local currentKeyBind = Enum.KeyCode[Options.KeyBind]
    local mainFrameVisible = true

    function toggleWindowVisibility()
        mainFrameVisible = not mainFrameVisible

        local dropShadow = Main:FindFirstChild("DropShadow")
        local imgDropShadow = dropShadow and dropShadow:FindFirstChild("ImgDropShadow")
        
        if mainFrameVisible then
            Main.Visible = true
            if dropShadow then
                dropShadow.Visible = true
            end
        else
            if dropShadow then
                dropShadow.Visible = false
            end
            Main.Visible = false
        end
    end
    
    -- Configurar o KeyBind
    function setupKeyBind()
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            
            if input.KeyCode == currentKeyBind then
                toggleWindowVisibility()
            end
        end)
    end
    
    -- Inicializar o KeyBind
    setupKeyBind()

    function setupMobileButton()
        if Options.Button then
            local Main_Button = CreateElement("Frame", {
        		Name = Options.Title,
        		Size = UDim2.fromOffset(60,60),
        		AnchorPoint = Vector2.new(0.5, 0),
        		Position = UDim2.new(0.5, 0, 0, 8),
        		BackgroundColor3 = Themes.Colors.Primary,
        		BackgroundTransparency = 0,
        		BorderSizePixel = 0,
        		Visible = Options.Button,
        		Active = true,
        		Draggable = true,
        		ZIndex = 9999999,
        		ClipsDescendants = false,
        		Parent = ScreenGui
        	})
        
        	CreateElement("UICorner", {
        		CornerRadius = UDim.new(0, 10),
        		Parent = Main_Button
        	})
        	
        	CreateElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Thickness = 1,
                Color = Themes.Colors.Stroke,
                Parent = Main_Button,
            })
        	
        	addShadow(Main_Button)
        	
            local Icon = CreateElement("ImageLabel", {
                Name = "Icon",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                ImageColor3 = Themes.Colors.Image,
                Image = "rbxassetid://" .. tostring(IconsSystem:GetIcon("Logo")),
                ImageTransparency = 0, 
                Size = UDim2.fromOffset(50, 50),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Parent = Main_Button,
            })
            
            local OnClick = CreateElement("TextButton", {
                Name = "OnClick",
                Parent = Main_Button,
                BackgroundTransparency = 1.000,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 1, 0),
                AutoButtonColor = false,
                Text = "",
                TextSize = 0.000,
            })
            
            OnClick.MouseButton1Click:Connect(function()
                toggleWindowVisibility()
            end)

        end
    end
    
    -- Inicializar botão mobile
    setupMobileButton()
	
	function StorageTabs:ShowWindow()
        if not mainFrameVisible then
            toggleWindowVisibility()
        end
    end
    
    function StorageTabs:HideWindow()
        if mainFrameVisible then
            toggleWindowVisibility()
        end
    end
    
    function StorageTabs:SetTitle(newTitle)
        Options.Title = newTitle
        Title_Label.Text = newTitle
        Main.Name = newTitle
        Main_Button.Name = newTitle
    end
    
    function StorageTabs:GetAcrylic()
        return Options.Acrylic
    end
    
    function StorageTabs:SetAcrylic(acrylicEnabled)
        Options.Acrylic = acrylicEnabled
        Main.BackgroundTransparency = acrylicEnabled and 0.080 or 0
    end
    
    function StorageTabs:GetKeyBind()
        return Options.KeyBind
    end
    
    function StorageTabs:SetKeyBind(newKey)
        Options.KeyBind = newKey
        currentKeyBind = Enum.KeyCode[newKey]
        setupKeyBind()
    end
    
    function StorageTabs:SetMobileButton(visible)
        local mobileButton = ScreenGui:FindFirstChild("MobileToggleButton")
        if mobileButton then
            mobileButton.Visible = visible
        end
    end
    
    function StorageTabs:GetSize()
        return Options.Size
    end
    
    function StorageTabs:SetSize(newSize)
        Options.Size = newSize
        if mainFrameVisible then
            Main.Size = UDim2.fromOffset(unpack(newSize))
        end
    end
    
    function StorageTabs:Destroy()
        if Main then
            Main:Destroy()
        end
    end
    
    function StorageTabs:Unload()
        -- Fechar todas as notificações ativas
        for containerFrame, _ in pairs(ActiveNotifications) do
            if containerFrame and containerFrame.Parent then
                containerFrame:Destroy()
            end
        end
        ActiveNotifications = {}
        
        -- Limpar o NotificationHolder
        if NotificationHolder then
            NotificationHolder:Destroy()
            NotificationHolder = nil
        end
        
        -- Destruir a janela principal
        if Main and Main.Parent then
            Main:Destroy()
        end
        
        -- Destruir o botão móvel se existir
        local mobileButton = ScreenGui:FindFirstChild(Options.Title or "HARPY LIBRARY")
        if mobileButton then
            mobileButton:Destroy()
        end
        
        -- Limpar todas as opções da biblioteca
        for flag, _ in pairs(Lib.Options) do
            Lib.Options[flag] = nil
        end
        
        -- Limpar referências
        StorageTabs.CurrentTab = nil
        StorageTabs.FirstTab = nil
        
        -- Limpar ScreenGui se estiver vazio
        if ScreenGui and #ScreenGui:GetChildren() == 0 then
            ScreenGui:Destroy()
        end
        
        Lib:SuccessNotification("Harpy Lib", "Interface successfully unloaded!")
    end
	
	function StorageTabs:Tab(Options)
        Options.Name = Options.Name or "Home"
        Options.Icon = Options.Icon or "Home"
        
        local Tab = {
            Hover = false,
            Active = false
        }
        
        local Tab_F = CreateElement("Frame", {
            Name = Options.Name.. "_Tab_F",
            Size = UDim2.new(1, -4, 0, 26),
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.new(0, 0, 0, 0),
            BackgroundColor3 = Themes.Colors.Active,
            BackgroundTransparency = 1, -- Começa transparente
            BorderSizePixel = 0,
            Visible = true,
            ClipsDescendants = true,
            Parent = ScrollingFrame
        })
        
        CreateElement("UICorner", {
            CornerRadius = UDim.new(0, 8),
            Parent = Tab_F
        })
        
        local UiStroke_01 = CreateElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Thickness = 0, -- Começa com 0
            Color = Themes.Colors.Stroke,
            Parent = Tab_F,
        })
        
        local iconId = IconsSystem:GetIcon(Options.Icon)
        
        local Icon = CreateElement("ImageLabel", {
            Name = "Icon",
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            ImageColor3 = Themes.Colors.Image,
            Image = "rbxassetid://" .. tostring(iconId) or "7436811843",
            ImageTransparency = 0.6, -- Começa transparente
            Size = UDim2.fromOffset(17, 17),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 8, 0.5, 0),
            Parent = Tab_F,
        })
    
        local Title_Tab = CreateElement("TextLabel", {
            Name = "Title_Tab",
            Size = UDim2.new(1, -50, 0, 13),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 33, 0.5, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Visible = true,
            ClipsDescendants = true,
            
            Text = Options.Name,
            TextColor3 = Themes.Colors.Text,
            TextTransparency = 0.6, -- Começa transparente
            TextScaled = true,
            TextSize = 10,
            Font = Enum.Font.Gotham,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            
            Parent = Tab_F
        })
        
        local OnClick = CreateElement("TextButton", {
            Name = "OnClick",
            Parent = Tab_F,
            BackgroundTransparency = 1.000,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 1, 0),
            AutoButtonColor = false,
            Text = "",
            TextSize = 0.000,
        })
        
        local Conteiner = CreateElement("Frame", {
    		Name = "Conteiner",
    		Size = UDim2.new(1, 0, 1, 0),
    		AnchorPoint = Vector2.new(0, 0),
    		Position = UDim2.new(0, 0, 0, 0),
    		BackgroundColor3 = Themes.Colors.Background,
    		BackgroundTransparency = 1,
    		BorderSizePixel = 0,
    		Visible = false,
    		ClipsDescendants = true,
    		Parent = Rigth_F
    	})
    	
    	local ScrollPages = CreateElement("ScrollingFrame", {
            Name = "ScrollPages",
            Parent = Conteiner,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            BorderSizePixel = 0,
            ScrollBarThickness = 0,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.new(0, 0, 0, 0)
        })
        
        local UiPagScroll = CreateElement("UIPadding", {
            Parent = ScrollPages,
            PaddingLeft = UDim.new(0, 1),
            PaddingRight = UDim.new(0, 1),
            PaddingTop = UDim.new(0, 1),
            PaddingBottom = UDim.new(0, 1)
        })
        
        local UiList = CreateElement("UIListLayout", {
            Parent = ScrollPages,
            Padding = UDim.new(0, 10),
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal
        })
        
        UiList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            ScrollPages.CanvasSize = UDim2.new(0, 0, 0, UiList.AbsoluteContentSize.Y)
        end)
        
        local left = CreateElement("Frame", {
            Name = "Left",
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.new(0.5, -5, 1, 0),
            Parent = ScrollPages
        })
        
        local leftUIListLayout = CreateElement("UIListLayout", {
            Name = "LeftUIListLayout",
            Padding = UDim.new(0, 15),
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = left
        })
        
        local right = CreateElement("Frame", {
            Name = "Right",
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1, -- Corrigido: era 2, deve ser 1
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.new(0.5, -5, 1, 0),
            Parent = ScrollPages
        })
        
        local rightUIListLayout = CreateElement("UIListLayout", {
            Name = "RightUIListLayout",
            Padding = UDim.new(0, 15),
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = right
        })
        
        OnClick.MouseButton1Click:Connect(function(input)
            Tab:Activate()
        end)
        
        function Tab:Activate()
            if not Tab.Active then
                if StorageTabs.CurrentTab and StorageTabs.CurrentTab ~= Tab then
                StorageTabs.CurrentTab:Deactivate()
                end
                Tab.Active = true
                StorageTabs.CurrentTab = Tab
                
                Conteiner.Visible = true

                TweenService:Create(Tab_F, TweenInfo.new(0.15), {
                    BackgroundTransparency = 0.040,
                    Size = UDim2.new(1, 0, 0, 30),
                }):Play()
                TweenService:Create(Title_Tab, TweenInfo.new(0.15), {
                    TextTransparency = 0
                }):Play()
                TweenService:Create(Icon, TweenInfo.new(0.15), {
                    ImageTransparency = 0
                }):Play()
                TweenService:Create(UiStroke_01, TweenInfo.new(0.15), {
                    Thickness = 1
                }):Play()
            end
        end
    
        function Tab:Deactivate()
            if Tab.Active then
                Tab.Active = false
                Tab.Hover = false
                
                Conteiner.Visible = false
                
                TweenService:Create(Tab_F, TweenInfo.new(0.15), {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, - 4, 0, 26),
                }):Play()
                TweenService:Create(Title_Tab, TweenInfo.new(0.15), {
                    TextTransparency = 0.6
                }):Play()
                TweenService:Create(Icon, TweenInfo.new(0.15), {
                    ImageTransparency = 0.6
                }):Play()
                TweenService:Create(UiStroke_01, TweenInfo.new(0.15), {
                    Thickness = 0
                }):Play()
            end
        end
    
        if StorageTabs.CurrentTab == nil then
            StorageTabs.CurrentTab = Tab
            Tab:Activate()
        end

        function Tab:Section(Options)
            Options.Header = Options.Header or ""
            Options.Side = Options.Side or "Left"
            
            local Section = {
                ActiveS = false,
                HoverS = false
            }
            
            local Section_F = CreateElement("Frame", {
                Name = Options.Header.. "_Section_F",
                Size = UDim2.new(1, 0, 0, 0),
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.new(0, 0, 0, 0),
                BackgroundColor3 = Themes.Colors.Primary,
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                Visible = true,
                Active = true,
                ClipsDescendants = true,
                Parent = Options.Side == "Left" and left or right 
            })
            
            local UIListLayout_01 = CreateElement("UIListLayout", {
            	FillDirection = Enum.FillDirection.Vertical,
            	HorizontalAlignment = Enum.HorizontalAlignment.Center,
            	VerticalAlignment = Enum.VerticalAlignment.Top,
            	SortOrder = Enum.SortOrder.LayoutOrder,
            	Padding = UDim.new(0, 8),
            	
            	Parent = Section_F
            })
            
            CreateElement("UIPadding", {
            	PaddingLeft = UDim.new(0, 0),
            	PaddingRight = UDim.new(0, 0),
            	PaddingTop = UDim.new(0, 8),
            	PaddingBottom = UDim.new(0, 8),
            	Parent = Section_F
            })
            
            CreateElement("UICorner", {
                CornerRadius = UDim.new(0, 8),
                Parent = Section_F
            })
            
            CreateElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Thickness = 1,
                Color = Themes.Colors.Stroke,
                Parent = Section_F,
            })
            
            UIListLayout_01:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                Section_F.Size = UDim2.new(1, 0, 0, UIListLayout_01.AbsoluteContentSize.Y + 17)
            end)
                
            if Options.Header ~= "" and Options.Header ~= " " then
                local Title_F = CreateElement("Frame", {
            		Name = "Title_F",
            		Size = UDim2.new(1, 0, 0, 15),
            		AnchorPoint = Vector2.new(0, 0),
            		Position = UDim2.new(0, 0, 0, 0),
            		BackgroundColor3 = Themes.Colors.Stroke,
            		BackgroundTransparency = 1,
            		BorderSizePixel = 0,
            		Visible = true,
            		ClipsDescendants = true,
            		Parent = Section_F
            	})
            
                local Title_Section = CreateElement("TextLabel", {
                    Name = "Title_Section",
                    Size = UDim2.new(1, -50, 0, 13),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Options.Header,
                    TextColor3 = Themes.Colors.Text,
                    TextTransparency = 0, -- Começa transparente
                    TextScaled = true,
                    TextSize = 10,
                    Font = Enum.Font.Gotham,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Title_F
                })
                
                local Line_05 = CreateElement("Frame", {
            		Name = "Line_05",
            		Size = UDim2.new(1, 0, 0, 1),
            		AnchorPoint = Vector2.new(0, 0),
            		Position = UDim2.new(0, 0, 0, 0),
            		BackgroundColor3 = Themes.Colors.Stroke,
            		BackgroundTransparency = 0,
            		BorderSizePixel = 0,
            		Visible = true,
            		ClipsDescendants = true,
            		Parent = Section_F
            	})
            end
            
            function Section:Button(Flags, Options)
                local Button = {Options = Options}
                
                local Button_F = CreateElement("Frame", {
                    Name = Button.Options.Name,
                    Size = UDim2.new(1, - 20, 0, 30),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Section_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(0, 8),
                    Parent = Button_F
                })
                
                CreateElement("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Thickness = 1,
                    Color = Themes.Colors.Stroke,
                    Parent = Button_F,
                })
                
                local Title_Button = CreateElement("TextLabel", {
                    Name = "Title_Button",
                    Size = UDim2.new(1, - 50, 0, 13),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Button.Options.Name,
                    TextColor3 = Themes.Colors.Text,
                    TextTransparency = 0.4,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Enum.Font.Gotham,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Button_F
                })
                
                local InvisCircle = CreateElement("Frame", {
                    Size = UDim2.fromOffset(11, 11),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, - 8, 0.5, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Button_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(1, 0),
                    Parent = InvisCircle
                })
                
                CreateElement("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Thickness = 1,
                    Color = Themes.Colors.Stroke,
                    Parent = InvisCircle,
                })
                
                local CenterBall = CreateElement("Frame", {
                    Size = UDim2.fromOffset(8, 8),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    BackgroundColor3 = Themes.Colors.Text,
                    BackgroundTransparency = 0.6,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = InvisCircle
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(1, 0),
                    Parent = CenterBall
                })
                
                local OnClick = CreateElement("TextButton", {
                    Name = "OnClick",
                    Parent = Button_F,
                    BackgroundTransparency = 1.000,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    AutoButtonColor = false,
                    Text = "",
                    TextSize = 0.000,
                })
                
                local HoverB = false
                local ActiveB = false
                
                OnClick.MouseEnter:Connect(function()
                    HoverB = true
                    if not ActiveB then
                        TweenService:Create(Title_Button, TweenInfo.new(0.15), {
                            TextTransparency = 0
                        }):Play()
                    end
                end)
                
                OnClick.MouseLeave:Connect(function()
                    HoverB = false
                    if not ActiveB then 
                        TweenService:Create(Title_Button, TweenInfo.new(0.15), {
                            TextTransparency = 0.4
                        }):Play()
                    end
                end)
                
                OnClick.MouseButton1Click:Connect(function(input)
                    Button:Callback()
                end)
                
                function Button:Callback()
                    Spawn(function()
                        Button.Options.Callback()
                    end)
                end
                
                function Button:GetCallback()
                    Button:Callback()
                end
                
                function Button:SetName(text)
                    Title_Button.Text = text
                end
                
                if Flags then
					Lib.Options[Flags] = Button
				end
                
                return Button
            end
            
            function Section:Toggle(Flags, Options)
                local Toggle = {Options = Options}
                
                local State = Toggle.Options.Default
                
                local Toggle_F = CreateElement("Frame", {
                    Name = Toggle.Options.Name,
                    Size = UDim2.new(1, - 20, 0, 30),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Section_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(0, 8),
                    Parent = Toggle_F
                })
                
                local Title_Toggle = CreateElement("TextLabel", {
                    Name = "Title_Toggle",
                    Size = UDim2.new(1, - 50, 0, 13),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Toggle.Options.Name,
                    TextColor3 = Themes.Colors.Text,
                    TextTransparency = 0.4,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Enum.Font.Gotham,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Toggle_F
                })
                
                local Holver_F = CreateElement("Frame", {
                    Size = UDim2.new(0, 43, 0, 18),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    BackgroundColor3 = Themes.Colors.Off,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Toggle_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(1, 0),
                    Parent = Holver_F
                })
                
                local Ball_F = CreateElement("Frame", {
                    Size = UDim2.fromOffset(10, 10),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 5, 0.5, 0),
                    BackgroundColor3 = Themes.Colors.Text,
                    BackgroundTransparency = 0.4,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Holver_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(1, 0),
                    Parent = Ball_F
                })
                
                local OnClick = CreateElement("TextButton", {
                    Name = "OnClick",
                    Parent = Toggle_F,
                    BackgroundTransparency = 1.000,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    AutoButtonColor = false,
                    Text = "",
                    TextSize = 0.000,
                })
                
                local HoverT = false
                local ActiveT = false
                
                OnClick.MouseEnter:Connect(function()
                    HoverT = true
                    if not ActiveT then
                        TweenService:Create(Title_Toggle, TweenInfo.new(0.15), {
                            TextTransparency = 0
                        }):Play()
                    end
                end)
                
                OnClick.MouseLeave:Connect(function()
                    HoverT = false
                    if not ActiveT then 
                        TweenService:Create(Title_Toggle, TweenInfo.new(0.15), {
                            TextTransparency = 0.4
                        }):Play()
                    end
                end)
                
                OnClick.MouseButton1Click:Connect(function(input)
                    Toggle:Callback()
                end)
                
                function Toggle:Activate()
                    TweenService:Create(Ball_F, TweenInfo.new(0.15), {
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.new(1, - 5, 0.5, 0),
                        BackgroundTransparency = 0.3,
                    }):Play()
                    
                    TweenService:Create(Holver_F, TweenInfo.new(0.15), {
                        BackgroundColor3 = Themes.Colors.On
                    }):Play()
                end
                
                function Toggle:Deactivate()
                    TweenService:Create(Ball_F, TweenInfo.new(0.15), {
                        Position = UDim2.new(0, 5, 0.5, 0),
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 0.4,
                    }):Play()
                    
                    TweenService:Create(Holver_F, TweenInfo.new(0.15), {
                        BackgroundColor3 = Themes.Colors.Off
                    }):Play()
                end
                
                function Toggle:Callback()
                    Spawn(function()
                        State = not State
                        if State then
                            Toggle:Activate()
                        else
                            Toggle:Deactivate()
                        end
                        if Toggle.Options.Callback then
                            Toggle.Options.Callback(State)
                        end
                    end)
                end
                
                function Toggle:GetCallback()
                    return State
                end
                
                function Toggle:GetState()
                    return State
                end
                
                function Toggle:SetState(state, skipCallback)
                    if State ~= state then
                        State = state
                        if state then
                            Toggle:Activate()
                        else
                            Toggle:Deactivate()
                        end
                        
                        if Toggle.Options.Callback and not skipCallback then
                            Toggle.Options.Callback(State)
                        end
                    end
                    return State
                end
                
                function Toggle:Toggle(skipCallback)
                    return Toggle:SetState(not State, skipCallback)
                end
                
                function Toggle:SetName(Text)
                    Title_Toggle.Text = Text or Options.Name
                end
                
                function Toggle:GetName()
                    return Title_Toggle.Text
                end
                
                function Toggle:SetCallback(newCallback)
                    if type(newCallback) == "function" then
                        Toggle.Options.Callback = newCallback
                    end
                end
                
                function Toggle:Destroy()
                    if Toggle_F then
                        Toggle_F:Destroy()
                    end
                end
                
                if State then
                    Toggle:Activate()
                else
                    Toggle:Deactivate()
                end
                
                Spawn(function()
                    if Toggle.Options.Callback then
                        Toggle.Options.Callback(State)
                    end
                end)
                
                if Flags then
					Lib.Options[Flags] = Toggle
				end
                
                return Toggle
            end
            
            function Section:Checkbox(Flags, Options) 
                local Checkbox = {Options = Options}
                
                local State = Checkbox.Options.Default
                
                local Checkbox_F = CreateElement("Frame", {
                    Name = Checkbox.Options.Name,
                    Size = UDim2.new(1, - 20, 0, 30),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = false,
                    Parent = Section_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(0, 4),
                    Parent = Checkbox_F
                })
                
                local Title_Checkbox = CreateElement("TextLabel", {
                    Name = "Title_Checkbox",
                    Size = UDim2.new(1, - 50, 0, 13),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Checkbox.Options.Name,
                    TextColor3 = Themes.Colors.Text,
                    TextTransparency = 0.4,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Enum.Font.Gotham,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Checkbox_F
                })
                
                local Check_F = CreateElement("Frame", {
                    Name = Checkbox.Options.Name,
                    Size = UDim2.new(0, 20, 0, 20),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    BackgroundColor3 = Themes.Colors.Off,
                    BackgroundTransparency = 0.2,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Checkbox_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(0, 2),
                    Parent = Check_F
                })
                
                CreateElement("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Thickness = 1,
                    Color = Themes.Colors.Stroke,
                    Parent = Check_F,
                })
                
                local Icon = CreateElement("ImageLabel", {
                    Name = "Icon",
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    ImageColor3 = Themes.Colors.Image,
                    Image = "rbxassetid://" .. tostring(IconsSystem:GetIcon("Check")) or "4333896501",
                    ImageTransparency = 1,
                    Size = UDim2.fromOffset(13, 13),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Parent = Check_F,
                })
                
                local OnClick = CreateElement("TextButton", {
                    Name = "OnClick",
                    Parent = Checkbox_F,
                    BackgroundTransparency = 1.000,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    AutoButtonColor = false,
                    Text = "",
                    TextSize = 0.000,
                })
                
                local HoverC = false
                local ActiveC = false
                
                OnClick.MouseEnter:Connect(function()
                    HoverC = true
                    if not ActiveC then
                        TweenService:Create(Title_Checkbox, TweenInfo.new(0.15), {
                            TextTransparency = 0
                        }):Play()
                    end
                end)
                
                OnClick.MouseLeave:Connect(function()
                    HoverC = false
                    if not ActiveC then 
                        TweenService:Create(Title_Checkbox, TweenInfo.new(0.15), {
                            TextTransparency = 0.4
                        }):Play()
                    end
                end)
                
                OnClick.MouseButton1Click:Connect(function(input)
                    Checkbox:Callback()
                end)
                
                function Checkbox:Activate()
                    TweenService:Create(Icon, TweenInfo.new(0.15), {
                        ImageTransparency = 0
                    }):Play()
                    
                    TweenService:Create(Check_F, TweenInfo.new(0.15), {
                        BackgroundColor3 = Themes.Colors.On
                    }):Play()
                end
                
                function Checkbox:Deactivate()
                    TweenService:Create(Icon, TweenInfo.new(0.15), {
                        ImageTransparency = 1
                    }):Play()
                    
                    TweenService:Create(Check_F, TweenInfo.new(0.15), {
                        BackgroundColor3 = Themes.Colors.Off
                    }):Play()
                end
                
                function Checkbox:Callback()
                    Spawn(function()
                        State = not State
                        if State then
                            Checkbox:Activate()
                        else
                            Checkbox:Deactivate()
                        end
                        if Checkbox.Options.Callback then
                            Checkbox.Options.Callback(State)
                        end
                    end)
                end
                
                function Checkbox:GetCallback()
                    return State
                end
                
                function Checkbox:GetState()
                    return State
                end
                
                function Checkbox:SetState(state, skipCallback)
                    if State ~= state then
                        State = state
                        if state then
                            Checkbox:Activate()
                        else
                            Checkbox:Deactivate()
                        end
                        
                        if Checkbox.Options.Callback and not skipCallback then
                            Checkbox.Options.Callback(State)
                        end
                    end
                    return State
                end
                
                function Checkbox:Toggle(skipCallback)
                    return Checkbox:SetState(not State, skipCallback)
                end
                
                function Checkbox:SetName(text)
                    Title_Checkbox.Text = text or Options.Name
                end
                
                function Checkbox:GetName()
                    return Title_Checkbox.Text
                end
                
                function Checkbox:SetCallback(newCallback)
                    if type(newCallback) == "function" then
                        Checkbox.Options.Callback = newCallback
                    end
                end
                
                function Checkbox:Destroy()
                    if Checkbox_F then
                        Checkbox_F:Destroy()
                    end
                end
                
                if State then
                    Checkbox:Activate()
                else
                    Checkbox:Deactivate()
                end
                
                Spawn(function()
                    if Checkbox.Options.Callback then
                        Checkbox.Options.Callback(State)
                    end
                end)
                
                if Flags then
					Lib.Options[Flags] = Checkbox
				end
                
                return Checkbox
            end
            
            function Section:RadioButton(Flags, Options)
                local Radio = {Options = Options}
                
                local Radio_F = CreateElement("Frame", {
                    Name = Radio.Options.Name,
                    Size = UDim2.new(1, -20, 0, 70),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Section_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(0, 8),
                    Parent = Radio_F
                })
                
                CreateElement("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Thickness = 1,
                    Color = Themes.Colors.Stroke,
                    Parent = Radio_F,
                })
                
                local Title_F = CreateElement("Frame", {
                    Name = "Title_F",
                    Size = UDim2.new(1, 0, 0, 27),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Radio_F
                })
                
                local Title_Checkbox = CreateElement("TextLabel", {
                    Name = "Title_Checkbox",
                    Size = UDim2.new(1, -50, 0, 13),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Radio.Options.Name,
                    TextColor3 = Themes.Colors.Text,
                    TextTransparency = 0.4,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Enum.Font.Gotham,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Title_F
                })
                
                local Icon
                if Radio.Options.Icon and Radio.Options.Icon ~= "" and Radio.Options.Icon ~= " " then
                    local imageId = IconsSystem:GetIcon(Radio.Options.Icon)
                    if imageId and imageId ~= "" then
                        Icon = CreateElement("ImageLabel", {
                            Name = "Icon",
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            BackgroundTransparency = 1,
                            BorderColor3 = Color3.fromRGB(0, 0, 0),
                            BorderSizePixel = 0,
                            ImageColor3 = Themes.Colors.Image,
                            Image = "rbxassetid://" .. tostring(imageId),
                            ImageTransparency = 0.6,
                            Size = UDim2.fromOffset(17, 17),
                            AnchorPoint = Vector2.new(0, 0.5),
                            Position = UDim2.new(0, 8, 0.5, 0),
                            Parent = Title_F,
                        })
                        
                        Title_Checkbox.Position = UDim2.new(0, 33, 0.5, 0)
                    else
                        -- Se o ícone não for encontrado, não ajusta a posição
                        Title_Checkbox.Position = UDim2.new(0, 8, 0.5, 0)
                    end
                else
                    -- Sem ícone, posição normal
                    Title_Checkbox.Position = UDim2.new(0, 8, 0.5, 0)
                end
                
                local Line_06 = CreateElement("Frame", {
                    Name = "Line_06",
                    Size = UDim2.new(1, 0, 0, 1),
                    AnchorPoint = Vector2.new(1, 1),
                    Position = UDim2.new(1, 0, 1, 0),
                    BackgroundColor3 = Themes.Colors.Stroke,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Title_F
                })
                
                local Conteiner_F = CreateElement("Frame", {
                    Name = "Conteiner_F",
                    Size = UDim2.new(1, 0, 1, -27),
                    AnchorPoint = Vector2.new(1, 1),
                    Position = UDim2.new(1, 0, 1, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Radio_F
                })
                
                -- Layout principal que controla as linhas
                local UIListLayout_02 = CreateElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 8),
                    Parent = Conteiner_F
                })
                
                CreateElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 5),
                    PaddingRight = UDim.new(0, 5),
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8),
                    Parent = Conteiner_F
                })
                
                -- Variáveis para controle do layout
                local currentRow = nil
                local currentRowLayout = nil
                local rowWidth = 0
                local maxRowWidth = Conteiner_F.AbsoluteSize.X - 10 -- Considerando padding
                
                local HoverR = false
                local ActiveR = false
                
                -- Variáveis globais do Radio
                local radioButtons = {}
                local selectedValue = Radio.Options.Default
                local radioCount = 0
                
                Radio.Options.Callback(selectedValue)
                
                -- Função para criar uma nova linha
                function createNewRow()
                    currentRow = CreateElement("Frame", {
                        Name = "Row",
                        Size = UDim2.new(1, 0, 0, 24),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        LayoutOrder = #Conteiner_F:GetChildren(),
                        Parent = Conteiner_F
                    })
                    
                    currentRowLayout = CreateElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Top,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 8),
                        Parent = currentRow
                    })
                    
                    rowWidth = 0
                    return currentRow
                end
                
                -- Função para atualizar a seleção
                function updateSelection(newValue)
                    -- Se clicar no mesmo valor, não faz nada (não permite deselecionar)
                    if selectedValue == newValue then
                        return
                    end
                    
                    -- Desmarcar o valor anterior se existir
                    if selectedValue and radioButtons[selectedValue] then
                        local previousRadio = radioButtons[selectedValue]
                        TweenService:Create(previousRadio.ViewBall, TweenInfo.new(0.15), {
                            BackgroundTransparency = 1
                        }):Play()
                        TweenService:Create(previousRadio.NameLabel, TweenInfo.new(0.15), {
                            TextTransparency = 0.4
                        }):Play()
                    end
                    
                    -- Marcar o novo valor
                    selectedValue = newValue
                    local currentRadio = radioButtons[newValue]
                    
                    if currentRadio then
                        TweenService:Create(currentRadio.ViewBall, TweenInfo.new(0.15), {
                            BackgroundTransparency = 0.4
                        }):Play()
                        TweenService:Create(currentRadio.NameLabel, TweenInfo.new(0.15), {
                            TextTransparency = 0
                        }):Play()
                    end
                    
                    -- Executar callback
                    Radio.Options.Callback(newValue)
                end
                
                -- Função para criar um botão de rádio individual
                function createRadioButton(value, isSelected)
                    radioCount = radioCount + 1
                    
                    local Features_F = CreateElement("Frame", {
                        Name = "Features_F_" .. radioCount,
                        Size = UDim2.new(0, 0, 0, 24),
                        AnchorPoint = Vector2.new(0, 0),
                        Position = UDim2.new(0, 0, 0, 0),
                        AutomaticSize = Enum.AutomaticSize.X,
                        BackgroundColor3 = Themes.Colors.Secondary,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Visible = true,
                        ClipsDescendants = true,
                    })
                    
                    local Stroke_Circle = CreateElement("Frame", {
                        Name = "Stroke_Circle",
                        Size = UDim2.fromOffset(17, 17),
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.new(0, 8, 0.5, 0),
                        BackgroundColor3 = Themes.Colors.Secondary,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Visible = true,
                        ClipsDescendants = true,
                        Parent = Features_F
                    })
                    
                    local View_Ball = CreateElement("Frame", {
                        Name = "View_Ball",
                        Size = UDim2.fromOffset(10, 10),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.new(0.5, 0, 0.5, 0),
                        BackgroundColor3 = Themes.Colors.Text,
                        BackgroundTransparency = isSelected and 0.4 or 1,
                        BorderSizePixel = 0,
                        Visible = true,
                        ClipsDescendants = true,
                        Parent = Stroke_Circle
                    })
                    
                    CreateElement("UICorner", {
                        CornerRadius = UDim.new(1, 0),
                        Parent = View_Ball
                    })
                    
                    CreateElement("UICorner", {
                        CornerRadius = UDim.new(1, 0),
                        Parent = Stroke_Circle
                    })
                    
                    CreateElement("UIStroke", {
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                        Thickness = 1,
                        Color = Themes.Colors.Stroke,
                        Parent = Stroke_Circle,
                    })
                    
                    local Name_Features = CreateElement("TextLabel", {
                        Name = "Name_Features",
                        Size = UDim2.new(0, 0, 0, 13),
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.new(0, 33, 0.5, 0),
                        BackgroundTransparency = 1,
                        AutomaticSize = Enum.AutomaticSize.X,
                        BorderSizePixel = 0,
                        Visible = true,
                        ClipsDescendants = true,
                        
                        Text = value,
                        TextColor3 = Themes.Colors.Text,
                        TextTransparency = isSelected and 0 or 0.4,
                        TextScaled = true,
                        TextSize = 10,
                        Font = Enum.Font.Gotham,
                        TextWrapped = true,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center,
                        
                        Parent = Features_F
                    })
                    
                    local OnClick = CreateElement("TextButton", {
                        Name = "OnClick",
                        Parent = Features_F,
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        AutoButtonColor = false,
                        Text = "",
                        TextSize = 0.000,
                    })
                    
                    -- Calcular o tamanho aproximado do botão
                    local textSize = game:GetService("TextService"):GetTextSize(value, 10, Enum.Font.Gotham, Vector2.new(1000, 13))
                    local buttonWidth = 33 + textSize.X + 8
                    
                    -- Lógica de posicionamento Sameline CORRIGIDA - ORDEM CORRETA
                    if Radio.Options.Sameline then
                        -- Se não existe linha atual, criar uma
                        if not currentRow then
                            createNewRow()
                        end
                        
                        -- Verificar se o botão cabe na linha atual
                        if rowWidth + buttonWidth > maxRowWidth and rowWidth > 0 then
                            -- Não cabe, criar nova linha
                            createNewRow()
                        end
                        
                        -- Adicionar à linha atual (a ordem é mantida pelo LayoutOrder automático)
                        Features_F.Parent = currentRow
                        rowWidth = rowWidth + buttonWidth + 8 -- +8 pelo padding do UIListLayout
                        
                        -- Forçar atualização do layout
                        if currentRowLayout then
                            currentRowLayout:ApplyLayout()
                        end
                    else
                        -- Se não for Sameline, cada botão vai em uma linha própria
                        Features_F.Parent = Conteiner_F
                        Features_F.Size = UDim2.new(1, -10, 0, 24) -- Ocupa toda a largura
                    end
                    
                    -- Armazenar referências
                    radioButtons[value] = {
                        Frame = Features_F,
                        ViewBall = View_Ball,
                        NameLabel = Name_Features,
                        Value = value
                    }
                    
                    -- Interações
                    local radioData = radioButtons[value]
                    
                    OnClick.MouseEnter:Connect(function()
                        HoverR = true
                        if selectedValue ~= value then
                            TweenService:Create(radioData.NameLabel, TweenInfo.new(0.15), {
                                TextTransparency = 0
                            }):Play()
                        end
                    end)
                    
                    OnClick.MouseLeave:Connect(function()
                        HoverR = false
                        if selectedValue ~= value then
                            TweenService:Create(radioData.NameLabel, TweenInfo.new(0.15), {
                                TextTransparency = 0.4
                            }):Play()
                        end
                    end)
                    
                    OnClick.MouseButton1Click:Connect(function()
                        updateSelection(value)
                    end)
                    
                    return Features_F
                end
                
                function updateContainerHeight()
                    if Radio.Options.Sameline then
                        local rowCount = 0
                        for _, child in ipairs(Conteiner_F:GetChildren()) do
                            if child:IsA("Frame") and child.Name == "Row" then
                                rowCount = rowCount + 1
                            end
                        end
                        local totalHeight = 27 + (rowCount * 24) + ((rowCount - 1) * 8) + 16
                        Radio_F.Size = UDim2.new(1, -20, 0, totalHeight)
                    else
                        local buttonCount = 0
                        for _ in pairs(radioButtons) do
                            buttonCount = buttonCount + 1
                        end
                        local totalHeight = 27 + (buttonCount * 24) + ((buttonCount - 1) * 8) + 16
                        Radio_F.Size = UDim2.new(1, -20, 0, totalHeight)
                    end
                end
                
                -- Função para reconstruir o layout MANTENDO A ORDEM
                function rebuildLayout()
                    -- Limpar todas as linhas existentes
                    for _, child in ipairs(Conteiner_F:GetChildren()) do
                        if child:IsA("Frame") then
                            child:Destroy()
                        end
                    end
                    
                    -- Resetar variáveis de linha
                    currentRow = nil
                    currentRowLayout = nil
                    rowWidth = 0
                    
                    -- Recriar todos os botões NA ORDEM CORRETA
                    for i, value in ipairs(Radio.Options.Values) do
                        if radioButtons[value] then
                            local isSelected = (value == selectedValue)
                            local newFrame = createRadioButton(value, isSelected)
                            radioButtons[value].Frame = newFrame
                        end
                    end
                    
                    -- Atualizar altura
                    updateContainerHeight()
                end
                
                -- Criar os botões iniciais NA ORDEM CORRETA
                for i, value in ipairs(Radio.Options.Values) do
                    createRadioButton(value, value == selectedValue)
                end
                
                -- Atualizar altura inicial
                updateContainerHeight()
                
                -- Atualizar altura quando o layout mudar
                Conteiner_F:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                    maxRowWidth = Conteiner_F.AbsoluteSize.X - 10
                    if Options.Sameline then
                        rebuildLayout()
                    end
                end)
                
                -- FUNÇÕES DO RADIO
                function Radio:AddRadio(value, select)
                    if radioButtons[value] then
                        warn("Radio button with value '" .. value .. "' already exists!")
                        return false
                    end
                    
                    local shouldSelect = select or false
                    
                    -- Adicionar ao array de valores para manter a ordem
                    table.insert(Radio.Options.Values, value)
                    
                    createRadioButton(value, shouldSelect)
                    
                    if shouldSelect then
                        updateSelection(value)
                    end
                    
                    if Radio.Options.Sameline then
                        rebuildLayout() -- Reconstruir para manter a ordem
                    else
                        updateContainerHeight()
                    end
                    
                    return true
                end
                
                function Radio:DelRadio(value)
                    if not radioButtons[value] then
                        warn("Radio button with value '" .. value .. "' not found!")
                        return false
                    end
                    
                    local radioData = radioButtons[value]
                    
                    -- Se estiver deletando o rádio selecionado, selecionar o primeiro disponível
                    if selectedValue == value then
                        local newSelection = nil
                        for otherValue, otherData in pairs(radioButtons) do
                            if otherValue ~= value then
                                newSelection = otherValue
                                break
                            end
                        end
                        
                        if newSelection then
                            updateSelection(newSelection)
                        else
                            selectedValue = nil
                        end
                    end
                    
                    -- Remover da tabela e destruir o frame
                    radioData.Frame:Destroy()
                    radioButtons[value] = nil
                    
                    -- Remover do array de valores
                    for i, v in ipairs(Radio.Options.Values) do
                        if v == value then
                            table.remove(Radio.Options.Values, i)
                            break
                        end
                    end
                    
                    -- Reconstruir layout se for Sameline
                    if Radio.Options.Sameline then
                        rebuildLayout()
                    else
                        updateContainerHeight()
                    end
                    
                    return true
                end

                function Radio:SetValue(value)
                    if value and value ~= "" then
                        self:SetRadio(value)
                    end
                end
                
                function Radio:GetValue()
                    return selectedValue or ""
                end
                
                function Radio:SetRadio(value)
                    if not radioButtons[value] then
                        warn("Radio button with value '" .. value .. "' not found!")
                        return false
                    end
                    
                    updateSelection(value)
                    return true
                end
                
                function Radio:GetValue()
                    return selectedValue
                end
                
                function Radio:GetValues()
                    local values = {}
                    for value in pairs(radioButtons) do
                        table.insert(values, value)
                    end
                    return values
                end
                
                function Radio:Clear()
                    -- Limpar todos os rádios
                    for value, radioData in pairs(radioButtons) do
                        radioData.Frame:Destroy()
                    end
                    
                    radioButtons = {}
                    Radio.Options.Values = {} -- Limpar o array de valores
                    selectedValue = nil
                    radioCount = 0
                    
                    -- Resetar variáveis de linha
                    currentRow = nil
                    currentRowLayout = nil
                    rowWidth = 0
                    
                    -- Reconstruir layout
                    if Radio.Options.Sameline then
                        rebuildLayout()
                    else
                        updateContainerHeight()
                    end
                end
                
                if Flags then
					Lib.Options[Flags] = Radio
				end
                
                return Radio
            end
            
            function Section:Colorpicker(Flags, Options)
                local Colorpicker = {Options = Options}
                
                -- ELEMENTOS DA UI
                local Colorpicker_F = CreateElement("Frame", {
                    Name = Colorpicker.Options.Name,
                    Size = UDim2.new(1, -20, 0, 26),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Section_F
                })
                
                local Title_F = CreateElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 26),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = false,
                    Parent = Colorpicker_F
                })
                
                local Title_Colorpicker = CreateElement("TextLabel", {
                    Name = "Title_Colorpicker",
                    Size = UDim2.new(1, -50, 0, 13),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Text = Colorpicker.Options.Name,
                    TextColor3 = Themes.Colors.Text,
                    TextTransparency = 0.4,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Enum.Font.Gotham,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    Parent = Title_F
                })
                
                local View_F = CreateElement("Frame", {
                    Size = UDim2.new(0, 22, 0, 22),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    BackgroundColor3 = Colorpicker.Options.Default,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Title_F
                })
                
                CreateElement("UICorner", {CornerRadius = UDim.new(0, 5), Parent = View_F})
                CreateElement("UIStroke", {ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Thickness = 1, Color = Themes.Colors.Stroke, Parent = View_F})
                
                local OnClick = CreateElement("TextButton", {
                    Name = "OnClick",
                    Parent = Title_F,
                    BackgroundTransparency = 1.000,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    AutoButtonColor = false,
                    Text = "",
                    TextSize = 0.000,
                })
                
                local Colorpicker_Window = CreateElement("Frame", {
                    Name = Colorpicker.Options.Name.. "_Window",
                    Size = UDim2.new(1, 0, 0, 125),
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0,26),
                    BackgroundColor3 = Themes.Colors.Primary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = false,
                    ClipsDescendants = true,
                    Parent = Colorpicker_F
                })
            
                CreateElement("UICorner", {CornerRadius = UDim.new(0, 10), Parent = Colorpicker_Window})
                
                CreateElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 0),
                    Parent = Colorpicker_Window
                })
                
                -- SELETOR DE COR
                local Colorpicker_Selector = CreateElement("Frame", {
                    Size = UDim2.new(1, -23, 1, 0),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Colorpicker_Window
                })
                
                CreateElement("UICorner", {CornerRadius = UDim.new(0, 8), Parent = Colorpicker_Selector})
                
                local UIGradient = Instance.new("UIGradient")
                UIGradient.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), 
                    ColorSequenceKeypoint.new(1.00, Colorpicker.Options.Default)
                }
                UIGradient.Rotation = 0
                UIGradient.Parent = Colorpicker_Selector
                
                local BlackOverlay = CreateElement("ImageLabel", {
                    Name = "BlackOverlay",
                    Parent = Colorpicker_Selector,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1.000,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    ZIndex = 1,
                    Image = "rbxassetid://5107152095",
                })
                
                CreateElement("UICorner", {CornerRadius = UDim.new(0, 7), Parent = BlackOverlay})
                
                local Cursor = CreateElement("ImageLabel", {
                    Name = "Cursor",
                    Parent = Colorpicker_Selector,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1.000,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    Position = UDim2.new(0, 0, 0, 0),
                    ImageTransparency = 1,
                    Size = UDim2.new(0, 8, 0, 8),
                    ZIndex = 2,
                    Image = assets.sliderhead,
                })
                
                -- BARRA RAINBOW VERTICAL
                local Colorpicker_RainbowBar = CreateElement("Frame", {
                    Size = UDim2.new(0, 15, 1, 0),
                    AnchorPoint = Vector2.new(1, 0),
                    Position = UDim2.new(1, 0, 0, 0),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Colorpicker_Window
                })
                
                CreateElement("UICorner", {CornerRadius = UDim.new(0, 3), Parent = Colorpicker_RainbowBar})
                
                local Rainbow_Cursor = CreateElement("ImageLabel", {
                    Name = "Rainbow_Cursor",
                    Parent = Colorpicker_RainbowBar,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1.000,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    Position = UDim2.new(0.5, 0, 0, 2),
                    Size = UDim2.new(0, 8, 0, 8),
                    ImageTransparency = 1,
                    ZIndex = 2,
                    Image = assets.sliderhead,
                })
                
                local UIGradient_Rainbow = Instance.new("UIGradient")
                UIGradient_Rainbow.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
                    ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 4)),
                    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
                    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
                    ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
                    ColorSequenceKeypoint.new(0.82, Color3.fromRGB(255, 0, 255)),
                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
                }
                UIGradient_Rainbow.Rotation = 90
                UIGradient_Rainbow.Parent = Colorpicker_RainbowBar
            
                -- SISTEMA DE FUNCIONAMENTO
                local draggingColor = false
                local draggingCConteiner = false
                local hue, sat, brightness = 0, 1, 1
                local currentColor = Colorpicker.Options.Default
                local rainbowMode = false
                local rainbowSpeed = 1
                local rainbowConnection = nil
                local isColorPickerOpen = false
            
                -- CONEXÕES DE INPUT
                local selectorInputConnection, selectorMoveConnection, selectorEndConnection
                local rainbowInputConnection, rainbowMoveConnection, rainbowEndConnection
                local closeConnection
            
                -- FUNÇÕES PRINCIPAIS
                function sendColorCallback(color)
                    currentColor = color
                    local r, g, b = math.floor(color.R * 255), math.floor(color.G * 255), math.floor(color.B * 255)
                    Colorpicker.Options.Callback(Color3.fromRGB(r, g, b))
                end
            
                function updateCConteinerColor(input)
                    local mousePos = input.Position
                    if not Colorpicker_Selector then return end
                    
                    local selectorPosition = Colorpicker_Selector.AbsolutePosition
                    local selectorSize = Colorpicker_Selector.AbsoluteSize
            
                    if mousePos.X >= selectorPosition.X and mousePos.Y >= selectorPosition.Y and
                        mousePos.X <= selectorPosition.X + selectorSize.X and mousePos.Y <= selectorPosition.Y + selectorSize.Y then
                        
                        sat = math.clamp((mousePos.X - selectorPosition.X) / selectorSize.X, 0, 1)
                        brightness = 1 - math.clamp((mousePos.Y - selectorPosition.Y) / selectorSize.Y, 0, 1)
            
                        currentColor = Color3.fromHSV(hue, sat, brightness)
                        View_F.BackgroundColor3 = currentColor
                        sendColorCallback(currentColor)
                        
                        local selectorX = math.clamp(mousePos.X - selectorPosition.X, 2, selectorSize.X - 2)
                        local selectorY = math.clamp(mousePos.Y - selectorPosition.Y, 2, selectorSize.Y - 2)
                        Cursor.Position = UDim2.fromOffset(selectorX - 4, selectorY - 4)
                    end
                end
            
                function updateColorSlider(input)
                    local mousePos = input.Position
                    if not Colorpicker_RainbowBar then return end
                    
                    local colorPosition = Colorpicker_RainbowBar.AbsolutePosition
                    local colorSize = Colorpicker_RainbowBar.AbsoluteSize
            
                    -- Para barra vertical, usar Y em vez de X
                    hue = math.clamp((mousePos.Y - colorPosition.Y) / colorSize.Y, 0, 1)
            
                    UIGradient.Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1.00, Color3.fromHSV(hue, 1, 1))
                    }
            
                    local yOffset = math.clamp(mousePos.Y - colorPosition.Y, 0, colorSize.Y - 3)
                    Rainbow_Cursor.Position = UDim2.new(0.5, 0, 0, yOffset)
            
                    currentColor = Color3.fromHSV(hue, sat, brightness)
                    View_F.BackgroundColor3 = currentColor
                    sendColorCallback(currentColor)
                end
            
                function startRainbowMode()
                    if rainbowConnection then
                        rainbowConnection:Disconnect()
                    end
                    
                    rainbowConnection = RunService.Heartbeat:Connect(function(deltaTime)
                        if not rainbowMode then
                            if rainbowConnection then
                                rainbowConnection:Disconnect()
                                rainbowConnection = nil
                            end
                            return
                        end
                        
                        hue = (hue + rainbowSpeed * deltaTime) % 1
                        
                        if Colorpicker_Window.Visible then
                            Rainbow_Cursor.Position = UDim2.new(0.5, 0, hue, 0)
                            UIGradient.Color = ColorSequence.new{
                                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
                                ColorSequenceKeypoint.new(1.00, Color3.fromHSV(hue, 1, 1))
                            }
                        end
                        
                        currentColor = Color3.fromHSV(hue, 1, 1)
                        View_F.BackgroundColor3 = currentColor
                        sendColorCallback(currentColor)
                    end)
                end
            
                function setInitialColor(color)
                    hue, sat, brightness = color:ToHSV()
                    
                    UIGradient.Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromHSV(hue, 1, 1))
                    }
                    
                    if Colorpicker_Selector and Colorpicker_Selector.AbsoluteSize then
                        local selectorSize = Colorpicker_Selector.AbsoluteSize
                        Cursor.Position = UDim2.new(sat, -4, 1 - brightness, -4)
                    end
                    
                    if Colorpicker_RainbowBar and Colorpicker_RainbowBar.AbsoluteSize then
                        local sliderSize = Colorpicker_RainbowBar.AbsoluteSize
                        Rainbow_Cursor.Position = UDim2.new(0.5, 0, hue, 0)
                    end
                    
                    View_F.BackgroundColor3 = color
                    currentColor = color
                    sendColorCallback(color)
                end
            
                -- SISTEMA DE CONEXÕES
                function connectSelectorInput()
                    if selectorInputConnection then selectorInputConnection:Disconnect() end
                    if selectorMoveConnection then selectorMoveConnection:Disconnect() end
                    if selectorEndConnection then selectorEndConnection:Disconnect() end
                    
                    selectorInputConnection = Colorpicker_Selector.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            draggingCConteiner = true
                            updateCConteinerColor(input)
                        end
                    end)
                    
                    selectorMoveConnection = UserInputService.InputChanged:Connect(function(input)
                        if draggingCConteiner and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                            updateCConteinerColor(input)
                        end
                    end)
                    
                    selectorEndConnection = UserInputService.InputEnded:Connect(function(input)
                        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                            draggingCConteiner = false
                        end
                    end)
                end
            
                function connectRainbowInput()
                    if rainbowInputConnection then rainbowInputConnection:Disconnect() end
                    if rainbowMoveConnection then rainbowMoveConnection:Disconnect() end
                    if rainbowEndConnection then rainbowEndConnection:Disconnect() end
                    
                    rainbowInputConnection = Colorpicker_RainbowBar.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            draggingColor = true
                            updateColorSlider(input)
                        end
                    end)
                    
                    rainbowMoveConnection = UserInputService.InputChanged:Connect(function(input)
                        if draggingColor and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                            updateColorSlider(input)
                        end
                    end)
                    
                    rainbowEndConnection = UserInputService.InputEnded:Connect(function(input)
                        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                            draggingColor = false
                        end
                    end)
                end
            
                function closeColorPicker()
                    isColorPickerOpen = false
                    
                    TweenService:Create(Colorpicker_Window, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(1, 0, 0, 0)
                    }):Play()
                    
                    delay(0.3, function()
                        if not isColorPickerOpen then
                            Colorpicker_Window.Visible = false
                        end
                    end)
                    
                    -- Desconectar eventos
                    if selectorInputConnection then selectorInputConnection:Disconnect() end
                    if selectorMoveConnection then selectorMoveConnection:Disconnect() end
                    if selectorEndConnection then selectorEndConnection:Disconnect() end
                    if rainbowInputConnection then rainbowInputConnection:Disconnect() end
                    if rainbowMoveConnection then rainbowMoveConnection:Disconnect() end
                    if rainbowEndConnection then rainbowEndConnection:Disconnect() end
                    if closeConnection then closeConnection:Disconnect() end
                end
                
                -- Mover a função setupCloseDetection para depois da definição de closeColorPicker
                function setupCloseDetection()
                    if closeConnection then closeConnection:Disconnect() end
                    
                    closeConnection = UserInputService.InputBegan:Connect(function(input, processed)
                        if processed then return end
                        
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            local mousePos = input.Position
                            
                            -- Função para verificar se o ponto está dentro de um frame
                            function isPointInFrame(frame, point)
                                local absPos = frame.AbsolutePosition
                                local absSize = frame.AbsoluteSize
                                return point.X >= absPos.X and point.X <= absPos.X + absSize.X and
                                       point.Y >= absPos.Y and point.Y <= absPos.Y + absSize.Y
                            end
                            
                            local isInsideColorpicker = isPointInFrame(Colorpicker_F, mousePos)
                            local isInsideWindow = isPointInFrame(Colorpicker_Window, mousePos)
                            
                            if not isInsideColorpicker and not isInsideWindow then
                                closeColorPicker()
                            end
                        end
                    end)
                end
            
                -- ANIMAÇÕES
                function openColorPicker()
                    isColorPickerOpen = true
                    Colorpicker_Window.Visible = true
                    Colorpicker_Window.Size = UDim2.new(1, 0, 0, 0)
                    Colorpicker_Window.Position = UDim2.new(0.5, 0, 0, 26)
                    
                    TweenService:Create(Colorpicker_Window, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(1, 0, 0, 125)
                    }):Play()
                    
                    setInitialColor(currentColor)
                    connectSelectorInput()
                    connectRainbowInput()
                    setupCloseDetection()
                end
                
                local HoverCp = false
                local ActiveCp = false

                -- EVENTOS
                OnClick.MouseEnter:Connect(function()
                    HoverCp = true
                    if not ActiveCp then
                        TweenService:Create(Title_Colorpicker, TweenInfo.new(0.15), {
                            TextTransparency = 0
                        }):Play()
                    end
                end)
                
                OnClick.MouseLeave:Connect(function()
                    HoverCp = false
                    if not ActiveCp then 
                        TweenService:Create(Title_Colorpicker, TweenInfo.new(0.15), {
                            TextTransparency = 0.4
                        }):Play()
                    end
                end)
                
                OnClick.MouseButton1Click:Connect(function()
                    if isColorPickerOpen then
                        closeColorPicker()
                    else
                        openColorPicker()
                    end
                end)
            
                -- SUPORTE MOBILE
                function setupTouchSupport()
                    Colorpicker_Selector.Active = true
                    Colorpicker_RainbowBar.Active = true
                    
                    if UserInputService.TouchEnabled then
                        Cursor.Size = UDim2.fromOffset(8, 8)
                        Rainbow_Cursor.Size = UDim2.fromOffset(8, 8)
                    end
                end
            
                -- INICIALIZAÇÃO
                View_F.BackgroundColor3 = currentColor
                setInitialColor(currentColor)
                setupTouchSupport()
            
                -- FUNÇÕES PÚBLICAS (adicione estas funções após as outras funções públicas do Colorpicker)

                function Colorpicker:SetColor(newColor)
                    currentColor = newColor
                    View_F.BackgroundColor3 = currentColor
                    setInitialColor(newColor)
                    sendColorCallback(newColor)
                end
                
                function Colorpicker:GetColor()
                    return Color3.fromRGB(
                        math.floor(currentColor.R * 255),
                        math.floor(currentColor.G * 255),
                        math.floor(currentColor.B * 255)
                    )
                end
                
                -- ADICIONE ESTAS DUAS FUNÇÕES:
                function Colorpicker:SetValue(value)
                    if typeof(value) == "Color3" then
                        -- Se for Color3, usar diretamente
                        self:SetColor(value)
                    elseif type(value) == "string" then
                        -- Se for string "Color3.fromRGB(r,g,b)", converter para Color3
                        local r, g, b = value:match("Color3%.fromRGB%((%d+),%s*(%d+),%s*(%d+)%)")
                        if r and g and b then
                            local color = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
                            self:SetColor(color)
                        else
                            -- Tentar converter de hexadecimal
                            if value:sub(1,1) == "#" then
                                value = value:sub(2)
                            end
                            if #value == 6 then
                                local r = tonumber(value:sub(1,2), 16) / 255
                                local g = tonumber(value:sub(3,4), 16) / 255
                                local b = tonumber(value:sub(5,6), 16) / 255
                                local color = Color3.new(r, g, b)
                                self:SetColor(color)
                            end
                        end
                    end
                end
                
                function Colorpicker:GetValue()
                    -- Retorna no formato "Color3.fromRGB(r,g,b)" para compatibilidade com o sistema de save/load
                    local color = self:GetColor()
                    return string.format("Color3.fromRGB(%d, %d, %d)", 
                        math.floor(color.R * 255), 
                        math.floor(color.G * 255), 
                        math.floor(color.B * 255))
                end
                
                function Colorpicker:SetCallback(newCallback)
                    if type(newCallback) == "function" then
                        Colorpicker.Options.Callback = newCallback
                    end
                end
                
                function Colorpicker:RainbowMode(State, Speed)
                    rainbowMode = State
                    if Speed then
                        rainbowSpeed = math.clamp(Speed, 0.1, 5)
                    end
                    
                    if rainbowMode then
                        startRainbowMode()
                    elseif rainbowConnection then
                        rainbowConnection:Disconnect()
                        rainbowConnection = nil
                    end
                    
                    return rainbowMode
                end
                
                if Flags then
					Lib.Options[Flags] = Colorpicker
				end
            
                return Colorpicker
            end
            
            function Section:KeyBind(Flags, Options)
                local KeyBind = {Options = Options}
                
                local Default_Value = Enum.KeyCode[KeyBind.Options.Default]
                
                local CurrentKey = Default_Value
                local Value = KeyBind.Options.Default
                
                local KeyBind_F = CreateElement("Frame", {
                    Name = KeyBind.Options.Name,
                    Size = UDim2.new(1, -20, 0, 30),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Section_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(0, 8),
                    Parent = KeyBind_F
                })
                
                local Title_KeyBind = CreateElement("TextLabel", {
                    Name = "Title_KeyBind",
                    Size = UDim2.new(1, -50, 0, 13),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = false,
                    
                    Text = KeyBind.Options.Name,
                    TextColor3 = Themes.Colors.Text,
                    TextTransparency = 0.4,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Enum.Font.Gotham,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = KeyBind_F
                })
                
                local Ac = CreateElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 30),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Title_KeyBind
                })
                
                local Holver_F = CreateElement("Frame", {
                    Size = UDim2.new(0, 45, 0, 25),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = KeyBind_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(0, 8),
                    Parent = Holver_F
                })
                
                local KeyBind_Display = CreateElement("TextLabel", {
                    Name = "KeyBind_Display",
                    Size = UDim2.new(0, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.XY,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = KeyBind.Options.Default,
                    TextColor3 = Themes.Colors.Text,
                    TextTransparency = 0,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Enum.Font.Gotham,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Holver_F
                })
                
                local Icon = CreateElement("ImageLabel", {
                    Name = "Icon",
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    ImageColor3 = Themes.Colors.Image,
                    Image = "rbxassetid://" .. tostring(IconsSystem:GetIcon("Keyboard")) or "4814130196",
                    ImageTransparency = 0,
                    Size = UDim2.fromOffset(17, 17),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 5, 0.5, 0),
                    Parent = Holver_F,
                })
                
                local OnClick = CreateElement("TextButton", {
                    Name = "OnClick",
                    Parent = Holver_F,
                    BackgroundTransparency = 1.000,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    AutoButtonColor = false,
                    Text = "",
                    TextSize = 0.000,
                })
                
                local HoverK = false
                local ActiveK =false
                
                Ac.MouseEnter:Connect(function()
                    HoverK = true
                    if not ActiveK then
                        TweenService:Create(Title_KeyBind, TweenInfo.new(0.15), {
                            TextTransparency = 0
                        }):Play()
                    end
                end)
                
                Ac.MouseLeave:Connect(function()
                    HoverK = false
                    if not ActiveK then 
                        TweenService:Create(Title_KeyBind, TweenInfo.new(0.15), {
                            TextTransparency = 0.4
                        }):Play()
                    end
                end)
                
                function FormatKeyName(keyCode)
                    local keyName = tostring(keyCode):gsub("Enum.KeyCode.", "")
                    
                    -- Mapeamento para nomes mais amigáveis
                    local keyMap = {
                        ["LeftControl"] = "LCtrl",
                        ["RightControl"] = "RCtrl",
                        ["LeftShift"] = "LShift", 
                        ["RightShift"] = "RShift",
                        ["LeftAlt"] = "LAlt",
                        ["RightAlt"] = "RAlt",
                        ["Return"] = "Enter",
                        ["Escape"] = "Esc",
                        ["Backspace"] = "Back",
                        ["Space"] = "Space",
                        ["PageUp"] = "PgUp",
                        ["PageDown"] = "PgDown",
                        ["Capital"] = "Caps"
                    }
                    
                    return keyMap[keyName] or keyName
                end
                
                -- Função para verificar se a tecla é permitida (apenas letras e números)
                function IsKeyAllowed(keyCode)
                    local keyName = tostring(keyCode)
                    
                    -- Teclas permitidas: letras (A-Z), números (0-9) e algumas teclas especiais úteis
                    local allowedKeys = {
                        -- Letras
                        "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", 
                        "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
                        
                        -- Números
                        "Zero", "One", "Two", "Three", "Four", "Five", 
                        "Six", "Seven", "Eight", "Nine",
                    }
                    
                    for _, allowedKey in ipairs(allowedKeys) do
                        if keyName == "Enum.KeyCode." .. allowedKey then
                            return true
                        end
                    end
                    
                    return false
                end
                
                -- Função para atualizar o tamanho do Holder
                function UpdateHolderSize()
                    local textSize = KeyBind_Display.TextBounds.X
                    local totalWidth = 5 + 17 + 8 + textSize + 5 -- 5(margem) + 17(ícone) + 8(espaço) + texto + 5(margem)
                    Holver_F.Size = UDim2.new(0, math.max(45, totalWidth), 0, 25)
                end
                
                -- Função para atualizar o display do KeyBind
                function UpdateDisplay()
                    KeyBind_Display.Text = Value
                    UpdateHolderSize()
                end
                
                -- Conexão do input para detectar teclas
                local InputConnection
                function StartListening()
                    --KeyBind.ActiveK = true
                    KeyBind_Display.Text = "..."
                    UpdateHolderSize()
                    
                    TweenService:Create(Holver_F, TweenInfo.new(0.15), {
                        BackgroundColor3 = Themes.Colors.Primary
                    }):Play()
                    
                    TweenService:Create(Title_KeyBind, TweenInfo.new(0.15), {
                        TextTransparency = 0.4
                    }):Play()
                    
                    -- Remove conexão anterior se existir
                    if InputConnection then
                        InputConnection:Disconnect()
                    end
                    
                    -- Cria nova conexão para capturar input
                    InputConnection = game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
                        if gameProcessed then return end
                        
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            -- Verifica se a tecla é permitida
                            if IsKeyAllowed(input.KeyCode) then
                                CurrentKey = input.KeyCode
                                Value = FormatKeyName(input.KeyCode)
                                
                                UpdateDisplay()
                                
                                -- Sai do modo de escuta
                                ActiveK = false
                                
                                TweenService:Create(Holver_F, TweenInfo.new(0.15), {
                                    BackgroundColor3 = Themes.Colors.Secondary
                                }):Play()
                                
                                if not HoverK then
                                    TweenService:Create(Title_KeyBind, TweenInfo.new(0.15), {
                                        TextTransparency = 0.4
                                    }):Play()
                                end
                                
                                -- Chama o callback
                                KeyBind.Options.Callback(Value, CurrentKey)
                            else
                                -- Tecla não permitida, mantém no modo de escuta
                                KeyBind_Display.Text = "Invalid"
                                UpdateHolderSize()
                                wait(0.5)
                                KeyBind_Display.Text = "..."
                                UpdateHolderSize()
                                return
                            end
                            
                            -- Desconecta a conexão
                            if InputConnection then
                                InputConnection:Disconnect()
                                InputConnection = nil
                            end
                        end
                    end)
                end
                
                -- Conexão para executar o KeyBind quando a tecla for pressionada
                local KeyConnection
                function ConnectKeyListener()
                    if KeyConnection then
                        KeyConnection:Disconnect()
                    end
                    
                    KeyConnection = game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
                        if gameProcessed then return end
                        
                        if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == CurrentKey then
                            -- Executa a função do KeyBind
                            KeyBind:Callback()
                        end
                    end)
                end
                
                -- Evento de clique para iniciar a escuta
                OnClick.MouseButton1Click:Connect(function()
                    if not ActiveK then
                        StartListening()
                    end
                end)
                
                -- Função para executar o callback do KeyBind
                function KeyBind:Callback()
                    spawn(function()
                        KeyBind.Options.Callback(Value, CurrentKey)
                    end)
                end
                
                -- Funções públicas para controle externo
                function KeyBind:SetKey(keyName)
                    local keyCode = Enum.KeyCode[keyName]
                    if keyCode and IsKeyAllowed(keyCode) then
                        CurrentKey = keyCode
                        Value = FormatKeyName(keyCode)
                        UpdateDisplay()
                        ConnectKeyListener()
                    end
                end
                
                function KeyBind:GetKey()
                    return Value, CurrentKey
                end
                
                function KeyBind:Destroy()
                    if InputConnection then
                        InputConnection:Disconnect()
                    end
                    if KeyConnection then
                        KeyConnection:Disconnect()
                    end
                    KeyBind_F:Destroy()
                end
                
                -- Inicializa o listener da tecla
                ConnectKeyListener()
                UpdateDisplay()
                
                if Flags then
					Lib.Options[Flags] = KeyBind
				end
                
                return KeyBind
            end
            
            function Section:Dropdown(Flags, Options)
                local Dropdown = {Options = Options}
                local SelectedValues
                local DropdownElements = {}
                local IsOpen = false
                
                if Dropdown.Options.MultiSelection then
                    SelectedValues = {}
                    
                    -- Verificar se há valores padrão definidos
                    if Dropdown.Options.Default then
                        if type(Dropdown.Options.Default) == "table" then
                            -- Para cada valor padrão, verificar se existe na lista de valores
                            for _, defaultValue in ipairs(Dropdown.Options.Default) do
                                if table.find(Dropdown.Options.Values, defaultValue) then
                                    table.insert(SelectedValues, defaultValue)
                                end
                            end
                        else
                            -- Se for um valor único, verificar se existe na lista
                            if table.find(Dropdown.Options.Values, Dropdown.Options.Default) then
                                table.insert(SelectedValues, Dropdown.Options.Default)
                            end
                        end
                    end
                else
                    -- Para seleção única
                    if Dropdown.Options.Default and table.find(Dropdown.Options.Values, Dropdown.Options.Default) then
                        SelectedValues = Dropdown.Options.Default
                    else
                        SelectedValues = Dropdown.Options.Values[1] or ""
                    end
                end
                
                local Dropdown_F = CreateElement("Frame", {
                    Name = Dropdown.Options.Name,
                    Size = UDim2.new(1, -20, 0, 30),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Section_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(0, 8),
                    Parent = Dropdown_F
                })
                
                CreateElement("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Thickness = 1,
                    Color = Themes.Colors.Stroke,
                    Parent = Dropdown_F,
                })
                
                local Title_F = CreateElement("Frame", {
                    Name = "Title_".. Dropdown.Options.Name,
                    Size = UDim2.new(1, 0, 0, 30),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = false,
                    Parent = Dropdown_F
                })
                
                local LINE = CreateElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1),
                    AnchorPoint = Vector2.new(1, 1),
                    Position = UDim2.new(1, 0, 1, 0),
                    BackgroundColor3 = Themes.Colors.Stroke,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = false,
                    ClipsDescendants = true,
                    Parent = Title_F
                })
                
                -- Função para formatar o texto de seleção
                function GetSelectedText()
                    if Dropdown.Options.MultiSelection then
                        if #SelectedValues > 0 then
                            return table.concat(SelectedValues, ", ")
                        else
                            return "None"
                        end
                    else
                        return tostring(SelectedValues)
                    end
                end
                
                -- Função para obter o valor para o callback (STRING com nomes separados por vírgula)
                function GetCallbackValue()
                    if Dropdown.Options.MultiSelection then
                        if #SelectedValues > 0 then
                            return table.concat(SelectedValues, ", ")
                        else
                            return ""
                        end
                    else
                        return tostring(SelectedValues)
                    end
                end
                
                local Title_Dropdown = CreateElement("TextLabel", {
                    Name = "Title_Dropdown",
                    Size = UDim2.new(1, -30, 0, 13),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Dropdown.Options.Name.. ": ".. GetSelectedText(),
                    TextColor3 = Themes.Colors.Text,
                    TextTransparency = 0.4,
                    TextScaled = false,
                    TextSize = 13,
                    Font = Enum.Font.Gotham,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Title_F
                })
            
                local Icon = CreateElement("ImageLabel", {
                    Name = "Icon",
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    ImageColor3 = Themes.Colors.Image,
                    Image = assets.dropdown,
                    ImageTransparency = 0.4,
                    Size = UDim2.fromOffset(13, 13),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -8, 0.5, 0),
                    Parent = Title_F,
                })
                
                local OnClick = CreateElement("TextButton", {
                    Name = "OnClick",
                    Parent = Title_F,
                    BackgroundTransparency = 1.000,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    AutoButtonColor = false,
                    Text = "",
                    TextSize = 0.000,
                })
                
                -- CONTENT DROPDOWN
                
                local Content_Dropdown_F = CreateElement("Frame", {
                    Name = "Content_".. Dropdown.Options.Name,
                    Size = UDim2.new(1, 0, 0, 0),
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.new(0, 0, 1, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Dropdown_F
                })
                
                local UIListLayout = CreateElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 8),
                    
                    Parent = Content_Dropdown_F
                })
                
                CreateElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8),
                    Parent = Content_Dropdown_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(0, 8),
                    Parent = Content_Dropdown_F
                })
                
                -- Variáveis para animação
                local AnimationConnection
                local CurrentTween
                
                -- Função para atualizar o título do dropdown
                function UpdateTitle()
                    Title_Dropdown.Text = Dropdown.Options.Name.. ": ".. GetSelectedText()
                end
                
                -- Função para executar o callback
                function ExecuteCallback()
                    if Dropdown.Options.Callback then
                        task.spawn(function()
                            -- SEMPRE envia uma STRING, nunca uma table
                            local callbackValue = GetCallbackValue()
                            Dropdown.Options.Callback(callbackValue)
                        end)
                    end
                end
                
                -- Função para animar a abertura/fechamento do dropdown
                function AnimateDropdown(open)
                    if CurrentTween then
                        CurrentTween:Cancel()
                    end
                    
                    -- Animar a rotação do ícone
                    TweenService:Create(Icon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Rotation = open and 90 or 0
                    }):Play()
                    
                    -- Calcular tamanho do conteúdo
                    local contentSize = UIListLayout.AbsoluteContentSize.Y
                    local targetHeight = open and (30 + contentSize + 16) or 30
                    local contentTargetHeight = open and (contentSize + 16) or 0
                    
                    -- Animar a altura do dropdown
                    CurrentTween = TweenService:Create(Dropdown_F, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(1, -20, 0, targetHeight)
                    })
                    CurrentTween:Play()
                    
                    -- Animar a altura do conteúdo
                    TweenService:Create(Content_Dropdown_F, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(1, 0, 0, contentTargetHeight)
                    }):Play()
                    
                    -- Animar a linha divisora
                    LINE.Visible = true
                    TweenService:Create(LINE, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundTransparency = open and 0 or 1
                    }):Play()
                end
            
                -- Função para criar um item do dropdown de forma otimizada
                function CreateDropdownItem(value, index)
                    local Button_F = CreateElement("Frame", {
                        Name = tostring(value),
                        Size = UDim2.new(1, 0, 0, 30),
                        AnchorPoint = Vector2.new(0, 0),
                        Position = UDim2.new(0, 0, 0, 0),
                        BackgroundColor3 = Themes.Colors.Secondary,
                        BackgroundTransparency = 0,
                        BorderSizePixel = 0,
                        Visible = true,
                        ClipsDescendants = true,
                        LayoutOrder = index,
                        Parent = Content_Dropdown_F
                    })
                    
                    table.insert(DropdownElements, Button_F)
                    
                    CreateElement("UICorner", {
                        CornerRadius = UDim.new(0, 8),
                        Parent = Button_F
                    })
                    
                    CreateElement("UIStroke", {
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                        Thickness = 1,
                        Color = Themes.Colors.Stroke,
                        Parent = Button_F,
                    })
                    
                    local Title_Button = CreateElement("TextLabel", {
                        Name = "Title_Button",
                        Size = UDim2.new(1, Options.MultiSelection and -50 or -30, 0, 13),
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.new(0, 8, 0.5, 0),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Visible = true,
                        ClipsDescendants = true,
                        
                        Text = tostring(value),
                        TextColor3 = Themes.Colors.Text,
                        TextTransparency = 0.4,
                        TextScaled = true,
                        TextSize = 14,
                        Font = Enum.Font.Gotham,
                        TextWrapped = true,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center,
                        
                        Parent = Button_F
                    })
                    
                    -- Elementos para multi seleção
                    if Dropdown.Options.MultiSelection then
                        local InvisCircle = CreateElement("Frame", {
                            Name = "InvisCircle",
                            Size = UDim2.fromOffset(11, 11),
                            AnchorPoint = Vector2.new(1, 0.5),
                            Position = UDim2.new(1, -8, 0.5, 0),
                            BackgroundColor3 = Themes.Colors.Secondary,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Visible = true,
                            ClipsDescendants = true,
                            Parent = Button_F
                        })
                        
                        CreateElement("UICorner", {
                            CornerRadius = UDim.new(1, 0),
                            Parent = InvisCircle
                        })
                        
                        CreateElement("UIStroke", {
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            Thickness = 1,
                            Color = Themes.Colors.Stroke,
                            Parent = InvisCircle,
                        })
                        
                        local CenterBall = CreateElement("Frame", {
                            Name = "CenterBall",
                            Size = UDim2.fromOffset(8, 8),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.new(0.5, 0, 0.5, 0),
                            BackgroundColor3 = Themes.Colors.Text,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Visible = true,
                            ClipsDescendants = true,
                            Parent = InvisCircle
                        })
                        
                        CreateElement("UICorner", {
                            CornerRadius = UDim.new(1, 0),
                            Parent = CenterBall
                        })
                        
                        -- Verificar se está selecionado
                        local isSelected = table.find(SelectedValues, value) ~= nil
                        CenterBall.BackgroundTransparency = isSelected and 0.5 or 1
                        Title_Button.TextTransparency = isSelected and 0 or 0.4
                    else
                        -- Para seleção única
                        local isSelected = SelectedValues == value
                        Title_Button.TextTransparency = isSelected and 0 or 0.4
                    end
                    
                    local ItemOnClick = CreateElement("TextButton", {
                        Name = "OnClick",
                        Parent = Button_F,
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        AutoButtonColor = false,
                        Text = "",
                        TextSize = 0.000,
                    })
                    
                    -- Clique no item
                    ItemOnClick.MouseButton1Click:Connect(function()
                        if Dropdown.Options.MultiSelection then
                            local index = table.find(SelectedValues, value)
                            if index then
                                table.remove(SelectedValues, index)
                            else
                                table.insert(SelectedValues, value)
                            end
                            
                            -- Animar a bolinha
                            local InvisCircle = Button_F:FindFirstChild("InvisCircle")
                            if InvisCircle then
                                local CenterBall = InvisCircle:FindFirstChild("CenterBall")
                                if CenterBall then
                                    local isSelected = table.find(SelectedValues, value) ~= nil
                                    TweenService:Create(CenterBall, TweenInfo.new(0.15), {
                                        BackgroundTransparency = isSelected and 0.5 or 1
                                    }):Play()
                                    
                                    TweenService:Create(Title_Button, TweenInfo.new(0.15), {
                                        TextTransparency = isSelected and 0 or 0.4
                                    }):Play()
                                end
                            end
                            
                            UpdateTitle()
                            ExecuteCallback() -- Executa callback após mudança
                        else
                            SelectedValues = value
                            
                            -- Fechar dropdown após seleção
                            IsOpen = false
                            AnimateDropdown(false)
                            
                            -- Atualizar todos os itens
                            for _, item in pairs(Content_Dropdown_F:GetChildren()) do
                                if item:IsA("Frame") and item.Name ~= "UIListLayout" and item.Name ~= "UIPadding" and item.Name ~= "UICorner" then
                                    local itemTitle = item:FindFirstChild("Title_Button")
                                    if itemTitle then
                                        local isSelected = item.Name == tostring(value)
                                        TweenService:Create(itemTitle, TweenInfo.new(0.15), {
                                            TextTransparency = isSelected and 0 or 0.4
                                        }):Play()
                                    end
                                end
                            end
                            
                            UpdateTitle()
                            ExecuteCallback() -- Executa callback após seleção
                        end
                    end)
                    
                    return Button_F
                end
                
                -- Função para criar os itens do dropdown de forma otimizada
                function CreateDropdownItems()
                    -- Limpar elementos existentes
                    for _, element in pairs(DropdownElements) do
                        if element and element.Parent then
                            element:Destroy()
                        end
                    end
                    DropdownElements = {}
                    
                    -- Criar novos elementos de forma otimizada
                    for i, value in ipairs(Dropdown.Options.Values) do
                        CreateDropdownItem(value, i)
                    end
                end
                
                -- Função para alternar o dropdown
                function ToggleDropdown()
                    IsOpen = not IsOpen
                    
                    if IsOpen then
                        CreateDropdownItems()
                        -- Esperar um frame para o UIListLayout calcular o tamanho
                        task.wait()
                    end
                    
                    AnimateDropdown(IsOpen)
                end
                
                -- Conectar eventos do UIListLayout para atualização dinâmica
                if AnimationConnection then
                    AnimationConnection:Disconnect()
                end
                
                AnimationConnection = UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    if IsOpen then
                        -- Recalcular e animar para o novo tamanho
                        local contentSize = UIListLayout.AbsoluteContentSize.Y
                        local targetHeight = 30 + contentSize + 16
                        
                        if CurrentTween then
                            CurrentTween:Cancel()
                        end
                        
                        CurrentTween = TweenService:Create(Dropdown_F, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = UDim2.new(1, -20, 0, targetHeight)
                        })
                        CurrentTween:Play()
                        
                        TweenService:Create(Content_Dropdown_F, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = UDim2.new(1, 0, 0, contentSize + 16)
                        }):Play()
                    end
                end)
                
                local HoverD = false
                local ActiveD = false
                
                -- Eventos de interação
                OnClick.MouseEnter:Connect(function()
                    HoverD = true
                    if not ActiveD then
                        TweenService:Create(Title_Dropdown, TweenInfo.new(0.15), {
                            TextTransparency = 0
                        }):Play()
                        TweenService:Create(Icon, TweenInfo.new(0.15), {
                            ImageTransparency = 0
                        }):Play()
                    end
                end)
                
                OnClick.MouseLeave:Connect(function()
                    HoverD = false
                    if not ActiveD then 
                        TweenService:Create(Title_Dropdown, TweenInfo.new(0.15), {
                            TextTransparency = 0.4
                        }):Play()
                        TweenService:Create(Icon, TweenInfo.new(0.15), {
                            ImageTransparency = 0.4
                        }):Play()
                    end
                end)
                
                OnClick.MouseButton1Click:Connect(function()
                    ToggleDropdown()
                end)
                
                -- Funções do dropdown
                function Dropdown:AddValue(value)
                    table.insert(Dropdown.Options.Values, value)
                    if IsOpen then
                        CreateDropdownItems()
                    end
                    UpdateTitle()
                    ExecuteCallback()
                end
                
                function Dropdown:DelValue(value)
                    local index = table.find(Dropdown.Options.Values, value)
                    if index then
                        table.remove(Dropdown.Options.Values, index)
                        
                        -- Remover da seleção se estiver selecionado
                        if Options.MultiSelection then
                            local selectedIndex = table.find(SelectedValues, value)
                            if selectedIndex then
                                table.remove(SelectedValues, selectedIndex)
                            end
                        elseif SelectedValues == value then
                            SelectedValues = Dropdown.Options.Values[1] or ""
                        end
                        
                        if IsOpen then
                            CreateDropdownItems()
                        end
                        UpdateTitle()
                        ExecuteCallback()
                    end
                end
                
                function Dropdown:EditValue(oldValue, newValue)
                    local index = table.find(Dropdown.Options.Values, oldValue)
                    if index then
                        Dropdown.Options.Values[index] = newValue
                        
                        -- Atualizar seleção se necessário
                        if Dropdown.Options.MultiSelection then
                            local selectedIndex = table.find(SelectedValues, oldValue)
                            if selectedIndex then
                                SelectedValues[selectedIndex] = newValue
                            end
                        elseif SelectedValues == oldValue then
                            SelectedValues = newValue
                        end
                        
                        if IsOpen then
                            CreateDropdownItems()
                        end
                        UpdateTitle()
                        ExecuteCallback()
                    end
                end
                
                function Dropdown:GetValue()
                    -- Retorna STRING para MultiSelection, não table
                    return GetCallbackValue()
                end
                
                function Dropdown:SetValue(value)
                    if Dropdown.Options.MultiSelection then
                        if type(value) == "table" then
                            SelectedValues = value
                        elseif type(value) == "string" then
                            -- Se for string, separar por vírgula
                            if value == "" then
                                SelectedValues = {}
                            else
                                SelectedValues = {}
                                for item in value:gmatch("[^,]+") do
                                    table.insert(SelectedValues, item:match("^%s*(.-)%s*$"))
                                end
                            end
                        else
                            SelectedValues = {value}
                        end
                    else
                        SelectedValues = value
                    end
                    
                    UpdateTitle()
                    
                    if IsOpen then
                        CreateDropdownItems()
                    end
                    
                    ExecuteCallback()
                end
                
                function Dropdown:SetName(newName)
                    Dropdown.Options.Name = newName
                    UpdateTitle()
                end
                
                -- Inicializar
                CreateDropdownItems()
                UpdateTitle()
                
                -- Executar callback inicial
                task.spawn(function()
                    wait(0.1)
                    ExecuteCallback()
                end)
                
                -- Fechar dropdown inicialmente
                Content_Dropdown_F.Size = UDim2.new(1, 0, 0, 0)
                
                if Flags then
                    Lib.Options[Flags] = Dropdown
                end
                
                return Dropdown
            end
            
            function Section:Slider(Flags, Options)
                local Slider = {Options = Options}
                local Value = Options.Default
                local dragging = false
                local finalValue
            
                local DisplayMethods = {
                    Hundredths = function(sliderValue, precision)
                        return string.format("%.2f", sliderValue)
                    end,
                    Tenths = function(sliderValue, precision)
                        return string.format("%.1f", sliderValue)
                    end,
                    Round = function(sliderValue, precision)
                        if precision then
                            return string.format("%." .. precision .. "f", sliderValue)
                        else
                            return tostring(math.round(sliderValue))
                        end
                    end,
                    Degrees = function(sliderValue, precision)
                        local formattedValue = precision and string.format("%." .. precision .. "f", sliderValue) or tostring(sliderValue)
                        return formattedValue .. "°"
                    end,
                    Percent = function(sliderValue, precision)
                        local percentage = (sliderValue - Options.Minimum) / (Options.Maximum - Options.Minimum) * 100
                        return precision and string.format("%." .. precision .. "f", percentage) .. "%" or tostring(math.round(percentage)) .. "%"
                    end,
                    Value = function(sliderValue, precision)
                        return precision and string.format("%." .. precision .. "f", sliderValue) or tostring(sliderValue)
                    end
                }
            
                local ValueDisplayMethod = DisplayMethods[Slider.Options.DisplayMethod] or DisplayMethods.Value
                
                local Slider_F = CreateElement("Frame", {
                    Name = Slider.Options.Name,
                    Size = UDim2.new(1, -20, 0, 30),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = false,
                    Parent = Section_F
                })
                
                local Title_Slider = CreateElement("TextLabel", {
                    Name = "Title_Slider",
                    Size = UDim2.new(0, 0, 0, 13),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = false,
                    
                    Text = Slider.Options.Name,
                    TextColor3 = Themes.Colors.Text,
                    TextTransparency = 0.4,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Enum.Font.Gotham,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Slider_F
                })
                
                local Display_F = CreateElement("Frame", {
                    Name = "Display_F",
                    Size = UDim2.new(0, 0, 0, 20),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -8, 0.5, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Slider_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(0, 4),
                    Parent = Display_F
                })
                        
                CreateElement("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Thickness = 1,
                    Color = Themes.Colors.Stroke,
                    Parent = Display_F,
                })
                
                CreateElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                    PaddingTop = UDim.new(0, 4),
                    PaddingBottom = UDim.new(0, 4),
                    Parent = Display_F
                })
                
                local Display = CreateElement("TextBox", {
                    Name = "Display",
                    Size = UDim2.new(0, 0, 1, 0),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    
                    Text = ValueDisplayMethod(Options.Default, Options.Precision),
                    TextColor3 = Themes.Colors.Text,
                    TextTransparency = 0.4,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    
                    PlaceholderText = ValueDisplayMethod(Options.Default, Options.Precision),
                    PlaceholderColor3 = Themes.Colors.Text,
                    
                    ClearTextOnFocus = false,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Display_F
                })
                
                local Bg_Line = CreateElement("Frame", {
                    Name = "Bg_Line",
                    Size = UDim2.new(0, 0, 0, 3),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 0, 0.5, 0),
                    BackgroundColor3 = Themes.Colors.BgLine,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = false,
                    Parent = Slider_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(1, 0),
                    Parent = Bg_Line
                })
                
                local Fill_Line = CreateElement("Frame", {
                    Name = "Fill_Line",
                    Size = UDim2.new(0, 0, 1, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 0, 0.5, 0),
                    BackgroundColor3 = Themes.Colors.LineFill,
                    BackgroundTransparency = 0.2,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = false,
                    Parent = Bg_Line
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(1, 0),
                    Parent = Fill_Line
                })
                
                local Ball_Slider = CreateElement("TextButton", {
                    Name = "Ball_Slider",
                    Parent = Bg_Line,
                    BackgroundColor3 = Themes.Colors.Ball,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Size = UDim2.fromOffset(12, 12),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0, 0, 0.5, 0),
                    AutoButtonColor = false,
                    Active = true,
                    Text = "",
                    TextSize = 0.000,
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(1, 0),
                    Parent = Ball_Slider
                })
                
                -- Adiciona efeito de hover na bola
                CreateElement("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Thickness = 2,
                    Color = Themes.Colors.Stroke,
                    Transparency = 0.8,
                    Parent = Ball_Slider,
                })
                
                local Hover_Title = CreateElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 30),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Title_Slider
                })
                
                local HoverS = false
                local ActiveS = false
                
                Hover_Title.MouseEnter:Connect(function()
                    HoverS = true
                    if not ActiveS then
                        TweenService:Create(Title_Slider, TweenInfo.new(0.15), {
                            TextTransparency = 0
                        }):Play()
                    end
                end)
                
                Hover_Title.MouseLeave:Connect(function()
                    HoverS = false
                    if not ActiveS then 
                        TweenService:Create(Title_Slider, TweenInfo.new(0.15), {
                            TextTransparency = 0.4
                        }):Play()
                    end
                end)
            
                function SetValue(val, ignorecallback)
                    print("DEBUG - Slider.Options:", Slider.Options)
                    print("DEBUG - Minimum:", Slider.Options.Minimum, "Maximum:", Slider.Options.Maximum)
                
                    local posXScale
                    
                    if typeof(val) == "Instance" then
                        local input = val
                        posXScale = math.clamp((input.Position.X - Bg_Line.AbsolutePosition.X) / Bg_Line.AbsoluteSize.X, 0, 1)
                    else
                        local value = val
                        
                        -- VERIFICAÇÕES DE SEGURANÇA ADICIONADAS
                        local min = Slider.Options.Minimum or 0
                        local max = Slider.Options.Maximum or 100
                        
                        -- Garantir que são números válidos
                        if type(min) ~= "number" then min = 0 end
                        if type(max) ~= "number" then max = 100 end
                        
                        -- Evitar divisão por zero e valores inválidos
                        local range = max - min
                        if range <= 0 then
                            range = 100  -- Valor padrão seguro
                            min = 0
                            max = 100
                        end
                        
                        posXScale = (value - min) / range
                        posXScale = math.clamp(posXScale, 0, 1) -- Garantir que está entre 0 e 1
                    end
            
                    local ballPosition = posXScale * Bg_Line.AbsoluteSize.X
                    Ball_Slider.Position = UDim2.new(0, ballPosition, 0.5, 0)
                    Fill_Line.Size = UDim2.new(posXScale, 0, 1, 0)
            
                    finalValue = posXScale * (Slider.Options.Maximum - Slider.Options.Minimum) + Slider.Options.Minimum
                    
                    -- Aplica precisão se necessário
                    if Slider.Options.Precision and Slider.Options.Precision > 0 then
                        local multiplier = 10 ^ Slider.Options.Precision
                        finalValue = math.floor(finalValue * multiplier + 0.5) / multiplier
                    else
                        finalValue = math.round(finalValue)
                    end
            
                    Display.Text = ValueDisplayMethod(finalValue, Slider.Options.Precision)
            
                    if not ignorecallback then
                        task.spawn(function()
                            if Slider.Options.Callback then
                                Slider.Options.Callback(finalValue)
                            end
                        end)
                    end
            
                    Slider.Value = finalValue
                end
            
                SetValue(Slider.Options.Default, true)
            
                Ball_Slider.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = true
                        ActiveS = true
                        TweenService:Create(Ball_Slider, TweenInfo.new(0.1), {
                            Size = UDim2.fromOffset(14, 14)
                        }):Play()
                        SetValue(input)
                    end
                end)
            
                Ball_Slider.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = false
                        ActiveS = false
                        TweenService:Create(Ball_Slider, TweenInfo.new(0.1), {
                            Size = UDim2.fromOffset(12, 12)
                        }):Play()
                    end
                end)
            
                -- Permite clicar em qualquer lugar na linha
                Bg_Line.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = true
                        ActiveS = true
                        SetValue(input)
                    end
                end)
            
                Bg_Line.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = false
                        ActiveS = false
                    end
                end)
            
                Display.FocusLost:Connect(function(enterPressed)
                    if enterPressed then
                        local inputText = Display.Text
                        local value, isPercent = inputText:match("^(%-?%d+%.?%d*)(%%?)$")
            
                        if value then
                            value = tonumber(value)
                            isPercent = isPercent == "%"
            
                            if isPercent then
                                value = Slider.Options.Minimum + (value / 100) * (Slider.Options.Maximum - Slider.Options.Minimum)
                            end
            
                            local newValue = math.clamp(value, Slider.Options.Minimum, Slider.Options.Maximum)
                            SetValue(newValue)
                        else
                            Display.Text = ValueDisplayMethod(finalValue, Slider.Options.Precision)
                        end
                    end
                end)
            
                -- Efeitos de hover no display
                Display_F.MouseEnter:Connect(function()
                    TweenService:Create(Display_F, TweenInfo.new(0.15), {
                        BackgroundTransparency = 0.1
                    }):Play()
                    TweenService:Create(Display, TweenInfo.new(0.15), {
                        TextTransparency = 0.2
                    }):Play()
                end)
            
                Display_F.MouseLeave:Connect(function()
                    TweenService:Create(Display_F, TweenInfo.new(0.15), {
                        BackgroundTransparency = 0
                    }):Play()
                    TweenService:Create(Display, TweenInfo.new(0.15), {
                        TextTransparency = 0.4
                    }):Play()
                end)
            
                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        SetValue(input)
                    end
                end)
                
                function UpdateLayout()
                    local Title_Size = Title_Slider.AbsoluteSize
                    local Display_Size = Display_F.AbsoluteSize
                    
                    -- Posiciona a linha após o título com espaçamento adequado
                    Bg_Line.Position = UDim2.new(0, Title_Size.X + 12, 0.5, 0)
                    
                    -- Calcula a largura disponível para a linha (entre título e display)
                    local availableWidth = Slider_F.AbsoluteSize.X - Title_Size.X - Display_Size.X - 12 - 15
                    Bg_Line.Size = UDim2.new(0, math.max(availableWidth, 80), 0, 3) -- Mínimo de 80 pixels
                    
                    -- Garante que o display fique fixo à direita
                    Display_F.Position = UDim2.new(1, 0, 0.5, 0)
            
                    SetValue(finalValue or Slider.Options.Default, true)
                end
                
                -- Atualiza o layout quando o texto do display muda
                Display:GetPropertyChangedSignal("Text"):Connect(function()
                    wait() -- Espera um frame para o texto atualizar
                    UpdateLayout()
                end)
                
                task.defer(function()
                    wait(0.1)
                    UpdateLayout()
                end)
            
                -- Funções públicas
                function Slider:SetValue(value)
                    SetValue(value, true)
                end
            
                function Slider:GetValue()
                    return finalValue
                end
            
                function Slider:UpdateName(Name)
                    Title_Slider.Text = Name
                    UpdateLayout()
                end
            
                function Slider:SetVisibility(State)
                    Slider_F.Visible = State
                end
                
                if Flags then
                    Lib.Options[Flags] = Slider
                end
            
                return Slider
            end

            function Section:Input(Flags, Options)
                local Input = {Options = Options}
                
                local Input_F = CreateElement("Frame", {
                    Name = Input.Options.Name,
                    Size = UDim2.new(1, -20, 0, 30),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Section_F
                })
                
                local Title_Input = CreateElement("TextLabel", {
                    Name = "Title_Input",
                    Size = UDim2.new(0, 0, 0, 13),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = false,
                    
                    Text = Input.Options.Name,
                    TextColor3 = Themes.Colors.Text,
                    TextTransparency = 0.4,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Enum.Font.Gotham,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Input_F
                })
                
                local Input_Container = CreateElement("Frame", {
                    Name = "Input_Container",
                    Size = UDim2.new(0, 0, 0, 24),
                    AnchorPoint = Vector2.new(1, 0.5),
                    AutomaticSize = Enum.AutomaticSize.X,
                    Position = UDim2.new(1, -3, 0.5, 0),
                    BackgroundColor3 = Themes.Colors.BgLine,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Input_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(0, 5),
                    Parent = Input_Container
                })
                        
                CreateElement("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Thickness = 1,
                    Color = Themes.Colors.Stroke,
                    Parent = Input_Container,
                })
                
                CreateElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8),
                    Parent = Input_Container
                })
                
                local Input_Display = CreateElement("TextBox", {
                    Name = "Input_Display",
                    Size = UDim2.new(0, 0, 1, 0),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    
                    Text = Input.Options.Default or "",
                    TextColor3 = Themes.Colors.Text,
                    TextSize = 10,
                    Font = Enum.Font.Gotham,
                    
                    PlaceholderText = Input.Options.Placeholder or "",
                    PlaceholderColor3 = Themes.Colors.Text,
                    
                    ClearTextOnFocus = Input.Options.ClearText or false,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Input_Container
                })
                
                local OnClick = CreateElement("TextButton", {
                    Name = "OnClick",
                    Parent = Title_Input,
                    BackgroundTransparency = 1.000,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 30),
                    AutoButtonColor = false,
                    Text = "",
                    TextSize = 0.000,
                })
                
                -- Função para atualizar o layout do input automaticamente
                function UpdateInputLayout()
                    local textSize = game:GetService("TextService"):GetTextSize(
                        Input_Display.Text,
                        Input_Display.TextSize,
                        Input_Display.Font,
                        Vector2.new(10000, Input_Display.AbsoluteSize.Y) -- Largura máxima muito grande
                    )
                    
                    -- Tamanho mínimo e máximo
                    local minWidth = 50
                    local maxWidth = 200
                    local calculatedWidth = math.clamp(textSize.X + 20, minWidth, maxWidth) -- +20 para padding
                    
                    Input_Container.Size = UDim2.new(0, calculatedWidth, 0, 24)
                end
                
                -- Conectar para atualizar automaticamente quando o texto mudar
                Input_Display:GetPropertyChangedSignal("Text"):Connect(function()
                    task.wait() -- Espera um frame para o texto ser renderizado
                    UpdateInputLayout()
                end)
                
                -- Conectar para atualizar quando o foco mudar (placeholder vs texto real)
                Input_Display.Focused:Connect(function()
                    task.wait()
                    UpdateInputLayout()
                end)
                
                Input_Display.FocusLost:Connect(function()
                    task.wait()
                    UpdateInputLayout()
                end)
                
                -- Atualizar layout inicial
                task.defer(function()
                    task.wait(0.1)
                    UpdateInputLayout()
                end)
                
                local HoverI = false
                local ActiveI = false
                local Value = Input.Options.Default or ""
                
                -- Função para executar o callback
                function ExecuteCallback()
                    local currentValue = Input_Display.Text
                    Value = currentValue
                    
                    if Input.Options.Callback then
                        task.spawn(function()
                            Input.Options.Callback(currentValue)
                        end)
                    end
                end
                
                -- Executa o callback inicial
                if Input.Options.Callback and Input.Options.Default then
                    task.spawn(function()
                        Input.Options.Callback(Value)
                    end)
                end
                
                OnClick.MouseEnter:Connect(function()
                    HoverI = true
                    if not ActiveI then
                        TweenService:Create(Title_Input, TweenInfo.new(0.15), {
                            TextTransparency = 0
                        }):Play()
                    end
                end)
                
                OnClick.MouseLeave:Connect(function()
                    HoverI = false
                    if not ActiveI then 
                        TweenService:Create(Title_Input, TweenInfo.new(0.15), {
                            TextTransparency = 0.4
                        }):Play()
                    end
                end)
                
                -- Clique no título executa o callback
                OnClick.MouseButton1Click:Connect(function()
                    ExecuteCallback()
                    
                    -- Efeito visual de clique
                    ActiveI = true
                    TweenService:Create(Title_Input, TweenInfo.new(0.1), {
                        TextTransparency = 0.2
                    }):Play()
                    wait(0.1)
                    TweenService:Create(Title_Input, TweenInfo.new(0.1), {
                        TextTransparency = 0
                    }):Play()
                    ActiveI = false
                end)
                
                -- Enter no input executa o callback
                Input_Display.FocusLost:Connect(function(enterPressed)
                    if enterPressed then
                        ExecuteCallback()
                    end
                end)
                
                -- Efeitos de hover no container do input
                Input_Container.MouseEnter:Connect(function()
                    TweenService:Create(Input_Container, TweenInfo.new(0.15), {
                        BackgroundTransparency = 0.1
                    }):Play()
                end)
                
                Input_Container.MouseLeave:Connect(function()
                    TweenService:Create(Input_Container, TweenInfo.new(0.15), {
                        BackgroundTransparency = 0
                    }):Play()
                end)
                
                -- Função para atualizar o layout quando o texto muda
                function UpdateInputLayout()
                    -- Garante que o container tenha um tamanho mínimo
                    local minWidth = 50
                    if Input_Container.AbsoluteSize.X < minWidth then
                        Input_Container.Size = UDim2.new(0, minWidth, 0, 24)
                    end
                end
                
                -- Atualiza o layout quando o texto muda
                Input_Display:GetPropertyChangedSignal("Text"):Connect(function()
                    wait() -- Espera um frame para o texto atualizar
                    UpdateInputLayout()
                end)
                
                -- Atualiza layout inicial
                task.defer(function()
                    wait(0.1)
                    UpdateInputLayout()
                end)
                
                function Input:UpdateLayout()
                    UpdateInputLayout()
                end

                function Input:SetValue(newValue)
                    Input_Display.Text = tostring(newValue)
                    Value = tostring(newValue)
                    task.wait(0.1) 
                    UpdateInputLayout()
                    ExecuteCallback()
                end
                
                function Input:GetValue()
                    return Input_Display.Text
                end
                
                function Input:UpdateName(Name)
                    Title_Input.Text = Name
                end
                
                function Input:SetVisibility(State)
                    Input_F.Visible = State
                end
                
                if Flags then
                    Lib.Options[Flags] = Input
                end
                
                return Input
            end
            
            function Section:Header(Flags, Options)
                local HeaderV = {Options = Options}
                
                local Header_F = CreateElement("Frame", {
                    Name = HeaderV.Options.Text,
                    Size = UDim2.new(1, -20, 0, 25),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Section_F
                })
                
                local Header = CreateElement("TextLabel", {
                    Name = "Header",
                    Size = UDim2.new(0, 0, 0, 13),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 0, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = false,
                    
                    Text = HeaderV.Options.Text,
                    TextColor3 = Themes.Colors.Text,
                    TextTransparency = 0,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Enum.Font.Gotham,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Header_F
                })
                
                function HeaderV:SetVisibility(bolean)
                    Header_F.Visible = bolean or true
                end
                
                function HeaderV:SetText(text)
                    HeaderV.Options.Text = text or "Header"
                    Header.Text = text or "Header"
                end
                
                if Flags then
					Lib.Options[Flags] = HeaderV
				end
                
                return HeaderV
            end
            
            function Section:Label(Flags, Options)
                local Label = {Options = Options}
                
                local Label_F = CreateElement("Frame", {
                    Name = Label.Options.Text,
                    Size = UDim2.new(1, -20, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Section_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(0, 5),
                    Parent = Label_F
                })
                
                CreateElement("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Thickness = 1,
                    Color = Themes.Colors.Stroke,
                    Parent = Label_F,
                })
                
                CreateElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8),
                    Parent = Label_F
                })
                
                local Label_Text = CreateElement("TextLabel", {
                    Name = "Label_Text",
                    Size = UDim2.new(0, 0, 0, 13),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = false,
                    
                    Text = Label.Options.Text,
                    TextColor3 = Themes.Colors.Text,
                    TextTransparency = 0.2,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Enum.Font.Gotham,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Label_F
                })
                
                function Label:SetText(text)
                    Label_Text.Text = text or "This is a small text label for more information. "
                    
                    -- Esperar um frame para o texto ser renderizado
                    task.spawn(function()
                        task.wait()
                        -- Calcular a altura do texto
                        local textSize = game:GetService("TextService"):GetTextSize(
                            Label_Text.Text,
                            Label_Text.TextSize,
                            Label_Text.Font,
                            Vector2.new(Label_Text.AbsoluteSize.X, math.huge)
                        )
                        
                        -- Ajustar a altura do label
                        Label_F.Size = UDim2.new(1, -20, 0, textSize.Y + 16) -- Texto + padding
                        Label_Text.Size = UDim2.new(1, 0, 0, textSize.Y)
                    end)
                end
                
                function Label:SetVisibility(state)
                    Label_F.Visible = state
                end
                
                if Flags then
					Lib.Options[Flags] = Label
				end
                
                return Label
            end
            
            function Section:Paragraph(Flags, Options)
                local Paragraph = {Options = Options}
                
                local Paragraph_F = CreateElement("Frame", {
                    Name = Paragraph.Options.Header,
                    Size = UDim2.new(1, -20, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Section_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(0, 8),
                    Parent = Paragraph_F
                })
                
                CreateElement("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Thickness = 1,
                    Color = Themes.Colors.Stroke,
                    Parent = Paragraph_F,
                })
                
                local HeaderTop_F = CreateElement("Frame", {
                    Name = "HeaderTop",
                    Size = UDim2.new(1, 0, 0, 27),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Paragraph_F
                })
                
                local Header = CreateElement("TextLabel", {
                    Name = "Header",
                    Size = UDim2.new(0, 0, 0, 13),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = false,
                    
                    Text = Paragraph.Options.Header,
                    TextColor3 = Themes.Colors.Text,
                    TextTransparency = 0.2,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Enum.Font.Gotham,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = HeaderTop_F
                })
                
                local Icon
                if Paragraph.Options.Icon and Paragraph.Options.Icon ~= "" and Paragraph.Options.Icon ~= " " then
                    local imageId = IconsSystem:GetIcon(Paragraph.Options.Icon)
                    if imageId and imageId ~= "" then
                        Icon = CreateElement("ImageLabel", {
                            Name = "Icon",
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            BackgroundTransparency = 1,
                            BorderColor3 = Color3.fromRGB(0, 0, 0),
                            BorderSizePixel = 0,
                            ImageColor3 = Themes.Colors.Image,
                            Image = "rbxassetid://" .. tostring(imageId),
                            ImageTransparency = 0.4,
                            Size = UDim2.fromOffset(13, 13),
                            AnchorPoint = Vector2.new(0, 0.5),
                            Position = UDim2.new(0, 8, 0.5, 0),
                            Parent = HeaderTop_F,
                        })
                        
                        Header.Position = UDim2.new(0, 23, 0.5, 0)
                    else
                        -- Se o ícone não for encontrado, não ajusta a posição
                        Header.Position = UDim2.new(0, 8, 0.5, 0)
                    end
                else
                    -- Sem ícone, posição normal
                    Header.Position = UDim2.new(0, 8, 0.5, 0)
                end
                
                local Content = CreateElement("Frame", {
                    Name = "Content",
                    Size = UDim2.new(1, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 27),
                    BackgroundColor3 = Themes.Colors.Secondary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Paragraph_F
                })
                
                CreateElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                    PaddingTop = UDim.new(0, 0),
                    PaddingBottom = UDim.new(0, 8),
                    Parent = Content
                })
                
                local ContentT = CreateElement("TextLabel", {
                    Name = "ContentText",
                    Size = UDim2.new(1, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Paragraph.Options.Content,
                    TextColor3 = Themes.Colors.Text,
                    TextTransparency = 0.4,
                    TextScaled = false,
                    TextSize = 10,
                    Font = Enum.Font.Gotham,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    
                    Parent = Content
                })

                ContentT:GetPropertyChangedSignal("Text"):Connect(function()
                    task.wait()
                    local textSize = game:GetService("TextService"):GetTextSize(
                        ContentT.Text,
                        ContentT.TextSize,
                        ContentT.Font,
                        Vector2.new(ContentT.AbsoluteSize.X, math.huge)
                    )
                    
                    Content.Size = UDim2.new(1, 0, 0, textSize.Y + 5)
                    ContentT.Size = UDim2.new(1, 0, 0, textSize.Y)
                    Paragraph_F.Size = UDim2.new(1, -20, 0, 27 + textSize.Y + 13)
                end)
            
                -- Função para atualizar o layout do ícone
                function UpdateIconLayout()
                    if Icon and Icon.Parent then
                        Header.Position = UDim2.new(0, 23, 0.5, 0)
                    else
                        Header.Position = UDim2.new(0, 8, 0.5, 0)
                    end
                end
            
                -- Funções públicas
                function Paragraph:SetHeader(newHeader)
                    Header.Text = newHeader or "Paragraph"
                    Paragraph_F.Name = newHeader or "Paragraph"
                end
            
                function Paragraph:SetVisibility(state)
                    Paragraph_F.Visible = state
                end
            
                function Paragraph:SetContent(newContent)
                    ContentT.Text = newContent or "This is the content of the paragraph."

                end
            
                function Paragraph:SetIcon(newIcon)
                    -- Remove ícone existente
                    if Icon then
                        Icon:Destroy()
                        Icon = nil
                    end
                    
                    -- Adiciona novo ícone se especificado e válido
                    if newIcon and newIcon ~= "" and newIcon ~= " " then
                        local imageId = IconsSystem:GetIcon(newIcon)
                        if imageId and imageId ~= "" then
                            Icon = CreateElement("ImageLabel", {
                                Name = "Icon",
                                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                BackgroundTransparency = 1,
                                BorderColor3 = Color3.fromRGB(0, 0, 0),
                                BorderSizePixel = 0,
                                ImageColor3 = Themes.Colors.Image,
                                Image = "rbxassetid://" .. tostring(imageId),
                                ImageTransparency = 0.4,
                                Size = UDim2.fromOffset(13, 13),
                                AnchorPoint = Vector2.new(0, 0.5),
                                Position = UDim2.new(0, 8, 0.5, 0),
                                Parent = HeaderTop_F,
                            })
                        end
                    end
                    
                    UpdateIconLayout()
                end
            
                function Paragraph:GetHeader()
                    return Header.Text
                end
            
                function Paragraph:GetContent()
                    return ContentT.Text
                end
            
                function Paragraph:GetIcon()
                    return Paragraph.Options.Icon
                end
            
                function Paragraph:Remove()
                    Paragraph_F:Destroy()
                end
            
                -- Atualiza layout inicial
                UpdateIconLayout()
                
                if Flags then
					Lib.Options[Flags] = Paragraph
				end
            
                return Paragraph
            end
            
            function Section:Divider()
                local SDivider = {}
                
                local Divider = CreateElement("Frame", {
            		Name = "Divider",
            		Size = UDim2.new(1, - 46, 0, 2),
            		AnchorPoint = Vector2.new(0, 0),
            		Position = UDim2.new(0, 0, 0, 0),
            		BackgroundColor3 = Themes.Colors.Stroke,
            		BackgroundTransparency = 0.2,
            		BorderSizePixel = 0,
            		Visible = true,
            		ClipsDescendants = true,
            		Parent = Section_F
            	})
            	
            	CreateElement("UICorner", {
                    CornerRadius = UDim.new(1, 0),
                    Parent = Divider
                })
            	
            	function SDivider:Remove()
            	    Divider:Destroy()
            	end
            	
            	function SDivider:SetVisibility(state)
            	    Divider.Visible = state
            	end
                
                return SDivider
            end

            return Section
        end
        
        function Tab:LoadSettingsMenu(Options)
            local LoadS = {Options = Options}
            
            local ConfigSection = Tab:Section({
                Header = "Configuration System",
                Side = LoadS.Options.Side or "Left"
            })
            
            local ConfigName = "default"
            
            -- Input para nome da configuração
            local ConfigNameInput = ConfigSection:Input("ConfigNameInput", {
                Name = "Config Name",
                Default = "default",
                Placeholder = "Enter config name...",
                Callback = function(value)
                    if value and value ~= "" then
                        ConfigName = value
                    end
                end
            })
            
            -- Dropdown para configurações existentes
            local ConfigDropdown = ConfigSection:Dropdown("ConfigDropdown", {
                Name = "Saved Configs",
                Values = {"None"},
                Default = "None",
                Callback = function(value)
                    if value ~= "None" then
                        ConfigName = value
                        ConfigNameInput:SetValue(value)
                    end
                end
            })
            
            -- Atualizar lista de configurações
            function UpdateConfigList()
                local configs = ConfigSystem:GetConfigList()
                
                -- Sempre atualizar os valores do dropdown
                if #configs > 0 then
                    ConfigDropdown.Options.Values = configs
                    
                    -- Verificar se o ConfigName atual ainda existe
                    if not table.find(configs, ConfigName) then
                        ConfigName = configs[1]
                        ConfigNameInput:SetValue(ConfigName)
                    end
                    
                    -- Atualizar o valor selecionado
                    ConfigDropdown:SetValue(ConfigName)
                else
                    -- Se não há configurações, resetar
                    ConfigDropdown.Options.Values = {"None"}
                    ConfigDropdown:SetValue("None")
                    ConfigName = "default"
                    ConfigNameInput:SetValue("default")
                end
            end
            
            -- MODIFICAR OS BOTÕES PARA CHAMAR UpdateConfigList APÓS AÇÃO
            
            -- Botão Save
            ConfigSection:Button("SaveConfig", {
                Name = "Save",
                Callback = function()
                    local currentName = ConfigNameInput:GetValue()
                    if currentName and currentName ~= "" then
                        ConfigName = currentName
                        local success, err = ConfigSystem:SaveConfig(ConfigName)
                        if success then
                            UpdateConfigList() -- ATUALIZAR LISTA APÓS SALVAR
                        end
                    else
                        Lib:WarningNotification("Config System", "Enter a config name")
                    end
                end
            })
            
            -- Botão Load
            ConfigSection:Button("LoadConfig", {
                Name = "Load",
                Callback = function()
                    local currentName = ConfigNameInput:GetValue()
                    if currentName and currentName ~= "" then
                        ConfigName = currentName
                        ConfigSystem:LoadConfig(ConfigName)
                    else
                        Lib:WarningNotification("Config System", "Enter a config name")
                    end
                end
            })
            
            -- Botão New Save
            ConfigSection:Button("NewConfig", {
                Name = "New Save",
                Callback = function()
                    local newName = "config_" .. os.time()
                    ConfigName = newName
                    ConfigNameInput:SetValue(newName)
                    UpdateConfigList() -- ATUALIZAR LISTA APÓS CRIAR NOVO
                end
            })
            
            -- Botão Delete
            ConfigSection:Button("DeleteConfig", {
                Name = "Delete",
                Callback = function()
                    local currentName = ConfigNameInput:GetValue()
                    if currentName and currentName ~= "" then
                        ConfigName = currentName
                        ConfigSystem:DeleteConfig(ConfigName)
                        UpdateConfigList() -- ATUALIZAR LISTA APÓS DELETAR
                    else
                        Lib:WarningNotification("Config System", "Enter a config name")
                    end
                end
            })
            
            -- Botão Refresh
            ConfigSection:Button("RefreshConfigs", {
                Name = "Refresh",
                Callback = function()
                    UpdateConfigList()
                    Lib:InfoNotification("Config System", "Config list updated")
                end
            })
            
            -- ADICIONAR ATUALIZAÇÃO AUTOMÁTICA PERIÓDICA
            function StartAutoRefresh()
                while true do
                    wait(10) -- Atualizar a cada 10 segundos
                    UpdateConfigList()
                end
            end
            
            -- Iniciar atualização automática
            task.spawn(StartAutoRefresh)
            
            -- Atualizar lista ao inicializar
            task.spawn(function()
                wait(1)
                UpdateConfigList()
            end)
            
            return LoadS
        end

        return Tab
    end
    
    function StorageTabs:Dialog(Settings)
        local DialogFunctions = {}
    
        local dialogCanvas = CreateElement("CanvasGroup", {
            Name = "DialogCanvas",
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            Active = true,
            GroupTransparency = 1,
            Parent = Main
        })
    
        local dialog = CreateElement("Frame", {
            Name = "Dialog",
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 0.5,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            Parent = dialogCanvas
        })
    
        CreateElement("UICorner", {
            Name = "BaseUICorner",
            CornerRadius = UDim.new(0, 10),
            Parent = dialog
        })
    
        local prompt = CreateElement("Frame", {
            Name = "Prompt",
            AnchorPoint = Vector2.new(0.5, 0.5),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Color3.fromRGB(15, 15, 15),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(280, 0),
            Parent = dialog
        })
    
        local promptUIScale = CreateElement("UIScale", {
            Name = "BaseUIScale",
            Scale = 0.95,
            Parent = prompt
        })
    
        CreateElement("UIStroke", {
            Name = "GlobalSettingsUIStroke",
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(255, 255, 255),
            Transparency = 0.9,
            Parent = prompt
        })
    
        CreateElement("UICorner", {
            Name = "GlobalSettingsUICorner",
            CornerRadius = UDim.new(0, 10),
            Parent = prompt
        })
    
        CreateElement("UIPadding", {
            Name = "GlobalSettingsUIPadding",
            PaddingBottom = UDim.new(0, 20),
            PaddingLeft = UDim.new(0, 20),
            PaddingRight = UDim.new(0, 20),
            PaddingTop = UDim.new(0, 20),
            Parent = prompt
        })
    
        local paragraph = CreateElement("Frame", {
            Name = "Paragraph",
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 38),
            Parent = prompt
        })
    
        local paragraphHeader = CreateElement("TextLabel", {
            Name = "ParagraphHeader",
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
            RichText = true,
            Text = Settings.Title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 18,
            TextTransparency = 0.4,
            TextWrapped = true,
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 0),
            Parent = paragraph
        })
    
        CreateElement("UIListLayout", {
            Name = "UIListLayout",
            Padding = UDim.new(0, 15),
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = paragraph
        })
    
        local paragraphBody = CreateElement("TextLabel", {
            Name = "ParagraphBody",
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
            RichText = true,
            Text = Settings.Description,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 14,
            TextTransparency = 0.5,
            TextWrapped = true,
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0),
            Parent = paragraph
        })
    
        local interactions = CreateElement("Frame", {
            Name = "Interactions",
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0),
            Parent = prompt
        })
    
        CreateElement("UIListLayout", {
            Name = "UIListLayout",
            Padding = UDim.new(0, 10),
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = interactions
        })
    
        CreateElement("UIPadding", {
            Name = "UIPadding",
            PaddingTop = UDim.new(0, 20),
            Parent = interactions
        })
    
        CreateElement("UIListLayout", {
            Name = "UIListLayout",
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = prompt
        })
    
        local TweenService = game:GetService("TweenService")
        local canvasIn = TweenService:Create(dialogCanvas, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { GroupTransparency = 0 })
        local canvasOut = TweenService:Create(dialogCanvas, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { GroupTransparency = 1 })
    
        local scaleIn = TweenService:Create(promptUIScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { Scale = 1 })
        local scaleOut = TweenService:Create(promptUIScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { Scale = 0.95 })
    
        function dialogIn()
            canvasIn:Play()
            scaleIn:Play()
            canvasIn.Completed:Wait()
        end
    
        function dialogOut()
            if not dialog.Parent then return end
            canvasOut:Play()
            scaleOut:Play()
            canvasOut.Completed:Wait()
            dialogCanvas:Destroy()
        end
    
        for _, v in pairs(Settings.Buttons) do
            local button = CreateElement("TextButton", {
                Name = "Button",
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
                Text = v.Name,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 15,
                TextTransparency = 0.5,
                TextTruncate = Enum.TextTruncate.AtEnd,
                AutoButtonColor = false,
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 0),
                Parent = interactions
            })
    
            CreateElement("UIPadding", {
                Name = "UIPadding",
                PaddingBottom = UDim.new(0, 9),
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10),
                PaddingTop = UDim.new(0, 9),
                Parent = button
            })
    
            CreateElement("UICorner", {
                Name = "BaseUICorner",
                CornerRadius = UDim.new(0, 10),
                Parent = button
            })
    
            local TweenSettings = {
                DefaultTransparency = 0,
                DefaultTransparency2 = 0.5,
                HoverTransparency = 0.3,
                HoverTransparency2 = 0.6,
                EasingStyle = Enum.EasingStyle.Sine
            }
    
            function ChangeState(State)
                if State == "Idle" then
                    TweenService:Create(button, TweenInfo.new(0.2, TweenSettings.EasingStyle), {
                        BackgroundTransparency = TweenSettings.DefaultTransparency,
                        TextTransparency = TweenSettings.DefaultTransparency2
                    }):Play()
                elseif State == "Hover" then
                    TweenService:Create(button, TweenInfo.new(0.2, TweenSettings.EasingStyle), {
                        BackgroundTransparency = TweenSettings.HoverTransparency,
                        TextTransparency = TweenSettings.HoverTransparency2
                    }):Play()
                end
            end
    
            button.MouseButton1Click:Connect(function()
                if dialogCanvas.GroupTransparency ~= 0 then return end
                if v.Callback then
                    v.Callback()
                end
                dialogOut()
            end)
    
            button.MouseEnter:Connect(function()
                ChangeState("Hover")
            end)
            button.MouseLeave:Connect(function()
                ChangeState("Idle")
            end)
        end
    
        dialogIn()
    
        function DialogFunctions:UpdateTitle(New)
            paragraphHeader.Text = New
        end
        
        function DialogFunctions:UpdateDescription(New)
            paragraphBody.Text = New
        end
    
        function DialogFunctions:Cancel()
            dialogOut()
        end
    
        getgenv()._CHECKMENU_LOADER = DialogFunctions
        return DialogFunctions
    end
        
    function StorageTabs:Divider()
        local TDivider = {}
        
        local Divider = CreateElement("Frame", {
            Name = "Divider",
            Size = UDim2.new(1, - 20, 0, 2),
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.new(0, 0, 0, 0),
            BackgroundColor3 = Themes.Colors.Stroke,
            BackgroundTransparency = 0.2,
            BorderSizePixel = 0,
            Visible = true,
            ClipsDescendants = true,
            Parent = ScrollingFrame
        })
        
        CreateElement("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = Divider
        })
        	
        function TDivider:Remove()
            Divider:Destroy()
        end
        	
        function TDivider:SetVisibility(state)
            Divider.Visible = state
        end
        
        return TDivider
    end
 

	return StorageTabs
end

function Lib:Demo()
    local Demo = Lib:Window({
        Title = "Harpy Demo",
        Theme = "Darker",
        KeyBind = "K",
        Size = {680, 430},
        Button = true,
        Acrylic = false
    })
    
    local Tab1 = Demo:Tab({ Name = "Info", Icon = "User" })
    Demo:Divider()
    local Tab2 = Demo:Tab({ Name = "Examples", Icon = "Home" })
    
    local Section1 = Tab1:Section({ Side = "Left" })
    local Section2 = Tab1:Section({ Side = "Right" })
    local Section3 = Tab2:Section({ Header = "Examples Features", Side = "Left" })
    local Section4 = Tab2:Section({ Side = "Right" })
    local Section5 = Tab2:Section({ Side = "Right" })
    
    -- NOVA SEÇÃO PARA NOTIFICAÇÕES E DIÁLOGOS
    local Section6 = Tab2:Section({ Header = "Notifications & Dialogs", Side = "Left" })
    
    local ModDescription = Section1:Paragraph("ModDescription", {
        Header = "MOD INFORMATION",
        Content = "HARPY LIBRARY - Advanced Roblox UI Library\n\nFeatures:\n• Complete UI System with windows & tabs\n• Configuration save/load system\n• Custom notifications\n• Mobile support\n• Multiple element types\n• Theme customization\n• Real-time player info\n\nOptimized for performance and user experience.",
        Icon = "Info"
    })

    Section1:Divider()

    local ModDetails = Section1:Paragraph("ModDetails", {
        Header = "SPECIFICATIONS",
        Content = "VERSION: 1.3\nCOMPATIBILITY: Studio & Executors\nPERFORMANCE: 60+ FPS\nPLATFORMS: Windows, Mobile, Console\n\nCOMPONENTS:\n• Window Management\n• Theme Engine\n• Configuration System\n• Notification Handler\n• Input Management\n\nEasy-to-use API with comprehensive features.",
        Icon = "Settings"
    })
    
    -- Criar o parágrafo primeiro
    local PlayerInfo = Section2:Paragraph("PlayerInfo", {
        Header = "PLAYER INFORMATION",
        Content = "Loading player data...",
        Icon = "User"
    })

    -- Função para atualizar informações
    function UpdatePlayerInfo()
        local success, result = pcall(function()
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            
            -- Informações da conta
            local playerName = LocalPlayer.Name
            local displayName = LocalPlayer.DisplayName
            local userId = LocalPlayer.UserId
            local accountAge = LocalPlayer.AccountAge
            local membership = LocalPlayer.MembershipType.Name
            
            -- Informações do servidor
            local totalPlayers = #Players:GetPlayers()
            local maxPlayers = Players.MaxPlayers
            
            -- Informações do character
            local characterInfo = "No character"
            if LocalPlayer.Character then
                local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    characterInfo = string.format("Health: %d/%d", math.floor(humanoid.Health), math.floor(humanoid.MaxHealth))
                end
            end
            
            -- Lista de jogadores (apenas nomes, limitado a 5)
            local otherPlayers = {}
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    table.insert(otherPlayers, player.Name)
                    if #otherPlayers >= 5 then
                        table.insert(otherPlayers, "...")
                        break
                    end
                end
            end
            
            local playersList = "None"
            if #otherPlayers > 0 then
                playersList = table.concat(otherPlayers, ", ")
            end
            
            -- Criar conteúdo formatado
            local content = string.format([[
ACCOUNT INFORMATION:
Name: @%s
Display Name: %s
User ID: %d
Account Age: %d days
Membership: %s

SERVER INFORMATION:
Online Players: %d/%d
Other Players: %s

CHARACTER STATUS:
%s

Last Update: %s
            ]], 
            playerName, displayName, userId, accountAge, membership,
            totalPlayers, maxPlayers, playersList,
            characterInfo,
            os.date("%H:%M:%S")
            )
            
            return content
        end)
        
        if success then
            PlayerInfo:SetContent(result)
        else
            PlayerInfo:SetContent("Error loading player information")
        end
    end

    -- Atualizar imediatamente
    UpdatePlayerInfo()

    -- Atualizar a cada 10 segundos
    spawn(function()
        while wait(10) do
            if PlayerInfo then
                UpdatePlayerInfo()
            end
        end
    end)
    
    -- Features Tab2
    Section3:Button("Button", {
        Name = "Button",
        Callback = function()
            print("Button #1 pressed")
        end
    })
    
    Section3:Toggle("Toggle", {
        Name = "Toggle",
        Default = false,
        Callback = function(State)
            print("Toggle #1:", State)
        end
    })
    
    Section3:Checkbox("Checkbox", {
        Name = "Checkbox",
        Default = true,
        Callback = function(State)
            print("Checkbox #1:", State)
        end
    })
    
    Section3:Divider()
    
    Section3:RadioButton("RadioButton", {
        Name = "RadioButton list",
        Values = {"Radio #1", "Radio #2", "Radio #3"},
        Default = "Radio #1",
        Callback = function(State)
            print(State)
        end
    })
    
    Section3:RadioButton("RadioButton", {
        Name = "RadioButton list",
        Values = {"Radio #1", "Radio #2", "Radio #3"},
        Default = "Radio #1",
        Icon = "User",
        Sameline = true,
        Callback = function(State)
            print(State)
        end
    })
    
    Section4:Colorpicker("Colorpicker", {
        Name = "Colorpicker",
        Default = Color3.fromRGB(0, 0, 200),
        Callback = function(State)
            print("Color", State)
        end
    })
    
    Section4:Dropdown("Dropdown", {
        Name = "Dropdown",
        Values = {"Option #1", "Option #2", "Option #3"},
        Default = "Option #1",
        Callback = function(State)
            print("Dropdown #1:", State)
        end
    })
    
    Section4:Dropdown("Dropdown", {
        Name = "Dropdown",
        Values = {"Option #1", "Option #2", "Option #3"},
        Default = "Option #1",
        MultiSelection = true,
        Callback = function(State)
            print("Dropdown #1:", State)
        end
    })
    
    Section4:Divider()
    
    Section4:Slider("Slider", {
        Name = "Slider",
        DisplayMethod = "Value",
        Maximum = 200,
        Minimum = 10,
        Default = 123,
        Precision = 2,
        Callback = function(State)
            print("Slider #1:", State)
        end
    })
    
    Section4:Input("Input", {
        Name = "Input",
        Default = "Input Text",
        PlaceHolder = "...",
        Callback = function(State)
            print("Input #1:", State)
        end
    })
    
    Section4:KeyBind("Keybind", {
        Name = "Keybind",
        Default = "K",
        Callback = function(State)
            print("KeyBind #1:", State)
        end
    })
    
    Section5:Header("Header", {
        Text = "This is the header.",
    })
    
    Section5:Divider()
    
    Section5:Label("Label", {
        Text = "This is the label.",
    })
    
    Section5:Paragraph("Paragraph", {
        Header = "This is the paragraph title.",
        Content = "This is the description/content of the paragraph."
    })
    
    -- NOVA SEÇÃO: NOTIFICAÇÕES E DIÁLOGOS
    Section6:Header("Notification System", {
        Text = "Test the notification system",
    })
    
    -- Dropdown com tipos de notificação
    local notificationDropdown = Section6:Dropdown("NotificationTypes", {
        Name = "Notification Type",
        Values = {
            "Success", 
            "Error", 
            "Warning", 
            "Info", 
            "Custom Short", 
            "Custom Normal", 
            "Custom Long", 
            "Custom Persistent"
        },
        Default = "Success",
        Callback = function(value)
            print("Selected notification type:", value)
        end
    })
    
    -- Botão para carregar notificação
    Section6:Button("LoadNotification", {
        Name = "Show Notification",
        Callback = function()
            local selectedType = notificationDropdown:GetValue()
            
            -- Mapear tipos para funções específicas
            if selectedType == "Success" then
                Lib:SuccessNotification(
                    "Operation Completed", 
                    "Your action was completed successfully!", 
                    "Normal"
                )
            elseif selectedType == "Error" then
                Lib:ErrorNotification(
                    "Error Occurred", 
                    "Something went wrong. Please try again.", 
                    "Long"
                )
            elseif selectedType == "Warning" then
                Lib:WarningNotification(
                    "Warning", 
                    "This action may have unintended consequences.", 
                    "Normal"
                )
            elseif selectedType == "Info" then
                Lib:InfoNotification(
                    "Information", 
                    "This is an informational message.", 
                    "Short"
                )
            elseif selectedType == "Custom Short" then
                Lib:Notification({
                    Name = "Short Notification",
                    Content = "This notification will disappear in 3 seconds.",
                    Icon = "Clock",
                    Duration = "Short",
                    Behavior = "Stack"
                })
            elseif selectedType == "Custom Normal" then
                Lib:Notification({
                    Name = "Normal Notification",
                    Content = "This is a standard notification with normal duration.",
                    Icon = "Bell",
                    Duration = "Normal",
                    Behavior = "Stack"
                })
            elseif selectedType == "Custom Long" then
                Lib:Notification({
                    Name = "Long Notification",
                    Content = "This notification will stay for 8 seconds. Perfect for important messages.",
                    Icon = "AlertCircle",
                    Duration = "Long",
                    Behavior = "Stack"
                })
            elseif selectedType == "Custom Persistent" then
                local persistentNotif = Lib:Notification({
                    Name = "Persistent Notification",
                    Content = "This notification will stay until you close it manually. Click the X to dismiss.",
                    Icon = "Pin",
                    Duration = "Persistent",
                    Behavior = "Stack"
                })
                
                -- Adicionar funcionalidade extra para notificação persistente
                if persistentNotif then
                    -- Exemplo: Fechar automaticamente após 15 segundos (opcional)
                    delay(15, function()
                        if persistentNotif.Close then
                            persistentNotif:Close()
                        end
                    end)
                end
            end
        end
    })
    
    Section6:Divider()
    
    -- Botão para testar múltiplas notificações
    Section6:Button("MultipleNotifications", {
        Name = "Test Multiple Notifications",
        Callback = function()
            -- Disparar várias notificações de uma vez
            Lib:SuccessNotification("Test 1", "First notification", "Short")
            wait(0.5)
            Lib:WarningNotification("Test 2", "Second notification", "Normal")
            wait(0.5)
            Lib:ErrorNotification("Test 3", "Third notification", "Long")
            wait(0.5)
            Lib:InfoNotification("Test 4", "Fourth notification", "Short")
        end
    })
    
    Section6:Divider()
    
    Section6:Header("Dialog System", {
        Text = "Test the dialog system",
    })
    
    -- Botão para abrir diálogo de exemplo
    Section6:Button("ShowDialog", {
        Name = "Show Example Dialog",
        Callback = function()
            local exampleDialog = Demo:Dialog({
                Title = "Confirmation Required",
                Description = "Are you sure you want to proceed with this action? This operation cannot be undone and may have significant consequences.",
                Buttons = {
                    {
                        Name = "Confirm",
                        Callback = function()
                            Lib:SuccessNotification("Dialog", "Action confirmed successfully!")
                            print("Dialog: User confirmed action")
                        end
                    },
                    {
                        Name = "Cancel", 
                        Callback = function()
                            Lib:InfoNotification("Dialog", "Action cancelled")
                            print("Dialog: User cancelled action")
                        end
                    },
                    {
                        Name = "More Info",
                        Callback = function()
                            Lib:InfoNotification("Info", "Showing more information about this action...")
                            print("Dialog: User requested more info")
                            
                            -- Poderia abrir outro diálogo aqui
                            wait(1)
                            Demo:Dialog({
                                Title = "Additional Information",
                                Description = "This action will:\n• Perform system changes\n• Modify user settings\n• Require restart to take effect\n\nPlease ensure you have saved all work before proceeding.",
                                Buttons = {
                                    {
                                        Name = "Understood",
                                        Callback = function()
                                            Lib:SuccessNotification("Info", "Thank you for reading the information!")
                                        end
                                    }
                                }
                            })
                        end
                    }
                }
            })
            
            print("Dialog opened successfully")
        end
    })
    
    -- Botão para diálogo simples
    Section6:Button("SimpleDialog", {
        Name = "Simple Dialog",
        Callback = function()
            Demo:Dialog({
                Title = "Simple Message",
                Description = "This is a simple dialog with only one option.",
                Buttons = {
                    {
                        Name = "OK",
                        Callback = function()
                            Lib:InfoNotification("Dialog", "Simple dialog closed")
                        end
                    }
                }
            })
        end
    })

end

return Lib
