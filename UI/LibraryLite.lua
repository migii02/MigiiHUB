-- ============================================== --
--    SOURCE CODE UI BY UEGENEWU AKA LUNARHUB     --
--                REWORK TIPIS² BY MIGII                           --
-- ============================================== --

local UILib = {}
UILib.__index = UILib

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local function isMobile()
	return UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
end

local function getScreenSize()
	local camera = workspace.CurrentCamera
	if camera then return camera.ViewportSize end
	return Vector2.new(1920, 1080)
end

local function resolveImageId(input)
    if not input or input == "" then return nil end
    local cleanStr = tostring(input):match("%d+")
    if cleanStr then return "rbxthumb://type=Asset&id="..cleanStr.."&w=420&h=420" end
    return input 
end

function UILib.ShowMigiiLoader()
    local CoreGui = game:GetService("CoreGui")
    local player = Players.LocalPlayer
    local LOGO_ID = "rbxthumb://type=Asset&id=132319281050903&w=150&h=150" 

    local LoaderGui = Instance.new("ScreenGui")
    LoaderGui.Name = "MigiiLoaderUI"
    LoaderGui.IgnoreGuiInset = true
    LoaderGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local successLoader, _ = pcall(function() LoaderGui.Parent = CoreGui end)
    if not successLoader then LoaderGui.Parent = player:WaitForChild("PlayerGui") end

    local BlurEffect = Instance.new("BlurEffect")
    BlurEffect.Size = 0
    BlurEffect.Parent = game:GetService("Lighting")

    local MainBg = Instance.new("Frame")
    MainBg.Size = UDim2.new(1, 0, 1, 0)
    MainBg.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    MainBg.BackgroundTransparency = 0.2
    MainBg.BorderSizePixel = 0
    MainBg.Parent = LoaderGui

    local CenterBox = Instance.new("Frame")
    CenterBox.Size = UDim2.new(0, 320, 0, 200)
    CenterBox.Position = UDim2.new(0.5, -160, 0.5, -100)
    CenterBox.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    CenterBox.BorderSizePixel = 0
    CenterBox.Parent = MainBg
    Instance.new("UICorner", CenterBox).CornerRadius = UDim.new(0, 12)
    local BoxStroke = Instance.new("UIStroke")
    BoxStroke.Color = Color3.fromRGB(50, 255, 50)
    BoxStroke.Thickness = 2
    BoxStroke.Transparency = 0.5
    BoxStroke.Parent = CenterBox

    local LogoImg = Instance.new("ImageLabel")
    LogoImg.Size = UDim2.new(0, 70, 0, 70)
    LogoImg.Position = UDim2.new(0.5, -35, 0, 15)
    LogoImg.BackgroundTransparency = 1
    LogoImg.Image = LOGO_ID
    LogoImg.Parent = CenterBox

    local LogoTitle = Instance.new("TextLabel")
    LogoTitle.Size = UDim2.new(1, 0, 0, 30)
    LogoTitle.Position = UDim2.new(0, 0, 0, 90)
    LogoTitle.BackgroundTransparency = 1
    LogoTitle.Text = "MIGII-HUB"
    LogoTitle.TextColor3 = Color3.fromRGB(50, 255, 50)
    LogoTitle.Font = Enum.Font.GothamBlack
    LogoTitle.TextSize = 28
    LogoTitle.Parent = CenterBox

    local StatusText = Instance.new("TextLabel")
    StatusText.Size = UDim2.new(1, 0, 0, 30)
    StatusText.Position = UDim2.new(0, 0, 0, 120)
    StatusText.BackgroundTransparency = 1
    StatusText.Text = "Initializing Script..."
    StatusText.TextColor3 = Color3.fromRGB(200, 200, 200)
    StatusText.Font = Enum.Font.GothamSemibold
    StatusText.TextSize = 13
    StatusText.Parent = CenterBox

    local BarBg = Instance.new("Frame")
    BarBg.Size = UDim2.new(0, 260, 0, 8)
    BarBg.Position = UDim2.new(0.5, -130, 0, 165)
    BarBg.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    BarBg.BorderSizePixel = 0
    BarBg.Parent = CenterBox
    Instance.new("UICorner", BarBg).CornerRadius = UDim.new(1, 0)

    local BarFill = Instance.new("Frame")
    BarFill.Size = UDim2.new(0, 0, 1, 0)
    BarFill.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
    BarFill.BorderSizePixel = 0
    BarFill.Parent = BarBg
    Instance.new("UICorner", BarFill).CornerRadius = UDim.new(1, 0)

    TweenService:Create(BlurEffect, TweenInfo.new(0.5), {Size = 15}):Play()

    local function updateLoad(text, progress, dur)
        StatusText.Text = text
        TweenService:Create(BarFill, TweenInfo.new(dur, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(progress, 0, 1, 0)}):Play()
        task.wait(dur)
    end

    updateLoad("Loading Configurations...", 0.3, 0.8)
    updateLoad("Fetching Map Data...", 0.6, 0.7)
    updateLoad("Bypassing Anti-Cheat...", 0.85, 0.6)
    updateLoad("Starting Interface...", 1, 0.5)
    task.wait(0.3)

    local fadeOutInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TweenService:Create(MainBg, fadeOutInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(CenterBox, fadeOutInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(LogoImg, fadeOutInfo, {ImageTransparency = 1}):Play()
    TweenService:Create(LogoTitle, fadeOutInfo, {TextTransparency = 1}):Play()
    TweenService:Create(StatusText, fadeOutInfo, {TextTransparency = 1}):Play()
    TweenService:Create(BarBg, fadeOutInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(BarFill, fadeOutInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(BoxStroke, fadeOutInfo, {Transparency = 1}):Play()
    TweenService:Create(BlurEffect, fadeOutInfo, {Size = 0}):Play()

    task.wait(0.6)
    LoaderGui:Destroy()
    BlurEffect:Destroy()
end

function UILib.new(config)
	local self = setmetatable({}, UILib)
	self.Title = config.Title or "My Hub"
	self.Tabs = {}
	self.TabButtons = {}
	self.TabPages = {}
	self.ActiveTab = nil
	self.IsMobile = isMobile()

	self.Size = config.Size or UDim2.new(0, 480, 0, 320)
	self.SidebarWidth = 110
	self.TitleBarHeight = 34
	self.TopBarH = 3
	self.HeaderTotal = self.TopBarH + self.TitleBarHeight
	self._resizing = false
	self._minimized = false

	local oldGui = game.CoreGui:FindFirstChild("UILib_Main")
	if oldGui then oldGui:Destroy() end

	self.ScreenGui = Instance.new("ScreenGui")
	self.ScreenGui.Name = "UILib_Main"
	self.ScreenGui.Parent = game.CoreGui
	self.ScreenGui.ResetOnSpawn = false

	self.Shadow = Instance.new("ImageLabel", self.ScreenGui)
	self.Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
	self.Shadow.BackgroundTransparency = 1
	self.Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	self.Shadow.Size = self.Size + UDim2.new(0, 30, 0, 30)
	self.Shadow.Image = "rbxassetid://5554236805"
	self.Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	self.Shadow.ImageTransparency = 0.6
	self.Shadow.ScaleType = Enum.ScaleType.Slice
	self.Shadow.SliceCenter = Rect.new(23, 23, 277, 277)

	self.Main = Instance.new("Frame", self.ScreenGui)
	self.Main.Name = "Main"
	self.Main.AnchorPoint = Vector2.new(0.5, 0.5)
	self.Main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
	self.Main.BorderSizePixel = 0
	self.Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	self.Main.Size = self.Size
	self.Main.ClipsDescendants = true
	Instance.new("UICorner", self.Main).CornerRadius = UDim.new(0, 10)
    
	local imageId = resolveImageId(config.BackgroundImage)
    
	if imageId then
		self.Main.BackgroundTransparency = 1 
		local bgImage = Instance.new("ImageLabel", self.Main)
		bgImage.Name = "AnimeBackground"
		bgImage.Size = UDim2.new(1, 0, 1, 0)
		bgImage.Position = UDim2.new(0, 0, 0, 0)
		bgImage.Image = imageId
		bgImage.ScaleType = Enum.ScaleType.Crop
		bgImage.ZIndex = 0
		bgImage.BackgroundTransparency = 1

		local overlay = Instance.new("Frame", self.Main)
		overlay.Size = UDim2.new(1, 0, 1, 0)
		overlay.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
		overlay.BackgroundTransparency = config.BackgroundDarkness or 0.5 
		overlay.ZIndex = 0
		overlay.BorderSizePixel = 0
	else
		self.Main.BackgroundTransparency = config.Transparency or 0
	end

	local stroke = Instance.new("UIStroke", self.Main)
	stroke.Color = Color3.fromRGB(60, 80, 180)
	stroke.Thickness = 1
	stroke.Transparency = 0.5

	self:_setupDrag()
	self:_createAnimatedBar()
	self:_createTitleBar(imageId ~= nil)
	self:_createSidebar(imageId ~= nil)

	self.ContentArea = Instance.new("Frame", self.Main)
	self.ContentArea.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
	self.ContentArea.BackgroundTransparency = imageId and 0.25 or 0 
	self.ContentArea.BorderSizePixel = 0
	self.ContentArea.Position = UDim2.new(0, self.SidebarWidth, 0, self.HeaderTotal)
	self.ContentArea.Size = UDim2.new(1, -self.SidebarWidth, 1, -self.HeaderTotal)

	self:_createNotifyBar()
	self:_createToastContainer()
	self:_setupResize()

	self.Main.Size = UDim2.new(0, 0, 0, 0)
	self.Shadow.ImageTransparency = 1
	TweenService:Create(self.Main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = self.Size }):Play()
	TweenService:Create(self.Shadow, TweenInfo.new(0.5), { ImageTransparency = 0.6 }):Play()

	return self
end

function UILib:Destroy()
    self._antiAfkActive = false
    if self._antiAfkIdleConnection then self._antiAfkIdleConnection:Disconnect(); self._antiAfkIdleConnection = nil end
    if self.ScreenGui then self.ScreenGui:Destroy() end
    local toggle = game.CoreGui:FindFirstChild("UILib_Toggle")
    if toggle then toggle:Destroy() end
    if self.ToastContainer then self.ToastContainer:Destroy() end
end

function UILib:_setupDrag()
	local dragging, dragInput, dragStart, startPos
	self.Main.InputBegan:Connect(function(input)
		if self._resizing then return end
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true; dragStart = input.Position; startPos = self.Main.Position
			input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
		end
	end)
	self.Main.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging and not self._resizing then
			local delta = input.Position - dragStart
			local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			self.Main.Position = newPos; self.Shadow.Position = newPos
		end
	end)
end

function UILib:_setupResize()
	local handleSize = 22; local dotSize = 2; local dotGap = 4
	local minW = self.SidebarWidth + 100; local minH = self.HeaderTotal + 80
	local screen = getScreenSize()
	local maxW = math.min(screen.X - 10, 1200); local maxH = math.min(screen.Y - 20, 900)
	local handle = Instance.new("Frame", self.Main)
	handle.BackgroundTransparency = 1
	handle.Position = UDim2.new(1, -handleSize, 1, -handleSize)
	handle.Size = UDim2.new(0, handleSize, 0, handleSize)
	handle.ZIndex = 10
	local gripDots = {}
	for row = 0, 2 do
		for col = 0, 2 - row do
			local d = Instance.new("Frame", handle)
			d.BackgroundColor3 = Color3.fromRGB(80, 100, 180)
			d.BackgroundTransparency = 0.3
			d.BorderSizePixel = 0
			d.Size = UDim2.new(0, dotSize, 0, dotSize)
			d.Position = UDim2.new(1, -(3 + col * (dotSize + dotGap)), 1, -(3 + row * (dotSize + dotGap)))
			d.AnchorPoint = Vector2.new(1, 1)
			Instance.new("UICorner", d).CornerRadius = UDim.new(1, 0)
			table.insert(gripDots, d)
		end
	end
	local btn = Instance.new("TextButton", handle)
	btn.BackgroundTransparency = 1
	btn.Size = UDim2.new(1, 10, 1, 10)
	btn.Text = ""
	local resizing = false; local resizeStart, startSize, startPos
	btn.InputBegan:Connect(function(input)
		if self._minimized then return end
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			resizing = true; self._resizing = true; resizeStart = input.Position; startSize = Vector2.new(self.Main.Size.X.Offset, self.Main.Size.Y.Offset); startPos = self.Main.Position
			input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then resizing = false; self._resizing = false end end)
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - resizeStart
			local newW = math.clamp(startSize.X + delta.X, minW, maxW)
			local newH = math.clamp(startSize.Y + delta.Y, minH, maxH)
			local newSize = UDim2.new(0, newW, 0, newH)
			local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + (newW - startSize.X) / 2, startPos.Y.Scale, startPos.Y.Offset + (newH - startSize.Y) / 2)
			self.Main.Size = newSize; self.Main.Position = newPos; self.Size = newSize
			self.Shadow.Size = newSize + UDim2.new(0, 30, 0, 30); self.Shadow.Position = newPos
		end
	end)
	self.ResizeHandle = handle
