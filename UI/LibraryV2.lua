-- ========================================= --
--            SOURCE CODE UILIBRARY V2.4               --
--   (POWERED UI NYA UEGENE AKA LUNAR HUB)    --
-- ========================================= --
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local UILib = {}
UILib.__index = UILib

local Themes = {
    Dark = {
        Background=Color3.fromRGB(12,12,18),Surface=Color3.fromRGB(20,20,28),
        SurfaceAlt=Color3.fromRGB(28,28,38),Element=Color3.fromRGB(35,35,48),
        ElementHover=Color3.fromRGB(42,42,58),Accent=Color3.fromRGB(88,101,242),
        AccentDark=Color3.fromRGB(65,78,200),AccentLight=Color3.fromRGB(120,135,255),
        Success=Color3.fromRGB(67,181,129),Warning=Color3.fromRGB(250,166,26),
        Error=Color3.fromRGB(237,66,69),Info=Color3.fromRGB(32,154,243),
        TextPrimary=Color3.fromRGB(235,235,245),TextSecondary=Color3.fromRGB(160,160,180),
        TextMuted=Color3.fromRGB(100,100,120),Border=Color3.fromRGB(45,45,60),
        Divider=Color3.fromRGB(38,38,52),Ripple=Color3.fromRGB(255,255,255),
        ScrollBar=Color3.fromRGB(60,80,180),
        GradientStart=Color3.fromRGB(88,101,242),GradientMid=Color3.fromRGB(155,89,255),
        GradientEnd=Color3.fromRGB(255,100,180),
    },
    Midnight = {
        Background=Color3.fromRGB(8,8,16),Surface=Color3.fromRGB(14,14,26),
        SurfaceAlt=Color3.fromRGB(22,22,36),Element=Color3.fromRGB(28,28,44),
        ElementHover=Color3.fromRGB(36,36,54),Accent=Color3.fromRGB(120,80,255),
        AccentDark=Color3.fromRGB(90,60,200),AccentLight=Color3.fromRGB(150,120,255),
        Success=Color3.fromRGB(80,200,140),Warning=Color3.fromRGB(255,180,40),
        Error=Color3.fromRGB(255,80,80),Info=Color3.fromRGB(60,170,255),
        TextPrimary=Color3.fromRGB(230,230,250),TextSecondary=Color3.fromRGB(150,150,180),
        TextMuted=Color3.fromRGB(90,90,120),Border=Color3.fromRGB(40,40,60),
        Divider=Color3.fromRGB(32,32,48),Ripple=Color3.fromRGB(200,180,255),
        ScrollBar=Color3.fromRGB(120,80,255),
        GradientStart=Color3.fromRGB(120,80,255),GradientMid=Color3.fromRGB(200,80,255),
        GradientEnd=Color3.fromRGB(255,80,200),
    },
    Ocean = {
        Background=Color3.fromRGB(8,14,22),Surface=Color3.fromRGB(12,20,32),
        SurfaceAlt=Color3.fromRGB(18,28,42),Element=Color3.fromRGB(24,36,52),
        ElementHover=Color3.fromRGB(30,44,62),Accent=Color3.fromRGB(0,180,216),
        AccentDark=Color3.fromRGB(0,140,180),AccentLight=Color3.fromRGB(60,210,240),
        Success=Color3.fromRGB(0,210,150),Warning=Color3.fromRGB(255,190,50),
        Error=Color3.fromRGB(255,90,90),Info=Color3.fromRGB(0,150,255),
        TextPrimary=Color3.fromRGB(220,240,250),TextSecondary=Color3.fromRGB(140,170,190),
        TextMuted=Color3.fromRGB(80,110,130),Border=Color3.fromRGB(30,50,70),
        Divider=Color3.fromRGB(24,40,56),Ripple=Color3.fromRGB(0,200,255),
        ScrollBar=Color3.fromRGB(0,180,216),
        GradientStart=Color3.fromRGB(0,180,216),GradientMid=Color3.fromRGB(0,120,200),
        GradientEnd=Color3.fromRGB(100,200,255),
    },
    Rose = {
        Background=Color3.fromRGB(18,10,14),Surface=Color3.fromRGB(26,16,22),
        SurfaceAlt=Color3.fromRGB(36,24,32),Element=Color3.fromRGB(46,32,40),
        ElementHover=Color3.fromRGB(56,40,50),Accent=Color3.fromRGB(230,70,120),
        AccentDark=Color3.fromRGB(190,50,100),AccentLight=Color3.fromRGB(255,110,160),
        Success=Color3.fromRGB(80,200,130),Warning=Color3.fromRGB(255,180,40),
        Error=Color3.fromRGB(255,70,70),Info=Color3.fromRGB(100,160,255),
        TextPrimary=Color3.fromRGB(250,230,240),TextSecondary=Color3.fromRGB(180,150,165),
        TextMuted=Color3.fromRGB(120,90,105),Border=Color3.fromRGB(60,40,50),
        Divider=Color3.fromRGB(48,32,42),Ripple=Color3.fromRGB(255,150,200),
        ScrollBar=Color3.fromRGB(230,70,120),
        GradientStart=Color3.fromRGB(230,70,120),GradientMid=Color3.fromRGB(255,100,80),
        GradientEnd=Color3.fromRGB(255,160,100),
    },
    Monochrome = {
        Background=Color3.fromRGB(14,14,14),Surface=Color3.fromRGB(22,22,22),
        SurfaceAlt=Color3.fromRGB(30,30,30),Element=Color3.fromRGB(38,38,38),
        ElementHover=Color3.fromRGB(48,48,48),
        Accent=Color3.fromRGB(75, 85, 95),         
        AccentDark=Color3.fromRGB(55, 65, 75),
        AccentLight=Color3.fromRGB(105, 115, 125),
        Success=Color3.fromRGB(67,181,129),Warning=Color3.fromRGB(250,166,26),
        Error=Color3.fromRGB(237,66,69),
        Info=Color3.fromRGB(200,200,200),
        TextPrimary=Color3.fromRGB(245,245,245),TextSecondary=Color3.fromRGB(200,200,200),
        TextMuted=Color3.fromRGB(120,120,120),Border=Color3.fromRGB(60,60,60),
        Divider=Color3.fromRGB(45,45,45),Ripple=Color3.fromRGB(255,255,255),
        ScrollBar=Color3.fromRGB(105, 115, 125),     
        GradientStart=Color3.fromRGB(75, 85, 95),GradientMid=Color3.fromRGB(90, 100, 110),
        GradientEnd=Color3.fromRGB(115, 125, 135),
    },
}

local function toHex(c) return string.format("%02X%02X%02X",math.floor(c.R*255),math.floor(c.G*255),math.floor(c.B*255)) end
local function hsvToRgb(h,s,v)
    local r,g,b local i=math.floor(h*6) local f=h*6-i
    local p=v*(1-s) local q=v*(1-f*s) local t=v*(1-(1-f)*s)
    i=i%6
    if i==0 then r,g,b=v,t,p elseif i==1 then r,g,b=q,v,p
    elseif i==2 then r,g,b=p,v,t elseif i==3 then r,g,b=p,q,v
    elseif i==4 then r,g,b=t,p,v elseif i==5 then r,g,b=v,p,q end
    return Color3.new(r,g,b)
end
local function rgbToHsv(c)
    local r,g,b=c.R,c.G,c.B local max,min=math.max(r,g,b),math.min(r,g,b)
    local h,s,v=0,0,max local d=max-min s=max==0 and 0 or d/max
    if max~=min then
        if max==r then h=(g-b)/d+(g<b and 6 or 0) elseif max==g then h=(b-r)/d+2 elseif max==b then h=(r-g)/d+4 end
        h=h/6
    end
    return h,s,v
end
local function tw(obj,time,props,style,dir)
    local t=TweenService:Create(obj,TweenInfo.new(time or 0.25,style or Enum.EasingStyle.Quint,dir or Enum.EasingDirection.Out),props)
    t:Play() return t
end
local function doRipple(parent,pos,color)
    local r=Instance.new("Frame") r.BackgroundColor3=color or Color3.new(1,1,1)
    r.BackgroundTransparency=0.7 r.BorderSizePixel=0 r.AnchorPoint=Vector2.new(0.5,0.5)
    r.Position=UDim2.new(0,pos.X-parent.AbsolutePosition.X,0,pos.Y-parent.AbsolutePosition.Y)
    r.Size=UDim2.new(0,0,0,0) r.ZIndex=10 r.Parent=parent
    Instance.new("UICorner",r).CornerRadius=UDim.new(1,0)
    local s=math.max(parent.AbsoluteSize.X,parent.AbsoluteSize.Y)*2.5
    tw(r,0.6,{Size=UDim2.new(0,s,0,s),BackgroundTransparency=1},Enum.EasingStyle.Quart)
    task.delay(0.65,function() if r and r.Parent then r:Destroy() end end)
end
local function mPos()
    local ok,p=pcall(function() return UserInputService:GetMouseLocation() end)
    return ok and p or Vector2.new(0,0)
