local Icons = loadstring(game:HttpGet("https://raw.githubusercontent.com/AKAIDOUSER/HARPY-LIBRARY/refs/heads/main/Load%20Icons.lua"))()
Icons:LoadIcons("https://raw.githubusercontent.com/AKAIDOUSER/HARPY-LIBRARY/refs/heads/main/Icons.lua")

local Lib = {
    Features = {}, 
    Folder = "Synapse",
    
	Themes = {
	    Darker = {
	        Background = {
                Primary = Color3.fromRGB(10, 10, 10),
                Secondary = Color3.fromRGB(15, 15, 15),
                Tertiary = Color3.fromRGB(15, 15, 15),
                Card = Color3.fromRGB(15, 15, 15)
            },
            
            Text = {
                Primary = Color3.fromRGB(240, 240, 240),
                Secondary = Color3.fromRGB(180, 180, 180),
                Disabled = Color3.fromRGB(120, 120, 120)
            },
            
            Font = {
                Title = Enum.Font.Gotham,
                Text = Enum.Font.GothamSemibold
            },
            
            Image = {
                Primary = Color3.fromRGB(240, 240, 240),
                Secondary = Color3.fromRGB(180, 180, 180),
                Disabled = Color3.fromRGB(120, 120, 120),
                Shadow = Color3.fromRGB(15, 15, 15)
            },
            
            Border = {
                Primary = Color3.fromRGB(35, 35, 35),
            },
            
            Interactive = {
                Hover = Color3.fromRGB(45, 45, 55),
                Pressed = Color3.fromRGB(55, 55, 65),
                Selected = Color3.fromRGB(18, 18, 18),
                Disabled = Color3.fromRGB(60, 60, 70)
            },
            
            Highlight = {
                White = Color3.fromRGB(255, 255, 255),
                Blue = Color3.fromRGB(0, 120, 215),
                Purple = Color3.fromRGB(103, 58, 183),
                Green = Color3.fromRGB(76, 175, 80),
                Red = Color3.fromRGB(244, 67, 54),
                Orange = Color3.fromRGB(255, 152, 0),
                Cyan = Color3.fromRGB(0, 188, 212)
            },
            
            Apple = {
                Red = Color3.fromRGB(255, 79, 79),
                Yellow = Color3.fromRGB(227, 232, 95),
                Green = Color3.fromRGB(96, 181, 65),
            },
            
            Elements = {
                Button = {
                    Primary = Color3.fromRGB(18, 18, 18),
                    Text = Color3.fromRGB(240, 240, 240),
                    Thumb = Color3.fromRGB(240, 240, 240),
                },
                
                Checkbox = {
                    Primary = Color3.fromRGB(18, 18, 18),
                    Text = Color3.fromRGB(240, 240, 240),
                },
                
                Slider = {
                    Primary = Color3.fromRGB(18, 18, 18),
                    Text = Color3.fromRGB(240, 240, 240),
                    Display = Color3.fromRGB(240, 240, 240),
                    Thumb = Color3.fromRGB(180, 180, 180),
                    Track = Color3.fromRGB(200, 200, 200),
                    Bottom = Color3.fromRGB(25, 25, 25)
                },
                
                Dropdown = {
                    Primary = Color3.fromRGB(18, 18, 18),
                    Text = Color3.fromRGB(240, 240, 240),
                    Buttons = Color3.fromRGB(18, 18, 18),
                    Ball = Color3.fromRGB(240, 240, 240)
                },
                
                Colorpicker = {
                    Primary = Color3.fromRGB(18, 18, 18),
                    Text = Color3.fromRGB(240, 240, 240)
                },
                
                Input = {
                    Primary = Color3.fromRGB(18, 18, 18),
                    Text = Color3.fromRGB(240, 240, 240),
                    Placeholder = Color3.fromRGB(200, 200, 200),
                },
                
                Paragraph = {
                    Primary = Color3.fromRGB(18, 18, 18),
                    Text = Color3.fromRGB(240, 240, 240),
                },
                
                Label = {
                    Primary = Color3.fromRGB(18, 18, 18),
                    Text = Color3.fromRGB(240, 240, 240),
                },
                
                SubLabel = {
                    Primary = Color3.fromRGB(18, 18, 18),
                    Text = Color3.fromRGB(180, 180, 180),
                },
                
                Header = {
                    Primary = Color3.fromRGB(18, 18, 18),
                    Text = Color3.fromRGB(240, 240, 240),
                },
                
                Dialog = {
                    Primary = Color3.fromRGB(10, 10, 10),
                    Secondary = Color3.fromRGB(18, 18, 18),
                    Tertiary = Color3.fromRGB(15, 15, 15),
                    Buttons = Color3.fromRGB(25, 25, 25),
                    Title = Color3.fromRGB(240, 240, 240),
                    Text = Color3.fromRGB(180, 180, 180),
                },
                
                Notification = {
                    Primary = Color3.fromRGB(10, 10, 10),
                    Secondary = Color3.fromRGB(18, 18, 18),
                    Tertiary = Color3.fromRGB(15, 15, 15),
                    Title = Color3.fromRGB(240, 240, 240),
                    Text = Color3.fromRGB(180, 180, 180),
                },
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
	dropdown = "rbxassetid://106970154099045",
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

function Lib:GetGui()
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

function UiCorner(Size, Parent)
    local Corner
    task.spawn(function()
        Corner = CreateElement("UICorner", {
            CornerRadius = UDim.new(Size[1], Size[2]),  -- Acessa os valores diretamente
            Parent = Parent
        })
    end)
    return Corner
end

function UIStroke(Size, Trans, Color, Parent)
    task.spawn(function()
        local Stroke = CreateElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Thickness = Size,
            Transparency = Trans,
            Color = Color,
            Parent = Parent,
        })
	end)
	return Stroke
end

function Lib:Shadow(parent, theme)
    local Themes = self:GetThemeConfig(theme)

    task.spawn(function()
        local DropShadow = CreateElement("Frame", {
    		Name = "DropShadow",
    		Size = UDim2.new(1, 0, 1, 0),
    		AnchorPoint = Vector2.new(0, 0),
    		Position = UDim2.new(0, 0, 0, 0),
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
    		ImageColor3 = Themes.Image.Shadow,
    		ImageTransparency = 0.3,
    		ScaleType = Enum.ScaleType.Slice,
    		SliceCenter = Rect.new(49, 49, 450, 450),
    	})
    end)
end

function Lib:AppleBalls(Size, Parent, theme, style)
    local Themes = self:GetThemeConfig(theme)

    local HolderBalls_F = CreateElement("Frame", {
    	Name = "HolderBalls_F",
    	Size = UDim2.new(0, 0, 0, 0),
    	AutomaticSize = Enum.AutomaticSize.XY,
    	BackgroundTransparency = 1,
    	BorderSizePixel = 0,
    	Visible = true,
    	ClipsDescendants = true,
    	Parent = Parent
    })
    
    if style == 2 then 
        HolderBalls_F.AnchorPoint = Vector2.new(1, 0.5)
        HolderBalls_F.Position = UDim2.new(1, - 8, 0.5, 0)
    else 
        HolderBalls_F.AnchorPoint = Vector2.new(0, 0.5)
        HolderBalls_F.Position = UDim2.new(0, 8, 0.5, 0)
    end
	
	CreateElement("UIListLayout", {
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
		BackgroundColor3 = Themes.Apple.Red,
		BackgroundTransparency = 1,
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
		BackgroundColor3 = Themes.Apple.Yellow,
		BackgroundTransparency = 1,
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
		BackgroundColor3 = Themes.Apple.Green,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = HolderBalls_F
	})
	
	CreateElement("UICorner", {
		CornerRadius = UDim.new(1, 0),
		Parent = Ball_Green
	})
	
	if style == 2 then 
        task.spawn(function()
    		TweenService:Create(Ball_Green, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    			BackgroundTransparency = 0
    		}):Play()
    
    		task.delay(0.4, function()
    			TweenService:Create(Ball_Yellow, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    				BackgroundTransparency = 0
    			}):Play()
    		end)
    		
    		task.delay(0.8, function()
    			TweenService:Create(Ball_Red, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    				BackgroundTransparency = 0
    			}):Play()
    		end)
    	end)
    else 
        task.spawn(function()
    		TweenService:Create(Ball_Red, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    			BackgroundTransparency = 0
    		}):Play()
    
    		task.delay(0.4, function()
    			TweenService:Create(Ball_Yellow, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    				BackgroundTransparency = 0
    			}):Play()
    		end)
    		
    		task.delay(0.8, function()
    			TweenService:Create(Ball_Green, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    				BackgroundTransparency = 0
    			}):Play()
    		end)
    	end)
    end
	
	
	return HolderBalls_F
end

function Lib:AutoUpdateText(parent)
    parent:GetPropertyChangedSignal("Text"):Connect(function()
	    task.wait()
	    local textSize = game:GetService("TextService"):GetTextSize(
	        parent.Text,
	        parent.TextSize,
	        parent.Font,
	        Vector2.new(parent.AbsoluteSize.X, math.huge)
	    )
	    
	    parent.Size = UDim2.new(textSize.X, 0, 0, textSize.Y)
	end)
end

function Lib:LineX(Parent, Pos, Theme)
    local Themes = self:GetThemeConfig(Theme)

    task.spawn(function()
        local line = CreateElement("Frame", {
    		Size = UDim2.new(1, 0, 0, 1),
    		BackgroundColor3 = Themes.Border.Primary,
    		AnchorPoint = Vector2.new(1, 0),
    		Position = UDim2.new(1, 0, 0, 0),
    		BackgroundTransparency = 0,
    		BorderSizePixel = 0,
    		Visible = true,
    		ClipsDescendants = true,
    		Parent = Parent
    	})
    	
    	if Pos == "Down" then
    	    line.AnchorPoint = Vector2.new(1, 1)
            line.Position = UDim2.new(1, 0, 1, 0)
    	end
    end)
    
    return line
end

function Lib:LineY(Parent, Pos, Theme)
    local Themes = self:GetThemeConfig(Theme)

    task.spawn(function()
        local line = CreateElement("Frame", {
    		Size = UDim2.new(0, 1, 1, 0),
    		BackgroundColor3 = Themes.Border.Primary,
    		AnchorPoint = Vector2.new(0, 1),
    		Position = UDim2.new(0, 0, 1, 0),
    		BackgroundTransparency = 0,
    		BorderSizePixel = 0,
    		Visible = true,
    		ClipsDescendants = true,
    		Parent = Parent
    	})
    	
    	if Pos == "Right" then
    	    line.AnchorPoint = Vector2.new(1, 1)
            line.Position = UDim2.new(1, 0, 1, 0)
    	end
    end)
    
    return line
end

function Lib:UserInfoLayout(Parent, theme, State)
    local Themes = self:GetThemeConfig(theme)
    
    local userId = LocalPlayer.UserId
    local thumbType = Enum.ThumbnailType.AvatarBust
    local thumbSize = Enum.ThumbnailSize.Size48x48
    
    -- CORREÇÃO AQUI: GetUserThumbnailAsync retorna 2 valores
    local headshotImage, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
    
    local Headshot = CreateElement("ImageLabel", {
        Name = "Headshot",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Image = State and headshotImage or assets.userInfoBlurred,
        ImageTransparency = 1,
        Size = UDim2.fromOffset(28, 28),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 10, 0.5, 0),
        Parent = Parent,
    })
    
    CreateElement("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = Headshot
    })
    
    local Stk = CreateElement("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Thickness = 1,
        Color = Themes.Border.Primary,
        Parent = Headshot,
    })
    
    local NameAndDisplay = CreateElement("Frame", {
        Name = "NameAndDisplay",
        Parent = Parent,
        ClipsDescendants = true,
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        Size = UDim2.new(1, -52, 0, 0),
    })
    
    CreateElement("UIListLayout", {
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
        TextColor3 = Themes.Text.Primary,
        TextSize = 13,
        TextTransparency = 1,
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
    
    -- Username muda baseado no State
    local usernameText = State and ("@" .. LocalPlayer.Name) or "•••••••"
    
    local username = CreateElement("TextLabel", {
        Name = "Username",
        FontFace = Font.new(
            assets.interFont,
            Enum.FontWeight.SemiBold,
            Enum.FontStyle.Normal
        ),
        TextColor3 = Themes.Text.Secondary,
        TextSize = 12,
        TextTransparency = 1,
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
        Text = usernameText
    })
    
    local Speed = 1
    
    task.spawn(function()
        TweenService:Create(Headshot, TweenInfo.new(Speed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ImageTransparency = 0
        }):Play()
        
        TweenService:Create(Stk, TweenInfo.new(Speed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Thickness = 1
        }):Play()
        
        TweenService:Create(displayName, TweenInfo.new(Speed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            TextTransparency = 0.1
        }):Play()
        
        TweenService:Create(username, TweenInfo.new(Speed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            TextTransparency = 0.4
        }):Play()
    end)
    
    -- Retorne uma tabela com todos os elementos principais se precisar controlá-los depois
    return {
        Headshot = Headshot,
        DisplayName = displayName,
        Username = username,
        NameAndDisplay = NameAndDisplay,
        Stroke = Stk
    }
end

function Lib:AutoUpdateList(parent1, parent2, type)
    if type == "Frame" then
        parent1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            parent2.Size = UDim2.new(0, 0, 0, parent1.AbsoluteContentSize.Y)
        end)
    else
        parent1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            parent2.CanvasSize = UDim2.new(0, 0, 0, parent1.AbsoluteContentSize.Y)
        end)
    end