end

function UILib:_createAnimatedBar()
	local bar = Instance.new("Frame", self.Main)
	bar.BackgroundColor3 = Color3.new(1, 1, 1)
	bar.BorderSizePixel = 0
	bar.Size = UDim2.new(1, 0, 0, self.TopBarH)
	local gradient = Instance.new("UIGradient", bar)
	gradient.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 120, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(160, 100, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 100, 180)) }
	task.spawn(function()
		while self.ScreenGui and self.ScreenGui.Parent do
			for i = 0, 1, 0.01 do if not self.ScreenGui.Parent then return end gradient.Offset = Vector2.new(i, 0); task.wait(0.05) end
			for i = 1, 0, -0.01 do if not self.ScreenGui.Parent then return end gradient.Offset = Vector2.new(i, 0); task.wait(0.05) end
		end
	end)
end

function UILib:_createTitleBar(hasBg)
	self.TitleBar = Instance.new("Frame", self.Main)
	self.TitleBar.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
	self.TitleBar.BackgroundTransparency = hasBg and 0.4 or 0 
	self.TitleBar.BorderSizePixel = 0
	self.TitleBar.Position = UDim2.new(0, 0, 0, self.TopBarH)
	self.TitleBar.Size = UDim2.new(1, 0, 0, self.TitleBarHeight)
	local titleLabel = Instance.new("TextLabel", self.TitleBar)
	titleLabel.BackgroundTransparency = 1
	titleLabel.Position = UDim2.new(0, 10, 0, 0)
	titleLabel.Size = UDim2.new(0, 200, 1, 0)
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.Text = self.Title
	titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	titleLabel.TextSize = 12
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left

	local closeBtn = Instance.new("TextButton", self.TitleBar)
	closeBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
	closeBtn.BackgroundTransparency = 0.8
	closeBtn.Position = UDim2.new(1, -28, 0.5, -11)
	closeBtn.Size = UDim2.new(0, 22, 0, 22)
	closeBtn.Font = Enum.Font.GothamBold
	closeBtn.Text = "✕"
	closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
	closeBtn.TextSize = 10
	Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)
	closeBtn.MouseButton1Click:Connect(function() self.ScreenGui.Enabled = false end)

	local minBtn = Instance.new("TextButton", self.TitleBar)
	minBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 60)
	minBtn.BackgroundTransparency = 0.8
	minBtn.Position = UDim2.new(1, -54, 0.5, -11)
	minBtn.Size = UDim2.new(0, 22, 0, 22)
	minBtn.Font = Enum.Font.GothamBold
	minBtn.Text = "—"
	minBtn.TextColor3 = Color3.fromRGB(255, 200, 60)
	minBtn.TextSize = 10
	Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)
	minBtn.MouseButton1Click:Connect(function()
		self._minimized = not self._minimized
		if self._minimized then
			TweenService:Create(self.Main, TweenInfo.new(0.3), { Size = UDim2.new(0, self.Size.X.Offset, 0, self.HeaderTotal) }):Play()
			TweenService:Create(self.Shadow, TweenInfo.new(0.3), { Size = UDim2.new(0, self.Size.X.Offset + 30, 0, self.HeaderTotal + 30) }):Play()
			if self.ResizeHandle then self.ResizeHandle.Visible = false end
		else
			TweenService:Create(self.Main, TweenInfo.new(0.3), { Size = self.Size }):Play()
			TweenService:Create(self.Shadow, TweenInfo.new(0.3), { Size = self.Size + UDim2.new(0, 30, 0, 30) }):Play()
			if self.ResizeHandle then self.ResizeHandle.Visible = true end
		end
	end)
    
	self:_createAntiAfkIndicator()