end
local function showLoading(gui,T,title,sub,cb)
    local lf=Instance.new("Frame",gui) lf.Name="Load" lf.BackgroundColor3=Color3.fromRGB(6,6,10)
    lf.Size=UDim2.new(1,0,1,0) lf.ZIndex=200
    local ct=Instance.new("Frame",lf) ct.BackgroundTransparency=1 ct.AnchorPoint=Vector2.new(0.5,0.5)
    ct.Position=UDim2.new(0.5,0,0.5,0) ct.Size=UDim2.new(0,260,0,200) ct.ZIndex=210
    local ring=Instance.new("Frame",ct) ring.BackgroundTransparency=1 ring.AnchorPoint=Vector2.new(0.5,0)
    ring.Position=UDim2.new(0.5,0,0,0) ring.Size=UDim2.new(0,50,0,50) ring.ZIndex=211
    local outerR=Instance.new("Frame",ring) outerR.BackgroundTransparency=1 outerR.Size=UDim2.new(1,0,1,0) outerR.ZIndex=212
    Instance.new("UIStroke",outerR).Color=T.Border Instance.new("UICorner",outerR).CornerRadius=UDim.new(1,0)
    local spinF=Instance.new("Frame",ring) spinF.BackgroundTransparency=1 spinF.Size=UDim2.new(1,0,1,0) spinF.ZIndex=213
    local ss=Instance.new("UIStroke",spinF) ss.Thickness=3 ss.Color=T.Accent
    Instance.new("UICorner",spinF).CornerRadius=UDim.new(1,0)
    local sg=Instance.new("UIGradient",ss)
    sg.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.4,0),
        NumberSequenceKeypoint.new(0.8,1),NumberSequenceKeypoint.new(1,1)}
    task.spawn(function() while spinF and spinF.Parent and lf.Parent do sg.Rotation=(sg.Rotation+4)%360 task.wait(0.016) end end)
    local dot=Instance.new("Frame",ring) dot.BackgroundColor3=T.Accent dot.AnchorPoint=Vector2.new(0.5,0.5)
    dot.Position=UDim2.new(0.5,0,0.5,0) dot.Size=UDim2.new(0,8,0,8) dot.ZIndex=214 dot.BorderSizePixel=0
    Instance.new("UICorner",dot).CornerRadius=UDim.new(1,0)
    local tl=Instance.new("TextLabel",ct) tl.BackgroundTransparency=1 tl.AnchorPoint=Vector2.new(0.5,0)
    tl.Position=UDim2.new(0.5,0,0,62) tl.Size=UDim2.new(1,0,0,26) tl.Font=Enum.Font.GothamBold
    tl.Text=title tl.TextColor3=T.TextPrimary tl.TextSize=18 tl.TextTransparency=1 tl.ZIndex=215
    local sl=Instance.new("TextLabel",ct) sl.BackgroundTransparency=1 sl.AnchorPoint=Vector2.new(0.5,0)
    sl.Position=UDim2.new(0.5,0,0,90) sl.Size=UDim2.new(1,0,0,16) sl.Font=Enum.Font.Gotham
    sl.Text=sub sl.TextColor3=T.TextMuted sl.TextSize=11 sl.TextTransparency=1 sl.ZIndex=215
    local pbg=Instance.new("Frame",ct) pbg.BackgroundColor3=T.Border pbg.BackgroundTransparency=0.5
    pbg.AnchorPoint=Vector2.new(0.5,0) pbg.Position=UDim2.new(0.5,0,0,118) pbg.Size=UDim2.new(0.6,0,0,3)
    pbg.ZIndex=216 pbg.BorderSizePixel=0 Instance.new("UICorner",pbg).CornerRadius=UDim.new(1,0)
    local pf=Instance.new("Frame",pbg) pf.BackgroundColor3=T.Accent pf.BorderSizePixel=0
    pf.Size=UDim2.new(0,0,1,0) pf.ZIndex=217 Instance.new("UICorner",pf).CornerRadius=UDim.new(1,0)
    local pfg=Instance.new("UIGradient",pf) pfg.Color=ColorSequence.new{
        ColorSequenceKeypoint.new(0,T.GradientStart),ColorSequenceKeypoint.new(0.5,T.GradientMid),
        ColorSequenceKeypoint.new(1,T.GradientEnd)}
    local stl=Instance.new("TextLabel",ct) stl.BackgroundTransparency=1 stl.AnchorPoint=Vector2.new(0.5,0)
    stl.Position=UDim2.new(0.5,0,0,130) stl.Size=UDim2.new(1,0,0,14) stl.Font=Enum.Font.Gotham
    stl.Text="Initializing..." stl.TextColor3=T.TextMuted stl.TextSize=9 stl.TextTransparency=1 stl.ZIndex=215
    task.spawn(function()
        task.wait(0.2)
        tw(tl,0.5,{TextTransparency=0}) tw(ct,0.5,{Position=UDim2.new(0.5,0,0.48,0)},Enum.EasingStyle.Back)
        task.wait(0.15) tw(sl,0.4,{TextTransparency=0})
        task.wait(0.1) tw(stl,0.3,{TextTransparency=0}) task.wait(0.2)
        local stages={{0.2,"Loading modules..."},{0.4,"Building interface..."},{0.6,"Loading components..."},{0.8,"Applying theme..."},{1.0,"Ready!"}}
        for _,st in ipairs(stages) do
            if not lf.Parent then return end
            stl.Text=st[2] tw(pf,0.25,{Size=UDim2.new(st[1],0,1,0)},Enum.EasingStyle.Quart)
            task.wait(0.2+math.random()*0.1)
        end
        task.wait(0.3)
        tw(tl,0.25,{TextTransparency=1}) tw(sl,0.2,{TextTransparency=1})
        tw(stl,0.2,{TextTransparency=1}) tw(pbg,0.2,{Size=UDim2.new(0,0,0,3)})
        tw(ring,0.25,{Size=UDim2.new(0,0,0,0)})
        task.wait(0.2) tw(lf,0.35,{BackgroundTransparency=1})
        task.wait(0.4) lf:Destroy() if cb then cb() end
    end)
end

function UILib.new(config)
    local self=setmetatable({},UILib)
    self.Title=config.Title or "Hub"
    self.Subtitle=config.Subtitle or ""
    self.Size=config.Size or UDim2.new(0,560,0,380)
    self.MinSize=UDim2.new(0,220,0,42)
    self.Theme=Themes[config.Theme or "Dark"] or Themes.Dark
    self.Tabs={} self.TabButtons={} self.TabPages={}
    self.ActiveTab=nil self.UpdateCallbacks={} self.Keybinds={}
    self._minimized=false self._closed=false
    self._headerH=42
    local T=self.Theme

    for _,n in ipairs({"UILib_Main","UILib_Toggle","UILib_Toast"}) do
        local old=game.CoreGui:FindFirstChild(n) if old then old:Destroy() end
    end

    self.ScreenGui=Instance.new("ScreenGui") self.ScreenGui.Name="UILib_Main"
    self.ScreenGui.Parent=game.CoreGui self.ScreenGui.ResetOnSpawn=false
    self.ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling self.ScreenGui.DisplayOrder=100

    self.ToastGui=Instance.new("ScreenGui") self.ToastGui.Name="UILib_Toast"
    self.ToastGui.Parent=game.CoreGui self.ToastGui.ResetOnSpawn=false self.ToastGui.DisplayOrder=200
    self.ToastContainer=Instance.new("Frame",self.ToastGui)
    self.ToastContainer.BackgroundTransparency=1 self.ToastContainer.AnchorPoint=Vector2.new(1,1)
    self.ToastContainer.Position=UDim2.new(1,-15,1,-15) self.ToastContainer.Size=UDim2.new(0,300,1,-30)
    local tcl=Instance.new("UIListLayout",self.ToastContainer) tcl.Padding=UDim.new(0,6)
    tcl.SortOrder=Enum.SortOrder.LayoutOrder tcl.VerticalAlignment=Enum.VerticalAlignment.Bottom
    tcl.HorizontalAlignment=Enum.HorizontalAlignment.Right

    self.Shadow=Instance.new("ImageLabel",self.ScreenGui) self.Shadow.Name="Shadow"
    self.Shadow.AnchorPoint=Vector2.new(0.5,0.5) self.Shadow.BackgroundTransparency=1
    self.Shadow.Position=UDim2.new(0.5,0,0.5,0) self.Shadow.Size=self.Size+UDim2.new(0,60,0,60)
    self.Shadow.Image="rbxassetid://5554236805" self.Shadow.ImageColor3=Color3.new(0,0,0)
    self.Shadow.ImageTransparency=1 self.Shadow.ScaleType=Enum.ScaleType.Slice
    self.Shadow.SliceCenter=Rect.new(23,23,277,277) self.Shadow.ZIndex=1 self.Shadow.Visible=false

    self.Main=Instance.new("Frame",self.ScreenGui) self.Main.Name="Main"
    self.Main.AnchorPoint=Vector2.new(0.5,0.5) self.Main.BackgroundColor3=T.Background
    self.Main.BorderSizePixel=0 self.Main.Position=UDim2.new(0.5,0,0.5,0)
    self.Main.Size=self.Size self.Main.ClipsDescendants=true self.Main.ZIndex=2 self.Main.Visible=false
    Instance.new("UICorner",self.Main).CornerRadius=UDim.new(0,12)
    local ms=Instance.new("UIStroke",self.Main) ms.Color=T.Border ms.Thickness=1 ms.Transparency=0.3

    self:_setupDrag()
    self:_createAccentBar()
    self:_createTitleBar()
    self:_createSidebar()

    self.ContentArea=Instance.new("Frame",self.Main) self.ContentArea.Name="Content"
    self.ContentArea.BackgroundColor3=T.Surface self.ContentArea.BorderSizePixel=0
    self.ContentArea.Position=UDim2.new(0,150,0,self._headerH+2)
    self.ContentArea.Size=UDim2.new(1,-150,1,-(self._headerH+2))
    self.ContentArea.ZIndex=2 self.ContentArea.ClipsDescendants=true

    self:_setupKeybindListener()
    self:_startUpdateLoop()

    if config.LoadingScreen~=false then
        showLoading(self.ScreenGui,T,config.LoadingTitle or self.Title,config.LoadingSubtitle or "Loading...",function()
            self:_animateOpen()
        end)
    else task.defer(function() self:_animateOpen() end) end

    return self
end

function UILib:_setupDrag()
    local dragging,dragInput,dragStart,startPos
    local dragZone=Instance.new("Frame",self.Main)
    dragZone.Name="DragZone" dragZone.BackgroundTransparency=1
    dragZone.Position=UDim2.new(0,0,0,0) dragZone.Size=UDim2.new(1,0,0,self._headerH+2) dragZone.ZIndex=45
    dragZone.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
            dragging=true dragStart=input.Position startPos=self.Main.Position
            input.Changed:Connect(function() if input.UserInputState==Enum.UserInputState.End then dragging=false end end)
        end
    end)
    dragZone.InputChanged:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch then dragInput=input end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input==dragInput and dragging then
            local d=input.Position-dragStart
            local np=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
            tw(self.Main,0.05,{Position=np},Enum.EasingStyle.Linear)
            tw(self.Shadow,0.05,{Position=np},Enum.EasingStyle.Linear)
        end
    end)
end

function UILib:_animateOpen()
    self._closed=false self.Main.Visible=true self.Shadow.Visible=true self.ScreenGui.Enabled=true
    self.Main.Size=UDim2.new(0,self.Size.X.Offset*0.85,0,self.Size.Y.Offset*0.85)
    self.Main.BackgroundTransparency=0.3 self.Shadow.ImageTransparency=1
    tw(self.Main,0.45,{Size=self.Size,BackgroundTransparency=0},Enum.EasingStyle.Back)
    tw(self.Shadow,0.45,{ImageTransparency=0.4,Size=self.Size+UDim2.new(0,60,0,60)})
end

function UILib:_animateClose()
    self._closed=true
    tw(self.Main,0.25,{Size=UDim2.new(0,self.Size.X.Offset*0.9,0,self.Size.Y.Offset*0.9),BackgroundTransparency=0.5},Enum.EasingStyle.Quart,Enum.EasingDirection.In)
    tw(self.Shadow,0.25,{ImageTransparency=1})
    task.delay(0.25,function()
        if self._closed then self.Main.Visible=false self.Shadow.Visible=false self.ScreenGui.Enabled=false self.Main.BackgroundTransparency=0 end
    end)
end

function UILib:_toggleMinimize()
    self._minimized=not self._minimized
    if self._minimized then
        if self.ContentArea then self.ContentArea.Visible=false end
        if self.Sidebar then self.Sidebar.Visible=false end
        tw(self.Main,0.35,{Size=self.MinSize},Enum.EasingStyle.Back,Enum.EasingDirection.In)
        tw(self.Shadow,0.35,{Size=self.MinSize+UDim2.new(0,60,0,60)})
    else
        tw(self.Main,0.4,{Size=self.Size},Enum.EasingStyle.Back)
        tw(self.Shadow,0.4,{Size=self.Size+UDim2.new(0,60,0,60)})
        task.delay(0.15,function()
            if not self._minimized then
                if self.ContentArea then self.ContentArea.Visible=true end
                if self.Sidebar then self.Sidebar.Visible=true end
            end
        end)
    end
end

function UILib:_createAccentBar()
    local T=self.Theme
    local bar=Instance.new("Frame",self.Main) bar.BackgroundColor3=Color3.new(1,1,1)
    bar.BorderSizePixel=0 bar.Size=UDim2.new(1,0,0,2) bar.ZIndex=10
    local g=Instance.new("UIGradient",bar)
    g.Color=ColorSequence.new{
        ColorSequenceKeypoint.new(0,T.GradientStart),ColorSequenceKeypoint.new(0.33,T.GradientMid),
        ColorSequenceKeypoint.new(0.66,T.GradientEnd),ColorSequenceKeypoint.new(1,T.GradientStart)}
    task.spawn(function()
        while self.ScreenGui and self.ScreenGui.Parent do g.Rotation=(g.Rotation+1)%360 task.wait(0.025) end
    end)