end

function Lib:HoverAimation(Parent1, Parent2, Hover, Active)
    Parent1.MouseEnter:Connect(function()
        Hover = true
        if not Active then
            TweenService:Create(Parent2, TweenInfo.new(0.15), {
                TextTransparency = 0
            }):Play()
        end
    end)
                
    Parent1.MouseLeave:Connect(function()
        Hover = false
        if not Active then 
            TweenService:Create(Parent2, TweenInfo.new(0.15), {
                TextTransparency = 0.4
            }):Play()
        end
    end)
end

function Lib:Window(Settings)
    Settings.Title = Settings.Title or "Synapse Lib"
    Settings.Theme = Settings.Theme or "Darker"
    Settings.Folder = Settings.Folder or "SynapseLib"
    Settings.ShowUserInfo = Settings.ShowUserInfo
    Settings.AcrylicBlur = Settings.AcrylicBlur or true
    Settings.Button = Settings.Button or false
    Settings.GlobalNotification = Settings.GlobalNotification or true
    Settings.Size = Settings.Size or {700, 430}
    Settings.TitleStyle = Settings.TitleStyle or 1
    Settings.MaxSize = Settings.MaxSize or {800, 500}
    Settings.MinSize = Settings.MinSize or {400, 300}
    Settings.KeyBind = Settings.KeyBind or Enum.KeyCode.K
    
	local StorageTabs = {CurrentTab = nil, FirstTab = true}
    local ScreenGui = Lib:GetGui()
    local Themes = self:GetThemeConfig(Settings.Theme)
    
    if getgenv()._Check_Loader_Menu then 
        getgenv()._Check_Loader_Menu = false 
        getgenv().StorageTabs:Unload()
        wait(0.4) 
    end

    getgenv()._Check_Loader_Menu = true
    getgenv().StorageTabs = StorageTabs
    
    local Window = CreateElement("Frame", {
		Name = Settings.Title,
		Size = UDim2.fromOffset(unpack(Settings.Size)),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = true,
		Active = true,
		Draggable = false,
		ZIndex = math.huge,
		ClipsDescendants = false,
		Parent = ScreenGui
	})

	UiCorner({0, 10}, Window)
	
	local ConteinerFuns = CreateElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = Themes.Background.Primary,
		BackgroundTransparency = Settings.AcrylicBlur and 0.04 or 0,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = Window
	})
	
	UiCorner({0, 10}, ConteinerFuns)
	
	local Left = CreateElement("Frame", {
		Size = UDim2.new(0, 180, 1, 0),
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = Themes.Background.Secondary,
		BackgroundTransparency = 0.03,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = ConteinerFuns
	})
	
	CreateElement("Frame", {
		Size = UDim2.new(0, 10, 1, 0),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Themes.Background.Secondary,
		BackgroundTransparency = 0.03,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Parent = Left
	})
    
    UiCorner({0, 10}, Left)
    
    local Title_Frame = CreateElement("Frame", {
		Size = UDim2.new(1, 0, 0, 40),
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Active = true,
		Parent = Left
	})
	
	local Title = CreateElement("TextLabel", {
        Size = UDim2.new(0, 0, 0, 18),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Visible = true,
        ClipsDescendants = true,
        Text = Settings.Title,
        TextColor3 = Themes.Text.Primary,
        TextTransparency = 0,
        TextScaled = false,
        TextSize = 13,
        Font = Themes.Font.Title,
        TextWrapped = true,
        TextYAlignment = Enum.TextYAlignment.Center,
        Parent = Title_Frame
    })
    
    local Tab_Frame = CreateElement("Frame", {
		Size = UDim2.new(1, 0, 1, - 90),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, -50),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = true,
		ClipsDescendants = true,
		Active = true,
		Parent = Left
	})
	
	local ScrollingFrame = CreateElement("ScrollingFrame", {
    	Name = "ScrollingFrame",
    	Size = UDim2.new(1, 0, 1, 0),
    	AnchorPoint = Vector2.new(1, 1),
    	Position = UDim2.new(1, 0, 1, 0),
    	BackgroundTransparency = 1,
    	BorderSizePixel = 0,
    	Visible = true,
    	ClipsDescendants = true,
    
    	CanvasSize = UDim2.new(0, 0, 0, 0),
    	ScrollBarThickness = 0,
    	ScrollBarImageTransparency = 1,
    	ScrollingDirection = Enum.ScrollingDirection.Y,
    	VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right,
    	
    	Parent = Tab_Frame
    })
    
    CreateElement("UIPadding", {
        PaddingLeft = UDim.new(0, 8),
       	PaddingRight = UDim.new(0, 8),
        PaddingTop = UDim.new(0, 8),
       	PaddingBottom = UDim.new(0, 8),
       	Parent = ScrollingFrame
    })
    
    local UIListLayout = CreateElement("UIListLayout", {
    	FillDirection = Enum.FillDirection.Vertical,
    	HorizontalAlignment = Enum.HorizontalAlignment.Center,
    	VerticalAlignment = Enum.VerticalAlignment.Top,
    	SortOrder = Enum.SortOrder.LayoutOrder,
    	Padding = UDim.new(0, 8),
    	
    	Parent = ScrollingFrame
    })
    
    local LocalPlayer_Frame = CreateElement("Frame", {
        Size = UDim2.new(1, 0, 0, 50),
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1, 
        BorderSizePixel = 0,
        Visible = true,
        Active = true,
        ClipsDescendants = true,
        Parent = Left
    })
	
	local Right_Frame = CreateElement("Frame", {
    	Size = UDim2.new(1, - 180, 1, 0),
    	AnchorPoint = Vector2.new(1, 1),
    	Position = UDim2.new(1, 0, 1, 0),
    	BackgroundTransparency = 1,
    	BorderSizePixel = 0,
    	Visible = true,
    	Active = true,
    	ClipsDescendants = true,
    	Parent = ConteinerFuns
   	})
   	
   	CreateElement("UIPadding", {
        PaddingLeft = UDim.new(0, 7),
       	PaddingRight = UDim.new(0, 7),
        PaddingTop = UDim.new(0, 7),
       	PaddingBottom = UDim.new(0, 7),
       	Parent = Right_Frame
    })

    

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
        
        TweenService:Create(Window, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = newPos
        }):Play()
    end
    
    Title_Frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Window.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    Title_Frame.InputChanged:Connect(function(input)
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
    local currentKeyBind = Settings.KeyBind
    local mainFrameVisible = true

    function toggleWindowVisibility()
        mainFrameVisible = not mainFrameVisible

        local dropShadow = Window:FindFirstChild("DropShadow")
        local imgDropShadow = dropShadow and dropShadow:FindFirstChild("ImgDropShadow")
        
        if mainFrameVisible then
            Window.Visible = true
            if dropShadow then
                dropShadow.Visible = true
            end
        else
            if dropShadow then
                dropShadow.Visible = false
            end
            Window.Visible = false
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
    
    function setupMobileButton()
        if Settings.Button then
            local Main_Button = CreateElement("Frame", {
                Name = Settings.Title,
        		Size = UDim2.fromOffset(60,60),
        		AnchorPoint = Vector2.new(0.5, 0),
        		Position = UDim2.new(0.5, 0, 0, 8),
        		BackgroundColor3 = Themes.Background.Primary,
        		BackgroundTransparency = 0,
        		BorderSizePixel = 0,
        		Visible = Settings.Button,
        		Active = true,
        		Draggable = true,
        		ZIndex = Window.ZIndex + 99999999,
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
                Color = Themes.Border.Primary,
                Parent = Main_Button,
            })
        	
        	Lib:Shadow(Main_Button, Settings.Theme)
        	
            local Icon = CreateElement("ImageLabel", {
                Name = "Icon",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                ImageColor3 = Themes.Text.Primary,
                Image = "rbxassetid://" .. tostring(Icons:GetIcon("Logo")),
                ImageTransparency = 0, 
                Size = UDim2.fromOffset(50, 50),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Parent = Main_Button,
            })
            
            local OnClick = CreateElement("TextButton", {
                Name = "OnClickW",
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

    setupMobileButton()

    setupKeyBind()
	
	if Settings.TitleStyle == 2 then
        Title.AnchorPoint = Vector2.new(0, 0.5)
        Title.Position = UDim2.new(0, 8, 0.5, 0)
        Title.TextXAlignment = Enum.TextXAlignment.Left
    else
        Title.AnchorPoint = Vector2.new(1, 0.5)
        Title.Position = UDim2.new(1, - 8, 0.5, 0)
        Title.TextXAlignment = Enum.TextXAlignment.Right
    end
    
    Lib:LineX(Title_Frame, "Down", Settings.Theme)
    Lib:LineY(Left, "Right", Settings.Theme)
    Lib:UserInfoLayout(LocalPlayer_Frame, Settings.Theme, Settings.ShowUserInfo)
    Lib:AppleBalls({8, 8} ,Title_Frame, Settings.Theme, Settings.TitleStyle)
    Lib:AutoUpdateText(Title)
    Lib:AutoUpdateList(UIListLayout, ScrollingFrame, "ScrollingFrame")
    
    function StorageTabs:Unload()
        if Window and Window.Parent then
            Window:Destroy()
        end
        
        for flag, _ in pairs(Lib.Features) do
            Lib.Features[flag] = nil
        end
        
        local mobileButton = ScreenGui:FindFirstChild(Settings.Title)
        if mobileButton then
            mobileButton:Destroy()
        end

        if ScreenGui then
            ScreenGui:Destroy()
        end
        
        getgenv()._Check_Loader_Menu = false
    end
    
    function StorageTabs:SetMobileButton(visible)
        local mobileButton = ScreenGui:FindFirstChild("MobileToggleButton")
        if mobileButton then
            mobileButton.Visible = visible
        end
    end
    
    function StorageTabs:SetTitle(text)
        Title.Text = text
    end
    
    function StorageTabs:SetSize(size)
        Window.Size = UDim2.fromOffset(size)
    end
    
    function StorageTabs:SetAcrylicBlur(state)
        ConteinerFuns.BackgroundTransparency = state and 0.04 or 0
    end
    
    function StorageTabs:SetShowUserInfo(state)
        Settings.ShowUserInfo = state
        
        -- Limpar o frame atual
        for _, child in pairs(LocalPlayer_Frame:GetChildren()) do
            child:Destroy()
        end
        
        -- Recriar o UserInfo com o novo estado
        Lib:UserInfoLayout(LocalPlayer_Frame, Settings.Theme, state)
    end
    
    function StorageTabs:SetKeyBind(key)
        Settings.KeyBind = key
        currentKeyBind = key
    end
    
    function StorageTabs:SetTitleStyle(style)
        Settings.TitleStyle = style
        
        -- Atualizar posição do título
        if style == 2 then
            Title.AnchorPoint = Vector2.new(0, 0.5)
            Title.Position = UDim2.new(0, 8, 0.5, 0)
            Title.TextXAlignment = Enum.TextXAlignment.Left
        else
            Title.AnchorPoint = Vector2.new(1, 0.5)
            Title.Position = UDim2.new(1, -8, 0.5, 0)
            Title.TextXAlignment = Enum.TextXAlignment.Right
        end
        
        -- Atualizar Apple Balls
        local holder = Title_Frame:FindFirstChild("HolderBalls_F")
        if holder then
            holder:Destroy()
        end
        
        -- Recriar Apple Balls com novo estilo
        Lib:AppleBalls({8, 8}, Title_Frame, Settings.Theme, style)
    end
    
    function StorageTabs:Divider()
        local Divider = {}
        local F_Divider = CreateElement("Frame", {
            Size = UDim2.new(1, - 20, 0, 1),
            BackgroundColor3 = Themes.Border.Primary,
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Visible = true,
            ClipsDescendants = true,
            Parent = ScrollingFrame
        })
        
        UiCorner({1, 0}, F_Divider)
        
        function Divider:SetVisibility(boolean)
            F_Divider.Visible = boolean
        end
        
        function Divider:Remove()
            F_Divider:Destroy()
        end
        
        return Divider
    end
    
    function StorageTabs:Tab(Settings)
        Settings.Name = Settings.Name or "Home"
        Settings.Icon = Settings.Icon or "Home"
        
        local Tab = {
            Hover = false,
            Active = false
        }
        
        local Tab_F = CreateElement("Frame", {
            Name = Settings.Name.. "_Tab_F",
            Size = UDim2.new(1, -4, 0, 26),
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.new(0, 0, 0, 0),
            BackgroundColor3 = Themes.Interactive.Selected,
            BackgroundTransparency = 1,
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
            Thickness = 0,
            Color = Themes.Border.Primary,
            Parent = Tab_F,
        })
        
        local iconId = Icons:GetIcon(Settings.Icon)
        
        local Icon = CreateElement("ImageLabel", {
            Name = "Icon",
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            ImageColor3 = Themes.Image.Primary,
            Image = "rbxassetid://" .. tostring(iconId) or "7436811843",
            ImageTransparency = 0.6,
            Size = UDim2.fromOffset(17, 17),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 8, 0.5, 0),
            Parent = Tab_F,
        })
    
        local Title_Tab = CreateElement("TextLabel", {
            Name = "Title_Tab",
            Size = UDim2.new(0, 0, 0, 13),
            AnchorPoint = Vector2.new(0, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
            Position = UDim2.new(0, 33, 0.5, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Visible = true,
            ClipsDescendants = true,
            
            Text = Settings.Name,
            TextColor3 = Themes.Text.Primary,
            TextTransparency = 0.6, -- Começa transparente
            TextScaled = true,
            TextSize = 10,
            Font = Themes.Font.Text,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            
            Parent = Tab_F
        })
        
        local OnClick = CreateElement("TextButton", {
            Name = "OnClickT",
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
    		BackgroundTransparency = 1,
    		BorderSizePixel = 0,
    		Visible = false,
    		ClipsDescendants = true,
    		Parent = Right_Frame
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
            Padding = UDim.new(0, 10),
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Vertical,
            Parent = left
        })
        
        local right = CreateElement("Frame", {
            Name = "Right",
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.new(0.5, -5, 1, 0),
            Parent = ScrollPages
        })
        
        local rightUIListLayout = CreateElement("UIListLayout", {
            Name = "RightUIListLayout",
            Padding = UDim.new(0, 10),
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Vertical,
            Parent = right
        })
        
        Lib:AutoUpdateList(UiList, ScrollPages, "ScrollingFrame")
        Lib:AutoUpdateText(Title_Tab)
        
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
        
        function Tab:SetName(text)
            Title_Tab.Text = text
        end
        
        function Tab:SetIcon(icon)
            Icon.Image = "rbxassetid://" .. Icons:GetIcon(icon)
        end
        
        function Tab:Section(Settings)
            Settings.Header = Settings.Header or ""
            Settings.Side = Settings.Side or "Left"
            
            local Section = {}
            
            local Section_Frame = CreateElement("Frame", {
                Name = Settings.Header.. "_Section",
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = Themes.Background.Card,
                BackgroundTransparency = 0.07,
                BorderSizePixel = 0,
                Visible = true,
                ClipsDescendants = true,
                Parent = Settings.Side == "Left" and left or right
            })
            
            UiCorner({0, 7}, Section_Frame)
            UIStroke(1, 0, Themes.Border.Primary, Section_Frame)
            
            local ListLayoutSection = CreateElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 8),
                
                Parent = Section_Frame
            })
            
            CreateElement("UIPadding", {
                Parent = Section_Frame,
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10),
                PaddingTop = UDim.new(0, 8),
                PaddingBottom = UDim.new(0, 8)
            })
            
            if Settings.Header ~= "" then
                local Header_Frame = CreateElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 15),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = false,
                    Parent = Section_Frame
                })
                
                local Title_Sec = CreateElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 13),
                    AnchorPoint = Vector2.new(0, 0.5),
                    AutomaticSize = Enum.AutomaticSize.X,
                    Position = UDim2.new(0, - 2, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Settings.Header,
                    TextColor3 = Themes.Text.Primary,
                    TextTransparency = 0,
                    TextScaled = true,
                    TextSize = 13,
                    Font = Themes.Font.Text,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Header_Frame
                })
                
                Lib:AutoUpdateText(Title_Sec)
            end 
            
            ListLayoutSection:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                task.spawn(function()
                    Section_Frame.Size = UDim2.new(1, 0, 0, ListLayoutSection.AbsoluteContentSize.Y + 17)
                end)
            end)
            
            function Section:Divider()
                local Divider = {}
                local F_Divider = CreateElement("Frame", {
                    Size = UDim2.new(1, - 20, 0, 1),
                    BackgroundColor3 = Themes.Border.Primary,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Section_Frame
                })
                
                UiCorner({1, 0}, F_Divider)
                
                function Divider:SetVisibility(boolean)
                    F_Divider.Visible = boolean
                end
                
                function Divider:Remove()
                    F_Divider:Destroy()
                end
                
                return Divider
            end
            
            function Section:Paragraph(Flags, Settings)
                local Element = Themes.Elements.Paragraph
                local Paragraph = {
                    Settings = Settings,
                }
                
                Paragraph.Settings.Header = Paragraph.Settings.Header or "Paragraph"
                Paragraph.Settings.Body = Paragraph.Settings.Body or "Paragraph body. Lorem ipsum odor amet, consectetuer adipiscing elit. Morbi tempus netus aliquet per velit est gravida."
                
                local Paragraph_Element = CreateElement("Frame", {
                    Name = Paragraph.Settings.Header.. "_Paragraph",
                    Size = UDim2.new(1, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Element.Primary,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    Active = true,
                    ClipsDescendants = true,
                    Parent = Section_Frame
                })
                
                local HeaderF = CreateElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 17),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Paragraph_Element
                })

                local Header_Paragraph = CreateElement("TextLabel", {
                    Name = "Header",
                    Size = UDim2.new(0, 0, 0, 13),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Paragraph.Settings.Header,
                    TextColor3 = Element.Text,
                    TextTransparency = 0.1,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Themes.Font.Text,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = HeaderF
                })

                local Content = CreateElement("Frame", {
                    Name = "Content",
                    Size = UDim2.new(1, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 13),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Paragraph_Element
                })
                
                CreateElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                    PaddingTop = UDim.new(0, 5),
                    PaddingBottom = UDim.new(0, 5),
                    Parent = Content
                })
                
                local Body_Paragraph = CreateElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Paragraph.Settings.Body,
                    TextColor3 = Element.Text,
                    TextTransparency = 0.3,
                    TextScaled = false,
                    TextSize = 10,
                    Font = Themes.Font.Text,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    
                    Parent = Content
                })

                UiCorner({0, 4}, Paragraph_Element)
                UIStroke(1, 0.2, Themes.Border.Primary, Paragraph_Element)
                
                Lib:AutoUpdateText(Header_Paragraph)
                
                Body_Paragraph:GetPropertyChangedSignal("Text"):Connect(function()
                    task.wait()
                    local textSize = game:GetService("TextService"):GetTextSize(
                        ContentT.Text,
                        ContentT.TextSize,
                        ContentT.Font,
                        Vector2.new(Body_Paragraph.AbsoluteSize.X, math.huge)
                    )
                    
                    Content.Size = UDim2.new(1, 0, 0, textSize.Y)
                    Body_Paragraph.Size = UDim2.new(1, 0, 0, textSize.Y)
                    Paragraph_Element.Size = UDim2.new(1, 0, 0, 17 + textSize.Y)
                end)
            
                function Paragraph:SetVisibility(boolean)
                    Paragraph_Element.Visible = boolean
                end
                
                function Paragraph:SetHeader(text)
                    if typeof(text) == "string" then
                        Header_Paragraph.Text = text
                        Paragraph.Settings.Header = text
                    end
                    return Paragraph
                end
                
                function Paragraph:SetBody(text)
                    if typeof(text) == "string" then
                        Body_Paragraph.Text = text
                        Paragraph.Settings.Body = text
                    end
                    return Paragraph
                end
                
                function Paragraph:GetHeader()
                    return Header_Paragraph.Text
                end
                
                function Paragraph:GetBody()
                    return Body_Paragraph.Text
                end
                
                function Paragraph:Remove()
                    if Paragraph_Element then
                        Paragraph_Element:Destroy()
                    end
                end
                
                if Flag then
    			    Lib.Features[Flag] = Paragraph
    	        end
                
                return Paragraph
            end
            
            function Section:Label(Flags, Settings)
                local Element = Themes.Elements.Label
                local Label = {
                    Settings = Settings,
                }
                
                Label.Settings.Text = Label.Settings.Text or "Label"
                
                local Label_Element = CreateElement("Frame", {
                    Name = Label.Settings.Text.. "_Label",
                    Size = UDim2.new(1, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Element.Primary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    Active = true,
                    ClipsDescendants = true,
                    Parent = Section_Frame
                })
                
                local Text_Label = CreateElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 8, 0, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Label.Settings.Text,
                    TextColor3 = Element.Text,
                    TextTransparency = 0.2,
                    TextScaled = false,
                    TextSize = 13,
                    Font = Themes.Font.Text,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Label_Element
                })
                
                Text_Label:GetPropertyChangedSignal("Text"):Connect(function()
                    task.wait()
                    local textSize = game:GetService("TextService"):GetTextSize(
                        ContentT.Text,
                        ContentT.TextSize,
                        ContentT.Font,
                        Vector2.new(Text_Label.AbsoluteSize.X, math.huge)
                    )
                    
                    Text_Label.Size = UDim2.new(1, 0, 0, textSize.Y)
                    Label_Element.Size = UDim2.new(1, 0, 0, textSize.Y)
                end)

                function Label:SetVisibility(boolean)
                    Label_Element.Visible = boolean
                end
                
                function Label:SetText(text)
                    if typeof(text) == "string" then
                        Text_Label.Text = text
                        Label.Settings.Text = text
                    end
                    return Label
                end
                
                function Label:GetText()
                    return Text_Label.Text
                end
                
                function Label:Remove()
                    if Label_Element then
                        Label_Element:Destroy()
                    end
                end
                
                if Flag then
    			    Lib.Features[Flag] = Label
    	        end

                return Label
            end
            
            function Section:SubLabel(Flags, Settings)
                local Element = Themes.Elements.SubLabel
                local SubLabel = {
                    Settings = Settings,
                }
                
                SubLabel.Settings.Text = SubLabel.Settings.Text or "Label"
                
                local SubLabel_Element = CreateElement("Frame", {
                    Name = SubLabel.Settings.Text.. "_SubLabel",
                    Size = UDim2.new(1, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Element.Primary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    Active = true,
                    ClipsDescendants = true,
                    Parent = Section_Frame
                })
                
                local Text_SubLabel = CreateElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 8, 0, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = SubLabel.Settings.Text,
                    TextColor3 = Element.Text,
                    TextTransparency = 0.3,
                    TextScaled = false,
                    TextSize = 11,
                    Font = Themes.Font.Text,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = SubLabel_Element
                })
                
                Text_SubLabel:GetPropertyChangedSignal("Text"):Connect(function()
                    task.wait()
                    local textSize = game:GetService("TextService"):GetTextSize(
                        ContentT.Text,
                        ContentT.TextSize,
                        ContentT.Font,
                        Vector2.new(Text_SubLabel.AbsoluteSize.X, math.huge)
                    )
                    
                    Text_SubLabel.Size = UDim2.new(1, 0, 0, textSize.Y)
                    SubLabel_Element.Size = UDim2.new(1, 0, 0, textSize.Y)
                end)

                function SubLabel:SetVisibility(boolean)
                    SubLabel_Element.Visible = boolean
                end
                
                function SubLabel:SetText(text)
                    if typeof(text) == "string" then
                        Text_SubLabel.Text = text
                        SubLabel.Settings.Text = text
                    end
                    return Label
                end
                
                function SubLabel:GetText()
                    return Text_SubLabel.Text
                end
                
                function SubLabel:Remove()
                    if SubLabel_Element then
                        SubLabel_Element:Destroy()
                    end
                end
                
                if Flag then
    			    Lib.Features[Flag] = SubLabel
    	        end

                return SubLabel
            end

            function Section:Button(Flag, Settings)
                local Element = Themes.Elements.Button
                local Button = {
                     Settings = Settings,
                     Hover_B = false,
                     Active_B = false
                }
                
                Button.Settings.Name = Button.Settings.Name or "Button"
                Button.Settings.Callback = Button.Settings.Callback or function() end
                
                local Button_Element = CreateElement("Frame", {
                    Name = Button.Settings.Name.. "_Button",
                    Size = UDim2.new(1, 0, 0, 30),
                    BackgroundColor3 = Element.Primary,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    Active = true,
                    ClipsDescendants = true,
                    Parent = Section_Frame
                })
                
                UiCorner({0, 8}, Button_Element)
                UIStroke(1, 0.2, Themes.Border.Primary, Button_Element)
                
                local Title_Button = CreateElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 13),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Button.Settings.Name,
                    TextColor3 = Element.Text,
                    TextTransparency = 0.4,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Themes.Font.Text,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Button_Element
                })
                
                local InvisCircle = CreateElement("Frame", {
                    Size = UDim2.fromOffset(11, 11),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, - 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Button_Element
                })
                
                UiCorner({1, 0}, InvisCircle)
                UIStroke(1, 0.6, Element.Thumb, InvisCircle)
                
                local CenterBall = CreateElement("Frame", {
                    Size = UDim2.fromOffset(8, 8),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    BackgroundColor3 = Element.Thumb,
                    BackgroundTransparency = 0.6,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = InvisCircle
                })
                
                UiCorner({1, 0}, CenterBall)
                
                local OnClick = CreateElement("TextButton", {
                    Name = "OnClick_".. Button.Settings.Name,
                    Parent = Button_Element,
                    BackgroundTransparency = 1.000,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    AutoButtonColor = false,
                    Text = "",
                    TextSize = 0.000,
                })
                
                Lib:AutoUpdateText(Title_Button)
                Lib:HoverAimation(OnClick, Title_Button, Button.Hover_B, Button.Active_B)
                
                OnClick.MouseButton1Click:Connect(function()
                    Button:Callback()
                end)
                
                function Button:Callback()
                    pcall(Button.Settings.Callback)
                end
                
                function Button:SetName(text)
                    Title_Button.Text = text or Button.Settings.Name
                end
                
                function Button:GetName()
                    return Title_Button.Text
                end 
                
                function Button:SetVisibility(state)
                    Button_Element.Visible = state or false
                end 
                
                function Button:GetVisibility()
                    return Button_Element.Visible
                end 
                
                function Button:Destroy()
                    Button_Element:Destroy()
                end
                
                if Flag then
    			    Lib.Features[Flag] = Button
    	        end
                
                return Button
            end
            
            function Section:Checkbox(Flag, Settings)
                local Element = Themes.Elements.Checkbox
                
                -- Configurações com valores padrão
                Settings = Settings or {}
                Settings.Name = Settings.Name or "Checkbox"
                Settings.Default = Settings.Default or false
                Settings.Callback = Settings.Callback or function() end
                
                -- Executar callback inicial
                pcall(Settings.Callback, Settings.Default)
                
                -- Criar objeto Checkbox
                local Checkbox = {
                    Settings = Settings,
                    IgnoreConfig = false, 
                    Class = "Checkbox",
                    Hover_C = false,
                    Active_C = false,
                    Value = Settings.Default
                }
                
                local Checkbox_Element = CreateElement("Frame", {
                    Name = Checkbox.Settings.Name.. "_Checkbox",
                    Size = UDim2.new(1, 0, 0, 30),
                    BackgroundColor3 = Element.Primary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    Active = true,
                    ClipsDescendants = true,
                    Parent = Section_Frame
                })
                
                local Title_Checkbox = CreateElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 13),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Checkbox.Settings.Name,
                    TextColor3 = Element.Text,
                    TextTransparency = 0.4,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Themes.Font.Text,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Checkbox_Element
                })
                
                local Check_Frame = CreateElement("Frame", {
                    Size = UDim2.new(0, 20, 0, 20),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -8, 0.5, 0),
                    BackgroundColor3 = Element.Primary,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    Active = true,
                    ClipsDescendants = true,
                    Parent = Checkbox_Element
                })
                
                UiCorner({0, 5}, Check_Frame)
                UIStroke(1, 0, Themes.Border.Primary, Check_Frame)
            
                local Icon = CreateElement("ImageLabel", {
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    ImageColor3 = Themes.Image.Primary,
                    Image = "rbxassetid://" .. tostring(Icons:GetIcon("Check")),
                    ImageTransparency = 1,
                    Size = UDim2.fromOffset(15, 15),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Parent = Check_Frame,
                })
                
                local OnClick = CreateElement("TextButton", {
                    Name = "OnClick_".. Checkbox.Settings.Name,
                    Parent = Checkbox_Element,
                    BackgroundTransparency = 1.000,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    AutoButtonColor = false,
                    Text = "",
                    TextSize = 0.000,
                })
                
                Lib:HoverAimation(OnClick, Title_Checkbox, Checkbox.Hover_C, Checkbox.Active_C)
                Lib:AutoUpdateText(Title_Checkbox)
                
                function Checkbox:Activate()
                    task.spawn(function()
                        TweenService:Create(Icon, TweenInfo.new(0.15), {
                            ImageTransparency = 0.4
                        }):Play()
                    end)
                end
                
                function Checkbox:Deactivate()
                    task.spawn(function()
                        TweenService:Create(Icon, TweenInfo.new(0.15), {
                            ImageTransparency = 1
                        }):Play()
                    end)
                end
                
                function Checkbox:Default()
                    Spawn(function()
                        if Checkbox.Value then
                            Checkbox:Activate()
                        else
                            Checkbox:Deactivate()
                        end
                    end)
                end
                
                function Checkbox:Callback()
                    Spawn(function()
                        Checkbox.Value = not Checkbox.Value
                        pcall(Checkbox.Settings.Callback, Checkbox.Value)
                        
                        if Checkbox.Value then
                            Checkbox:Activate()
                        else
                            Checkbox:Deactivate()
                        end
                    end)
                end
                
                function Checkbox:SetValue(value)
                    Spawn(function()
                        if value ~= Checkbox.Value then
                            Checkbox.Value = value
                            pcall(Checkbox.Settings.Callback, Checkbox.Value)
                            
                            if Checkbox.Value then
                                Checkbox:Activate()
                            else
                                Checkbox:Deactivate()
                            end
                        end
                    end)
                    return Checkbox
                end
                
                function Checkbox:GetValue()
                    return Checkbox.Value
                end
                
                OnClick.MouseButton1Click:Connect(function()
                    Checkbox:Callback()
                end)
                
                Checkbox:Default()
                
                function Checkbox:SetName(text)
                    Title_Checkbox.Text = text or Checkbox.Settings.Name
                end
                
                function Checkbox:GetName()
                    return Title_Checkbox.Text
                end 
                
                function Checkbox:SetVisibility(state)
                    Checkbox_Element.Visible = state or false
                end 
                
                function Checkbox:GetVisibility()
                    return Checkbox_Element.Visible
                end 
                
                function Checkbox:Destroy()
                    Checkbox_Element:Destroy()
                end
                
                if Flag then
                    Lib.Features[Flag] = Checkbox
                end
                
                return Checkbox
            end
            
            function Section:Dropdown(Flag, Settings)
                local Element = Themes.Elements.Dropdown
                local Dropdown = {
                    Settings = Settings,
                    IgnoreConfig = false, 
                    Class = "Dropdown",
                    Hover_D = false,
                    Active_D = false,
                    Open = false,
                    Selected = nil,
                    Values = {}
                }
                
                -- Configurações padrão
                Dropdown.Settings.Name = Dropdown.Settings.Name or "Dropdown"
                Dropdown.Settings.Values = Dropdown.Settings.Values or {"Banana", "Apple", "Melon"}
                Dropdown.Settings.Default = Dropdown.Settings.Default or Dropdown.Settings.Values[1]
                Dropdown.Settings.Callback = Dropdown.Settings.Callback or function() end
                
                -- Executar callback com valor padrão
                Dropdown.Selected = Dropdown.Settings.Default
                pcall(Dropdown.Settings.Callback, Dropdown.Settings.Default)
                
                -- Frame principal do dropdown
                local Dropdown_Element = CreateElement("Frame", {
                    Name = Dropdown.Settings.Name.. "_Dropdown",
                    Size = UDim2.new(1, 0, 0, 30),
                    BackgroundColor3 = Element.Primary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    Active = true,
                    ClipsDescendants = false,
                    Parent = Section_Frame
                })
                
                -- Container dos elementos
                local Elements = CreateElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundColor3 = Element.Primary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    Active = true,
                    ClipsDescendants = true,
                    Parent = Dropdown_Element
                })
                
                -- Título do dropdown
                local Title_Dropdown = CreateElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 13),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Dropdown.Settings.Name,
                    TextColor3 = Element.Text,
                    TextTransparency = 0.4,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Themes.Font.Text,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Elements
                })
                
                Lib:HoverAimation(Title_Dropdown, Title_Dropdown, Dropdown.Hover_D, Dropdown.Active_D)
                
                -- Display do dropdown (onde mostra o valor selecionado)
                local Dropdown_Display = CreateElement("Frame", {
                    Size = UDim2.new(0, 0, 0, 20),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -8, 0.5, 0),
                    BackgroundColor3 = Element.Primary,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    Active = true,
                    ClipsDescendants = false,
                    Parent = Elements
                })
                
                -- Texto do valor selecionado
                local Display_Text = CreateElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 13),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 5, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Dropdown.Selected,
                    TextColor3 = Element.Text,
                    TextTransparency = 0.2,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Themes.Font.Text,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Dropdown_Display
                })
                
                -- Ícone do dropdown
                local Icon = CreateElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    ImageColor3 = Element.Text,
                    Image = "rbxassetid://6031090990", -- Ícone padrão de dropdown
                    ImageTransparency = 0.2,
                    Size = UDim2.fromOffset(15, 15),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -5, 0.5, 0),
                    Parent = Dropdown_Display,
                })
                
                local Onclick_Dropdown_Display = CreateElement("TextButton", {
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Text = "",
                    AutoButtonColor = false,
                    Parent = Dropdown_Display
                })
                
                -- Aplicar bordas e cantos arredondados
                UiCorner({0, 5}, Dropdown_Display)
                UIStroke(1, 0.2, Themes.Border.Primary, Dropdown_Display)
                
                -- Container das opções (inicialmente escondido)
                local Dropdown_Content = CreateElement("Frame", {
                    Size = UDim2.new(0, Dropdown_Display.AbsoluteSize.X, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Element.Primary,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = false,
                    Active = true,
                    ZIndex = 999999999999,
                    ClipsDescendants = true,
                    Parent = Conteiner
                })
                
                -- Lista para organizar as opções
                local ListLayout = CreateElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 2),
                    
                    Parent = Dropdown_Content
                })
                
                -- Padding interno
                CreateElement("UIPadding", {
                    Parent = Dropdown_Content,
                    PaddingLeft = UDim.new(0, 5),
                    PaddingRight = UDim.new(0, 5),
                    PaddingTop = UDim.new(0, 5),
                    PaddingBottom = UDim.new(0, 5)
                })
                
                UiCorner({0, 5}, Dropdown_Content)
                UIStroke(1, 0, Themes.Border.Primary, Dropdown_Content)

                -- Função para atualizar o tamanho do display com base no texto
                function updateDropdownSize()
                    local currentText = Display_Text.Text
                    local textSize = game:GetService("TextService"):GetTextSize(
                        currentText,
                        Display_Text.TextSize,
                        Display_Text.Font,
                        Vector2.new(math.huge, 20)
                    )
                    
                    -- Calcular largura necessária (texto + espaço para ícone)
                    local requiredWidth = textSize.X + 25  -- 25 pixels para o ícone e padding
                    
                    -- Definir limites mínimos e máximos
                    local minWidth = 80
                    local maxWidth = 200
                    
                    -- Aplicar limites
                    local finalWidth = math.clamp(requiredWidth, minWidth, maxWidth)
                    
                    -- Atualizar tamanhos
                    Display_Text.Size = UDim2.new(0, textSize.X, 0, 13)
                    Dropdown_Display.Size = UDim2.new(0, finalWidth, 0, 20)
                    
                    -- Atualizar posição do ícone
                    Icon.Position = UDim2.new(1, -5, 0.5, 0)
                    
                    -- Atualizar tamanho do título para ocupar espaço restante
                    local availableWidth = Dropdown_Element.AbsoluteSize.X - finalWidth - 16
                    if availableWidth > 0 then
                        Title_Dropdown.Size = UDim2.new(0, availableWidth, 0, 13)
                        Title_Dropdown.Position = UDim2.new(0, 8, 0.5, 0)
                    end
                end
                
                -- Conectar evento para atualizar tamanho quando o texto mudar
                Display_Text:GetPropertyChangedSignal("Text"):Connect(updateDropdownSize)
                
                -- Função para atualizar tamanho das opções
                function updateContentSize()
                    local maxOptionWidth = 0
                    
                    -- Encontrar a opção mais larga
                    for _, optionData in pairs(Dropdown.Values) do
                        if optionData.OptionText then
                            local optionText = optionData.OptionText.Text
                            local textSize = game:GetService("TextService"):GetTextSize(
                                optionText,
                                optionData.OptionText.TextSize,
                                optionData.OptionText.Font,
                                Vector2.new(math.huge, 20)
                            )
                            
                            maxOptionWidth = math.max(maxOptionWidth, textSize.X + 25) -- +25 para padding
                        end
                    end
                    
                    -- Definir largura do conteúdo (mínimo 80, máximo 250)
                    local contentWidth = math.clamp(math.max(Dropdown_Display.AbsoluteSize.X, maxOptionWidth), 80, 250)
                    
                    -- Atualizar largura de todas as opções
                    for _, optionData in pairs(Dropdown.Values) do
                        if optionData.Frame then
                            optionData.Frame.Size = UDim2.new(1, 0, 0, 20)
                        end
                    end
                    
                    -- Atualizar tamanho do conteúdo
                    local itemCount = #Dropdown.Settings.Values
                    local itemHeight = 20
                    local padding = 10 -- padding interno
                    local spacing = (itemCount - 1) * 2
                    
                    local totalHeight = (itemCount * itemHeight) + padding + spacing
                    
                    Dropdown_Content.Size = UDim2.new(0, contentWidth, 0, totalHeight)
                end
                
                -- Inicializar tamanhos
                updateDropdownSize()

                -- Função para alternar o dropdown
                function toggleDropdown()
                    Dropdown.Open = not Dropdown.Open
                    
                    if Dropdown.Open then

                        local displayAbsolutePos = Dropdown_Display.AbsolutePosition
                        local displayAbsoluteSize = Dropdown_Display.AbsoluteSize
            
                        local contentParentAbsolutePos = Dropdown_Content.Parent.AbsolutePosition
            
                        local relativeY = (displayAbsolutePos.Y - contentParentAbsolutePos.Y) + displayAbsoluteSize.Y + 5
            
                        local relativeX = displayAbsolutePos.X - contentParentAbsolutePos.X
                        local widthDifference = Dropdown_Display.AbsoluteSize.X - Dropdown_Content.AbsoluteSize.X
            
                        local itemCount = #Dropdown.Settings.Values
                        local itemHeight = 20
                        local padding = 8
                        local spacing = (itemCount - 1) * 2
                        
                        local totalHeight = (itemCount * itemHeight) + padding + spacing
            
                        Dropdown_Content.Position = UDim2.new(0, relativeX , 0, relativeY)
                        Dropdown_Content.Size = UDim2.new(0, Dropdown_Display.AbsoluteSize.X, 0, totalHeight)
                        
                        TweenService:Create(Icon, TweenInfo.new(0.2), {
                            Rotation = 180
                        }):Play()
                        
                        Dropdown_Content.Visible = true
                    else
                        TweenService:Create(Icon, TweenInfo.new(0.15), {
                            Rotation = 0
                        }):Play()
                        
                        Dropdown_Content.Visible = false
                    end
                end
                
                -- Função para criar um botão de opção
                function createOptionButton(value)
                    local OptionButton = CreateElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 20),
                        BackgroundColor3 = Element.Primary,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Visible = true,
                        Active = true,
                        ClipsDescendants = true,
                        Parent = Dropdown_Content
                    })
                    
                    -- ADICIONE ESTE BOTÃO INVISÍVEL para capturar cliques:
                    local OptionClickButton = CreateElement("TextButton", {
                        Size = UDim2.new(1, 0, 1, 0),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Text = "",
                        AutoButtonColor = false,
                        Parent = OptionButton
                    })
                    
                    local OptionText = CreateElement("TextLabel", {
                        Size = UDim2.new(0, 0, 0, 13),
                        AutomaticSize = Enum.AutomaticSize.X,
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.new(0, 3, 0.5, 0),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Visible = true,
                        ClipsDescendants = true,
                        
                        Text = value,
                        TextColor3 = Element.Text,
                        TextTransparency = 0.4,
                        TextScaled = true,
                        TextSize = 10,
                        Font = Themes.Font.Text,
                        TextWrapped = true,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center,
                        
                        Parent = OptionButton
                    })
                    
                    -- Efeitos de hover (agora no botão, não no frame)
                    OptionClickButton.MouseEnter:Connect(function()
                        if Dropdown.Selected ~= value then
                            TweenService:Create(OptionText, TweenInfo.new(0.2), {
                                TextTransparency = 0.2
                            }):Play()
                        end
                    end)
                    
                    OptionClickButton.MouseLeave:Connect(function()
                        if Dropdown.Selected ~= value then
                            TweenService:Create(OptionText, TweenInfo.new(0.2), {
                                TextTransparency = 0.4
                            }):Play()
                        end
                    end)
                    
                    -- Clique para selecionar (CORRIGIDO: usa o TextButton)
                    OptionClickButton.MouseButton1Click:Connect(function()
                        Dropdown.Selected = value
                        Display_Text.Text = value
                        
                        -- Atualizar transparência de todas as opções
                        for _, optionData in pairs(Dropdown.Values) do
                            if optionData.OptionText then
                                local targetTransparency = (optionData.Value == value) and 0.1 or 0.4
                                TweenService:Create(optionData.OptionText, TweenInfo.new(0.2), {
                                    TextTransparency = targetTransparency
                                }):Play()
                            end
                        end
                        
                        -- Fechar dropdown
                        toggleDropdown()
                        
                        -- Executar callback
                        pcall(Dropdown.Settings.Callback, value)
                    end)
                    
                    -- Armazenar referência
                    table.insert(Dropdown.Values, {
                        Frame = OptionButton,
                        OptionText = OptionText,
                        Value = value
                    })
                    
                    -- Definir transparência inicial
                    OptionText.TextTransparency = (value == Dropdown.Selected) and 0.1 or 0.4
                    
                    return OptionButton
                end
                
                -- Função para criar todas as opções
                function createOptions()
                    for _, value in ipairs(Dropdown.Settings.Values) do
                        createOptionButton(value)
                    end
                end
                
                -- Criar opções iniciais
                createOptions()
                
                -- Função para fechar dropdown ao clicar fora
                function closeDropdownOnClickOutside(input)
                    if Dropdown.Open and input.UserInputType == Enum.UserInputType.MouseButton1 then
                        local mousePos = input.Position
                        local displayPos = Dropdown_Display.AbsolutePosition
                        local displaySize = Dropdown_Display.AbsoluteSize
                        local contentPos = Dropdown_Content.AbsolutePosition
                        local contentSize = Dropdown_Content.AbsoluteSize
                        
                        -- Verificar se o clique foi dentro do display ou content
                        local isInDisplay = 
                            mousePos.X >= displayPos.X and mousePos.X <= displayPos.X + displaySize.X and
                            mousePos.Y >= displayPos.Y and mousePos.Y <= displayPos.Y + displaySize.Y
                            
                        local isInContent = 
                            mousePos.X >= contentPos.X and mousePos.X <= contentPos.X + contentSize.X and
                            mousePos.Y >= contentPos.Y and mousePos.Y <= contentPos.Y + contentSize.Y
                        
                        if not isInDisplay and not isInContent then
                            toggleDropdown()
                        end
                    end
                end
                
                -- Conectar eventos
                Onclick_Dropdown_Display.MouseButton1Click:Connect(toggleDropdown)
                
                -- Efeitos de hover no display
                Dropdown_Display.MouseEnter:Connect(function()
                    Dropdown.Hover_D = true
                    TweenService:Create(Display_Text, TweenInfo.new(0.2), {
                        TextTransparency = 0.1
                    }):Play()
                    TweenService:Create(Icon, TweenInfo.new(0.2), {
                        ImageTransparency = 0.1
                    }):Play()
                end)
                
                Dropdown_Display.MouseLeave:Connect(function()
                    Dropdown.Hover_D = false
                    if not Dropdown.Open then
                        TweenService:Create(Display_Text, TweenInfo.new(0.2), {
                            TextTransparency = 0.2
                        }):Play()
                        TweenService:Create(Icon, TweenInfo.new(0.2), {
                            ImageTransparency = 0.2
                        }):Play()
                    end
                end)
                
                -- Conectar evento de clique fora
                UserInputService.InputBegan:Connect(closeDropdownOnClickOutside)
                
                -- Limpar eventos quando o dropdown for destruído
                local cleanupConnection
                cleanupConnection = Dropdown_Element.AncestryChanged:Connect(function()
                    if Dropdown_Element.Parent == nil then
                        cleanupConnection:Disconnect()
                    end
                end)

                -- Funções públicas para controle
                function Dropdown:SetValue(value)
                    if table.find(Dropdown.Settings.Values, value) then
                        Dropdown.Selected = value
                        Display_Text.Text = value
                        
                        -- Atualizar transparência das opções
                        for _, option in pairs(Dropdown.Values) do
                            if option.OptionText then
                                option.OptionText.TextTransparency = (option.Value == value) and 0.1 or 0.4
                            end
                        end
                        
                        -- Executar callback
                        pcall(Dropdown.Settings.Callback, value)
                    else
                        warn("Dropdown: Valor '" .. tostring(value) .. "' não encontrado na lista")
                    end
                end
                
                function Dropdown:Refresh(values)
                    Dropdown.Settings.Values = values or Dropdown.Settings.Values
                    
                    -- Limpar opções antigas
                    for _, option in pairs(Dropdown.Values) do
                        if option.Frame then
                            option.Frame:Destroy()
                        end
                    end
                    
                    Dropdown.Values = {}
                    
                    -- Criar novas opções
                    createOptions()
                    
                    -- Verificar se o valor atual ainda está na lista
                    if not table.find(Dropdown.Settings.Values, Dropdown.Selected) then
                        Dropdown.Selected = Dropdown.Settings.Values[1]
                        Display_Text.Text = Dropdown.Selected
                        pcall(Dropdown.Settings.Callback, Dropdown.Selected)
                    end
                end
                
                function Dropdown:GetValue()
                    return Dropdown.Selected
                end
                
                -- Retornar o objeto dropdown com métodos
                return Dropdown
            end
            
            function Section:Slider(Flag, Settings)
                local Tema = Themes.Elements.Slider
                local Slider = {
                    Settings = Settings,
                    Hover_S = false,
                    Active_S = false,
                    Value = nil,
                    _connections = {}
                }
                
                -- Configurações padrão
                Slider.Settings.Name = Slider.Settings.Name or "Slider"
                Slider.Settings.Minimum = Slider.Settings.Minimum or 0
                Slider.Settings.Maximum = Slider.Settings.Maximum or 100
                Slider.Settings.Default = Slider.Settings.Default or 50
                Slider.Settings.Precision = Slider.Settings.Precision or 0
                Slider.Settings.DisplayMethod = Slider.Settings.DisplayMethod or "Value"
                Slider.Settings.Callback = Slider.Settings.Callback or function() end
                
                -- Garantir que o valor padrão está dentro dos limites
                Slider.Value = math.clamp(Slider.Settings.Default, Slider.Settings.Minimum, Slider.Settings.Maximum)
                
                local DisplayMethods = {
                    Hundredths = function(sliderValue, precision)
                        return string.format("%.2f", sliderValue)
                    end,
                    Tenths = function(sliderValue, precision)
                        return string.format("%.1f", sliderValue)
                    end,
                    Round = function(sliderValue, precision)
                        if precision and precision > 0 then
                            return string.format("%." .. precision .. "f", sliderValue)
                        else
                            return tostring(math.round(sliderValue))
                        end
                    end,
                    Degrees = function(sliderValue, precision)
                        local formattedValue = precision and precision > 0 and string.format("%." .. precision .. "f", sliderValue) or tostring(math.round(sliderValue))
                        return formattedValue .. "°"
                    end,
                    Percent = function(sliderValue, minimum, maximum, precision)
                        local percentage = ((sliderValue - minimum) / (maximum - minimum)) * 100
                        if precision and precision > 0 then
                            return string.format("%." .. precision .. "f", percentage) .. "%"
                        else
                            return tostring(math.round(percentage)) .. "%"
                        end
                    end,
                    Value = function(sliderValue, precision)
                        if precision and precision > 0 then
                            return string.format("%." .. precision .. "f", sliderValue)
                        else
                            return tostring(math.round(sliderValue))
                        end
                    end
                }
                
                function GetDisplayValue(value)
                    local method = DisplayMethods[Slider.Settings.DisplayMethod] or DisplayMethods.Value
                    
                    if Slider.Settings.DisplayMethod == "Percent" then
                        return method(value, Slider.Settings.Minimum, Slider.Settings.Maximum, Slider.Settings.Precision)
                    else
                        return method(value, Slider.Settings.Precision)
                    end
                end
                
                -- Criar elementos
                local Slider_Element = CreateElement("Frame", {
                    Name = Slider.Settings.Name.. "_Slider",
                    Size = UDim2.new(1, 0, 0, 40),
                    BackgroundColor3 = Tema.Primary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    Active = true,
                    ClipsDescendants = true,
                    Parent = Section_Frame
                })
                
                local Line_F = CreateElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 7),
                    AnchorPoint = Vector2.new(1, 1),
                    Position = UDim2.new(1, 0, 1, - 3),
                    BackgroundColor3 = Tema.Primary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    Active = true,
                    ClipsDescendants = false,
                    Parent = Slider_Element
                })
                
                CreateElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                    PaddingTop = UDim.new(0, 0),
                    PaddingBottom = UDim.new(0, 0),
                    Parent = Line_F
                })
                
                local Title_Slider = CreateElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 13),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 8, 0, 10),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Slider.Settings.Name,
                    TextColor3 = Tema.Text,
                    TextTransparency = 0.4,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Themes.Font.Text,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Slider_Element
                })
                
                local Display = CreateElement("TextBox", {
                    Size = UDim2.new(0, 0, 0, 13),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(1, 0),
                    Position = UDim2.new(1, -8, 0, 10),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    
                    Text = GetDisplayValue(Slider.Value),
                    TextColor3 = Tema.Display,
                    TextTransparency = 0.4,
                    TextSize = 13,
                    Font = Themes.Font.Text,
                    
                    PlaceholderText = GetDisplayValue(Slider.Value),
                    PlaceholderColor3 = Tema.Display,
                    
                    ClearTextOnFocus = true,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Slider_Element
                })
                
                local Bottom = CreateElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 3),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    BackgroundColor3 = Tema.Bottom,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    Active = true,
                    ClipsDescendants = false,
                    Parent = Line_F
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(1, 0),
                    Parent = Bottom
                })
                
                local Track = CreateElement("Frame", {
                    Size = UDim2.new(0, 0, 1, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 0, 0.5, 0),
                    BackgroundColor3 = Tema.Track,
                    BackgroundTransparency = 0.03,
                    BorderSizePixel = 0,
                    Visible = true,
                    Active = true,
                    ClipsDescendants = false,
                    Parent = Bottom
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(1, 0),
                    Parent = Track
                })
                
                local Thumb = CreateElement("Frame", {
                    Size = UDim2.fromOffset(12, 12),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0, 0, 0.5, 0),
                    BackgroundColor3 = Tema.Thumb,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    Active = true,
                    ClipsDescendants = false,
                    Parent = Track
                })
                
                CreateElement("UICorner", {
                    CornerRadius = UDim.new(1, 0),
                    Parent = Thumb
                })
                
                -- Botão para o slider inteiro (para click direto na linha)
                local SliderButton = CreateElement("TextButton", {
                    Parent = Bottom,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 4, 0), -- Área maior para facilitar toque
                    Position = UDim2.new(0, 0, -1.5, 0),
                    AutoButtonColor = false,
                    Text = "",
                    TextSize = 0,
                })
                
                Lib:AutoUpdateText(Title_Slider)
                
                -- Atualizar visual do slider
                function UpdateSliderVisual()
                    local min = Slider.Settings.Minimum
                    local max = Slider.Settings.Maximum
                    local value = Slider.Value
                    
                    -- Calcular proporção (0 a 1)
                    local ratio = (value - min) / (max - min)
                    ratio = math.clamp(ratio, 0, 1)
                    
                    -- Atualizar largura da track
                    Track.Size = UDim2.new(ratio, 0, 1, 0)
                    
                    -- Atualizar posição do thumb
                    Thumb.Position = UDim2.new(1, 0, 0.5, 0)
                    
                    -- Atualizar display
                    Display.Text = GetDisplayValue(value)
                    Display.PlaceholderText = GetDisplayValue(value)
                end
                
                -- Função para atualizar valor do slider
                function SetValue(newValue, fromUserInput)
                    -- Clamp do valor
                    local min = Slider.Settings.Minimum
                    local max = Slider.Settings.Maximum
                    local precision = Slider.Settings.Precision
                    
                    -- Arredondar baseado na precisão
                    if precision and precision > 0 then
                        local multiplier = 10 ^ precision
                        newValue = math.floor(newValue * multiplier + 0.5) / multiplier
                    else
                        newValue = math.round(newValue)
                    end
                    
                    newValue = math.clamp(newValue, min, max)
                    
                    -- Atualizar apenas se mudou
                    if Slider.Value ~= newValue then
                        Slider.Value = newValue
                        
                        -- Atualizar visual
                        UpdateSliderVisual()
                        
                        -- Chamar callback se foi input do usuário
                        if fromUserInput then
                            pcall(Slider.Settings.Callback, newValue)
                        end
                    end
                end
                
                -- Sistema de arrasto
                local isDragging = false
                
                -- Função para converter posição do mouse para valor
                function GetValueFromPosition(positionX)
                    local absolutePosition = Bottom.AbsolutePosition.X
                    local absoluteSize = Bottom.AbsoluteSize.X
                    
                    -- Calcular posição relativa (0 a 1)
                    local relativePosition = (positionX - absolutePosition) / absoluteSize
                    relativePosition = math.clamp(relativePosition, 0, 1)
                    
                    -- Converter para valor
                    local min = Slider.Settings.Minimum
                    local max = Slider.Settings.Maximum
                    local value = min + (relativePosition * (max - min))
                    
                    return value
                end
                
                -- Função para iniciar arrasto
                function StartDrag(input)
                    Spawn(function()
                        isDragging = true
                    
                        -- Feedback visual
                        Thumb.BackgroundColor3 = Tema.ThumbHover or Color3.fromRGB(200, 200, 200)
                        Slider.Active_S = true
                        
                        -- Atualizar imediatamente para a posição do click
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            local value = GetValueFromPosition(input.Position.X)
                            SetValue(value, true)
                        end
                    end)
                end
                
                -- Função para atualizar durante arrasto
                function UpdateDrag(input)
                    Spawn(function()
                        if not isDragging then return end
                        
                        -- Verificar se é mouse movement ou touch
                        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                            local value = GetValueFromPosition(input.Position.X)
                            SetValue(value, true)
                        end
                    end)
                end
                
                -- Função para parar arrasto
                function StopDrag()
                    Spawn(function()
                        if isDragging then
                            isDragging = false
                            
                            -- Resetar feedback visual
                            Thumb.BackgroundColor3 = Tema.Thumb
                            Slider.Active_S = false
                        end
                    end)
                end
                
                -- Obter serviço de input
                local UserInputService = game:GetService("UserInputService")
                
                -- Conectar eventos de input
                function SetupInputEvents()
                    -- Conexão para InputBegan (mouse click e touch)
                    Slider._connections.InputBegan = SliderButton.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            StartDrag(input)
                        end
                    end)
                    
                    -- Conexão para InputChanged (arrastando)
                    Slider._connections.InputChanged = SliderButton.InputChanged:Connect(function(input)
                        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and isDragging then
                            UpdateDrag(input)
                        end
                    end)
                    
                    -- Conexão para InputEnded (soltar)
                    Slider._connections.InputEnded = SliderButton.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            StopDrag()
                        end
                    end)
                    
                    -- Conexão global para parar arrasto se soltar em qualquer lugar
                    Slider._connections.GlobalInputEnded = UserInputService.InputEnded:Connect(function(input)
                        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and isDragging then
                            StopDrag()
                        end
                    end)
                    
                    -- Evento para clique direto na linha
                    SliderButton.MouseButton1Down:Connect(function()
                        local mouse = game:GetService("Players").LocalPlayer:GetMouse()
                        local value = GetValueFromPosition(mouse.X)
                        SetValue(value, true)
                    end)
                    
                    -- Suporte para input manual no TextBox
                    Slider._connections.FocusLost = Display.FocusLost:Connect(function(enterPressed)
                        if enterPressed then
                            local text = Display.Text
                            
                            -- Remover símbolos para parsing
                            text = text:gsub("°", ""):gsub("%%", "")
                            
                            local num = tonumber(text)
                            if num then
                                SetValue(num, true)
                            else
                                -- Se não for número válido, restaurar valor anterior
                                Display.Text = GetDisplayValue(Slider.Value)
                            end
                        end
                    end)
                end
                
                -- Configurar eventos
                Spawn(function()
                    SetupInputEvents()
                end)
                
                -- Métodos públicos
                function Slider:SetValue(newValue)
                    SetValue(newValue, false)
                    return self
                end
                
                function Slider:GetValue()
                    return Slider.Value
                end
                
                function Slider:SetRange(min, max)
                    self.Settings.Minimum = min
                    self.Settings.Maximum = max
                    -- Recalcular valor atual dentro do novo range
                    SetValue(self.Value, false)
                    return self
                end
                
                function Slider:Destroy()
                    -- Limpar todas as conexões
                    for _, connection in pairs(Slider._connections) do
                        if connection then
                            connection:Disconnect()
                        end
                    end
                    Slider_Element:Destroy()
                end
                
                Spawn(function()
                    UpdateSliderVisual()
                end)
                
                -- Registrar na biblioteca se tiver flag
                if Flag then
                    Lib.Features[Flag] = Slider
                end
                
                return Slider
            end
            
            function Section:Colorpicker(Flag, Settings)
                local Colorpicker = {Settings = Settings, IgnoreConfig = false, Class = "Colorpicker"}
                
                -- Configurações padrão
                Colorpicker.Settings.Name = Colorpicker.Settings.Name or "Colorpicker"
                Colorpicker.Settings.Default = Colorpicker.Settings.Default or Color3.fromRGB(255, 255, 255)
                Colorpicker.Settings.Callback = Colorpicker.Settings.Callback or function() end
                
                -- Usar temas da sua biblioteca
                local Element = Themes.Elements.Checkbox
                local currentTheme = Themes -- Usar os temas globais da sua lib
                
                -- ELEMENTOS DA UI (MANTIDO ORIGINAL)
                local Colorpicker_F = CreateElement("Frame", {
                    Name = Colorpicker.Settings.Name,
                    Size = UDim2.new(1, 0, 0, 30),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Element.Primary,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Section_Frame -- Mudado de Section_F para Section_Frame (padrão da sua lib)
                })
                
                UiCorner({0, 8}, Colorpicker_F)
                UIStroke(1, 0.2, Themes.Border.Primary, Colorpicker_F)
                
                local Title_F = CreateElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 30),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = Element.Primary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = false,
                    Parent = Colorpicker_F
                })
                
                local Title_Colorpicker = CreateElement("TextLabel", {
                    Name = "Title_Colorpicker",
                    Size = UDim2.new(0, 0, 0, 13),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Text = Colorpicker.Settings.Name,
                    TextColor3 = Themes.Text.Primary, -- Usar tema da sua lib
                    TextTransparency = 0.4,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Themes.Font.Text, -- Usar fonte da sua lib
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    Parent = Title_F
                })
                
                local View_F = CreateElement("Frame", {
                    Size = UDim2.new(0, 20, 0, 20),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, - 8, 0.5, 0),
                    BackgroundColor3 = Colorpicker.Settings.Default,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Title_F
                })
                
                UiCorner({0, 5}, View_F)
                
                local OnClick = CreateElement("TextButton", {
                    Name = "OnClick".. "_".. Colorpicker.Settings.Name,
                    Parent = Title_F,
                    BackgroundTransparency = 1.000,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    AutoButtonColor = false,
                    Text = "",
                    TextSize = 0.000,
                })
                
                local Colorpicker_Window = CreateElement("Frame", {
                    Name = Colorpicker.Settings.Name.. "_Window",
                    Size = UDim2.new(1, 0, 0, 125),
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0, 30),
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
                    PaddingTop = UDim.new(0, 3),
                    PaddingBottom = UDim.new(0, 5),
                    Parent = Colorpicker_Window
                })
                
                -- SELETOR DE COR (CÓDIGO ORIGINAL MANTIDO)
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
                    ColorSequenceKeypoint.new(1.00, Colorpicker.Settings.Default)
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
                
                -- BARRA RAINBOW VERTICAL (CÓDIGO ORIGINAL MANTIDO)
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
                
                -- SISTEMA DE FUNCIONAMENTO (CÓDIGO ORIGINAL MANTIDO)
                local draggingColor = false
                local draggingCConteiner = false
                local hue, sat, brightness = 0, 1, 1
                local currentColor = Colorpicker.Settings.Default
                local rainbowMode = false
                local rainbowSpeed = 1
                local rainbowConnection = nil
                local isColorPickerOpen = false
                
                -- CONEXÕES DE INPUT (CÓDIGO ORIGINAL MANTIDO)
                local selectorInputConnection, selectorMoveConnection, selectorEndConnection
                local rainbowInputConnection, rainbowMoveConnection, rainbowEndConnection
                local closeConnection
                
                -- FUNÇÕES PRINCIPAIS (CÓDIGO ORIGINAL MANTIDO)
                function sendColorCallback(color)
                    Spawn(function()
                        currentColor = color
                        local r, g, b = math.floor(color.R * 255), math.floor(color.G * 255), math.floor(color.B * 255)
                        Colorpicker.Settings.Callback(Color3.fromRGB(r, g, b))
                    end)
                end
                
                function updateCConteinerColor(input)
                    Spawn(function()
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
                    end)
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
                    Spawn(function()
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
                    end)
                end
                
                function setInitialColor(color)
                    Spawn(function()
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
                    end)
                end
                
                -- SISTEMA DE CONEXÕES (CÓDIGO ORIGINAL MANTIDO)
                function connectSelectorInput()
                    Spawn(function()
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
                    end)
                end
                
                function connectRainbowInput()
                    Spawn(function()
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
                    end)
                end
                
                function closeColorPicker()
                    Spawn(function()
                        isColorPickerOpen = false
                    
                        TweenService:Create(Colorpicker_Window, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = UDim2.new(1, 0, 0, 0)
                        }):Play()
                        
                        delay(0.21, function()
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
                    end)
                end
                
                function openColorPicker()
                    Spawn(function()
                        isColorPickerOpen = true
                        Colorpicker_Window.Visible = true
                        
                        TweenService:Create(Colorpicker_Window, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = UDim2.new(1, 0, 0, 125),
                        }):Play()
                        
                        connectSelectorInput()
                        connectRainbowInput()
                        
                        -- Fechar ao clicar fora (ADAPTADO para sua lib)
                        closeConnection = UserInputService.InputBegan:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                local mousePos = input.Position
                                local colorpickerPos = Colorpicker_F.AbsolutePosition
                                local colorpickerSize = Colorpicker_F.AbsoluteSize
                                local windowPos = Colorpicker_Window.AbsolutePosition
                                local windowSize = Colorpicker_Window.AbsoluteSize
                                
                                local totalHeight = colorpickerSize.Y + windowSize.Y
                                
                                -- Verificar se clique foi fora do colorpicker
                                local clickedInside = 
                                    (mousePos.X >= colorpickerPos.X and mousePos.X <= colorpickerPos.X + colorpickerSize.X and
                                     mousePos.Y >= colorpickerPos.Y and mousePos.Y <= colorpickerPos.Y + totalHeight)
                                
                                if not clickedInside then
                                    closeColorPicker()
                                end
                            end
                        end)
                    end)
                end
                
                -- Conectar clique para abrir/fechar
                OnClick.MouseButton1Click:Connect(function()
                    Spawn(function()
                        if isColorPickerOpen then
                            closeColorPicker()
                        else
                            openColorPicker()
                        end
                    end)
                end)
                
                -- Inicializar com cor padrão
                setInitialColor(currentColor)
                
                -- Adicionar hover effect usando sua lib
                local Hover_CP = false
                local Active_CP = false
                
                OnClick.MouseEnter:Connect(function()
                    Hover_CP = true
                    if not Active_CP then
                        TweenService:Create(Title_Colorpicker, TweenInfo.new(0.15), {
                            TextTransparency = 0.2
                        }):Play()
                    end
                end)
                            
                OnClick.MouseLeave:Connect(function()
                    Hover_CP = false
                    if not Active_CP then 
                        TweenService:Create(Title_Colorpicker, TweenInfo.new(0.15), {
                            TextTransparency = 0.4
                        }):Play()
                    end
                end)
                
                -- Atualizar texto automaticamente (usando sua lib)
                Lib:AutoUpdateText(Title_Colorpicker)
                
                -- MÉTODOS PÚBLICOS (adaptados para sua lib)
                function Colorpicker:SetColor(color)
                    if typeof(color) == "Color3" then
                        setInitialColor(color)
                        pcall(Colorpicker.Settings.Callback, color)
                    end
                    return self
                end
                
                function Colorpicker:GetColor()
                    return currentColor
                end
                
                function Colorpicker:SetVisibility(state)
                    Colorpicker_F.Visible = state or false
                    return self
                end
                
                function Colorpicker:Destroy()
                    if Colorpicker_F then
                        Colorpicker_F:Destroy()
                    end
                end
                
                -- Registrar na biblioteca se tiver flag
                if Flag then
                    Lib.Features[Flag] = Colorpicker
                end
                
                return Colorpicker
            end
            
            function Section:Input(Flag, Settings)
                local Element = Themes.Elements.Input
                local Input = {
                    Settings = Settings,
                    Hover_I = false,
                    Active_I = false
                }
                
                -- Configurações padrão
                Input.Settings.Name = Input.Settings.Name or "Input"
                Input.Settings.Default = Input.Settings.Default or ""
                Input.Settings.Placeholder = Input.Settings.Placeholder or ""
                Input.Settings.ClearTextOnFocus = Input.Settings.ClearTextOnFocus or false
                Input.Settings.Callback = Input.Settings.Callback or function() end
                
                -- Frame principal do input
                local Input_Frame = CreateElement("Frame", {
                    Name = Input.Settings.Name.. "_Input",
                    Size = UDim2.new(1, 0, 0, 30),
                    BackgroundColor3 = Element.Primary,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    Active = true,
                    ClipsDescendants = true,
                    Parent = Section_Frame
                })
                
                -- Título do input
                local Title_Input = CreateElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 13),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    
                    Text = Input.Settings.Name,
                    TextColor3 = Element.Text,
                    TextTransparency = 0.4,
                    TextScaled = true,
                    TextSize = 10,
                    Font = Themes.Font.Text,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Input_Frame
                })
                
                -- Container do input (onde fica o TextBox)
                local Input_Container = CreateElement("Frame", {
                    Size = UDim2.new(0, 100, 0, 20),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -8, 0.5, 0),
                    BackgroundColor3 = Element.Primary,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Visible = true,
                    ClipsDescendants = true,
                    Parent = Input_Frame
                })
                
                UiCorner({0, 5}, Input_Container)
                UIStroke(1, 0.2, Themes.Border.Primary, Input_Container)
                
                -- TextBox para entrada de texto
                local Input_Box = CreateElement("TextBox", {
                    Size = UDim2.new(1, -10, 0, 13),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    
                    Text = Input.Settings.Default,
                    TextColor3 = Element.Text,
                    TextTransparency = 0.2,
                    TextSize = 12,
                    Font = Themes.Font.Text,
                    
                    PlaceholderText = Input.Settings.Placeholder,
                    PlaceholderColor3 = Element.Placeholder,
                    
                    ClearTextOnFocus = Input.Settings.ClearTextOnFocus,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    
                    Parent = Input_Container
                })
                
                -- Botão invisível para capturar cliques
                local OnClick = CreateElement("TextButton", {
                    Name = "OnClick_".. Input.Settings.Name,
                    Parent = Input_Frame,
                    BackgroundTransparency = 1.000,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    AutoButtonColor = false,
                    Text = "",
                    TextSize = 0.000,
                })
                
                -- Função para atualizar tamanho do container baseado no texto
                function updateContainerSize()
                    local currentText = Input_Box.Text
                    
                    -- Se estiver vazio, usar placeholder para cálculo
                    local displayText = currentText == "" and Input.Settings.Placeholder or currentText
                    if displayText == "" then
                        displayText = " "
                    end
                    
                    local textSize = game:GetService("TextService"):GetTextSize(
                        displayText,
                        Input_Box.TextSize,
                        Input_Box.Font,
                        Vector2.new(math.huge, 20)
                    )
                    
                    -- Limites de tamanho
                    local minWidth = 50
                    local maxWidth = 200
                    local calculatedWidth = math.clamp(textSize.X + 15, minWidth, maxWidth)
                    
                    -- Atualizar tamanho do container
                    Input_Container.Size = UDim2.new(0, calculatedWidth, 0, 20)
                    
                    -- Atualizar tamanho do título para usar espaço restante
                    local frameWidth = Input_Frame.AbsoluteSize.X
                    local availableWidth = frameWidth - calculatedWidth - 16
                    
                    if availableWidth > 0 then
                        Title_Input.Size = UDim2.new(0, availableWidth, 0, 13)
                        Title_Input.Position = UDim2.new(0, 8, 0.5, 0)
                    end
                end

                function executeCallback()
                    Spawn(function()
                        pcall(Input.Settings.Callback, Input_Box.Text)
                    end)
                end

                Input_Box:GetPropertyChangedSignal("Text"):Connect(function()
                    updateContainerSize()
                end)
                
                Input_Box.Focused:Connect(function()
                    if Input.Settings.ClearTextOnFocus and Input_Box.Text == Input.Settings.Default then
                        Input_Box.Text = ""
                    end
                end)
                
                Input_Box.FocusLost:Connect(function(enterPressed)
                    if enterPressed then
                        executeCallback()
                    end
                end)
                
                OnClick.MouseButton1Click:Connect(function()
                    executeCallback()
                end)
                
                -- Efeitos de hover (usando sua função de animação)
                OnClick.MouseEnter:Connect(function()
                    Input.Hover_I = true
                    if not Input.Active_I then
                        TweenService:Create(Title_Input, TweenInfo.new(0.15), {
                            TextTransparency = 0.2
                        }):Play()
                    end
                end)
                
                OnClick.MouseLeave:Connect(function()
                    Input.Hover_I = false
                    if not Input.Active_I then
                        TweenService:Create(Title_Input, TweenInfo.new(0.15), {
                            TextTransparency = 0.4
                        }):Play()
                    end
                end)
                
                -- Inicializar tamanho
                updateContainerSize()
                
                -- Métodos públicos
                function Input:SetValue(value)
                    if typeof(value) == "string" then
                        Input_Box.Text = value
                        updateContainerSize()
                        executeCallback()
                    end
                    return self
                end
                
                function Input:GetValue()
                    return Input_Box.Text
                end
                
                function Input:SetName(name)
                    if typeof(name) == "string" then
                        Title_Input.Text = name
                        Input.Settings.Name = name
                        updateContainerSize()
                    end
                    return self
                end
                
                function Input:SetPlaceholder(placeholder)
                    if typeof(placeholder) == "string" then
                        Input_Box.PlaceholderText = placeholder
                        Input.Settings.Placeholder = placeholder
                    end
                    return self
                end
                
                function Input:SetVisibility(state)
                    Input_Frame.Visible = state or false
                    return self
                end
                
                function Input:Destroy()
                    if Input_Frame then
                        Input_Frame:Destroy()
                    end
                end
                
                -- Registrar na biblioteca se tiver flag
                if Flag then
                    Lib.Features[Flag] = Input
                end
                
                return Input
            end
            
            return Section
        end
        
        return Tab 
    end
    
    function StorageTabs:Dialog(Settings)
        local Element = Themes.Elements.Dialog
        local DialogFunctions = {}
        
        local base = Window
        
        -- CÓDIGO ADAPTADO PARA USAR CreateElement
        local dialogCanvas = CreateElement("CanvasGroup", {
            Name = "DialogCanvas_" .. HttpService:GenerateGUID(false):sub(1, 8),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            GroupTransparency = 1,
            Parent = base
        })
        
        local dialog = CreateElement("Frame", {
            Name = "Dialog",
            BackgroundColor3 = Element.Primary,
            BackgroundTransparency = 0.35,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            Active = true,
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
            BackgroundColor3 = Element.Secondary,
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
            Color = Themes.Border.Primary,
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
            FontFace = Font.new(
                assets.interFont,
                Enum.FontWeight.Medium,
                Enum.FontStyle.Normal
            ),
            RichText = true,
            Text = Settings.Title,
            TextColor3 = Element.Title,
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
            FontFace = Font.new(assets.interFont),
            RichText = true,
            Text = Settings.Description,
            TextColor3 = Element.Text,
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
        
        -- CÓDIGO ORIGINAL MANTIDO (apenas usando CreateElement para os botões)
        local canvasIn = TweenService:Create(dialogCanvas, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { GroupTransparency = 0 })
        local canvasOut = TweenService:Create(dialogCanvas, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { GroupTransparency = 1 })
        
        local scaleIn = TweenService:Create(promptUIScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { Scale = 1 })
        local scaleOut = TweenService:Create(promptUIScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { Scale = 0.95 })
        
        -- Variável para rastrear conexões específicas deste dialog
        local dialogConnections = {}
        
        function dialogIn()
            canvasIn:Play()
            scaleIn:Play()
            canvasIn.Completed:Wait()
        end
        
        function dialogOut()
            if not dialogCanvas.Parent then return end
            
            -- Desconectar todas as conexões específicas deste dialog
            for _, connection in pairs(dialogConnections) do
                if connection then
                    connection:Disconnect()
                end
            end
            
            canvasOut:Play()
            scaleOut:Play()
            canvasOut.Completed:Wait()
            dialogCanvas:Destroy()
        end
        
        -- Conexão para fechar ao clicar fora do prompt
        local closeOnClickOutsideConnection = UserInputService.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 and dialogCanvas.GroupTransparency == 0 then
                local mousePos = input.Position
                local promptPos = prompt.AbsolutePosition
                local promptSize = prompt.AbsoluteSize
                
                -- Verificar se o clique foi fora do prompt
                local clickedInsidePrompt = 
                    mousePos.X >= promptPos.X and mousePos.X <= promptPos.X + promptSize.X and
                    mousePos.Y >= promptPos.Y and mousePos.Y <= promptPos.Y + promptSize.Y
                    
                if not clickedInsidePrompt then
                    dialogOut()
                end
            end
        end)
        
        table.insert(dialogConnections, closeOnClickOutsideConnection)
        
        -- Criar botões com callbacks isolados
        for i, v in ipairs(Settings.Buttons) do
            -- Criar closure para isolar o callback de cada botão
            local buttonIndex = i
            local buttonData = v
            
            local button = CreateElement("TextButton", {
                Name = "Button_" .. buttonIndex,
                FontFace = Font.new(assets.interFont),
                Text = buttonData.Name,
                TextColor3 = Element.Title,
                TextSize = 15,
                TextTransparency = 0.5,
                TextTruncate = Enum.TextTruncate.AtEnd,
                AutoButtonColor = false,
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = Element.Buttons,
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
            
            -- Funções de estado específicas para este botão
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
            
            -- Conexão de clique específica para este botão
            local clickConnection = button.MouseButton1Click:Connect(function()
                if dialogCanvas.GroupTransparency ~= 0 then return end
                
                -- Executar o callback específico deste botão
                if buttonData.Callback then
                    buttonData.Callback()
                end
                
                -- Fechar o dialog após o clique
                dialogOut()
            end)
            
            -- Conexões de hover específicas para este botão
            local enterConnection = button.MouseEnter:Connect(function()
                ChangeState("Hover")
            end)
            
            local leaveConnection = button.MouseLeave:Connect(function()
                ChangeState("Idle")
            end)
            
            -- Armazenar conexões específicas deste botão
            table.insert(dialogConnections, clickConnection)
            table.insert(dialogConnections, enterConnection)
            table.insert(dialogConnections, leaveConnection)
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
        
        -- Adicionar método para fechar programaticamente
        function DialogFunctions:Close()
            dialogOut()
        end
        
        return DialogFunctions
    end
    
    function StorageTabs:Notification(Settings)
        Settings.Title = Settings.Title or "Notification"
        Settings.Message = Settings.Message or "Notification message"
        Settings.Duration = Settings.Duration or 3
        Settings.ShowProgress = Settings.ShowProgress or false
        
        local Notification = {}
        local Element = Themes.Elements.Notification
        
        local notificationId = HttpService:GenerateGUID(false):sub(1, 8)
        local isClosing = false
        local progressTween
        local closeTimer
        
        -- Inicializar sistema se não existir
        if not StorageTabs.NotificationSystem then
            StorageTabs.NotificationSystem = {
                Notifications = {},
                NextPosition = 15
            }
        end
        
        -- Aguardar se estiver reorganizando
        if StorageTabs.NotificationSystem.IsReorganizing then
            task.wait(0.1)
        end
    
        -- Criar layer de notificação se não existir
        if not ConteinerFuns:FindFirstChild("NotificationLayer") then
            local notificationLayer = CreateElement("Frame", {
                Name = "NotificationLayer",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(0, 260, 1, 0),
                AnchorPoint = Vector2.new(1, 0),
                Position = UDim2.new(1, 0, 0, 0),
                ZIndex = math.huge,
                Parent = ConteinerFuns
            })
        end
        
        local notificationLayer = ConteinerFuns:FindFirstChild("NotificationLayer")
        
        -- Calcular posição baseada nas notificações VISÍVEIS
        local currentY = 15
        for _, notifData in pairs(StorageTabs.NotificationSystem.Notifications) do
            if notifData and notifData.Frame and notifData.Frame.Parent and not notifData.IsClosing then
                currentY = currentY + notifData.Frame.AbsoluteSize.Y + 8
            end
        end
        
        -- Armazenar posição inicial
        local startY = currentY
        
        -- Criar frame da notificação
        local notificationFrame = CreateElement("Frame", {
            Name = "Notification_" .. notificationId,
            BackgroundColor3 = Element.Secondary,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 0), -- Altura será calculada
            Position = UDim2.new(1, 260, 0, startY), -- Fora da tela
            AnchorPoint = Vector2.new(1, 0),
            Parent = notificationLayer
        })
        
        UiCorner({0, 8}, notificationFrame) 
        UIStroke(1, 0.15, Themes.Border.Primary, notificationFrame)
        Lib:Shadow(notificationFrame, Settings.Theme)
        
        -- Container principal
        local Container = CreateElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 0), -- Altura será calculada
            Parent = notificationFrame
        })
    
        CreateElement("UIPadding", {
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
            PaddingTop = UDim.new(0, 6),
            PaddingBottom = UDim.new(0, 6),
            Parent = Container
        })
    
        -- Cabeçalho
        local HeaderFrame = CreateElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 18),
            Parent = Container
        })
        
        local titleLabel = CreateElement("TextLabel", {
            Name = "Title",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(1, -20, 0, 18),
            Text = Settings.Title,
            TextColor3 = Element.Title,
            TextSize = 12,
            TextTransparency = 0.2,
            Font = Themes.Font.Title,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            TextTruncate = Enum.TextTruncate.AtEnd,
            Parent = HeaderFrame
        })
        
        -- Botão de fechar
        local closeButton = CreateElement("TextButton", {
            Name = "CloseButton",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(0, 14, 0, 14),
            Position = UDim2.new(1, -14, 0, 2),
            Text = "",
            AutoButtonColor = false,
            Parent = HeaderFrame
        })
        
        local closeCircle = CreateElement("Frame", {
            Name = "CloseCircle",
            BackgroundColor3 = Themes.Border.Primary,
            BackgroundTransparency = 0.8,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 1, 0),
            Parent = closeButton
        })
        
        UiCorner({1, 0}, closeCircle)
        
        local Icon = CreateElement("ImageLabel", {
            BackgroundTransparency = 1,
            ImageColor3 = Themes.Image.Primary,
            Image = "rbxassetid://4536216511",
            ImageTransparency = 0.3,
            Size = UDim2.fromScale(1, 1),
            Parent = closeCircle,
        })
        
        -- Área da mensagem
        local messageFrame = CreateElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 0),
            Position = UDim2.new(0, 0, 0, 22),
            Parent = Container
        })
        
        local messageLabel = CreateElement("TextLabel", {
            Name = "Message",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 0),
            Text = Settings.Message,
            TextColor3 = Element.Text,
            TextSize = 11,
            TextTransparency = 0.4,
            Font = Themes.Font.Text,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            TextWrapped = true,
            Parent = messageFrame
        })
        
        -- Barra de progresso
        local progressBar
        if Settings.ShowProgress then
            local progressContainer = CreateElement("Frame", {
                Name = "ProgressContainer",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 2),
                Position = UDim2.new(0, 0, 1, 0),
                AnchorPoint = Vector2.new(0, 1),
                Parent = Container
            })
            
            local progressBackground = CreateElement("Frame", {
                Name = "ProgressBackground",
                BackgroundColor3 = Themes.Border.Primary,
                BackgroundTransparency = 0.95,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 1, 0),
                Parent = progressContainer
            })
            
            UiCorner({1, 0}, progressBackground)
            
            progressBar = CreateElement("Frame", {
                Name = "ProgressBar",
                BackgroundColor3 = Themes.Highlight.Blue,
                BackgroundTransparency = 0.3,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 1, 0),
                Parent = progressBackground
            })
            
            UiCorner({1, 0}, progressBar)
        end
        
        -- Função para calcular altura
        function calculateHeights()
            local textService = game:GetService("TextService")
            local maxWidth = 230
            local maxLines = 4
            local lineHeight = 14
            
            local textSize = textService:GetTextSize(
                Settings.Message,
                11,
                Themes.Font.Text,
                Vector2.new(maxWidth, 10000)
            )
            
            local lineCount = math.ceil(textSize.Y / lineHeight)
            local actualLines = math.min(lineCount, maxLines)
            local messageHeight = actualLines * lineHeight
            
            local paddingTopBottom = 12
            local headerHeight = 18
            local progressHeight = Settings.ShowProgress and 2 or 0
            
            local totalHeight = paddingTopBottom + headerHeight + messageHeight + progressHeight + 4
            
            messageLabel.Size = UDim2.new(1, 0, 0, messageHeight)
            messageFrame.Size = UDim2.new(1, 0, 0, messageHeight)
            Container.Size = UDim2.new(1, 0, 0, totalHeight)
            notificationFrame.Size = UDim2.new(1, 0, 0, totalHeight)
            
            return totalHeight
        end
        
        -- Calcular altura
        local totalHeight = calculateHeights()
        
        -- Atualizar posição inicial
        notificationFrame.Position = UDim2.new(1, 260, 0, startY)
        
        -- Interações do botão de fechar
        closeButton.MouseEnter:Connect(function()
            TweenService:Create(closeCircle, TweenInfo.new(0.15), {
                BackgroundTransparency = 0.5
            }):Play()
        end)
        
        closeButton.MouseLeave:Connect(function()
            TweenService:Create(closeCircle, TweenInfo.new(0.15), {
                BackgroundTransparency = 0.8
            }):Play()
        end)
        
        -- Animação de entrada SMOOTH
        function animateIn()
            if isClosing then return end
            
            -- Animar entrada
            local slideIn = TweenService:Create(notificationFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0), {
                Position = UDim2.new(1, -15, 0, startY)
            })
            
            slideIn:Play()
            
            -- Animar notificações existentes para baixo
            local newY = startY + totalHeight + 8
            for id, notifData in pairs(StorageTabs.NotificationSystem.Notifications) do
                if notifData and notifData.Frame and notifData.Frame.Parent and id ~= notificationId and not notifData.IsClosing then
                    if notifData.StartY >= startY then
                        local targetY = notifData.StartY + totalHeight + 8
                        TweenService:Create(notifData.Frame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0), {
                            Position = UDim2.new(1, -15, 0, targetY)
                        }):Play()
                        notifData.StartY = targetY
                        newY = targetY + notifData.Frame.AbsoluteSize.Y + 8
                    end
                end
            end
            
            StorageTabs.NotificationSystem.NextPosition = newY
            
            -- Iniciar progresso
            if Settings.ShowProgress and progressBar then
                task.delay(0.4, function()
                    if not isClosing then
                        progressTween = TweenService:Create(progressBar, TweenInfo.new(Settings.Duration, Enum.EasingStyle.Linear), {
                            Size = UDim2.new(0, 0, 1, 0)
                        })
                        progressTween:Play()
                    end
                end)
            end
        end
        
        -- Função para reorganizar notificações
        function reorganizeNotifications()
            if StorageTabs.NotificationSystem.IsReorganizing then return end
            StorageTabs.NotificationSystem.IsReorganizing = true
            
            local newY = 15
            local notificationsToUpdate = {}
            
            -- Coletar notificações ativas
            for id, notifData in pairs(StorageTabs.NotificationSystem.Notifications) do
                if notifData and notifData.Frame and notifData.Frame.Parent and not notifData.IsClosing then
                    table.insert(notificationsToUpdate, {
                        Id = id,
                        Data = notifData,
                        TargetY = newY
                    })
                    newY = newY + notifData.Frame.AbsoluteSize.Y + 8
                end
            end
            
            StorageTabs.NotificationSystem.NextPosition = newY
            
            -- Animar todas as notificações
            for _, notifInfo in ipairs(notificationsToUpdate) do
                if notifInfo.Data.StartY ~= notifInfo.TargetY then
                    TweenService:Create(notifInfo.Data.Frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Position = UDim2.new(1, -15, 0, notifInfo.TargetY)
                    }):Play()
                    notifInfo.Data.StartY = notifInfo.TargetY
                end
            end
            
            task.wait(0.35) -- Aguardar animação
            StorageTabs.NotificationSystem.IsReorganizing = false
        end
        
        -- Animação de saída SMOOTH
        function animateOut()
            if isClosing then return end
            isClosing = true
            
            StorageTabs.NotificationSystem.Notifications[notificationId].IsClosing = true
            
            if progressTween then 
                progressTween:Cancel() 
            end
            
            if closeTimer then 
                closeTimer:Disconnect()
            end
            
            -- Animar saída
            local slideOut = TweenService:Create(notificationFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Position = UDim2.new(1, 260, 0, startY)
            })
            
            local fadeOut = TweenService:Create(notificationFrame, TweenInfo.new(0.35, Enum.EasingStyle.Quad), {
                BackgroundTransparency = 0.8
            })
            
            slideOut:Play()
            fadeOut:Play()
            
            slideOut.Completed:Connect(function()
                if notificationFrame and notificationFrame.Parent then
                    notificationFrame:Destroy()
                    
                    -- Remover da lista
                    StorageTabs.NotificationSystem.Notifications[notificationId] = nil
                    
                    -- Reorganizar notificações restantes
                    task.delay(0.1, reorganizeNotifications)
                end
            end)
        end
        
        -- Timer automático
        if Settings.Duration > 0 then
            closeTimer = game:GetService("RunService").Heartbeat:Connect(function() end)
            
            if Settings.ShowProgress then
                task.delay(Settings.Duration + 0.4, animateOut)
            else
                task.delay(Settings.Duration, animateOut)
            end
        end
        
        -- Eventos
        closeButton.MouseButton1Click:Connect(animateOut)
        
        -- Armazenar referência
        StorageTabs.NotificationSystem.Notifications[notificationId] = {
            Frame = notificationFrame,
            StartY = startY,
            TotalHeight = totalHeight,
            IsClosing = false,
            Close = animateOut
        }
        
        -- Iniciar animação com pequeno delay
        task.delay(0.05, animateIn)
        
        -- Funções da notificação
        function Notification:UpdateTitle(newTitle)
            titleLabel.Text = newTitle
        end
        
        function Notification:UpdateMessage(newMessage)
            Settings.Message = newMessage
            messageLabel.Text = newMessage
            calculateHeights()
        end
        
        function Notification:Close()
            animateOut()
        end
        
        function Notification:GetId()
            return notificationId
        end
        
        return Notification
    end

    return StorageTabs
