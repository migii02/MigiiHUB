-- // ========================================== \\ --
-- ||     MIGII-HUB AUTO LOADER - BOOK EDITION    || --
-- \\ ========================================== // --

-- [ 1. ANTI-DOUBLE EXECUTE ] --
if getgenv().MigiiHubExecuted then
    return 
end
getgenv().MigiiHubExecuted = true

-- [ 2. VARIABEL & SERVICES ] --
local player = game.Players.LocalPlayer
local placeId = game.PlaceId
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

-- [ Variabel name game & IDs ] 
local danceNowID = 101348054552567
local sawahIndoID = 83369512629707
local indohangoutID = 9788848685
local desarayapID = 75915753480190
local sambungKataID = 130342654546662 -- Game Baru
local webhookURL = "https://discord.com/api/webhooks/1489506441168420985/VWhllBrbEASFprNRjcnN_Ykv10jzHQ7DH2onRISHhpBm-dbz1rOILSZtCKcXEgnxDxI_"

-- Definisi List Game (Hanya untuk Tampilan UI)
local gamesListData = {
    [1] = {Name = "Dance Now", ID = danceNowID},
    [2] = {Name = "Sawah Indo", ID = sawahIndoID},
    [3] = {Name = "Indo Hangout", ID = indohangoutID},
    [4] = {Name = "Desa Rayap", ID = desarayapID},
    [5] = {Name = "Sambung Kata", ID = sambungKataID} -- List Game Baru
}

-- [ 3. SETUP BUKU TULIS UI ] --
local BookGui = Instance.new("ScreenGui")
BookGui.Name = "MigiiHubBookUI"
BookGui.ResetOnSpawn = false
local success = pcall(function() BookGui.Parent = CoreGui end)
if not success then BookGui.Parent = player:WaitForChild("PlayerGui") end

-- Background Blur (Dikecilin biar layar belakang masih lumayan kelihatan)
local Blur = Instance.new("BlurEffect", game.Lighting)
Blur.Size = 0
Blur.Enabled = true
TweenService:Create(Blur, TweenInfo.new(1), {Size = 10}):Play()

-- Container Utama (Buku - UKURAN DIPESAR DIKIT, POSISI POJOK KANAN ATAS)
local MainFrame = Instance.new("Frame", BookGui)
MainFrame.Name = "MainFrame"
-- UPDATED POSISI: Pojok Kanan Atas
MainFrame.AnchorPoint = Vector2.new(1, 0) -- Titik acuan pojok kanan atas frame
MainFrame.Position = UDim2.new(1, -15, 0, 15) -- Jarak 15px dari kanan dan atas layar
MainFrame.Size = UDim2.new(0, 0, 0, 0) -- Mulai dari nol untuk animasi

-- UPDATED UKURAN TARGET (DIBESARIN DIKIT): 260x280 -> 300x320
local targetSize = UDim2.new(0, 300, 0, 320)

MainFrame.BackgroundColor3 = Color3.fromRGB(255, 252, 230)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- Biar bisa digeser manual

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 10)

-- Garis Pink Pinggir Buku (Lebih estetik)
local PinkLine = Instance.new("Frame", MainFrame)
PinkLine.Size = UDim2.new(0, 2, 1, 0)
PinkLine.Position = UDim2.new(0, 35, 0, 0) -- Disesuaikan posisinya karena frame lebih lebar
PinkLine.BackgroundColor3 = Color3.fromRGB(255, 105, 180) -- Menggunakan warna pink
PinkLine.BorderSizePixel = 0

-- Shadow/Effect Buku
local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Color = Color3.fromRGB(0, 0, 0)
UIStroke.Thickness = 2
UIStroke.Transparency = 0.8