end

function UILib:_createTitleBar()
    local T=self.Theme local hh=self._headerH
    self.TitleBar=Instance.new("Frame",self.Main) self.TitleBar.BackgroundColor3=T.Background
    self.TitleBar.BorderSizePixel=0 self.TitleBar.Position=UDim2.new(0,0,0,2)
    self.TitleBar.Size=UDim2.new(1,0,0,hh) self.TitleBar.ZIndex=3

    local dotSize=12
    local dot=Instance.new("Frame",self.TitleBar) dot.BackgroundColor3=T.Accent dot.BorderSizePixel=0
    dot.Position=UDim2.new(0,10,0.5,-dotSize/2) dot.Size=UDim2.new(0,dotSize,0,dotSize) dot.ZIndex=5
    Instance.new("UICorner",dot).CornerRadius=UDim.new(1,0)
    task.spawn(function()
        while self.ScreenGui and self.ScreenGui.Parent do
            tw(dot,0.8,{Size=UDim2.new(0,dotSize+3,0,dotSize+3),BackgroundTransparency=0.3,Position=UDim2.new(0,9,0.5,-(dotSize+3)/2)})
            task.wait(0.9)
            if not self.ScreenGui or not self.ScreenGui.Parent then return end
            tw(dot,0.8,{Size=UDim2.new(0,dotSize,0,dotSize),BackgroundTransparency=0,Position=UDim2.new(0,10,0.5,-dotSize/2)})
            task.wait(0.9)
        end
    end)

    local titleX=28 local titleW=110
    if self.Subtitle~="" then
        local tl=Instance.new("TextLabel",self.TitleBar) tl.BackgroundTransparency=1
        tl.Position=UDim2.new(0,titleX,0,5) tl.Size=UDim2.new(0,titleW,0,16)
        tl.Font=Enum.Font.GothamBold tl.Text=self.Title tl.TextColor3=T.TextPrimary tl.TextSize=12 tl.TextXAlignment=Enum.TextXAlignment.Left tl.ZIndex=5 tl.TextTruncate=Enum.TextTruncate.AtEnd
        local sl=Instance.new("TextLabel",self.TitleBar) sl.BackgroundTransparency=1
        sl.Position=UDim2.new(0,titleX,0,20) sl.Size=UDim2.new(0,titleW,0,14)
        sl.Font=Enum.Font.Gotham sl.Text=self.Subtitle sl.TextColor3=T.TextMuted sl.TextSize=9 sl.TextXAlignment=Enum.TextXAlignment.Left sl.ZIndex=5 sl.TextTruncate=Enum.TextTruncate.AtEnd
    else
        local tl=Instance.new("TextLabel",self.TitleBar) tl.BackgroundTransparency=1
        tl.Position=UDim2.new(0,titleX,0,0) tl.Size=UDim2.new(0,titleW,1,0)
        tl.Font=Enum.Font.GothamBold tl.Text=self.Title tl.TextColor3=T.TextPrimary tl.TextSize=12 tl.TextXAlignment=Enum.TextXAlignment.Left tl.ZIndex=5 tl.TextTruncate=Enum.TextTruncate.AtEnd
    end

    local btnSize=26 local btnGap=5 local rightPad=8
    local cb=Instance.new("TextButton",self.TitleBar) cb.BackgroundColor3=T.Error cb.BackgroundTransparency=1
    cb.BorderSizePixel=0 cb.AnchorPoint=Vector2.new(1,0.5) cb.Position=UDim2.new(1,-rightPad,0.5,0)
    cb.Size=UDim2.new(0,btnSize,0,btnSize) cb.Text="" cb.AutoButtonColor=false cb.ZIndex=50 cb.ClipsDescendants=true
    Instance.new("UICorner",cb).CornerRadius=UDim.new(0,6)
    local x1=Instance.new("Frame",cb) x1.BackgroundColor3=T.Error x1.BorderSizePixel=0 x1.AnchorPoint=Vector2.new(0.5,0.5) x1.Position=UDim2.new(0.5,0,0.5,0) x1.Size=UDim2.new(0,12,0,2) x1.Rotation=45 x1.ZIndex=51
    local x2=Instance.new("Frame",cb) x2.BackgroundColor3=T.Error x2.BorderSizePixel=0 x2.AnchorPoint=Vector2.new(0.5,0.5) x2.Position=UDim2.new(0.5,0,0.5,0) x2.Size=UDim2.new(0,12,0,2) x2.Rotation=-45 x2.ZIndex=51
    cb.MouseEnter:Connect(function() tw(cb,0.15,{BackgroundTransparency=0.15}) tw(x1,0.15,{BackgroundColor3=Color3.new(1,1,1)}) tw(x2,0.15,{BackgroundColor3=Color3.new(1,1,1)}) end)
    cb.MouseLeave:Connect(function() tw(cb,0.15,{BackgroundTransparency=1}) tw(x1,0.15,{BackgroundColor3=T.Error}) tw(x2,0.15,{BackgroundColor3=T.Error}) end)
    cb.MouseButton1Click:Connect(function() doRipple(cb,mPos(),T.Ripple) self:_animateClose() end)

    local mb=Instance.new("TextButton",self.TitleBar) mb.BackgroundColor3=T.Warning mb.BackgroundTransparency=1
    mb.BorderSizePixel=0 mb.AnchorPoint=Vector2.new(1,0.5) mb.Position=UDim2.new(1,-(rightPad+btnSize+btnGap),0.5,0) mb.Size=UDim2.new(0,btnSize,0,btnSize)
    mb.Text="" mb.AutoButtonColor=false mb.ZIndex=50 mb.ClipsDescendants=true
    Instance.new("UICorner",mb).CornerRadius=UDim.new(0,6)
    local ml=Instance.new("Frame",mb) ml.BackgroundColor3=T.Warning ml.BorderSizePixel=0 ml.AnchorPoint=Vector2.new(0.5,0.5) ml.Position=UDim2.new(0.5,0,0.5,0) ml.Size=UDim2.new(0,12,0,2) ml.ZIndex=51
    mb.MouseEnter:Connect(function() tw(mb,0.15,{BackgroundTransparency=0.15}) tw(ml,0.15,{BackgroundColor3=Color3.new(1,1,1)}) end)
    mb.MouseLeave:Connect(function() tw(mb,0.15,{BackgroundTransparency=1}) tw(ml,0.15,{BackgroundColor3=T.Warning}) end)
    mb.MouseButton1Click:Connect(function() doRipple(mb,mPos(),T.Ripple) self:_toggleMinimize() end)

    local statusStartX = titleX + titleW + 8
    local buttonsTotalW = rightPad + btnSize + btnGap + btnSize + 8
    local sf=Instance.new("Frame",self.TitleBar) sf.BackgroundTransparency=1 sf.Position=UDim2.new(0,statusStartX,0,0) sf.Size=UDim2.new(1,-(statusStartX+buttonsTotalW),1,0) sf.ZIndex=4 sf.ClipsDescendants=true
    self.StatusLabels={}
    for i=1,3 do
        local l=Instance.new("TextLabel",sf) l.BackgroundTransparency=1 l.Position=UDim2.new(0,0,0,3+(i-1)*12) l.Size=UDim2.new(1,0,0,12) l.Font=Enum.Font.Gotham l.TextSize=9 l.TextXAlignment=Enum.TextXAlignment.Left l.TextColor3=T.TextMuted l.Text="" l.ZIndex=5 l.TextTruncate=Enum.TextTruncate.AtEnd
        self.StatusLabels[i]=l
    end
    local dv=Instance.new("Frame",self.TitleBar) dv.BackgroundColor3=T.Divider dv.BorderSizePixel=0 dv.Position=UDim2.new(0,0,1,-1) dv.Size=UDim2.new(1,0,0,1) dv.ZIndex=4
end

function UILib:SetStatus(line,text,color)
    if self.StatusLabels and self.StatusLabels[line] then self.StatusLabels[line].Text=text if color then self.StatusLabels[line].TextColor3=color end end
end

function UILib:_createSidebar()
    local T=self.Theme
    self.Sidebar=Instance.new("Frame",self.Main) self.Sidebar.BackgroundColor3=T.Background self.Sidebar.BorderSizePixel=0 self.Sidebar.Position=UDim2.new(0,0,0,self._headerH+2) self.Sidebar.Size=UDim2.new(0,150,1,-(self._headerH+2)) self.Sidebar.ZIndex=3
    self.SidebarScroll=Instance.new("ScrollingFrame",self.Sidebar) self.SidebarScroll.BackgroundTransparency=1 self.SidebarScroll.Size=UDim2.new(1,0,1,-6) self.SidebarScroll.Position=UDim2.new(0,0,0,3) self.SidebarScroll.ScrollBarThickness=0 self.SidebarScroll.CanvasSize=UDim2.new(0,0,0,0) self.SidebarScroll.ZIndex=4 self.SidebarScroll.BorderSizePixel=0
    pcall(function() self.SidebarScroll.AutomaticCanvasSize=Enum.AutomaticSize.Y end)
    local sl=Instance.new("UIListLayout",self.SidebarScroll) sl.Padding=UDim.new(0,3) sl.SortOrder=Enum.SortOrder.LayoutOrder
    local sp=Instance.new("UIPadding",self.SidebarScroll) sp.PaddingLeft=UDim.new(0,8) sp.PaddingRight=UDim.new(0,8) sp.PaddingTop=UDim.new(0,4)
    local line=Instance.new("Frame",self.Sidebar) line.BackgroundColor3=T.Divider line.BorderSizePixel=0 line.Position=UDim2.new(1,-1,0,0) line.Size=UDim2.new(0,1,1,0) line.ZIndex=4
    self._tabIndex=0
end

function UILib:_setupKeybindListener()
    UserInputService.InputBegan:Connect(function(input,gpe)
        if gpe then return end
        for _,kb in ipairs(self.Keybinds) do if input.KeyCode==kb.Key then pcall(kb.Callback,input.KeyCode) end end
    end)
end
function UILib:OnUpdate(cb) table.insert(self.UpdateCallbacks,cb) end
function UILib:_startUpdateLoop()
    task.spawn(function() while self.ScreenGui and self.ScreenGui.Parent do for _,cb in ipairs(self.UpdateCallbacks) do pcall(cb) end task.wait(0.5) end end)
end

