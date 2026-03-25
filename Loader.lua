-- =====================================================================
-- MIGIIHUB | MOBILE BLACK EDITION (WIND UI VERSION FIXED + LOGO)
-- =====================================================================

-- Load Library Wind UI (Link Terbaru)
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- Pengaturan Window (Ukuran HP & Tema Hitam Pekat dengan Custom Logo)
local Window = WindUI:CreateWindow({
    Title = "MigiiHUB | Loader",
    Icon = "rbxthumb://type=Asset&id=132319281050903&w=150&h=150", -- Logo Custom
    Author = "migii_corleone",
    Folder = "MigiiHUB",
    Size = UDim2.fromOffset(500, 320), -- Ukuran dioptimalkan untuk mobile
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HasOutline = true
})

-- Daftar Tab Menu
local HomeTab = Window:Tab({ Title = "Beranda", Icon = "home" })
local GameHubTab = Window:Tab({ Title = "Game Hub", Icon = "gamepad-2" })
local LocalFilesTab = Window:Tab({ Title = "File Lokal", Icon = "folder-search" })
local ManualTab = Window:Tab({ Title = "Manual", Icon = "link" })
local SettingsTab = Window:Tab({ Title = "Pengaturan", Icon = "settings" })

-- =====================================================================
-- TAB 1: BERANDA
-- =====================================================================
HomeTab:Paragraph({ 
    Title = "🌾 Welcome to MigiiHUB", 
    Desc = "Loader ringan (Black Edition) untuk pengguna Mobile." 
})
HomeTab:Paragraph({ 
    Title = "Info Status Game:", 
    Desc = "🟢 = Aman & Lancar\n🟡 = Sedang Diperbaiki\n🔴 = Rusak / Patched" 
})

-- =====================================================================
-- TAB 2: GAME HUB
-- =====================================================================
GameHubTab:Section({ Title = "🚜 Kategori: Game Farming" })
GameHubTab:Button({
    Title = "🟢 Sawah Indo",
    Desc = "[AKTIF] Auto Farm, Teleport, & More",
    Callback = function()
        WindUI:Notify({ Title = "Memuat...", Content = "Mengeksekusi Sawah Indo...", Duration = 3 })
        pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/migii02/MigiiHUB/refs/heads/main/SawahIndo.lua"))() end)
    end
})

GameHubTab:Section({ Title = "🌟 Kategori: Multi-Game Hub" })
GameHubTab:Button({
    Title = "🟢 Generius-HUB",
    Desc = "[AKTIF] Script multi-fungsi Generius-HUB",
    Callback = function()
        WindUI:Notify({ Title = "Memuat...", Content = "Mengeksekusi Generius-HUB...", Duration = 3 })
        pcall(function() loadstring(game:HttpGet("https://pastefy.app/jWYQsjJa/raw"))() end)
    end
})

GameHubTab:Button({
    Title = "🟢 Chloe-X",
    Desc = "[AKTIF] Script multi-fungsi Chloe-X",
    Callback = function()
        WindUI:Notify({ Title = "Memuat...", Content = "Mengeksekusi Chloe-X...", Duration = 3 })
        pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/MajestySkie/Chloe-X/main/Main/ChloeX"))() end)
    end
})

GameHubTab:Button({
    Title = "🟢 Lynx Hub",
    Desc = "[AKTIF] Script multi-fungsi Lynx Hub",
    Callback = function()
        WindUI:Notify({ Title = "Memuat...", Content = "Mengeksekusi Lynx Hub...", Duration = 3 })
        pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/4LynxX/Lynx/refs/heads/main/LynxxMain.lua"))() end)
    end
})

GameHubTab:Section({ Title = "🕹️ Kategori: Game Lainnya" })
GameHubTab:Button({
    Title = "🟢 Eugun Premium",
    Desc = "[AKTIF] Script Eugun Premium",
    Callback = function()
        WindUI:Notify({ Title = "Memuat...", Content = "Mengeksekusi Eugun Premium...", Duration = 3 })
        pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/numerouno2/eugunewupremium/refs/heads/main/main.lua"))() end)
    end
})

GameHubTab:Button({
    Title = "🟢 VIP GUNUNG (Wata X)",
    Desc = "[AKTIF] Script VIP Gunung Wata X",
    Callback = function()
        WindUI:Notify({ Title = "Memuat...", Content = "Mengeksekusi VIP Gunung...", Duration = 3 })
        pcall(function() loadstring(game:HttpGetAsync("https://pastefy.app/yRBdG7p8/raw"))() end)
    end
})

