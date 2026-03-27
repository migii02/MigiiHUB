-- ======================================================== --
-- 🚀 MAIN SCRIPT MIGII-HUB (LOADER)
-- ======================================================== --

-- Base URL dari repo GitHub kamu
local githubRepo = "https://raw.githubusercontent.com/migii02/MigiiHUB/refs/heads/main/SawahIndo/Module/"

-- Daftar file module yang akan digabungkan secara otomatis (harus urut)
local modules = {
    "01_Core.lua",
    "02_Helpers.lua",
    "03_Kaitun.lua",
    "04_StandAlone.lua",
    "05_Loops.lua"
}

local successLoader, errLoader = pcall(function()
    local fullScript = ""
    
    -- Looping untuk mendownload dan menggabungkan teks dari kelima file
    for i, fileName in ipairs(modules) do
        local fileUrl = githubRepo .. fileName
        local response = game:HttpGet(fileUrl)
        
        -- Menambahkan pembatas agar rapi di dalam memori
        fullScript = fullScript .. "\n\n-- ================= [ " .. fileName .. " ] ================= --\n\n"
        fullScript = fullScript .. response
    end
    
    -- Mengeksekusi seluruh script yang sudah digabung menjadi satu kesatuan
    local func, compileErr = loadstring(fullScript)
    if not func then
        error("Compile Error: " .. tostring(compileErr))
    end
    func()
end)

-- Jika terjadi error saat mengambil file atau mengeksekusi
if not successLoader then
    warn("❌ Gagal meload MigiiHUB! Error: " .. tostring(errLoader))
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "MIGII-HUB Error",
            Text = "Gagal memanggil module dari GitHub. Cek console (F9).",
            Duration = 5
        })
    end)
end