function UILib:Toast(config)
    local T=self.Theme config=config or {}
    local title=config.Title or "Notification" local message=config.Message or config.Text or ""
    local duration=config.Duration or 3 local nType=config.Type or "Info"
    local typeColors={Info=T.Info,Success=T.Success,Warning=T.Warning,Error=T.Error}
    local typeIcons={Info="ℹ️",Success="✅",Warning="⚠️",Error="❌"}
    local color=typeColors[nType] or T.Info local icon=typeIcons[nType] or "ℹ️"
    local toast=Instance.new("Frame",self.ToastContainer) toast.BackgroundColor3=T.SurfaceAlt toast.BorderSizePixel=0 toast.Size=UDim2.new(1,0,0,62) toast.ClipsDescendants=true toast.LayoutOrder=-math.floor(tick()*100) Instance.new("UICorner",toast).CornerRadius=UDim.new(0,8)
    local ts=Instance.new("UIStroke",toast) ts.Color=T.Border ts.Thickness=1 ts.Transparency=0.5
    Instance.new("Frame",toast).BackgroundColor3=color local al=toast:GetChildren()[#toast:GetChildren()] al.BorderSizePixel=0 al.Size=UDim2.new(0,3,1,0)
    local il=Instance.new("TextLabel",toast) il.BackgroundTransparency=1 il.Position=UDim2.new(0,12,0,10) il.Size=UDim2.new(0,20,0,20) il.Text=icon il.TextSize=14 il.Font=Enum.Font.GothamBold
    local ttl=Instance.new("TextLabel",toast) ttl.BackgroundTransparency=1 ttl.Position=UDim2.new(0,38,0,8) ttl.Size=UDim2.new(1,-50,0,16) ttl.Font=Enum.Font.GothamBold ttl.Text=title ttl.TextColor3=T.TextPrimary ttl.TextSize=11 ttl.TextXAlignment=Enum.TextXAlignment.Left
    local tml=Instance.new("TextLabel",toast) tml.BackgroundTransparency=1 tml.Position=UDim2.new(0,38,0,24) tml.Size=UDim2.new(1,-50,0,28) tml.Font=Enum.Font.Gotham tml.Text=message tml.TextColor3=T.TextSecondary tml.TextSize=10 tml.TextXAlignment=Enum.TextXAlignment.Left tml.TextWrapped=true tml.TextYAlignment=Enum.TextYAlignment.Top
    local pb=Instance.new("Frame",toast) pb.BackgroundColor3=T.Element pb.BorderSizePixel=0 pb.Position=UDim2.new(0,3,1,-2) pb.Size=UDim2.new(1,-3,0,2)
    local ppf=Instance.new("Frame",pb) ppf.BackgroundColor3=color ppf.BorderSizePixel=0 ppf.Size=UDim2.new(1,0,1,0) Instance.new("UICorner",ppf).CornerRadius=UDim.new(1,0)
    toast.Position=UDim2.new(1,20,0,0) tw(toast,0.35,{Position=UDim2.new(0,0,0,0)},Enum.EasingStyle.Back) tw(ppf,duration,{Size=UDim2.new(0,0,1,0)},Enum.EasingStyle.Linear)
    task.delay(duration,function() if toast and toast.Parent then tw(toast,0.25,{Position=UDim2.new(1,20,0,0),BackgroundTransparency=1}) task.delay(0.3,function() if toast and toast.Parent then toast:Destroy() end end) end end)
end
function UILib:Notify(msg) self:Toast({Title="Notice",Message=msg,Type="Info"}) end

function UILib:Dialog(config)
    if self._dialogOpen then return end self._dialogOpen=true local T=self.Theme
    local ov=Instance.new("Frame",self.Main) ov.BackgroundColor3=Color3.new(0,0,0) ov.BackgroundTransparency=1 ov.Size=UDim2.new(1,0,1,0) ov.ZIndex=80 tw(ov,0.25,{BackgroundTransparency=0.5})
    local df=Instance.new("Frame",ov) df.AnchorPoint=Vector2.new(0.5,0.5) df.BackgroundColor3=T.SurfaceAlt df.BorderSizePixel=0 df.Position=UDim2.new(0.5,0,0.5,0) df.Size=UDim2.new(0,300,0,170) df.ZIndex=81 df.ClipsDescendants=true Instance.new("UICorner",df).CornerRadius=UDim.new(0,12) Instance.new("UIStroke",df).Color=T.Border
    local acl=Instance.new("Frame",df) acl.BackgroundColor3=T.Accent acl.BorderSizePixel=0 acl.Size=UDim2.new(1,0,0,2) acl.ZIndex=82
    local dt=Instance.new("TextLabel",df) dt.BackgroundTransparency=1 dt.Position=UDim2.new(0,18,0,14) dt.Size=UDim2.new(1,-36,0,22) dt.Font=Enum.Font.GothamBold dt.Text=config.Title or "Confirm" dt.TextColor3=T.TextPrimary dt.TextSize=15 dt.TextXAlignment=Enum.TextXAlignment.Left dt.ZIndex=82
    local dm=Instance.new("TextLabel",df) dm.BackgroundTransparency=1 dm.Position=UDim2.new(0,18,0,40) dm.Size=UDim2.new(1,-36,0,60) dm.Font=Enum.Font.Gotham dm.Text=config.Message or "Are you sure?" dm.TextColor3=T.TextSecondary dm.TextSize=12 dm.TextWrapped=true dm.TextXAlignment=Enum.TextXAlignment.Left dm.TextYAlignment=Enum.TextYAlignment.Top dm.ZIndex=82
    local function closeD(confirmed) self._dialogOpen=false tw(ov,0.2,{BackgroundTransparency=1}) tw(df,0.2,{BackgroundTransparency=1}) task.delay(0.25,function() if ov and ov.Parent then ov:Destroy() end end) if confirmed then pcall(config.OnConfirm or function()end) else pcall(config.OnCancel or function()end) end end
    local canB=Instance.new("TextButton",df) canB.BackgroundColor3=T.Element canB.BorderSizePixel=0 canB.Position=UDim2.new(0,18,1,-46) canB.Size=UDim2.new(0.5,-22,0,34) canB.Font=Enum.Font.GothamSemibold canB.Text=config.CancelText or "Cancel" canB.TextColor3=T.TextSecondary canB.TextSize=12 canB.AutoButtonColor=false canB.ZIndex=82 Instance.new("UICorner",canB).CornerRadius=UDim.new(0,6)
    canB.MouseEnter:Connect(function() tw(canB,0.12,{BackgroundColor3=T.ElementHover}) end) canB.MouseLeave:Connect(function() tw(canB,0.12,{BackgroundColor3=T.Element}) end) canB.MouseButton1Click:Connect(function() closeD(false) end)
    local conB=Instance.new("TextButton",df) conB.BackgroundColor3=T.Accent conB.BorderSizePixel=0 conB.Position=UDim2.new(0.5,4,1,-46) conB.Size=UDim2.new(0.5,-22,0,34) conB.Font=Enum.Font.GothamBold conB.Text=config.ConfirmText or "Confirm" conB.TextColor3=Color3.new(1,1,1) conB.TextSize=12 conB.AutoButtonColor=false conB.ZIndex=82 Instance.new("UICorner",conB).CornerRadius=UDim.new(0,6)
    conB.MouseEnter:Connect(function() tw(conB,0.12,{BackgroundColor3=T.AccentDark}) end) conB.MouseLeave:Connect(function() tw(conB,0.12,{BackgroundColor3=T.Accent}) end) conB.MouseButton1Click:Connect(function() closeD(true) end)
    df.Size=UDim2.new(0,280,0,150) df.BackgroundTransparency=0.5 tw(df,0.25,{Size=UDim2.new(0,300,0,170),BackgroundTransparency=0},Enum.EasingStyle.Back)
end

function UILib:CreateToggleButton(config)
    config=config or {} local T=self.Theme local old=game.CoreGui:FindFirstChild("UILib_Toggle") if old then old:Destroy() end
    local tg=Instance.new("ScreenGui") tg.Name="UILib_Toggle" tg.Parent=game.CoreGui tg.ResetOnSpawn=false tg.DisplayOrder=150
    local tb=Instance.new("TextButton",tg) tb.AnchorPoint=Vector2.new(0.5,0.5) tb.BackgroundColor3=T.Accent tb.BorderSizePixel=0 tb.Position=UDim2.new(0,35,0.5,0) tb.Size=UDim2.new(0,44,0,44) tb.Font=Enum.Font.GothamBold tb.Text=config.Icon or "⚡" tb.TextSize=18 tb.Active=true tb.Draggable=true tb.AutoButtonColor=false tb.ClipsDescendants=true Instance.new("UICorner",tb).CornerRadius=UDim.new(1,0)
    local bs=Instance.new("UIStroke",tb) bs.Color=T.AccentLight bs.Thickness=2 bs.Transparency=0.5
    tb.MouseEnter:Connect(function() tw(tb,0.15,{Size=UDim2.new(0,50,0,50)}) tw(bs,0.15,{Transparency=0}) end) tb.MouseLeave:Connect(function() tw(tb,0.15,{Size=UDim2.new(0,44,0,44)}) tw(bs,0.15,{Transparency=0.5}) end)
    tb.MouseButton1Click:Connect(function() doRipple(tb,mPos(),T.Ripple) if self._closed or not self.ScreenGui.Enabled then self.ScreenGui.Enabled=true self:_animateOpen() else self:_animateClose() end end)
    if config.Key then table.insert(self.Keybinds,{Key=config.Key,Callback=function() if self._closed or not self.ScreenGui.Enabled then self.ScreenGui.Enabled=true self:_animateOpen() else self:_animateClose() end end}) end
    return tg
end

function UILib:Destroy()
    if self.ScreenGui then self.ScreenGui:Destroy() end if self.ToastGui then self.ToastGui:Destroy() end
    local t=game.CoreGui:FindFirstChild("UILib_Toggle") if t then t:Destroy() end
end

UILib._TabMethods={}
function UILib:AddTab(config)
    local T=self.Theme local tabName=config.Name or "Tab" local tabIcon=config.Icon or "📁" self._tabIndex=self._tabIndex+1 local index=self._tabIndex
    local btn=Instance.new("TextButton",self.SidebarScroll) btn.BackgroundColor3=T.Background btn.BackgroundTransparency=1 btn.BorderSizePixel=0 btn.Size=UDim2.new(1,0,0,34) btn.Text="" btn.AutoButtonColor=false btn.LayoutOrder=index btn.ZIndex=5 btn.ClipsDescendants=true Instance.new("UICorner",btn).CornerRadius=UDim.new(0,8)
    local ind=Instance.new("Frame",btn) ind.Name="Indicator" ind.BackgroundColor3=T.Accent ind.BackgroundTransparency=1 ind.BorderSizePixel=0 ind.Position=UDim2.new(0,0,0.15,0) ind.Size=UDim2.new(0,3,0.7,0) ind.ZIndex=6 Instance.new("UICorner",ind).CornerRadius=UDim.new(0,2)
    local ico=Instance.new("TextLabel",btn) ico.Name="Icon" ico.BackgroundTransparency=1 ico.Position=UDim2.new(0,10,0,0) ico.Size=UDim2.new(0,20,1,0) ico.Font=Enum.Font.GothamBold ico.Text=tabIcon ico.TextColor3=T.TextMuted ico.TextSize=13 ico.ZIndex=6
    local lbl=Instance.new("TextLabel",btn) lbl.Name="Label" lbl.BackgroundTransparency=1 lbl.Position=UDim2.new(0,34,0,0) lbl.Size=UDim2.new(1,-34,1,0) lbl.Font=Enum.Font.GothamSemibold lbl.Text=tabName lbl.TextColor3=T.TextMuted lbl.TextSize=11 lbl.TextXAlignment=Enum.TextXAlignment.Left lbl.ZIndex=6 lbl.TextTruncate=Enum.TextTruncate.AtEnd
    local badge=Instance.new("TextLabel",btn) badge.Name="Badge" badge.BackgroundColor3=T.Error badge.BackgroundTransparency=1 badge.Position=UDim2.new(1,-22,0.5,-8) badge.Size=UDim2.new(0,16,0,16) badge.Font=Enum.Font.GothamBold badge.Text="" badge.TextColor3=Color3.new(1,1,1) badge.TextSize=9 badge.ZIndex=7 badge.Visible=false Instance.new("UICorner",badge).CornerRadius=UDim.new(1,0)
    btn.MouseEnter:Connect(function() if self.ActiveTab~=tabName then tw(btn,0.12,{BackgroundTransparency=0.5}) tw(lbl,0.12,{TextColor3=T.TextSecondary}) end end)
    btn.MouseLeave:Connect(function() if self.ActiveTab~=tabName then tw(btn,0.12,{BackgroundTransparency=1}) tw(lbl,0.12,{TextColor3=T.TextMuted}) end end)
    local page=Instance.new("ScrollingFrame",self.ContentArea) page.BackgroundTransparency=1 page.BorderSizePixel=0 page.Size=UDim2.new(1,0,1,0) page.ScrollBarThickness=3 page.ScrollBarImageColor3=T.ScrollBar page.ScrollBarImageTransparency=0.3 page.CanvasSize=UDim2.new(0,0,0,0) page.Visible=false page.ZIndex=3
    pcall(function() page.AutomaticCanvasSize=Enum.AutomaticSize.Y end)
    local pp=Instance.new("UIPadding",page) pp.PaddingLeft=UDim.new(0,12) pp.PaddingRight=UDim.new(0,12) pp.PaddingTop=UDim.new(0,10) pp.PaddingBottom=UDim.new(0,10)
    local pl=Instance.new("UIListLayout",page) pl.Padding=UDim.new(0,10) pl.SortOrder=Enum.SortOrder.LayoutOrder
    self.TabButtons[tabName]=btn self.TabPages[tabName]=page
    btn.MouseButton1Click:Connect(function() doRipple(btn,mPos(),T.Ripple) self:SwitchTab(tabName) end)
    if index==1 then task.defer(function() self:SwitchTab(tabName) end) end
    local tab={Name=tabName,Page=page,Library=self,Badge=badge,_sectionOrder=0} setmetatable(tab,{__index=UILib._TabMethods}) table.insert(self.Tabs,tab) return tab
end

function UILib:SwitchTab(name)
    if self.ActiveTab==name then return end local T=self.Theme self.ActiveTab=name
    for tn,btn in pairs(self.TabButtons) do
        local ind=btn:FindFirstChild("Indicator") local lbl=btn:FindFirstChild("Label") local ico=btn:FindFirstChild("Icon")
        if tn==name then
            tw(btn,0.2,{BackgroundColor3=T.Accent,BackgroundTransparency=0.85})
            if lbl then tw(lbl,0.2,{TextColor3=T.AccentLight}) end if ico then tw(ico,0.2,{TextColor3=T.AccentLight}) end if ind then tw(ind,0.2,{BackgroundTransparency=0}) end
        else
            tw(btn,0.2,{BackgroundColor3=T.Background,BackgroundTransparency=1})
            if lbl then tw(lbl,0.2,{TextColor3=T.TextMuted}) end if ico then tw(ico,0.2,{TextColor3=T.TextMuted}) end if ind then tw(ind,0.2,{BackgroundTransparency=1}) end
        end
    end
    for tn,page in pairs(self.TabPages) do if tn==name then page.Visible=true page.CanvasPosition=Vector2.new(0,0) else page.Visible=false end end
end

function UILib._TabMethods:SetBadge(text)
    if self.Badge then if text and text~="" then self.Badge.Text=tostring(text) self.Badge.Visible=true self.Badge.BackgroundTransparency=0 else self.Badge.Visible=false end end
end
function UILib._TabMethods:AddSection(config)
    local T=self.Library.Theme self._sectionOrder=self._sectionOrder+1
    local section=Instance.new("Frame",self.Page) section.BackgroundColor3=T.SurfaceAlt section.BorderSizePixel=0 section.Size=UDim2.new(1,0,0,0) section.LayoutOrder=config.Order or self._sectionOrder section.ZIndex=3
    pcall(function() section.AutomaticSize=Enum.AutomaticSize.Y end)
    Instance.new("UICorner",section).CornerRadius=UDim.new(0,10) Instance.new("UIStroke",section).Color=T.Border
    local p=Instance.new("UIPadding",section) p.PaddingLeft=UDim.new(0,12) p.PaddingRight=UDim.new(0,12) p.PaddingTop=UDim.new(0,10) p.PaddingBottom=UDim.new(0,12)
    local l=Instance.new("UIListLayout",section) l.Padding=UDim.new(0,8) l.SortOrder=Enum.SortOrder.LayoutOrder
    local tf=Instance.new("Frame",section) tf.BackgroundTransparency=1 tf.Size=UDim2.new(1,0,0,20) tf.LayoutOrder=0 tf.ZIndex=4
    local ad=Instance.new("Frame",tf) ad.BackgroundColor3=T.Accent ad.BorderSizePixel=0 ad.Position=UDim2.new(0,0,0.5,-7) ad.Size=UDim2.new(0,3,0,14) ad.ZIndex=5 Instance.new("UICorner",ad).CornerRadius=UDim.new(0,2)
    local tl=Instance.new("TextLabel",tf) tl.BackgroundTransparency=1 tl.Position=UDim2.new(0,12,0,0) tl.Size=UDim2.new(1,-12,1,0) tl.Font=Enum.Font.GothamBold tl.Text=config.Title or "Section" tl.TextColor3=T.TextPrimary tl.TextSize=12 tl.TextXAlignment=Enum.TextXAlignment.Left tl.ZIndex=5
    local sec={Frame=section,Tab=self,Library=self.Library,_elementOrder=0} setmetatable(sec,{__index=UILib._SectionMethods}) return sec
end
function UILib._TabMethods:AddNote(config)
    local T=self.Library.Theme self._sectionOrder=self._sectionOrder+1
    local nf=Instance.new("Frame",self.Page) nf.BackgroundColor3=T.Element nf.BorderSizePixel=0 nf.Size=UDim2.new(1,0,0,0) nf.LayoutOrder=config.Order or self._sectionOrder nf.ZIndex=3
    pcall(function() nf.AutomaticSize=Enum.AutomaticSize.Y end)
    Instance.new("UICorner",nf).CornerRadius=UDim.new(0,8)
    local p=Instance.new("UIPadding",nf) p.PaddingLeft=UDim.new(0,10) p.PaddingRight=UDim.new(0,10) p.PaddingTop=UDim.new(0,8) p.PaddingBottom=UDim.new(0,8)
    local nt=Instance.new("TextLabel",nf) nt.BackgroundTransparency=1 nt.Size=UDim2.new(1,0,0,0)
    pcall(function() nt.AutomaticSize=Enum.AutomaticSize.Y end)
    nt.Font=Enum.Font.Gotham nt.Text=config.Text or "" nt.TextColor3=T.Info nt.TextSize=10 nt.TextWrapped=true nt.TextXAlignment=Enum.TextXAlignment.Left nt.ZIndex=4 return nt
end
function UILib._TabMethods:AddSeparator()
    self._sectionOrder=self._sectionOrder+1 local T=self.Library.Theme
    local s=Instance.new("Frame",self.Page) s.BackgroundColor3=T.Divider s.BorderSizePixel=0 s.Size=UDim2.new(1,0,0,1) s.LayoutOrder=self._sectionOrder s.ZIndex=3 return s
end
function UILib._TabMethods:AddParagraph(config)
    local T=self.Library.Theme self._sectionOrder=self._sectionOrder+1
    local f=Instance.new("Frame",self.Page) f.BackgroundColor3=T.SurfaceAlt f.BorderSizePixel=0 f.Size=UDim2.new(1,0,0,0) f.LayoutOrder=config.Order or self._sectionOrder f.ZIndex=3
    pcall(function() f.AutomaticSize=Enum.AutomaticSize.Y end)
    Instance.new("UICorner",f).CornerRadius=UDim.new(0,10) Instance.new("UIStroke",f).Color=T.Border
    local p=Instance.new("UIPadding",f) p.PaddingLeft=UDim.new(0,12) p.PaddingRight=UDim.new(0,12) p.PaddingTop=UDim.new(0,10) p.PaddingBottom=UDim.new(0,10)
    local ll=Instance.new("UIListLayout",f) ll.Padding=UDim.new(0,4) ll.SortOrder=Enum.SortOrder.LayoutOrder
    local tl=Instance.new("TextLabel",f) tl.BackgroundTransparency=1 tl.Size=UDim2.new(1,0,0,18) tl.Font=Enum.Font.GothamBold tl.Text=config.Title or "Info" tl.TextColor3=T.TextPrimary tl.TextSize=12 tl.TextXAlignment=Enum.TextXAlignment.Left tl.LayoutOrder=1 tl.ZIndex=4
    local cl=Instance.new("TextLabel",f) cl.BackgroundTransparency=1 cl.Size=UDim2.new(1,0,0,0)
    pcall(function() cl.AutomaticSize=Enum.AutomaticSize.Y end)
    cl.Font=Enum.Font.Gotham cl.Text=config.Content or "" cl.TextColor3=T.TextSecondary cl.TextSize=10 cl.TextWrapped=true cl.TextXAlignment=Enum.TextXAlignment.Left cl.LayoutOrder=2 cl.ZIndex=4 return {Title=tl,Content=cl}
end

UILib._SectionMethods={}
function UILib._SectionMethods:AddToggle(config)
    local T=self.Library.Theme self._elementOrder=self._elementOrder+1
    local desc=config.Description local default=config.Default or false local callback=config.Callback or function() end local fh=desc and 46 or 36
    local f=Instance.new("Frame",self.Frame) f.BackgroundColor3=T.Element f.BorderSizePixel=0 f.Size=UDim2.new(1,0,0,fh) f.LayoutOrder=config.Order or self._elementOrder f.ZIndex=4 f.ClipsDescendants=true Instance.new("UICorner",f).CornerRadius=UDim.new(0,6)
    local l=Instance.new("TextLabel",f) l.BackgroundTransparency=1 l.Position=UDim2.new(0,10,0,desc and 4 or 0) l.Size=UDim2.new(1,-65,0,desc and 18 or fh) l.Font=Enum.Font.GothamSemibold l.Text=config.Text or "Toggle" l.TextColor3=T.TextPrimary l.TextSize=11 l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=5
    if desc then local dl=Instance.new("TextLabel",f) dl.BackgroundTransparency=1 dl.Position=UDim2.new(0,10,0,22) dl.Size=UDim2.new(1,-65,0,16) dl.Font=Enum.Font.Gotham dl.Text=desc dl.TextColor3=T.TextMuted dl.TextSize=9 dl.TextXAlignment=Enum.TextXAlignment.Left dl.ZIndex=5 end
    local bg=Instance.new("Frame",f) bg.BackgroundColor3=T.Border bg.BorderSizePixel=0 bg.Position=UDim2.new(1,-52,0.5,-10) bg.Size=UDim2.new(0,40,0,20) bg.ZIndex=5 Instance.new("UICorner",bg).CornerRadius=UDim.new(1,0)
    local knob=Instance.new("Frame",bg) knob.BackgroundColor3=T.TextMuted knob.BorderSizePixel=0 knob.Position=UDim2.new(0,2,0.5,-8) knob.Size=UDim2.new(0,16,0,16) knob.ZIndex=6 Instance.new("UICorner",knob).CornerRadius=UDim.new(1,0)
    local active=default
    local function upd(anim) local t=anim~=false and 0.2 or 0
        if active then tw(bg,t,{BackgroundColor3=T.Accent}) tw(knob,t,{Position=UDim2.new(1,-18,0.5,-8),BackgroundColor3=Color3.new(1,1,1)}) else tw(bg,t,{BackgroundColor3=T.Border}) tw(knob,t,{Position=UDim2.new(0,2,0.5,-8),BackgroundColor3=T.TextMuted}) end
    end
    local clickB=Instance.new("TextButton",f) clickB.BackgroundTransparency=1 clickB.Size=UDim2.new(1,0,1,0) clickB.Text="" clickB.ZIndex=7
    clickB.MouseEnter:Connect(function() tw(f,0.1,{BackgroundColor3=T.ElementHover}) end) clickB.MouseLeave:Connect(function() tw(f,0.1,{BackgroundColor3=T.Element}) end)
    clickB.MouseButton1Click:Connect(function() active=not active upd() callback(active) end)
    upd(false) return {Frame=f,SetValue=function(_,v) active=v upd() end,GetValue=function() return active end}
end
function UILib._SectionMethods:AddButton(config)
    local T=self.Library.Theme self._elementOrder=self._elementOrder+1 local desc=config.Description local color=config.Color or T.Accent
    local btn=Instance.new("TextButton",self.Frame) btn.BackgroundColor3=color btn.BorderSizePixel=0 btn.Size=UDim2.new(1,0,0,desc and 44 or 34) btn.Text="" btn.AutoButtonColor=false btn.LayoutOrder=config.Order or self._elementOrder btn.ZIndex=4 btn.ClipsDescendants=true Instance.new("UICorner",btn).CornerRadius=UDim.new(0,6)
    local g=Instance.new("UIGradient",btn) g.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,0.25)} g.Rotation=135
    local l=Instance.new("TextLabel",btn) l.BackgroundTransparency=1 l.Position=UDim2.new(0,12,0,desc and 4 or 0) l.Size=UDim2.new(1,-40,0,desc and 20 or 34) l.Font=Enum.Font.GothamBold l.Text=config.Text or "Button" l.TextColor3=Color3.new(1,1,1) l.TextSize=12 l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=5
    if desc then local dl=Instance.new("TextLabel",btn) dl.BackgroundTransparency=1 dl.Position=UDim2.new(0,12,0,22) dl.Size=UDim2.new(1,-40,0,14) dl.Font=Enum.Font.Gotham dl.Text=desc dl.TextColor3=Color3.new(1,1,1) dl.TextTransparency=0.4 dl.TextSize=9 dl.TextXAlignment=Enum.TextXAlignment.Left dl.ZIndex=5 end
    local arrow=Instance.new("TextLabel",btn) arrow.BackgroundTransparency=1 arrow.Position=UDim2.new(1,-28,0,0) arrow.Size=UDim2.new(0,16,1,0) arrow.Font=Enum.Font.GothamBold arrow.Text="→" arrow.TextColor3=Color3.new(1,1,1) arrow.TextTransparency=0.5 arrow.TextSize=14 arrow.ZIndex=5
    btn.MouseEnter:Connect(function() tw(g,0.15,{Rotation=45}) tw(arrow,0.15,{TextTransparency=0}) end) btn.MouseLeave:Connect(function() tw(g,0.15,{Rotation=135}) tw(arrow,0.15,{TextTransparency=0.5}) end)
    btn.MouseButton1Click:Connect(function() doRipple(btn,mPos(),T.Ripple) ;(config.Callback or function()end)(btn) end) return btn