-- Title (MIGII-HUB)
local Title = Instance.new("TextLabel", MainFrame)
Title.Name = "Title"
Title.Size = UDim2.new(1, -45, 0, 35)
Title.Position = UDim2.new(0, 45, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "MIGII-HUB : Game List"
Title.TextColor3 = Color3.fromRGB(50, 50, 50) 
Title.Font = Enum.Font.PermanentMarker 
Title.TextSize = 18 -- Sedikit disesuaikan
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Container untuk List
local ListContainer = Instance.new("Frame", MainFrame)
ListContainer.Name = "ListContainer"
ListContainer.Size = UDim2.new(1, -55, 1, -80)
ListContainer.Position = UDim2.new(0, 45, 0, 50)
ListContainer.BackgroundTransparency = 1

local UIListLayout = Instance.new("UIListLayout", ListContainer)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10) -- Jarak antar baris sedikit dilonggarkan karena frame lebih tinggi

-- Template Label Kosong untuk Efek Tulis (Dibuat otomatis sesuai jumlah game di gamesListData)
local TextLines = {}
for i = 1, #gamesListData do
    local lineLabel = Instance.new("TextLabel", ListContainer)
    lineLabel.Name = "Line_"..tostring(i)
    lineLabel.Size = UDim2.new(1, 0, 0, 22) -- Sedikit lebih tinggi
    lineLabel.BackgroundTransparency = 1
    lineLabel.Text = "" 
    lineLabel.TextColor3 = Color3.fromRGB(60, 60, 60)
    lineLabel.Font = Enum.Font.IndieFlower 
    lineLabel.TextSize = 16 -- Ukuran font tulisan list sedikit lebih besar
    lineLabel.TextXAlignment = Enum.TextXAlignment.Left
    lineLabel.LayoutOrder = i
    
    -- Garis bawah pensil
    local underline = Instance.new("Frame", lineLabel)
    underline.Size = UDim2.new(1, 0, 0, 1)
    underline.Position = UDim2.new(0, 0, 1, 0)
    underline.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    underline.BorderSizePixel = 0
    
    TextLines[i] = lineLabel
end

-- Label untuk Status Akhir (Paling Bawah)
local StatusLabel = Instance.new("TextLabel", MainFrame)
StatusLabel.Name = "StatusLabel"
StatusLabel.Size = UDim2.new(1, -55, 0, 20)
StatusLabel.Position = UDim2.new(0, 45, 1, -35)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "" 
StatusLabel.TextColor3 = Color3.fromRGB(50, 50, 50)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.TextSize = 12 
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Animasi Masuk UI (Target ukuran baru yang lebih besar)
TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = targetSize}):Play()

-- [ 4. FUNGSI EFEK NULIS (TYPEWRITER) ] --
local function WriteText(label, fullText, speed)
    speed = speed or 0.05 
    for i = 1, #fullText do
        label.Text = string.sub(fullText, 1, i)
        task.wait(speed)
    end
end

-- [ 5. FUNGSI WEBHOOK DISCORD ] --
local function SendWebhook(gameName, isSuccess)
    task.spawn(function()
        local req = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
        if not req then return end

        local currentTime = os.date("%d/%m/%Y - %H:%M:%S")
        local statusColor = isSuccess and 65280 or 16711680 
        local statusText = isSuccess and "Berhasil Dimuat" or "Gagal / Ditolak (Auto-Kick)"

        local data = {
            ["username"] = "Migii Log system",
            ["embeds"] = {
                {
                    ["title"] = "🚀 Log Eksekusi Script",
                    ["color"] = statusColor,
                    ["fields"] = {
                        {["name"] = "👤 Username", ["value"] = "```" .. player.Name .. "```", ["inline"] = true},
                        {["name"] = "🏷️ Nama Player", ["value"] = "```" .. player.DisplayName .. "```", ["inline"] = true},
                        {["name"] = "📊 Total Execute", ["value"] = "```1 (Sesi ini)```", ["inline"] = false},
                        {["name"] = "🎮 Nama Game", ["value"] = "```" .. gameName .. "```", ["inline"] = false},
                        {["name"] = "🛡️ Status", ["value"] = "```" .. statusText .. "```", ["inline"] = false},
                        {["name"] = "⏰ Tanggal & Jam", ["value"] = "```" .. currentTime .. " WIB```", ["inline"] = false}
                    },
                    ["footer"] = {["text"] = "MIGII-HUB Security System"}
                }
            }
        }

        pcall(function()
            req({
                Url = webhookURL,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode(data)
            })
        end)
    end)