end

function UILib:_createAntiAfkIndicator()
	self._antiAfkActive = true
	local indicator = Instance.new("Frame", self.TitleBar)
	indicator.Name = "AntiAfkIndicator"
	indicator.BackgroundTransparency = 1
	indicator.Position = UDim2.new(1, -82, 0, 9)
	indicator.Size = UDim2.new(0, 32, 0, 16)
	local dot = Instance.new("Frame", indicator)
	dot.Name = "Dot"
	dot.BackgroundColor3 = Color3.fromRGB(50, 255, 100)
	dot.BorderSizePixel = 0
	dot.Position = UDim2.new(0, 0, 0.5, -3)
	dot.Size = UDim2.new(0, 6, 0, 6)
	Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
	local label = Instance.new("TextLabel", indicator)
	label.BackgroundTransparency = 1
	label.Position = UDim2.new(0, 9, 0, 0)
	label.Size = UDim2.new(0, 22, 1, 0)
	label.Font = Enum.Font.GothamBold
	label.Text = "AFK"
	label.TextColor3 = Color3.fromRGB(50, 255, 100)
	label.TextSize = 7
	label.TextXAlignment = Enum.TextXAlignment.Left
    
	task.spawn(function()
		while self._antiAfkActive and dot and dot.Parent do
			TweenService:Create(dot, TweenInfo.new(0.8), { BackgroundTransparency = 0.6 }):Play()
			task.wait(0.8)
			if not (dot and dot.Parent) then break end
			TweenService:Create(dot, TweenInfo.new(0.8), { BackgroundTransparency = 0 }):Play()
			task.wait(0.8)
		end
	end)