end
function UILib._SectionMethods:AddSlider(config)
    local T=self.Library.Theme self._elementOrder=self._elementOrder+1 local mn,mx=config.Min or 0,config.Max or 100 local default=config.Default or mn local inc=config.Increment or 1 local suffix=config.Suffix or "" local callback=config.Callback or function() end
    local f=Instance.new("Frame",self.Frame) f.BackgroundColor3=T.Element f.BorderSizePixel=0 f.Size=UDim2.new(1,0,0,48) f.LayoutOrder=config.Order or self._elementOrder f.ZIndex=4 Instance.new("UICorner",f).CornerRadius=UDim.new(0,6)
    local l=Instance.new("TextLabel",f) l.BackgroundTransparency=1 l.Position=UDim2.new(0,10,0,4) l.Size=UDim2.new(0.55,0,0,18) l.Font=Enum.Font.GothamSemibold l.Text=config.Text or "Slider" l.TextColor3=T.TextPrimary l.TextSize=11 l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=5
    local vl=Instance.new("TextLabel",f) vl.BackgroundTransparency=1 vl.Position=UDim2.new(0.55,0,0,4) vl.Size=UDim2.new(0.45,-10,0,18) vl.Font=Enum.Font.GothamBold vl.Text=tostring(default)..suffix vl.TextColor3=T.Accent vl.TextSize=11 vl.TextXAlignment=Enum.TextXAlignment.Right vl.ZIndex=5
    local track=Instance.new("Frame",f) track.BackgroundColor3=T.Border track.BorderSizePixel=0 track.Position=UDim2.new(0,10,0,30) track.Size=UDim2.new(1,-20,0,5) track.ZIndex=5 Instance.new("UICorner",track).CornerRadius=UDim.new(1,0)
    local fill=Instance.new("Frame",track) fill.BackgroundColor3=T.Accent fill.BorderSizePixel=0 fill.Size=UDim2.new((default-mn)/(mx-mn),0,1,0) fill.ZIndex=6 Instance.new("UICorner",fill).CornerRadius=UDim.new(1,0)
    local thumb=Instance.new("Frame",track) thumb.BackgroundColor3=Color3.new(1,1,1) thumb.BorderSizePixel=0 thumb.AnchorPoint=Vector2.new(0.5,0.5) thumb.Position=UDim2.new((default-mn)/(mx-mn),0,0.5,0) thumb.Size=UDim2.new(0,14,0,14) thumb.ZIndex=7 Instance.new("UICorner",thumb).CornerRadius=UDim.new(1,0)
    local cur=default local dragging=false local function snap(v) return math.clamp(math.floor((v-mn)/inc+0.5)*inc+mn,mn,mx) end
    local function update(input) local p2=math.clamp((input.Position.X-track.AbsolutePosition.X)/track.AbsoluteSize.X,0,1) cur=snap(mn+(mx-mn)*p2) local np=(cur-mn)/(mx-mn) tw(fill,0.04,{Size=UDim2.new(np,0,1,0)},Enum.EasingStyle.Linear) tw(thumb,0.04,{Position=UDim2.new(np,0,0.5,0)},Enum.EasingStyle.Linear) vl.Text=tostring(cur)..suffix callback(cur) end
    local ib=Instance.new("TextButton",track) ib.BackgroundTransparency=1 ib.Size=UDim2.new(1,0,1,16) ib.Position=UDim2.new(0,0,0,-8) ib.Text="" ib.ZIndex=8
    ib.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dragging=true tw(thumb,0.1,{Size=UDim2.new(0,18,0,18)}) update(i) end end)
    ib.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dragging=false tw(thumb,0.1,{Size=UDim2.new(0,14,0,14)}) end end)
    UserInputService.InputChanged:Connect(function(i) if dragging and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then update(i) end end)
    return {Frame=f,SetValue=function(_,v) cur=snap(v) local np=(cur-mn)/(mx-mn) fill.Size=UDim2.new(np,0,1,0) thumb.Position=UDim2.new(np,0,0.5,0) vl.Text=tostring(cur)..suffix end, GetValue=function() return cur end}