-- =====================================================================
-- TAB 3: FILE LOKAL (SCAN FOLDER MigiiHub/Loader)
-- =====================================================================
LocalFilesTab:Paragraph({
    Title = "📁 Folder: MigiiHub/Loader",
    Desc = "Tekan tombol scan untuk memunculkan daftar script dari folder lokal."
})

if makefolder then
    pcall(function() makefolder("MigiiHub") end)
    pcall(function() makefolder("MigiiHub/Loader") end)
end

local scannedFiles = {}

LocalFilesTab:Button({
    Title = "🔍 Scan Folder MigiiHub/Loader",
    Desc = "Mendeteksi script dan memunculkannya sebagai tombol",
    Callback = function()
        if not listfiles then
            WindUI:Notify({Title = "Error", Content = "Executor kamu tidak support scan file!", Duration = 3})
            return
        end

        local success, files = pcall(function() return listfiles("MigiiHub/Loader") end)

        if success and files then
            local foundCount = 0

            for _, fullPath in ipairs(files) do
                if fullPath:match("%.lua$") or fullPath:match("%.txt$") or fullPath:match("%.bin$") or fullPath:match("%.octet%-stream$") or not fullPath:match("%.") then
                    
                    local fileName = fullPath:match("[^/%\\]+$") or fullPath

                    if not scannedFiles[fullPath] then
                        scannedFiles[fullPath] = true
                        foundCount = foundCount + 1

                        LocalFilesTab:Button({
                            Title = "▶️ " .. fileName,
                            Desc = "Jalankan " .. fileName,
                            Callback = function()
                                if not readfile then
                                    WindUI:Notify({Title = "Error", Content = "Executor tidak support readfile!", Duration = 3})
                                    return
                                end

                                WindUI:Notify({Title = "Mengeksekusi...", Content = "Memuat " .. fileName, Duration = 3})

                                local execSuccess, err = pcall(function()
                                    local fileContent = readfile(fullPath)
                                    local executeScript = loadstring(fileContent)
                                    
                                    if executeScript then
                                        executeScript()
                                    else
                                        warn("Gagal mengubah teks menjadi script")
                                    end
                                end)

                                if execSuccess then
                                    WindUI:Notify({Title = "Selesai!", Content = fileName .. " berhasil dijalankan.", Duration = 4})
                                else
                                    WindUI:Notify({Title = "Gagal", Content = "Script error. Cek F9.", Duration = 4})
                                    warn("Local Execute Error: ", err)
                                end
                            end
                        })
                    end
                end
            end

            if foundCount > 0 then
                WindUI:Notify({Title = "Berhasil", Content = "Menemukan " .. foundCount .. " script di folder!", Duration = 3})
            else
                WindUI:Notify({Title = "Selesai", Content = "Tidak ada script baru di folder tersebut.", Duration = 3})
            end
        else
            WindUI:Notify({Title = "Folder Kosong", Content = "Pastikan kamu sudah menaruh file di folder MigiiHub/Loader.", Duration = 3})
        end
    end
})

-- =====================================================================
-- TAB 4: EKSEKUSI MANUAL (LINK)
-- =====================================================================
ManualTab:Paragraph({ Title = "🔗 Eksekusi Link Manual", Desc = "Paste link script dari luar (GitHub/Pastebin)." })

local LinkScriptManual = "" 
ManualTab:Input({
    Title = "Link Script", 
    Default = "", 
    Placeholder = "https://raw.github...", 
    Callback = function(Value) 
        LinkScriptManual = Value 
    end
})

ManualTab:Button({
    Title = "▶️ Jalankan Script",
    Callback = function()
        if LinkScriptManual == "" then return end
        WindUI:Notify({ Title = "Mengeksekusi...", Content = "Memuat script manual...", Duration = 3 })
        local success, err = pcall(function() loadstring(game:HttpGet(LinkScriptManual))() end)
        if not success then warn("Manual Execute Error: ", err) end
    end
})

-- =====================================================================
-- TAB 5: PENGATURAN (TUTUP LOADER)
-- =====================================================================
SettingsTab:Button({
    Title = "❌ Tutup & Hapus Loader",
    Desc = "Menghapus UI dari layar secara permanen",
    Callback = function()
        if Window and Window.Destroy then
            Window:Destroy()
        else
            local coreGui = game:GetService("CoreGui")
            local ui = coreGui:FindFirstChild("WindUI")
            if ui then ui:Destroy() end
        end
    end
})

WindUI:Notify({ Title = "Berhasil!", Content = "MigiiHUB Loader Dimuat", Duration = 4 })