end

function UILib:_createSidebar(hasBg)
	self.Sidebar = Instance.new("ScrollingFrame", self.Main)
	self.Sidebar.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
	self.Sidebar.BackgroundTransparency = hasBg and 0.3 or 0 
	self.Sidebar.BorderSizePixel = 0
	self.Sidebar.Position = UDim2.new(0, 0, 0, self.HeaderTotal)
	self.Sidebar.Size = UDim2.new(0, self.SidebarWidth, 1, -self.HeaderTotal)
	self.Sidebar.ScrollBarThickness = 2
	self.Sidebar.ScrollBarImageColor3 = Color3.fromRGB(60, 80, 180)
	self.Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
	self.Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
	local line = Instance.new("Frame", self.Sidebar)
	line.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
	line.BackgroundTransparency = hasBg and 0.5 or 0
	line.BorderSizePixel = 0
	line.Position = UDim2.new(1, -1, 0, 0)
	line.Size = UDim2.new(0, 1, 1, 0)
	self._tabIndex = 0
end

function UILib:_createNotifyBar()
	self.NotifyContainer = Instance.new("Frame", self.ContentArea)
	self.NotifyContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
	self.NotifyContainer.BackgroundTransparency = self.ContentArea.BackgroundTransparency
	self.NotifyContainer.BorderSizePixel = 0
	self.NotifyContainer.Position = UDim2.new(0, 0, 0, 0)
	self.NotifyContainer.Size = UDim2.new(1, 0, 0, 20)
	self.NotifyContainer.ClipsDescendants = true
	self.NotifyContainer.Visible = false

	local bottomLine = Instance.new("Frame", self.NotifyContainer)
	bottomLine.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
	bottomLine.BorderSizePixel = 0
	bottomLine.Position = UDim2.new(0, 0, 1, -1)
	bottomLine.Size = UDim2.new(1, 0, 0, 1)

	self.NotifyText = Instance.new("TextLabel", self.NotifyContainer)
	self.NotifyText.BackgroundTransparency = 1
	self.NotifyText.Size = UDim2.new(0, 0, 1, 0)
	self.NotifyText.Font = Enum.Font.GothamSemibold
	self.NotifyText.Text = ""
	self.NotifyText.TextColor3 = Color3.fromRGB(80, 255, 120)
	self.NotifyText.TextSize = 10
	self.NotifyText.TextXAlignment = Enum.TextXAlignment.Left
	self.NotifyText.AutomaticSize = Enum.AutomaticSize.X

	self._notifyTween = nil
end

function UILib:Notify(msg, color)
	self.NotifyContainer.Visible = true
	self.NotifyText.Text = msg .. "      " 
	self.NotifyText.TextColor3 = color or Color3.fromRGB(80, 255, 120)

	if self._notifyTween then self._notifyTween:Cancel() end
	self.NotifyText.Position = UDim2.new(1, 10, 0, 0)
	
	task.wait(0.05)
	local textWidth = self.NotifyText.AbsoluteSize.X
	local containerWidth = self.NotifyContainer.AbsoluteSize.X
	local distance = containerWidth + textWidth + 20
	local duration = distance / 60 

	self._notifyTween = TweenService:Create(self.NotifyText, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
		Position = UDim2.new(0, -textWidth - 10, 0, 0)
	})
	
	self._notifyTween.Completed:Connect(function(playbackState)
		if playbackState == Enum.PlaybackState.Completed then self.NotifyContainer.Visible = false end
	end)
	self._notifyTween:Play()
end