end
function UILib._SectionMethods:AddDropdown(config)
    local T=self.Library.Theme self._elementOrder=self._elementOrder+1 local items=config.Items or {} local multi=config.Multi or false local maxVisible=config.MaxVisible or 6 local default=config.Default or (not multi and items[1] or {}) local callback=config.Callback or function() end local isOpen=false local selected=multi and {} or default
    if multi and type(config.Default)=="table" then for _,v in ipairs(config.Default) do selected[v]=true end end
    local itemH=28 local itemGap=2
    local function getDisplay() if multi then local s={} for k,v in pairs(selected) do if v then table.insert(s,k) end end return #s>0 and table.concat(s,", ") or "None" else return tostring(selected) end end
    local function calcScrollH() return math.min(#items, maxVisible)*(itemH+itemGap)+4 end
    local function calcCanvasH() return #items*(itemH+itemGap)+4 end
    local f=Instance.new("Frame",self.Frame) f.BackgroundColor3=T.Element f.BorderSizePixel=0 f.Size=UDim2.new(1,0,0,34) f.LayoutOrder=config.Order or self._elementOrder f.ZIndex=4 f.ClipsDescendants=true Instance.new("UICorner",f).CornerRadius=UDim.new(0,6)
    local l=Instance.new("TextLabel",f) l.BackgroundTransparency=1 l.Position=UDim2.new(0,10,0,0) l.Size=UDim2.new(0.45,0,0,34) l.Font=Enum.Font.GothamSemibold l.Text=config.Text or "Select" l.TextColor3=T.TextPrimary l.TextSize=11 l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=5
    local vl=Instance.new("TextLabel",f) vl.BackgroundTransparency=1 vl.Position=UDim2.new(0.4,0,0,0) vl.Size=UDim2.new(0.6,-30,0,34) vl.Font=Enum.Font.Gotham vl.Text=getDisplay() vl.TextColor3=T.TextSecondary vl.TextSize=10 vl.TextXAlignment=Enum.TextXAlignment.Right vl.TextTruncate=Enum.TextTruncate.AtEnd vl.ZIndex=5
    local arrow=Instance.new("TextLabel",f) arrow.BackgroundTransparency=1 arrow.Position=UDim2.new(1,-24,0,0) arrow.Size=UDim2.new(0,16,0,34) arrow.Font=Enum.Font.GothamBold arrow.Text="▾" arrow.TextColor3=T.TextMuted arrow.TextSize=12 arrow.ZIndex=5
    local scrollH=calcScrollH() local canvasH=calcCanvasH() local needsScroll=#items>maxVisible
    local of=Instance.new("ScrollingFrame",f) of.Name="DropdownScroll" of.BackgroundColor3=T.SurfaceAlt of.BackgroundTransparency=0.8 of.BorderSizePixel=0 of.Position=UDim2.new(0,4,0,38) of.Size=UDim2.new(1,-8,0,scrollH) of.CanvasSize=UDim2.new(0,0,0,canvasH) of.ScrollBarThickness=needsScroll and 3 or 0 of.ScrollBarImageColor3=T.ScrollBar of.ScrollBarImageTransparency=0.2 of.ScrollingDirection=Enum.ScrollingDirection.Y of.ZIndex=5 of.Visible=false of.ClipsDescendants=true pcall(function() of.AutomaticCanvasSize=Enum.AutomaticSize.Y end) Instance.new("UICorner",of).CornerRadius=UDim.new(0,5)
    local ofl=Instance.new("UIListLayout",of) ofl.Padding=UDim.new(0,itemGap) ofl.SortOrder=Enum.SortOrder.LayoutOrder
    local ofp=Instance.new("UIPadding",of) ofp.PaddingLeft=UDim.new(0,2) ofp.PaddingRight=UDim.new(0,2) ofp.PaddingTop=UDim.new(0,2) ofp.PaddingBottom=UDim.new(0,2)
    local optBtns={}
    local function makeOpt(item,i)
        local ob=Instance.new("TextButton",of) ob.BackgroundColor3=T.SurfaceAlt ob.BackgroundTransparency=0.5 ob.BorderSizePixel=0 ob.Size=UDim2.new(1,0,0,itemH) ob.Font=Enum.Font.Gotham ob.TextColor3=T.TextSecondary ob.TextSize=10 ob.TextXAlignment=Enum.TextXAlignment.Left ob.AutoButtonColor=false ob.LayoutOrder=i ob.ZIndex=6 ob.ClipsDescendants=true Instance.new("UICorner",ob).CornerRadius=UDim.new(0,5) Instance.new("UIPadding",ob).PaddingLeft=UDim.new(0,10)
        local isSel=multi and selected[item] or (item==selected) ob.Text=multi and ((isSel and "☑ " or "☐ ")..item) or item if isSel then ob.TextColor3=T.Accent ob.BackgroundTransparency=0.3 end
        ob.MouseEnter:Connect(function() tw(ob,0.08,{BackgroundTransparency=0.2}) end) ob.MouseLeave:Connect(function() local s2=multi and selected[item] or (item==selected) tw(ob,0.08,{BackgroundTransparency=s2 and 0.3 or 0.5}) end)
        ob.MouseButton1Click:Connect(function()
            if multi then selected[item]=not selected[item] ob.Text=(selected[item] and "☑ " or "☐ ")..item ob.TextColor3=selected[item] and T.Accent or T.TextSecondary ob.BackgroundTransparency=selected[item] and 0.3 or 0.5 vl.Text=getDisplay() callback(selected)
            else selected=item vl.Text=getDisplay() for _,d in pairs(optBtns) do d.TextColor3=T.TextSecondary d.BackgroundTransparency=0.5 end ob.TextColor3=T.Accent ob.BackgroundTransparency=0.3 callback(selected) task.delay(0.12,function() if isOpen then isOpen=false of.Visible=false tw(f,0.2,{Size=UDim2.new(1,0,0,34)}) tw(arrow,0.15,{Rotation=0}) end end) end
        end) optBtns[item]=ob return ob
    end
    for i,item in ipairs(items) do makeOpt(item,i) end
    local hb=Instance.new("TextButton",f) hb.BackgroundTransparency=1 hb.Size=UDim2.new(1,0,0,34) hb.Text="" hb.ZIndex=6
    hb.MouseEnter:Connect(function() tw(f,0.1,{BackgroundColor3=T.ElementHover}) end) hb.MouseLeave:Connect(function() tw(f,0.1,{BackgroundColor3=T.Element}) end)
    hb.MouseButton1Click:Connect(function() isOpen=not isOpen if isOpen then of.Visible=true of.CanvasPosition=Vector2.new(0,0) local openH=scrollH+8 tw(f,0.25,{Size=UDim2.new(1,0,0,34+openH)},Enum.EasingStyle.Back) tw(arrow,0.15,{Rotation=180}) else tw(f,0.2,{Size=UDim2.new(1,0,0,34)}) tw(arrow,0.15,{Rotation=0}) task.delay(0.2,function() if not isOpen then of.Visible=false end end) end end)
    return {Frame=f,SetValue=function(_,v) selected=v vl.Text=getDisplay() end,GetValue=function() return selected end,Refresh=function(_,ni) for _,ob in pairs(optBtns) do ob:Destroy() end optBtns={} items=ni for i,item in ipairs(ni) do makeOpt(item,i) end local newScrollH=calcScrollH() local newCanvasH=calcCanvasH() local newNeedsScroll=#items>maxVisible of.Size=UDim2.new(1,-8,0,newScrollH) of.CanvasSize=UDim2.new(0,0,0,newCanvasH) of.ScrollBarThickness=newNeedsScroll and 3 or 0 scrollH=newScrollH if not multi then selected=ni[1] or "" vl.Text=getDisplay() end if isOpen then tw(f,0.2,{Size=UDim2.new(1,0,0,34+(scrollH+8))}) end end}
end
function UILib._SectionMethods:AddColorPicker(config)
    local T=self.Library.Theme self._elementOrder=self._elementOrder+1 local default=config.Default or T.Accent local callback=config.Callback or function() end local h,s,v=rgbToHsv(default) local isOpen=false
    local f=Instance.new("Frame",self.Frame) f.BackgroundColor3=T.Element f.BorderSizePixel=0 f.Size=UDim2.new(1,0,0,34) f.LayoutOrder=config.Order or self._elementOrder f.ZIndex=4 f.ClipsDescendants=true Instance.new("UICorner",f).CornerRadius=UDim.new(0,6)
    local l=Instance.new("TextLabel",f) l.BackgroundTransparency=1 l.Position=UDim2.new(0,10,0,0) l.Size=UDim2.new(1,-55,0,34) l.Font=Enum.Font.GothamSemibold l.Text=config.Text or "Color" l.TextColor3=T.TextPrimary l.TextSize=11 l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=5
    local preview=Instance.new("Frame",f) preview.BackgroundColor3=default preview.BorderSizePixel=0 preview.Position=UDim2.new(1,-42,0,8) preview.Size=UDim2.new(0,30,0,18) preview.ZIndex=5 Instance.new("UICorner",preview).CornerRadius=UDim.new(0,5) Instance.new("UIStroke",preview).Color=T.Border
    local pp=Instance.new("Frame",f) pp.BackgroundTransparency=1 pp.Position=UDim2.new(0,8,0,40) pp.Size=UDim2.new(1,-16,0,120) pp.ZIndex=5 pp.Visible=false
    local svC=Instance.new("ImageLabel",pp) svC.BackgroundColor3=hsvToRgb(h,1,1) svC.BorderSizePixel=0 svC.Size=UDim2.new(1,-32,0,90) svC.Image="rbxassetid://4155801252" svC.ZIndex=6 Instance.new("UICorner",svC).CornerRadius=UDim.new(0,5)
    local svCur=Instance.new("Frame",svC) svCur.BackgroundColor3=Color3.new(1,1,1) svCur.BorderSizePixel=0 svCur.AnchorPoint=Vector2.new(0.5,0.5) svCur.Position=UDim2.new(s,0,1-v,0) svCur.Size=UDim2.new(0,12,0,12) svCur.ZIndex=8 Instance.new("UICorner",svCur).CornerRadius=UDim.new(1,0)
    local hueBar=Instance.new("Frame",pp) hueBar.BackgroundColor3=Color3.new(1,1,1) hueBar.BorderSizePixel=0 hueBar.Position=UDim2.new(1,-22,0,0) hueBar.Size=UDim2.new(0,16,0,90) hueBar.ZIndex=6 Instance.new("UICorner",hueBar).CornerRadius=UDim.new(0,5)
    local hg=Instance.new("UIGradient",hueBar) hg.Rotation=90 hg.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(0.167,Color3.fromRGB(255,255,0)),ColorSequenceKeypoint.new(0.333,Color3.fromRGB(0,255,0)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,255)),ColorSequenceKeypoint.new(0.667,Color3.fromRGB(0,0,255)),ColorSequenceKeypoint.new(0.833,Color3.fromRGB(255,0,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,0))}
    local hCur=Instance.new("Frame",hueBar) hCur.BackgroundColor3=Color3.new(1,1,1) hCur.BorderSizePixel=0 hCur.AnchorPoint=Vector2.new(0.5,0.5) hCur.Position=UDim2.new(0.5,0,h,0) hCur.Size=UDim2.new(1,4,0,5) hCur.ZIndex=8 Instance.new("UICorner",hCur).CornerRadius=UDim.new(1,0)
    local hexL=Instance.new("TextLabel",pp) hexL.BackgroundColor3=T.SurfaceAlt hexL.Position=UDim2.new(0,0,0,96) hexL.Size=UDim2.new(1,-32,0,18) hexL.Font=Enum.Font.Code hexL.TextColor3=T.TextSecondary hexL.TextSize=9 hexL.Text="#"..toHex(default) hexL.ZIndex=6 Instance.new("UICorner",hexL).CornerRadius=UDim.new(0,3)
    local function upd() local c=hsvToRgb(h,s,v) preview.BackgroundColor3=c svC.BackgroundColor3=hsvToRgb(h,1,1) hexL.Text="#"..toHex(c) callback(c) end
    local dSV,dH=false,false
    local svBtn=Instance.new("TextButton",svC) svBtn.BackgroundTransparency=1 svBtn.Size=UDim2.new(1,0,1,0) svBtn.Text="" svBtn.ZIndex=7 svBtn.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dSV=true end end) svBtn.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dSV=false end end)
    local hBtn=Instance.new("TextButton",hueBar) hBtn.BackgroundTransparency=1 hBtn.Size=UDim2.new(1,0,1,0) hBtn.Text="" hBtn.ZIndex=7 hBtn.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dH=true end end) hBtn.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dH=false end end)
    UserInputService.InputChanged:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch then if dSV then s=math.clamp((i.Position.X-svC.AbsolutePosition.X)/svC.AbsoluteSize.X,0,1) v=math.clamp(1-(i.Position.Y-svC.AbsolutePosition.Y)/svC.AbsoluteSize.Y,0,1) svCur.Position=UDim2.new(s,0,1-v,0) upd() end if dH then h=math.clamp((i.Position.Y-hueBar.AbsolutePosition.Y)/hueBar.AbsoluteSize.Y,0,1) hCur.Position=UDim2.new(0.5,0,h,0) upd() end end end)
    local headerB=Instance.new("TextButton",f) headerB.BackgroundTransparency=1 headerB.Size=UDim2.new(1,0,0,34) headerB.Text="" headerB.ZIndex=6 headerB.MouseEnter:Connect(function() tw(f,0.1,{BackgroundColor3=T.ElementHover}) end) headerB.MouseLeave:Connect(function() tw(f,0.1,{BackgroundColor3=T.Element}) end)
    headerB.MouseButton1Click:Connect(function() isOpen=not isOpen if isOpen then pp.Visible=true tw(f,0.25,{Size=UDim2.new(1,0,0,170)},Enum.EasingStyle.Back) else tw(f,0.2,{Size=UDim2.new(1,0,0,34)}) task.delay(0.2,function() if not isOpen then pp.Visible=false end end) end end)
    return {Frame=f,SetValue=function(_,c2) h,s,v=rgbToHsv(c2) preview.BackgroundColor3=c2 svC.BackgroundColor3=hsvToRgb(h,1,1) svCur.Position=UDim2.new(s,0,1-v,0) hCur.Position=UDim2.new(0.5,0,h,0) hexL.Text="#"..toHex(c2) end,GetValue=function() return hsvToRgb(h,s,v) end}