end

function Lib:Demo()
    local Demo = {}

    local Window = Lib:Window({
        Title = "Synapse Demo",
        Theme = "Darker",
        Folder = "SynapseDemo",
        ShowUserInfo = false,
        AcylicBlur = false,
        Button = false,
        TitleStyle = 1,
        Size = {700, 430},
        MaxSize = {800, 500},
        MinSize = {400, 300},
        KeyBind = Enum.KeyCode.K
    })
    
    local Tabs = {
        Main = Window:Tab({
            Name = "Main",
            Icon = "Home"
        }),
    }
    
    local Sections = {
        m1Left = Tabs.Main:Section({
            Header = "Section Header (Optional)",
            Side = "Left"
        }),
        
        m2Left = Tabs.Main:Section({
            Header = "",
            Side = "Left"
        }),
        
        m1Right = Tabs.Main:Section({
            Header = "",
            Side = "Right"
        }),
        
        m2Right = Tabs.Main:Section({
            Header = "",
            Side = "Right"
        }),
    }
    
    Sections.m1Left:Button("Flag_Button", {
        Name = "Example button",
        Callback = function()
            Window:Notification({
                Title = "Teste",
                Message = "Esta é uma notificação de teste!",
                Duration = 5
            })
            
            -- Teste com progresso
            Window:Notification({
                Title = "Carregando",
                Message = "Processando dados...",
                Duration = 5,
                ShowProgress = true
            })
        end
    })
    
    Sections.m1Left:Button("Flag_Button", {
        Name = "Example dialog",
        Callback = function()
            Window:Dialog({
                Title = "Dialog Title",
                Description = "Description of the dialog box with important information.",
                Buttons = {
                    {
                        Name = "Confirm",
                        Callback = function()
                            
                        end
                    },
                    {
                        Name = "Cancel",
                        Callback = function()
                            
                        end
                    }
                }
            })
        end
    })
    
    Sections.m1Left:Divider()
    
    Sections.m1Left:Checkbox("Flag_Checkbox", {
        Name = "Example checkbox [true]",
        Default = true,
        Callback = function(Value)
            
        end
    })
    
    Sections.m1Left:Checkbox("Flag_Checkbox", {
        Name = "Example checkbox",
        Default = false,
        Callback = function(Value)
            
        end
    })
    
    Sections.m2Left:Dropdown("Flag_Dropdown", {
        Name = "Example dropdown",
        Values = {"Banana", "Apple", "Mellon"},
        Default = "Apple",
        Callback = function(Value)
            
        end
    })
    
    Sections.m2Left:Input("Flag_Input", {
        Name = "Example input",
        Default = "Kaliu",
        Callback = function(Value)
            
        end
    })
    
    Sections.m2Left:Divider()
    
    Sections.m2Left:Colorpicker("Flag_Colorpicker", {
        Name = "Example colorpicker",
        Default = Color3.fromRGB(0, 128, 0),
        Callback = function(Value)
            
        end
    })
    
    Sections.m1Right:Slider("Flag_Slider", {
        Name = "Example slider",
        Minimum = -10,
        Maximum = 10,
        Default = 0,
        Callback = function(Value)
        
        end
    })
    
    Sections.m1Right:Slider("Flag_Slider", {
        Name = "Example slider",
        DisplayMethod = "Percentage",
        Minimum = 0,
        Maximum = 10,
        Default = 2,
        Precision = 1,
        Callback = function(Value)
            
        end
    })
    
    Sections.m1Right:Slider("Flag_Slider", {
        Name = "Example slider",
        DisplayMethod = "Value",
        Minimum = 0,
        Maximum = 10,
        Default = 2,
        Precision = 3,
        Callback = function(Value)
            
        end
    })
    
    Sections.m2Right:Paragraph("Flag_Paragraph", {})
    
    Sections.m2Right:Divider()
    
    Sections.m2Right:Label("Flag_Label", {Text = "Create By : KALIU"})
    
    Sections.m2Right:SubLabel("Flag_Label", {})
    
    return Demo
end

return Lib