function UILib:_createToastContainer()
    self.ToastContainer = Instance.new("Frame", self.ScreenGui)
    self.ToastContainer.Name = "ToastContainer"
    self.ToastContainer.BackgroundTransparency = 1
    self.ToastContainer.Position = UDim2.new(1, -20, 1, -20)
    self.ToastContainer.Size = UDim2.new(0, 240, 1, 0)
    self.ToastContainer.AnchorPoint = Vector2.new(1, 1)

    local layout = Instance.new("UIListLayout", self.ToastContainer)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 10)
end

function UILib:Toast(config)
    config = config or {}
    local title = config.Title or "Notification" 
    local message = config.Message or config.Text or ""
    local duration = config.Duration or 3 
    local nType = config.Type or "Info"
    
    local typeColors = {
        Info = Color3.fromRGB(60, 120, 255),
        Success = Color3.fromRGB(60, 255, 100),
        Warning = Color3.fromRGB(255, 200, 60),
        Error = Color3.fromRGB(255, 60, 60)
    }
    local typeIcons = {Info="ℹ️", Success="✅", Warning="⚠️", Error="❌"}
    local color = typeColors[nType] or typeColors.Info 
    local icon = typeIcons[nType] or "ℹ️"
    
    local toast = Instance.new("Frame", self.ToastContainer) 
    toast.BackgroundColor3 = Color3.fromRGB(25, 25, 35) 
    toast.BackgroundTransparency = 0.2 
    toast.BorderSizePixel = 0 
    toast.Size = UDim2.new(1, 0, 0, 62) 
    toast.ClipsDescendants = true 
    toast.LayoutOrder = -math.floor(tick()*100) 
    Instance.new("UICorner", toast).CornerRadius = UDim.new(0, 8)
    
    local ts = Instance.new("UIStroke", toast) 
    ts.Color = color 
    ts.Thickness = 1 
    ts.Transparency = 0.5
    
    local al = Instance.new("Frame", toast)
    al.BackgroundColor3 = color 
    al.BorderSizePixel = 0 
    al.Size = UDim2.new(0, 3, 1, 0)
    
    local il = Instance.new("TextLabel", toast) 
    il.BackgroundTransparency = 1 
    il.Position = UDim2.new(0, 12, 0, 10) 
    il.Size = UDim2.new(0, 20, 0, 20) 
    il.Text = icon 
    il.TextSize = 14 
    il.Font = Enum.Font.GothamBold
    
    local ttl = Instance.new("TextLabel", toast) 
    ttl.BackgroundTransparency = 1 
    ttl.Position = UDim2.new(0, 38, 0, 8) 
    ttl.Size = UDim2.new(1, -50, 0, 16) 
    ttl.Font = Enum.Font.GothamBold 
    ttl.Text = title 
    ttl.TextColor3 = Color3.fromRGB(255, 255, 255) 
    ttl.TextSize = 11 
    ttl.TextXAlignment = Enum.TextXAlignment.Left
    
    local tml = Instance.new("TextLabel", toast) 
    tml.BackgroundTransparency = 1 
    tml.Position = UDim2.new(0, 38, 0, 24) 
    tml.Size = UDim2.new(1, -50, 0, 28) 
    tml.Font = Enum.Font.Gotham 
    tml.Text = message 
    tml.TextColor3 = Color3.fromRGB(200, 200, 220) 
    tml.TextSize = 10 
    tml.TextXAlignment = Enum.TextXAlignment.Left 
    tml.TextWrapped = true 
    tml.TextYAlignment = Enum.TextYAlignment.Top
    
    local pb = Instance.new("Frame", toast) 
    pb.BackgroundColor3 = Color3.fromRGB(40, 40, 50) 
    pb.BorderSizePixel = 0 
    pb.Position = UDim2.new(0, 3, 1, -2) 
    pb.Size = UDim2.new(1, -3, 0, 2)
    
    local ppf = Instance.new("Frame", pb) 
    ppf.BackgroundColor3 = color 
    ppf.BorderSizePixel = 0 
    ppf.Size = UDim2.new(1, 0, 1, 0) 
    Instance.new("UICorner", ppf).CornerRadius = UDim.new(1, 0)
    
    toast.Position = UDim2.new(1, 20, 0, 0) 
    toast.BackgroundTransparency = 1
    ts.Transparency = 1
    al.BackgroundTransparency = 1
    il.TextTransparency = 1
    ttl.TextTransparency = 1
    tml.TextTransparency = 1
    pb.BackgroundTransparency = 1
    ppf.BackgroundTransparency = 1

    TweenService:Create(toast, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 0.2}):Play()
    TweenService:Create(ts, TweenInfo.new(0.35), {Transparency = 0.5}):Play()
    TweenService:Create(al, TweenInfo.new(0.35), {BackgroundTransparency = 0}):Play()
    TweenService:Create(il, TweenInfo.new(0.35), {TextTransparency = 0}):Play()
    TweenService:Create(ttl, TweenInfo.new(0.35), {TextTransparency = 0}):Play()
    TweenService:Create(tml, TweenInfo.new(0.35), {TextTransparency = 0}):Play()
    TweenService:Create(pb, TweenInfo.new(0.35), {BackgroundTransparency = 0}):Play()
    TweenService:Create(ppf, TweenInfo.new(0.35), {BackgroundTransparency = 0}):Play()
    
    TweenService:Create(ppf, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)}):Play()
    
    task.delay(duration, function() 
        if toast and toast.Parent then 
            TweenService:Create(toast, TweenInfo.new(0.25), {Position = UDim2.new(1, 20, 0, 0), BackgroundTransparency = 1}):Play()
            TweenService:Create(ts, TweenInfo.new(0.25), {Transparency = 1}):Play()
            TweenService:Create(al, TweenInfo.new(0.25), {BackgroundTransparency = 1}):Play()
            TweenService:Create(il, TweenInfo.new(0.25), {TextTransparency = 1}):Play()
            TweenService:Create(ttl, TweenInfo.new(0.25), {TextTransparency = 1}):Play()
            TweenService:Create(tml, TweenInfo.new(0.25), {TextTransparency = 1}):Play()
            TweenService:Create(pb, TweenInfo.new(0.25), {BackgroundTransparency = 1}):Play()
            TweenService:Create(ppf, TweenInfo.new(0.25), {BackgroundTransparency = 1}):Play()
            task.delay(0.3, function() 
                if toast and toast.Parent then toast:Destroy() end 
            end) 
        end 
    end)