end
function UILib._SectionMethods:AddKeybind(config)
    local T=self.Library.Theme self._elementOrder=self._elementOrder+1 local default=config.Default or Enum.KeyCode.Unknown local callback=config.Callback or function() end local currentKey=default local listening=false
    local f=Instance.new("Frame",self.Frame) f.BackgroundColor3=T.Element f.BorderSizePixel=0 f.Size=UDim2.new(1,0,0,34) f.LayoutOrder=config.Order or self._elementOrder f.ZIndex=4 Instance.new("UICorner",f).CornerRadius=UDim.new(0,6)
    local l=Instance.new("TextLabel",f) l.BackgroundTransparency=1 l.Position=UDim2.new(0,10,0,0) l.Size=UDim2.new(1,-90,1,0) l.Font=Enum.Font.GothamSemibold l.Text=config.Text or "Keybind" l.TextColor3=T.TextPrimary l.TextSize=11 l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=5
    local kb=Instance.new("TextButton",f) kb.BackgroundColor3=T.SurfaceAlt kb.BorderSizePixel=0 kb.Position=UDim2.new(1,-78,0,5) kb.Size=UDim2.new(0,66,0,24) kb.Font=Enum.Font.GothamSemibold kb.Text=currentKey==Enum.KeyCode.Unknown and "None" or currentKey.Name kb.TextColor3=T.TextSecondary kb.TextSize=10 kb.AutoButtonColor=false kb.ZIndex=5 Instance.new("UICorner",kb).CornerRadius=UDim.new(0,5)
    local ks=Instance.new("UIStroke",kb) ks.Color=T.Border ks.Thickness=1
    kb.MouseEnter:Connect(function() tw(ks,0.1,{Color=T.Accent}) end) kb.MouseLeave:Connect(function() if not listening then tw(ks,0.1,{Color=T.Border}) end end)
    kb.MouseButton1Click:Connect(function() listening=true kb.Text="..." kb.TextColor3=T.Accent ks.Color=T.Accent local conn conn=UserInputService.InputBegan:Connect(function(input,gpe) if gpe then return end if input.UserInputType==Enum.UserInputType.Keyboard then listening=false conn:Disconnect() if input.KeyCode==Enum.KeyCode.Escape then currentKey=Enum.KeyCode.Unknown kb.Text="None" else currentKey=input.KeyCode kb.Text=currentKey.Name end kb.TextColor3=T.TextSecondary ks.Color=T.Border for i,kbData in ipairs(self.Library.Keybinds) do if kbData.Id==f then table.remove(self.Library.Keybinds,i) break end end if currentKey~=Enum.KeyCode.Unknown then table.insert(self.Library.Keybinds,{Id=f,Key=currentKey,Callback=callback}) end end end) end)
    if default~=Enum.KeyCode.Unknown then table.insert(self.Library.Keybinds,{Id=f,Key=default,Callback=callback}) end
    return {Frame=f,GetValue=function() return currentKey end,SetValue=function(_,k) currentKey=k kb.Text=k==Enum.KeyCode.Unknown and "None" or k.Name end}