end

-- [ 6. LOGIKA SCANNING & EKSEKUSI ] --
task.wait(0.7) 

-- Mulai nulis Title
WriteText(Title, "MIGII-HUB : Game List", 0.03)
task.wait(0.3)

local gameFoundData = nil

-- Loop nulis list satu-satu sambil cek game (dinamis berdasarkan list)
for i = 1, #gamesListData do
    local data = gamesListData[i]
    local targetLine = TextLines[i]
    
    local lineTextBase = tostring(i) .. ". " .. data.Name .. " ..... "
    local symbol = ""
    
    if placeId == data.ID then
        symbol = "[ ✅ ]"
        targetLine.TextColor3 = Color3.fromRGB(0, 150, 0) 
        gameFoundData = data
    else
        symbol = "[ ❌ ]"
        targetLine.TextColor3 = Color3.fromRGB(200, 0, 0) 
    end
    
    WriteText(targetLine, lineTextBase .. symbol, 0.02)
end

task.wait(0.5)

-- Logika Eksekusi berdasarkan hasil scan
if gameFoundData then
    local gameName = gameFoundData.Name
    local loadURL = ""
    
    if placeId == danceNowID then
        loadURL = "https://raw.githubusercontent.com/migii02/MigiiHUB/refs/heads/main/GameList/Dancenow.lua"
    elseif placeId == sawahIndoID then
        loadURL = "https://raw.githubusercontent.com/migii02/MigiiHUB/refs/heads/main/GameList/SawahIndo.lua"
    elseif placeId == indohangoutID then
        loadURL = "https://raw.githubusercontent.com/migii02/MigiiHUB/refs/heads/main/GameList/Indohangout.lua"
    elseif placeId == desarayapID then
        loadURL = "https://raw.githubusercontent.com/migii02/MigiiHUB/refs/heads/main/GameList/Desarayap.lua"
    elseif placeId == sambungKataID then
        loadURL = "https://raw.githubusercontent.com/migii02/MigiiHUB/refs/heads/main/GameList/Sambungkata.lua"
    end
    
    WriteText(StatusLabel, "Membuka " .. gameName .. "...", 0.03)
    SendWebhook(gameName, true)
    
    task.wait(1)
    
    -- Tutup UI Buku (mengecil ke titik anchor pojok kanan atas)
    TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    TweenService:Create(Blur, TweenInfo.new(0.5), {Size = 0}):Play()
    
    task.delay(0.5, function() 
        BookGui:Destroy() 
        Blur:Destroy()
        -- Eksekusi Script Asli
        local s, e = pcall(function()
            loadstring(game:HttpGet(loadURL))()
        end)
        if not s then
            gameFoundData = nil 
        end
    end)

else
    SendWebhook("Game Tidak Diketahui / Gagal Load (ID: " .. placeId .. ")", false)
    
    StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    WriteText(StatusLabel, "ERROR: Game tidak support!", 0.03)
    
    task.wait(1)
    
    local lineError = Instance.new("TextLabel", ListContainer)
    lineError.Size = UDim2.new(1, 0, 0, 20)
    lineError.BackgroundTransparency = 1
    lineError.TextColor3 = Color3.fromRGB(255, 60, 60)
    lineError.Font = Enum.Font.GothamBold
    lineError.TextSize = 11
    lineError.LayoutOrder = 10 
    
    WriteText(lineError, "Kick dalam 3 detik...", 0.03)
    
    task.wait(3)
    player:Kick("[ MIGII-HUB ]\nGAME NO SUPPORT / FAILED TO LOAD SCRIPT.")
end