end

function UILib:AddTab(config)
	local tabName = config.Name or "Tab"
	self._tabIndex = self._tabIndex + 1

	local btn = Instance.new("TextButton", self.Sidebar)
	btn.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
	btn.BackgroundTransparency = self.Sidebar.BackgroundTransparency
	btn.BorderSizePixel = 0
	btn.Position = UDim2.new(0, 4, 0, 5 + (self._tabIndex - 1) * 32)
	btn.Size = UDim2.new(1, -8, 0, 28)
	btn.Text = ""
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

	local indicator = Instance.new("Frame", btn)
	indicator.Name = "Indicator"
	indicator.BackgroundColor3 = Color3.fromRGB(100, 140, 255)
	indicator.BackgroundTransparency = 1
	indicator.Size = UDim2.new(0, 3, 0.7, 0)
	indicator.Position = UDim2.new(0, 0, 0.15, 0)
	Instance.new("UICorner", indicator).CornerRadius = UDim.new(0, 2)

	local label = Instance.new("TextLabel", btn)
	label.Name = "Label"
	label.BackgroundTransparency = 1
	label.Position = UDim2.new(0, 8, 0, 0)
	label.Size = UDim2.new(1, -8, 1, 0)
	label.Font = Enum.Font.GothamBold
	label.Text = (config.Icon or "📁") .. " " .. tabName
	label.TextColor3 = Color3.fromRGB(180, 180, 200)
	label.TextSize = 10
	label.TextXAlignment = Enum.TextXAlignment.Left

	local page = Instance.new("ScrollingFrame", self.ContentArea)
	page.BackgroundTransparency = 1
	page.BorderSizePixel = 0
	page.Position = UDim2.new(0, 6, 0, 22)
	page.Size = UDim2.new(1, -12, 1, -22)
	page.ScrollBarThickness = 3
	page.ScrollBarImageColor3 = Color3.fromRGB(60, 80, 180)
	page.CanvasSize = UDim2.new(0, 0, 0, 0)
	page.Visible = false
	page.AutomaticCanvasSize = Enum.AutomaticSize.Y
	Instance.new("UIPadding", page).PaddingRight = UDim.new(0, 6)
	
	local layout = Instance.new("UIListLayout", page)
	layout.Padding = UDim.new(0, 8)

	self.TabButtons[tabName] = btn
	self.TabPages[tabName] = page

	btn.MouseButton1Click:Connect(function() self:SwitchTab(tabName) end)
	if self._tabIndex == 1 then task.defer(function() self:SwitchTab(tabName) end) end

	local tab = { Name = tabName, Page = page, Library = self, _sectionOrder = 0 }
	setmetatable(tab, { __index = UILib._TabMethods })
	return tab
end

function UILib:SwitchTab(name)
	if self.ActiveTab == name then return end
	self.ActiveTab = name
	for tabName, btn in pairs(self.TabButtons) do
		local ind = btn:FindFirstChild("Indicator")
		local lbl = btn:FindFirstChild("Label")
		if tabName == name then
			btn.BackgroundColor3 = Color3.fromRGB(60, 80, 180)
			btn.BackgroundTransparency = self.Sidebar.BackgroundTransparency * 0.5 
			if lbl then lbl.TextColor3 = Color3.new(1, 1, 1) end
			if ind then ind.BackgroundTransparency = 0 end
		else
			btn.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
			btn.BackgroundTransparency = self.Sidebar.BackgroundTransparency
			if lbl then lbl.TextColor3 = Color3.fromRGB(180, 180, 200) end
			if ind then ind.BackgroundTransparency = 1 end
		end
	end
	for tabName, page in pairs(self.TabPages) do
		page.Visible = (tabName == name)
	end
end

UILib._TabMethods = {}
function UILib._TabMethods:AddSection(config)
	self._sectionOrder = self._sectionOrder + 1
	local section = Instance.new("Frame", self.Page)
	section.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
	section.BackgroundTransparency = self.Library.ContentArea.BackgroundTransparency 
	section.BorderSizePixel = 0
	section.Size = UDim2.new(1, 0, 0, 0)
	section.AutomaticSize = Enum.AutomaticSize.Y
	section.LayoutOrder = self._sectionOrder
	Instance.new("UICorner", section).CornerRadius = UDim.new(0, 8)
	local stroke = Instance.new("UIStroke", section)
	stroke.Color = Color3.fromRGB(60, 60, 80)
	stroke.Transparency = 0.4
	
	local padding = Instance.new("UIPadding", section)
	padding.PaddingLeft = UDim.new(0, 10); padding.PaddingRight = UDim.new(0, 10); padding.PaddingTop = UDim.new(0, 8); padding.PaddingBottom = UDim.new(0, 11)
	
	local layout = Instance.new("UIListLayout", section)
	layout.Padding = UDim.new(0, 6)
	layout.SortOrder = Enum.SortOrder.LayoutOrder 
	
	local titleLabel = Instance.new("TextLabel", section)
	titleLabel.BackgroundTransparency = 1
	titleLabel.Size = UDim2.new(1, 0, 0, 16)
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.Text = config.Title or "Section"
	titleLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
	titleLabel.TextSize = 11
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.LayoutOrder = 0 

	local sec = { Frame = section, Tab = self, Library = self.Library, _elementOrder = 0 }
	setmetatable(sec, { __index = UILib._SectionMethods })
	return sec