end
function UILib._SectionMethods:AddProgress(config)
    local T=self.Library.Theme self._elementOrder=self._elementOrder+1
    local f=Instance.new("Frame",self.Frame) f.BackgroundColor3=T.Element f.BorderSizePixel=0 f.Size=UDim2.new(1,0,0,40) f.LayoutOrder=config.Order or self._elementOrder f.ZIndex=4 Instance.new("UICorner",f).CornerRadius=UDim.new(0,6)
    local l=Instance.new("TextLabel",f) l.BackgroundTransparency=1 l.Position=UDim2.new(0,10,0,3) l.Size=UDim2.new(0.65,0,0,16) l.Font=Enum.Font.GothamSemibold l.Text=config.Text or "Progress" l.TextColor3=T.TextPrimary l.TextSize=10 l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=5
    local pl=Instance.new("TextLabel",f) pl.BackgroundTransparency=1 pl.Position=UDim2.new(0.65,0,0,3) pl.Size=UDim2.new(0.35,-10,0,16) pl.Font=Enum.Font.GothamBold pl.Text="0%" pl.TextColor3=T.Accent pl.TextSize=10 pl.TextXAlignment=Enum.TextXAlignment.Right l.ZIndex=5
    local track=Instance.new("Frame",f) track.BackgroundColor3=T.Border track.BorderSizePixel=0 track.Position=UDim2.new(0,10,0,24) track.Size=UDim2.new(1,-20,0,6) track.ZIndex=5 Instance.new("UICorner",track).CornerRadius=UDim.new(1,0)
    local fill=Instance.new("Frame",track) fill.BackgroundColor3=T.Accent fill.BorderSizePixel=0 fill.Size=UDim2.new(0,0,1,0) fill.ZIndex=6 Instance.new("UICorner",fill).CornerRadius=UDim.new(1,0)
    local fg2=Instance.new("UIGradient",fill) fg2.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,T.GradientStart),ColorSequenceKeypoint.new(0.5,T.GradientMid),ColorSequenceKeypoint.new(1,T.GradientEnd)}
    return {Frame=f,SetValue=function(_,v2) v2=math.clamp(v2,0,1) tw(fill,0.25,{Size=UDim2.new(v2,0,1,0)}) pl.Text=math.floor(v2*100).."%" end,SetText=function(_,t2) l.Text=t2 end}
end
function UILib._SectionMethods:AddLabel(config)
    local T=self.Library.Theme self._elementOrder=self._elementOrder+1
    local l=Instance.new("TextLabel",self.Frame) l.BackgroundColor3=T.Element l.BorderSizePixel=0 l.Size=UDim2.new(1,0,0,config.Height or 26) l.Font=Enum.Font.GothamSemibold l.Text=config.Text or "" l.TextColor3=config.TextColor or T.TextSecondary l.TextSize=config.TextSize or 10 l.TextXAlignment=Enum.TextXAlignment.Left l.TextWrapped=true l.LayoutOrder=config.Order or self._elementOrder l.ZIndex=4 Instance.new("UICorner",l).CornerRadius=UDim.new(0,6)
    local p=Instance.new("UIPadding",l) p.PaddingLeft=UDim.new(0,10) p.PaddingRight=UDim.new(0,8) return l
end
function UILib._SectionMethods:AddTextBox(config)
    local T=self.Library.Theme self._elementOrder=self._elementOrder+1 local callback=config.Callback or function() end
    local f=Instance.new("Frame",self.Frame) f.BackgroundColor3=T.Element f.BorderSizePixel=0 f.Size=UDim2.new(1,0,0,34) f.LayoutOrder=config.Order or self._elementOrder f.ZIndex=4 Instance.new("UICorner",f).CornerRadius=UDim.new(0,6)
    if config.Text then local l=Instance.new("TextLabel",f) l.BackgroundTransparency=1 l.Position=UDim2.new(0,10,0,0) l.Size=UDim2.new(0.35,0,1,0) l.Font=Enum.Font.GothamSemibold l.Text=config.Text l.TextColor3=T.TextPrimary l.TextSize=11 l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=5 end
    local ib=Instance.new("Frame",f) ib.BackgroundColor3=T.SurfaceAlt ib.BorderSizePixel=0 ib.Position=config.Text and UDim2.new(0.35,4,0,4) or UDim2.new(0,4,0,4) ib.Size=config.Text and UDim2.new(0.65,-14,0,26) or UDim2.new(1,-8,0,26) ib.ZIndex=5 Instance.new("UICorner",ib).CornerRadius=UDim.new(0,5)
    local is=Instance.new("UIStroke",ib) is.Color=T.Border is.Thickness=1 is.Transparency=0.5
    local tb=Instance.new("TextBox",ib) tb.BackgroundTransparency=1 tb.Position=UDim2.new(0,8,0,0) tb.Size=UDim2.new(1,-16,1,0) tb.Font=Enum.Font.Gotham tb.PlaceholderText=config.Placeholder or "Type..." tb.PlaceholderColor3=T.TextMuted tb.Text=config.Default or "" tb.TextColor3=T.TextPrimary tb.TextSize=11 tb.TextXAlignment=Enum.TextXAlignment.Left tb.ZIndex=6 tb.ClearTextOnFocus=false
    tb.Focused:Connect(function() tw(is,0.12,{Color=T.Accent,Transparency=0}) end) tb.FocusLost:Connect(function(ep) tw(is,0.12,{Color=T.Border,Transparency=0.5}) callback(tb.Text,ep) end) return tb
end
function UILib._SectionMethods:AddFeature(config)
    local T=self.Library.Theme self._elementOrder=self._elementOrder+1 local color=config.Color or T.Accent
    local f=Instance.new("Frame",self.Frame) f.BackgroundColor3=T.Element f.BorderSizePixel=0 f.Size=UDim2.new(1,0,0,30) f.LayoutOrder=config.Order or self._elementOrder f.ZIndex=4 Instance.new("UICorner",f).CornerRadius=UDim.new(0,6)
    local ind=Instance.new("Frame",f) ind.BackgroundColor3=color ind.BorderSizePixel=0 ind.Size=UDim2.new(0,3,0.55,0) ind.Position=UDim2.new(0,0,0.225,0) ind.ZIndex=5 Instance.new("UICorner",ind).CornerRadius=UDim.new(0,2)
    local l=Instance.new("TextLabel",f) l.BackgroundTransparency=1 l.Position=UDim2.new(0,10,0,0) l.Size=UDim2.new(1,-16,1,0) l.Font=Enum.Font.GothamSemibold l.Text=(config.Icon or "✨").."  "..(config.Text or "Feature") l.TextColor3=T.TextSecondary l.TextSize=10 l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=5 return f
end
function UILib._SectionMethods:AddSeparator()
    local T=self.Library.Theme self._elementOrder=self._elementOrder+1 local s=Instance.new("Frame",self.Frame) s.BackgroundColor3=T.Divider s.BorderSizePixel=0 s.Size=UDim2.new(1,0,0,1) s.LayoutOrder=self._elementOrder s.ZIndex=4 return s
end
function UILib._SectionMethods:AddNote(config)
    local T=self.Library.Theme self._elementOrder=self._elementOrder+1
    local nf=Instance.new("Frame",self.Frame) nf.BackgroundColor3=T.SurfaceAlt nf.BorderSizePixel=0 nf.Size=UDim2.new(1,0,0,0) nf.LayoutOrder=config.Order or self._elementOrder nf.ZIndex=4
    pcall(function() nf.AutomaticSize=Enum.AutomaticSize.Y end) Instance.new("UICorner",nf).CornerRadius=UDim.new(0,6)
    local p=Instance.new("UIPadding",nf) p.PaddingLeft=UDim.new(0,8) p.PaddingRight=UDim.new(0,8) p.PaddingTop=UDim.new(0,6) p.PaddingBottom=UDim.new(0,6)
    local nt=Instance.new("TextLabel",nf) nt.BackgroundTransparency=1 nt.Size=UDim2.new(1,0,0,0)
    pcall(function() nt.AutomaticSize=Enum.AutomaticSize.Y end) nt.Font=Enum.Font.Gotham nt.Text=config.Text or "" nt.TextColor3=T.Info nt.TextSize=9 nt.TextWrapped=true nt.TextXAlignment=Enum.TextXAlignment.Left nt.ZIndex=5 return nt
end

-- SMART PATCH FIX
local oldAddSection = UILib._TabMethods.AddSection
UILib._TabMethods.AddSection = function(self, config)
    local sec = oldAddSection(self, config)
    self._currentSection = sec
    return sec
end

UILib._TabMethods.AddParagraph = function(self, config)
    local sec = self:AddSection({Title = config.Title})
    local noteLabel
    if config.Content and config.Content ~= "" then
        noteLabel = sec:AddNote({Text = config.Content})
    else
        noteLabel = sec:AddNote({Text = " "})
    end
    local dummyTitle = Instance.new("TextLabel")
    return {Title = dummyTitle, Content = noteLabel}
end

local oldAddToggle = UILib._SectionMethods.AddToggle
UILib._SectionMethods.AddToggle = function(self, config)
    local toggleObj = oldAddToggle(self, config)
    local oldSetValue = toggleObj.SetValue
    toggleObj.SetValue = function(obj, v)
        oldSetValue(obj, v)
        if config.Callback then config.Callback(v) end 
    end
    return toggleObj
end

for methodName, func in pairs(UILib._SectionMethods) do
    if not UILib._TabMethods[methodName] then
        UILib._TabMethods[methodName] = function(self, ...)
            if not self._currentSection then self._currentSection = self:AddSection({Title = "🛠️ " .. self.Name}) end
            return func(self._currentSection, ...)
        end
    end
end

-- ======================================================== --
--  FUNGSI CUSTOM LOADER MIGII-HUB
-- ======================================================== --
function UILib.ShowMigiiLoader()
    local Players = game:GetService("Players")
    local CoreGui = game:GetService("CoreGui")
    local TweenService = game:GetService("TweenService")
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
        local tween = TweenService:Create(BarFill, TweenInfo.new(dur, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(progress, 0, 1, 0)})
        tween:Play()
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

return UILib
