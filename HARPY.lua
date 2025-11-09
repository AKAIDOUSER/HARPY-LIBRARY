local IconsSystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/AKAIDOUSER/HARPY-LIBRARY/refs/heads/main/Load%20Icons.lua"))()
IconsSystem:LoadIcons("https://raw.githubusercontent.com/AKAIDOUSER/HARPY-LIBRARY/refs/heads/main/Icons.lua")

local Lib = {
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
local function GetNotificationHolder()
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
local function GetDuration(durationType)
    local durations = {
        Short = 3,
        Normal = 5,
        Long = 8,
        Persistent = 0
    }
    return durations[durationType] or durations.Normal
end

-- Função para verificar se já existe notificação com mesmo título
local function HasNotificationWithTitle(title)
    for _, notification in pairs(ActiveNotifications) do
        if notification.Title == title then
            return true
        end
    end
    return false
end

-- Função para remover notificação
local function RemoveNotification(containerFrame, notificationFrame, title)
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
    local function CloseNotification()
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

function Lib:Window(Options)
    Options.Title = Options.Title or "HARPY LIBRARY"
    Options.Theme = Options.Theme or "Darker"
    Options.KeyBind = Options.KeyBind or "K"
    Options.Size = Options.Size or {630, 430}
    Options.Acrylic = Options.Acrylic or false
    Options.Buttom = Options.Buttom or false
    
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
    
    local function updateDrag(input)
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

    local function toggleWindowVisibility()
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
    local function setupKeyBind()
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            
            if input.KeyCode == currentKeyBind then
                toggleWindowVisibility()
            end
        end)
    end
    
    -- Inicializar o KeyBind
    setupKeyBind()

    local function setupMobileButton()
        -- Verificar se é dispositivo móvel
        local isMobile = Options.Button
        
        if isMobile then
            local Main_Button = CreateElement("Frame", {
        		Name = Options.Title,
        		Size = UDim2.fromOffset(60,60),
        		AnchorPoint = Vector2.new(0.5, 0),
        		Position = UDim2.new(0.5, 0, 0, 8),
        		BackgroundColor3 = Themes.Colors.Primary,
        		BackgroundTransparency = 0,
        		BorderSizePixel = 0,
        		Visible = Options.Buttom,
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
    
	local StorageTabs = {
	    CurrentTab = nil,
        FirstTab = true
	}
	
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
            Options.Name = Options.Name or ""
            Options.Side = Options.Side or "Left"
            
            local Section = {
                ActiveS = false,
                HoverS = false
            }
            
            local Section_F = CreateElement("Frame", {
                Name = Options.Name.. "_Section_F",
                Size = UDim2.new(1, 0, 0, 0),
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.new(0, 0, 0, 0),
                BackgroundColor3 = Themes.Colors.Primary,
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                Visible = true,
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
                
            if Options.Name ~= "" and Options.Name ~= " " then
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
                    
                    Text = Options.Name,
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
                Options.Name = Options.Name or "Buttom"
                Options.Callback = Options.Callback or function() end
                
                local Button = {
                    HoverB = false,
                    ActiveB = false
                }
                
                local Button_F = CreateElement("Frame", {
                    Name = Options.Name,
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
                    
                    Text = Options.Name,
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
                
                OnClick.MouseEnter:Connect(function()
                    Button.HoverB = true
                    if not Button.ActiveB then
                        TweenService:Create(Title_Button, TweenInfo.new(0.15), {
                            TextTransparency = 0
                        }):Play()
                    end
                end)
                
                OnClick.MouseLeave:Connect(function()
                    Button.HoverB = false
                    if not Button.ActiveB then 
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
                        Options.Callback()
                    end)
                end
                
                function Button:GetCallback()
                    Button:Callback()
                end
                
                function Button:SetName(text)
                    Title_Button.Text = text
                end
                
                return Button
            end
            
            function Section:Toggle(Flags, Options)
                Options.Name = Options.Name or "Toggle"
                Options.Default = Options.Default or false
                Options.Callback = Options.Callback or function() end
                
                local State = Options.Default
                
                local Toggle = {
                    HoverT = false,
                    ActiveT = false
                }
                
                local Toggle_F = CreateElement("Frame", {
                    Name = Options.Name,
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
                    
                    Text = Options.Name,
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
                
                OnClick.MouseEnter:Connect(function()
                    Toggle.HoverT = true
                    if not Toggle.ActiveT then
                        TweenService:Create(Title_Toggle, TweenInfo.new(0.15), {
                            TextTransparency = 0
                        }):Play()
                    end
                end)
                
                OnClick.MouseLeave:Connect(function()
                    Toggle.HoverT = false
                    if not Toggle.ActiveT then 
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
                        if Options.Callback then
                            Options.Callback(State)
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
                        
                        if Options.Callback and not skipCallback then
                            Options.Callback(State)
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
                        Options.Callback = newCallback
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
                    if Options.Callback then
                        Options.Callback(State)
                    end
                end)
                
                return Toggle
            end
            
            function Section:Checkbox(Flags, Options) 
                Options.Name = Options.Name or "Checkbox"
                Options.Default = Options.Default or false
                Options.Callback = Options.Callback or function() end
                
                local Checkbox = {
                    HoverC = false,
                    ActiveC = false
                }
                
                local State = Options.Default
                
                local Checkbox_F = CreateElement("Frame", {
                    Name = Options.Name,
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
                    
                    Text = Options.Name,
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
                    Name = Options.Name,
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
                
                OnClick.MouseEnter:Connect(function()
                    Checkbox.HoverC = true
                    if not Checkbox.ActiveC then
                        TweenService:Create(Title_Checkbox, TweenInfo.new(0.15), {
                            TextTransparency = 0
                        }):Play()
                    end
                end)
                
                OnClick.MouseLeave:Connect(function()
                    Checkbox.HoverC = false
                    if not Checkbox.ActiveC then 
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
                        if Options.Callback then
                            Options.Callback(State)
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
                        
                        if Options.Callback and not skipCallback then
                            Options.Callback(State)
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
                        Options.Callback = newCallback
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
                    if Options.Callback then
                        Options.Callback(State)
                    end
                end)
                
                return Checkbox
            end
            
            function Section:RadioButton(Flags, Options)
                Options.Name = Options.Name or "Radio Button List"
                Options.Values = Options.Values or {"Radio 1", "Radio 2", "Radio 3"}
                Options.Default = Options.Default or "Radio 1"
                Options.Icon = Options.Icon or "Home"
                Options.Sameline = Options.Sameline or false
                Options.Callback = Options.Callback or function() end
                
                local Radio = {
                    HoverR = false,
                    ActiveR = false
                }
                
                local Radio_F = CreateElement("Frame", {
                    Name = Options.Name,
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
                
                local imageId = IconsSystem:GetIcon(Options.Icon)
                
                local Icon = CreateElement("ImageLabel", {
                    Name = "Icon",
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    ImageColor3 = Themes.Colors.Image,
                    Image = "rbxassetid://" .. tostring(imageId) or "7436811843",
                    ImageTransparency = 0.6,
                    Size = UDim2.fromOffset(17, 17),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    Parent = Title_F,
                })
                
                local Title_Checkbox = CreateElement("TextLabel", {
                    Name = "Title_Checkbox",
                    Size = UDim2.new(1, -50, 0, 13),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 33, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Options.Name,
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
                
                -- Variáveis globais do Radio
                local radioButtons = {}
                local selectedValue = Options.Default
                local radioCount = 0
                
                -- Função para criar uma nova linha
                local function createNewRow()
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
                local function updateSelection(newValue)
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
                    Options.Callback(newValue)
                end
                
                -- Função para criar um botão de rádio individual
                local function createRadioButton(value, isSelected)
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
                    if Options.Sameline then
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
                        Radio.HoverR = true
                        if selectedValue ~= value then
                            TweenService:Create(radioData.NameLabel, TweenInfo.new(0.15), {
                                TextTransparency = 0
                            }):Play()
                        end
                    end)
                    
                    OnClick.MouseLeave:Connect(function()
                        Radio.HoverR = false
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
                    if Options.Sameline then
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
                local function rebuildLayout()
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
                    for i, value in ipairs(Options.Values) do
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
                for i, value in ipairs(Options.Values) do
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
                    table.insert(Options.Values, value)
                    
                    createRadioButton(value, shouldSelect)
                    
                    if shouldSelect then
                        updateSelection(value)
                    end
                    
                    if Options.Sameline then
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
                    for i, v in ipairs(Options.Values) do
                        if v == value then
                            table.remove(Options.Values, i)
                            break
                        end
                    end
                    
                    -- Reconstruir layout se for Sameline
                    if Options.Sameline then
                        rebuildLayout()
                    else
                        updateContainerHeight()
                    end
                    
                    return true
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
                    Options.Values = {} -- Limpar o array de valores
                    selectedValue = nil
                    radioCount = 0
                    
                    -- Resetar variáveis de linha
                    currentRow = nil
                    currentRowLayout = nil
                    rowWidth = 0
                    
                    -- Reconstruir layout
                    if Options.Sameline then
                        rebuildLayout()
                    else
                        updateContainerHeight()
                    end
                end
                
                return Radio
            end
            
            function Section:Colorpicker(Flags, Options)
                Options.Name = Options.Name or "Colorpicker"
                Options.Default = Options.Default or Color3.fromRGB(128, 28, 28)
                Options.Callback = Options.Callback or function() end
                
                local Colorpicker = {
                    HoverCp = false,
                    ActiveCp = false
                }
                
                -- ELEMENTOS DA UI
                local Colorpicker_F = CreateElement("Frame", {
                    Name = Options.Name,
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
                    Text = Options.Name,
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
                    BackgroundColor3 = Options.Default,
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
                    Name = Options.Name.. "_Window",
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
                    ColorSequenceKeypoint.new(1.00, Options.Default)
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
                local currentColor = Options.Default
                local rainbowMode = false
                local rainbowSpeed = 1
                local rainbowConnection = nil
                local isColorPickerOpen = false
            
                -- CONEXÕES DE INPUT
                local selectorInputConnection, selectorMoveConnection, selectorEndConnection
                local rainbowInputConnection, rainbowMoveConnection, rainbowEndConnection
                local closeConnection
            
                -- FUNÇÕES PRINCIPAIS
                local function sendColorCallback(color)
                    currentColor = color
                    local r, g, b = math.floor(color.R * 255), math.floor(color.G * 255), math.floor(color.B * 255)
                    Options.Callback(Color3.fromRGB(r, g, b))
                end
            
                local function updateCConteinerColor(input)
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
            
                local function updateColorSlider(input)
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
            
                local function startRainbowMode()
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
            
                local function setInitialColor(color)
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
                end
            
                -- SISTEMA DE CONEXÕES
                local function connectSelectorInput()
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
            
                local function connectRainbowInput()
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
            
                local function closeColorPicker()
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
                local function setupCloseDetection()
                    if closeConnection then closeConnection:Disconnect() end
                    
                    closeConnection = UserInputService.InputBegan:Connect(function(input, processed)
                        if processed then return end
                        
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            local mousePos = input.Position
                            
                            -- Função para verificar se o ponto está dentro de um frame
                            local function isPointInFrame(frame, point)
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
                local function openColorPicker()
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

                -- EVENTOS
                OnClick.MouseEnter:Connect(function()
                    Colorpicker.HoverCp = true
                    if not Colorpicker.ActiveCp then
                        TweenService:Create(Title_Colorpicker, TweenInfo.new(0.15), {
                            TextTransparency = 0
                        }):Play()
                    end
                end)
                
                OnClick.MouseLeave:Connect(function()
                    Colorpicker.HoverCp = false
                    if not Colorpicker.ActiveCp then 
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
                local function setupTouchSupport()
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
            
                -- FUNÇÕES PÚBLICAS
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
            
                function Colorpicker:SetCallback(newCallback)
                    if type(newCallback) == "function" then
                        Options.Callback = newCallback
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
            
                return Colorpicker
            end
            
            function Section:KeyBind(Flags, Options)
                Options.Name = Options.Name or "KeyBind"
                Options.Default = Options.Default or "K"
                Options.Callback = Options.Callback or function() end
                
                local Default_Value = Enum.KeyCode[Options.Default]
                
                local KeyBind = {
                    HoverK = false,
                    ActiveK = false,
                    CurrentKey = Default_Value,
                    Value = Options.Default
                }
                
                local KeyBind_F = CreateElement("Frame", {
                    Name = Options.Name,
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
                    ClipsDescendants = true,
                    
                    Text = Options.Name,
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
                    
                    Text = Options.Default,
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
                
                local function FormatKeyName(keyCode)
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
                local function IsKeyAllowed(keyCode)
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
                local function UpdateHolderSize()
                    local textSize = KeyBind_Display.TextBounds.X
                    local totalWidth = 5 + 17 + 8 + textSize + 5 -- 5(margem) + 17(ícone) + 8(espaço) + texto + 5(margem)
                    Holver_F.Size = UDim2.new(0, math.max(45, totalWidth), 0, 25)
                end
                
                -- Função para atualizar o display do KeyBind
                local function UpdateDisplay()
                    KeyBind_Display.Text = KeyBind.Value
                    UpdateHolderSize()
                end
                
                -- Conexão do input para detectar teclas
                local InputConnection
                local function StartListening()
                    KeyBind.ActiveK = true
                    KeyBind_Display.Text = "..."
                    UpdateHolderSize()
                    
                    TweenService:Create(Holver_F, TweenInfo.new(0.15), {
                        BackgroundColor3 = Themes.Colors.Primary
                    }):Play()
                    
                    TweenService:Create(Title_KeyBind, TweenInfo.new(0.15), {
                        TextTransparency = 0
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
                                KeyBind.CurrentKey = input.KeyCode
                                KeyBind.Value = FormatKeyName(input.KeyCode)
                                
                                UpdateDisplay()
                                
                                -- Sai do modo de escuta
                                KeyBind.ActiveK = false
                                
                                TweenService:Create(Holver_F, TweenInfo.new(0.15), {
                                    BackgroundColor3 = Themes.Colors.Secondary
                                }):Play()
                                
                                if not KeyBind.HoverK then
                                    TweenService:Create(Title_KeyBind, TweenInfo.new(0.15), {
                                        TextTransparency = 0.4
                                    }):Play()
                                end
                                
                                -- Chama o callback
                                Options.Callback(KeyBind.Value, KeyBind.CurrentKey)
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
                local function ConnectKeyListener()
                    if KeyConnection then
                        KeyConnection:Disconnect()
                    end
                    
                    KeyConnection = game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
                        if gameProcessed then return end
                        
                        if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == KeyBind.CurrentKey then
                            -- Executa a função do KeyBind
                            KeyBind:Callback()
                        end
                    end)
                end
                
                -- Evento de clique para iniciar a escuta
                OnClick.MouseButton1Click:Connect(function()
                    if not KeyBind.ActiveK then
                        StartListening()
                    end
                end)
                
                -- Função para executar o callback do KeyBind
                function KeyBind:Callback()
                    spawn(function()
                        Options.Callback(self.Value, self.CurrentKey)
                    end)
                end
                
                -- Funções públicas para controle externo
                function KeyBind:SetKey(keyName)
                    local keyCode = Enum.KeyCode[keyName]
                    if keyCode and IsKeyAllowed(keyCode) then
                        self.CurrentKey = keyCode
                        self.Value = FormatKeyName(keyCode)
                        UpdateDisplay()
                        ConnectKeyListener()
                    end
                end
                
                function KeyBind:GetKey()
                    return self.Value, self.CurrentKey
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
                
                return KeyBind
            end
            
            function Section:Dropdown(Flags, Options)
                Options.Name = Options.Name or "Dropdown"
                Options.Values = Options.Values or {"Option 1", "Option 2"}
                Options.MultiSelection = Options.MultiSelection or false
                Options.Default = Options.Default or (Options.MultiSelection and {} or "Option 1")
                Options.Callback = Options.Callback or function() end
                
                local IsOpen = false
            
                local SelectedValues
                local DropdownElements = {}
                if Options.MultiSelection then
                    SelectedValues = type(Options.Default) == "table" and Options.Default or {}
                else
                    SelectedValues = Options.Default or Options.Values[1] or ""
                end
            
                local Dropdown = {
                    HoverD = false,
                    ActiveD = false,
                    Values = SelectedValues
                }
                
                local Dropdown_F = CreateElement("Frame", {
                    Name = Options.Name,
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
                    Name = "Title_"..Options.Name,
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
                
                local Title_Dropdown = CreateElement("TextLabel", {
                    Name = "Title_Dropdown",
                    Size = UDim2.new(1, -30, 0, 13),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Options.Name.. ": ".. (Options.MultiSelection and (#SelectedValues > 0 and table.concat(SelectedValues, ", ") or "None") or tostring(SelectedValues)),
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
                    Name = "Content_".. Options.Name,
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
                local function UpdateTitle()
                    if Options.MultiSelection then
                        local selectedText = ""
                        if #SelectedValues > 0 then
                            selectedText = table.concat(SelectedValues, ", ")
                        else
                            selectedText = "None"
                        end
                        Title_Dropdown.Text = Options.Name.. ": ".. selectedText
                    else
                        Title_Dropdown.Text = Options.Name.. ": ".. tostring(SelectedValues)
                    end
                end
                
                -- COLOCAR ESTA FUNÇÃO ANTES do CreateDropdownItems
                
                -- Função para animar a abertura/fechamento do dropdown
                local function AnimateDropdown(open)
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
            
            -- DEPOIS colocar o CreateDropdownItems
                
                -- Função para criar um item do dropdown de forma otimizada
                local function CreateDropdownItem(value, index)
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
                    if Options.MultiSelection then
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
                        CenterBall.BackgroundTransparency = isSelected and 0 or 1
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
                    
                    -- Mude esta parte no clique do item:
                    ItemOnClick.MouseButton1Click:Connect(function()
                if Options.MultiSelection then
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
                    Options.Callback(SelectedValues)
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
                    Options.Callback(value) -- CORRIGIDO: enviar o valor, não a table
                end
            end)
                    
                    return Button_F
                end
                
                -- Função para criar os itens do dropdown de forma otimizada
                local function CreateDropdownItems()
                    -- Limpar elementos existentes
                    for _, element in pairs(DropdownElements) do
                        if element and element.Parent then
                            element:Destroy()
                        end
                    end
                    DropdownElements = {}
                    
                    -- Criar novos elementos de forma otimizada
                    for i, value in ipairs(Options.Values) do
                        CreateDropdownItem(value, i)
                    end
                end
                
                -- Função para animar a abertura/fechamento do dropdown
                
                -- Função para alternar o dropdown
                local function ToggleDropdown()
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
                
                -- Eventos de interação
                OnClick.MouseEnter:Connect(function()
                    Dropdown.HoverD = true
                    if not Dropdown.ActiveD then
                        TweenService:Create(Title_Dropdown, TweenInfo.new(0.15), {
                            TextTransparency = 0
                        }):Play()
                        TweenService:Create(Icon, TweenInfo.new(0.15), {
                            ImageTransparency = 0
                        }):Play()
                    end
                end)
                
                OnClick.MouseLeave:Connect(function()
                    Dropdown.HoverD = false
                    if not Dropdown.ActiveD then 
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
                    table.insert(Options.Values, value)
                    if IsOpen then
                        CreateDropdownItems()
                    end
                    UpdateTitle()
                end
                
                function Dropdown:DelValue(value)
                    local index = table.find(Options.Values, value)
                    if index then
                        table.remove(Options.Values, index)
                        
                        -- Remover da seleção se estiver selecionado
                        if Options.MultiSelection then
                            local selectedIndex = table.find(SelectedValues, value)
                            if selectedIndex then
                                table.remove(SelectedValues, selectedIndex)
                            end
                        elseif SelectedValues == value then
                            SelectedValues = Options.Values[1] or ""
                        end
                        
                        if IsOpen then
                            CreateDropdownItems()
                        end
                        UpdateTitle()
                    end
                end
                
                function Dropdown:EditValue(oldValue, newValue)
                    local index = table.find(Options.Values, oldValue)
                    if index then
                        Options.Values[index] = newValue
                        
                        -- Atualizar seleção se necessário
                        if Options.MultiSelection then
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
                    end
                end
                
                function Dropdown:GetValue()
                    return SelectedValues
                end
                
                function Dropdown:SetValue(value)
                    if Options.MultiSelection then
                        if type(value) == "table" then
                            SelectedValues = value
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
                end
                
                function Dropdown:SetName(newName)
                    Options.Name = newName
                    UpdateTitle()
                end
                
                -- Inicializar
                CreateDropdownItems()
                UpdateTitle()
                
                -- Fechar dropdown inicialmente
                Content_Dropdown_F.Size = UDim2.new(1, 0, 0, 0)
                
                return Dropdown
            end

            return Section
        end


        return Tab
    end
	
	return StorageTabs
end

return Lib