end

UILib._SectionMethods = {}
function UILib._SectionMethods:AddToggle(config)
	self._elementOrder = self._elementOrder + 1
	local frame = Instance.new("Frame", self.Frame)
	frame.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
	frame.BackgroundTransparency = 0.3 
	frame.Size = UDim2.new(1, 0, 0, 30)
	frame.LayoutOrder = self._elementOrder
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
	
	local label = Instance.new("TextLabel", frame)
	label.BackgroundTransparency = 1
	label.Position = UDim2.new(0, 8, 0, 0)
	label.Size = UDim2.new(1, -50, 1, 0)
	label.Font = Enum.Font.GothamSemibold
	label.Text = config.Text or "Toggle"
	label.TextColor3 = Color3.fromRGB(220, 220, 240)
	label.TextSize = 10
	label.TextXAlignment = Enum.TextXAlignment.Left
	
	local bg = Instance.new("Frame", frame)
	bg.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
	bg.Position = UDim2.new(1, -42, 0.5, -9)
	bg.Size = UDim2.new(0, 34, 0, 18)
	Instance.new("UICorner", bg).CornerRadius = UDim.new(1, 0)
	
	local knob = Instance.new("Frame", bg)
	knob.BackgroundColor3 = Color3.fromRGB(150, 150, 170)
	knob.Position = UDim2.new(0, 3, 0.5, -6.5)
	knob.Size = UDim2.new(0, 13, 0, 13)
	Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

	local active = config.Default or false
	local function updateVisual()
		if active then
			bg.BackgroundColor3 = Color3.fromRGB(60, 160, 100)
			TweenService:Create(knob, TweenInfo.new(0.2), {Position = UDim2.new(1, -16, 0.5, -6.5), BackgroundColor3 = Color3.new(1, 1, 1)}):Play()
		else
			bg.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
			TweenService:Create(knob, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, -6.5), BackgroundColor3 = Color3.fromRGB(150, 150, 170)}):Play()
		end
	end

	local clickBtn = Instance.new("TextButton", frame)
	clickBtn.BackgroundTransparency = 1
	clickBtn.Size = UDim2.new(1, 0, 1, 0)
	clickBtn.Text = ""
	clickBtn.MouseButton1Click:Connect(function() active = not active; updateVisual(); if config.Callback then config.Callback(active) end end)
	updateVisual()
	return { SetValue = function(_, val) active = val; updateVisual() end, GetValue = function() return active end }
end

function UILib._SectionMethods:AddButton(config)
	self._elementOrder = self._elementOrder + 1
	local btn = Instance.new("TextButton", self.Frame)
	btn.BackgroundColor3 = config.Color or Color3.fromRGB(60, 80, 180)
	btn.BackgroundTransparency = 0.15 
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.Font = Enum.Font.GothamBold
	btn.Text = config.Text or "Button"
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.TextSize = 11
	btn.LayoutOrder = self._elementOrder
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
	btn.MouseButton1Click:Connect(function() if config.Callback then config.Callback() end end)
	return btn
end

function UILib._SectionMethods:AddLabel(config)
	self._elementOrder = self._elementOrder + 1
	local label = Instance.new("TextLabel", self.Frame)
	label.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
	label.BackgroundTransparency = 0.4 
	label.Size = UDim2.new(1, 0, 0, config.Height or 22)
	label.Font = Enum.Font.GothamSemibold
	label.Text = config.Text or ""
	label.TextColor3 = config.TextColor or Color3.fromRGB(200, 200, 220)
	label.TextSize = 9
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.LayoutOrder = self._elementOrder
	Instance.new("UICorner", label).CornerRadius = UDim.new(0, 6)
	local padding = Instance.new("UIPadding", label)
	padding.PaddingLeft = UDim.new(0, 8)
	return label
end

function UILib._SectionMethods:AddSlider(config)
	self._elementOrder = self._elementOrder + 1
	local min = config.Min or 0
	local max = config.Max or 100
	local default = config.Default or min
	local decimals = config.Decimals or 0
	local step = config.Step or 1
	local callback = config.Callback or function() end

	local function round(num)
		if decimals > 0 then
			local mult = 10^decimals
			return math.floor(num * mult + 0.5) / mult
		end
		return math.floor(num + 0.5)
	end

	local value = round(math.clamp(default, min, max))

	local frame = Instance.new("Frame", self.Frame)
	frame.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
	frame.BackgroundTransparency = 0.3 
	frame.Size = UDim2.new(1, 0, 0, 45)
	frame.LayoutOrder = self._elementOrder
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

	local titleLabel = Instance.new("TextLabel", frame)
	titleLabel.BackgroundTransparency = 1
	titleLabel.Position = UDim2.new(0, 8, 0, 4)
	titleLabel.Size = UDim2.new(0.5, 0, 0, 14)
	titleLabel.Font = Enum.Font.GothamSemibold
	titleLabel.Text = config.Text or "Slider"
	titleLabel.TextColor3 = Color3.fromRGB(220, 220, 240)
	titleLabel.TextSize = 10
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left

	local valueLabel = Instance.new("TextLabel", frame)
	valueLabel.BackgroundTransparency = 1
	valueLabel.Position = UDim2.new(0.5, -8, 0, 4)
	valueLabel.Size = UDim2.new(0.5, 0, 0, 14)
	valueLabel.Font = Enum.Font.GothamBold
	if decimals > 0 then
		valueLabel.Text = string.format("%."..decimals.."f", value)
	else
		valueLabel.Text = tostring(value)
	end
	valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	valueLabel.TextSize = 10
	valueLabel.TextXAlignment = Enum.TextXAlignment.Right

	local sliderBg = Instance.new("Frame", frame)
	sliderBg.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
	sliderBg.BackgroundTransparency = self.Library.ContentArea.BackgroundTransparency 
	sliderBg.Position = UDim2.new(0, 35, 0, 26)
	sliderBg.Size = UDim2.new(1, -70, 0, 8)
	Instance.new("UICorner", sliderBg).CornerRadius = UDim.new(1, 0)

	local sliderFill = Instance.new("Frame", sliderBg)
	sliderFill.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
	sliderFill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
	Instance.new("UICorner", sliderFill).CornerRadius = UDim.new(1, 0)

	local function updateValue(newVal)
		value = round(math.clamp(newVal, min, max))
		local percent = (value - min) / (max - min)
		TweenService:Create(sliderFill, TweenInfo.new(0.1), {Size = UDim2.new(percent, 0, 1, 0)}):Play()
		
		if decimals > 0 then
			valueLabel.Text = string.format("%."..decimals.."f", value)
		else
			valueLabel.Text = tostring(value)
		end
		
		callback(value)
	end

	local btnMinus = Instance.new("TextButton", frame)
	btnMinus.Text = "-"
	btnMinus.Size = UDim2.new(0, 22, 0, 22)
	btnMinus.Position = UDim2.new(0, 6, 0, 19)
	btnMinus.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
	btnMinus.BackgroundTransparency = 0.2 
	btnMinus.TextColor3 = Color3.new(1, 1, 1)
	btnMinus.Font = Enum.Font.GothamBold
	Instance.new("UICorner", btnMinus).CornerRadius = UDim.new(0, 4)
	btnMinus.MouseButton1Click:Connect(function() updateValue(value - step) end)

	local btnPlus = Instance.new("TextButton", frame)
	btnPlus.Text = "+"
	btnPlus.Size = UDim2.new(0, 22, 0, 22)
	btnPlus.Position = UDim2.new(1, -28, 0, 19)
	btnPlus.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
	btnPlus.BackgroundTransparency = 0.2
	btnPlus.TextColor3 = Color3.new(1, 1, 1)
	btnPlus.Font = Enum.Font.GothamBold
	Instance.new("UICorner", btnPlus).CornerRadius = UDim.new(0, 4)
	btnPlus.MouseButton1Click:Connect(function() updateValue(value + step) end)

	local hitBox = Instance.new("TextButton", sliderBg)
	hitBox.BackgroundTransparency = 1; hitBox.Size = UDim2.new(1, 0, 1, 20); hitBox.Position = UDim2.new(0, 0, 0, -10); hitBox.Text = ""

	local dragging = false
	local function handleDrag(input)
		local percent = math.clamp((input.Position.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
		local rawVal = min + ((max - min) * percent)
		rawVal = math.floor(rawVal / step + 0.5) * step
		updateValue(rawVal)
	end

	hitBox.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			handleDrag(input)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			handleDrag(input)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
    end)

	return { SetValue = function(_, v) updateValue(v) end }
end

function UILib:CreateToggleButton(config)
	config = config or {}
	local icon = config.Icon or "🌸"
	local old = game.CoreGui:FindFirstChild("UILib_Toggle")
	if old then old:Destroy() end

	local toggleGui = Instance.new("ScreenGui")
	toggleGui.Name = "UILib_Toggle"
	toggleGui.Parent = game.CoreGui
	toggleGui.ResetOnSpawn = false

	local toggleBtn = Instance.new("TextButton", toggleGui)
	toggleBtn.AnchorPoint = Vector2.new(0, 0)
	toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40) 
	toggleBtn.BackgroundTransparency = 0.1
	toggleBtn.BorderSizePixel = 0
	toggleBtn.Position = UDim2.new(0, 80, 0, 20)
	toggleBtn.Size = UDim2.new(0, 45, 0, 45) 
	toggleBtn.Text = "" 
	toggleBtn.Active = true
	toggleBtn.Draggable = true
	Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 6)
    
	local stroke = Instance.new("UIStroke", toggleBtn)
	stroke.Color = Color3.fromRGB(50, 255, 50)
	stroke.Thickness = 2

	local isImage = tostring(icon):match("rbx") or tonumber(icon) ~= nil
	local resolvedImage = resolveImageId(icon)

	if isImage and resolvedImage then
		local iconImg = Instance.new("ImageLabel", toggleBtn)
		iconImg.BackgroundTransparency = 1
		iconImg.Size = UDim2.new(0.7, 0, 0.7, 0)
		iconImg.Position = UDim2.new(0.15, 0, 0.15, 0)
		iconImg.Image = resolvedImage
		iconImg.ScaleType = Enum.ScaleType.Fit
	else
		toggleBtn.Text = icon
		toggleBtn.Font = Enum.Font.GothamBold
		toggleBtn.TextSize = 20
		toggleBtn.TextColor3 = Color3.new(1, 1, 1)
	end

	toggleBtn.MouseButton1Click:Connect(function() self.ScreenGui.Enabled = not self.ScreenGui.Enabled end)
	return toggleGui
end

return UILib
