-- =========================================
-- FITUR STAND-ALONE AUTOS
-- =========================================

Tabs.StandAlone:AddParagraph({ Title = "📌 AREA & CLAIM LAHAN", Content = "Otomatis mengklaim lahan dan kandang yang kosong." })

local TogClaimLahan
TogClaimLahan = Tabs.StandAlone:AddToggle({ 
    Text = "🌴 Auto Claim Lahan Besar", 
    Default = false,
    Callback = function(v)
        if v and checkKaitunLock() then TogClaimLahan:SetValue(false); return end
        isAutoClaimLahan = v
        if isAutoClaimLahan then
            task.spawn(function()
                while isAutoClaimLahan do
                    if not isStandAloneAutoPlant then saStatusText = "Mencari & Claim Lahan Besar..." end
                    if myLockedLahan and myLockedLahan.Parent then 
                        sendNotification("⚠️ Lahan Besar sudah di claim!")
                        isAutoClaimLahan = false
                        TogClaimLahan:SetValue(false)
                        break 
                    end
                    local success, plot = autoClaimPlot("AreaTanamBesar", "Lahan Besar", true)
                    if success then myLockedLahan = plot; isAutoClaimLahan = false; TogClaimLahan:SetValue(false); break end
                    task.wait(2)
                end
                if not isStandAloneAutoPlant then saStatusText = "Standby" end
            end)
        else if not isStandAloneAutoPlant then saStatusText = "Standby" end end
    end
})

local TogClaimAyam
TogClaimAyam = Tabs.StandAlone:AddToggle({ 
    Text = "🐔 Auto Claim Kandang Ayam", 
    Default = false,
    Callback = function(v)
        if v and checkKaitunLock() then TogClaimAyam:SetValue(false); return end
        isAutoClaimAyam = v
        if isAutoClaimAyam then
            task.spawn(function()
                while isAutoClaimAyam do
                    if not isStandAloneAutoPlant then saStatusText = "Mencari & Claim Kandang Ayam..." end
                    if getPlot("Coop_CoopPlot_") then sendNotification("⚠️ Kandang Ayam sudah di claim!"); isAutoClaimAyam = false; TogClaimAyam:SetValue(false); break end
                    local success, _ = autoClaimPlot("CoopPlots", "Kandang Ayam", false)
                    if success then isAutoClaimAyam = false; TogClaimAyam:SetValue(false); break end
                    task.wait(2)
                end
                if not isStandAloneAutoPlant then saStatusText = "Standby" end
            end)
        else if not isStandAloneAutoPlant then saStatusText = "Standby" end end
    end
})

local TogClaimSapi
TogClaimSapi = Tabs.StandAlone:AddToggle({ 
    Text = "🐄 Auto Claim Kandang Sapi", 
    Default = false,
    Callback = function(v)
        if v and checkKaitunLock() then TogClaimSapi:SetValue(false); return end
        isAutoClaimSapi = v
        if isAutoClaimSapi then
            task.spawn(function()
                while isAutoClaimSapi do
                    if not isStandAloneAutoPlant then saStatusText = "Mencari & Claim Kandang Sapi..." end
                    if getPlot("Barn_Plot_") then sendNotification("⚠️ Kandang Sapi sudah di claim!"); isAutoClaimSapi = false; TogClaimSapi:SetValue(false); break end
                    local success, _ = autoClaimPlot("BarnPlots", "Kandang Sapi", false)
                    if success then isAutoClaimSapi = false; TogClaimSapi:SetValue(false); break end
                    task.wait(2)
                end
                if not isStandAloneAutoPlant then saStatusText = "Standby" end
            end)
        else if not isStandAloneAutoPlant then saStatusText = "Standby" end end
    end
})

Tabs.StandAlone:AddParagraph({ Title = "🌱 AUTO TANAM / PLANT", Content = "Fitur tanam khusus Stand Alone. Atur limit dan bibitnya di sini. Tanaman akan ditanam tepat di bawah karaktermu." })

Tabs.StandAlone:AddTextBox({
    Text = "Batas Limit Tanam (Stand Alone)",
    Default = "15",
    Placeholder = "Maksimal 25",
    Callback = function(text)
        local num = tonumber(text)
        if num then 
            if num > 25 then num = 25 end; if num < 1 then num = 1 end; saCustomLimit = math.floor(num)
        else saCustomLimit = 15 end
        sendNotification("Batas Limit Stand Alone diatur ke: " .. tostring(saCustomLimit))
    end
})

Tabs.StandAlone:AddButton({
    Text = "🔍 Scan Bibit Di Tas (Khusus StandAlone)",
    Callback = function()
        pcall(function()
            sendNotification("⏳ Sedang memindai tas Anda...")
            local foundBibit = {}
            local char = player.Character
            local backpack = player:FindFirstChild("Backpack")
            
            local function cleanBibitName(name) 
                local base = string.gsub(name, "%s*[%[%(]?%d+[%]%)]?$", "")
                base = string.gsub(base, "%s*[xX]%d+$", "")
                return string.match(base, "^%s*(.-)%s*$") or name 
            end
            
            local function cekItem(item) 
                if item:IsA("Tool") then 
                    local namaLower = string.lower(item.Name)
                    if string.find(namaLower, "bibit") and not string.find(namaLower, "sawit") and not string.find(namaLower, "durian") then 
                        foundBibit[cleanBibitName(item.Name)] = true 
                    end 
                end 
            end
            
            if char then for _, item in ipairs(char:GetChildren()) do cekItem(item) end end
            if backpack then for _, item in ipairs(backpack:GetChildren()) do cekItem(item) end end
            
            local options1 = {}
            local options2 = {"❌ Single Seeds"}
            for k, _ in pairs(foundBibit) do table.insert(options1, k); table.insert(options2, k) end
            if #options1 == 0 then table.insert(options1, "Tidak ada bibit di tas") end
            
            if _G.DropSABibit1 then _G.DropSABibit1:Refresh(options1); _G.DropSABibit1:SetValue(options1[1]) end
            if _G.DropSABibit2 then _G.DropSABibit2:Refresh(options2); _G.DropSABibit2:SetValue(options2[1]) end
            sendNotification("✅ Scan selesai! Silakan pilih bibit.")
        end)
    end
})

_G.DropSABibit1 = Tabs.StandAlone:AddDropdown({ Text = "🔽 Pilih Bibit 1 (StandAlone)", Items = {"Scan Bibit Dulu!"}, Multi = false, Default = "Scan Bibit Dulu!", Callback = function(v) saSelectedBibit1 = v; sendNotification("Bibit 1 StandAlone dipilih: " .. v) end })
_G.DropSABibit2 = Tabs.StandAlone:AddDropdown({ Text = "🔽 Pilih Bibit 2 (Opsional SA)", Items = {"Scan Bibit Dulu!"}, Multi = false, Default = "Scan Bibit Dulu!", Callback = function(v) if v == "❌ Single Seeds" then saSelectedBibit2 = nil; sendNotification("Mode Single Seed (SA) diaktifkan.") else saSelectedBibit2 = v; sendNotification("Bibit 2 StandAlone dipilih: " .. v) end end })

local TogSA_AutoPlant
TogSA_AutoPlant = Tabs.StandAlone:AddToggle({ 
    Text = "🌱 Auto Plant Bibit (Berdiri Langsung Tanam)", 
    Default = false,
    Callback = function(v)
        if v and checkKaitunLock() then TogSA_AutoPlant:SetValue(false); return end
        
        if v and (not saSelectedBibit1 or saSelectedBibit1 == "Scan Bibit Dulu!" or saSelectedBibit1 == "Tidak ada bibit di tas") then
            sendNotification("⚠️ Scan dan pilih Bibit 1 di atas terlebih dahulu!")
            isStandAloneAutoPlant = false
            TogSA_AutoPlant:SetValue(false)
            return
        end
        
        isStandAloneAutoPlant = v
        if isStandAloneAutoPlant then
            TogGlobalDash:SetValue(true) 
            saCurrentTurn = 1
            
            task.spawn(function()
                local RemotesFolder = ReplicatedStorage:WaitForChild("Remotes", 5)
                local plantCrop = RemotesFolder and RemotesFolder:WaitForChild("TutorialRemotes", 5):FindFirstChild("PlantCrop")
                
                while isStandAloneAutoPlant do
                    task.wait(0.1)
                    if isPriorityTaskActive then continue end
                    
                    if saCustomLimit ~= "Unlimited" and saPlantedCount >= saCustomLimit then
                        saStatusText = "Batas Tanam Tercapai! Menunggu panen..."
                        task.wait(1)
                        continue
                    end
                    
                    pcall(function()
                        local currentHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        if currentHrp then
                            local targetBibit = saSelectedBibit1
                            if saSelectedBibit2 ~= nil and saCurrentTurn == 2 then targetBibit = saSelectedBibit2 end
                            saStatusText = "Mencari bibit " .. targetBibit
                            if cariDanPegang(targetBibit) then
                                if plantCrop then
                                    saStatusText = "Menanam " .. targetBibit
                                    local targetPos = currentHrp.Position 
                                    plantCrop:FireServer(targetPos)
                                    saPlantedCount = saPlantedCount + 1 
                                    if saSelectedBibit2 ~= nil then saCurrentTurn = (saCurrentTurn == 1) and 2 or 1 end
                                    task.wait(0.2)
                                end
                            else saStatusText = "Menunggu Bibit di Tas..."; task.wait(0.5) end
                        end
                    end)
                end
                saStatusText = "Standby"
            end)
        else 
            saStatusText = "Standby" 
            if not isKaitunActive then TogGlobalDash:SetValue(false) end 
        end
    end
})

local TogSA_AutoPlantBesar
TogSA_AutoPlantBesar = Tabs.StandAlone:AddToggle({ 
    Text = "🌴 Auto Plant Lahan Besar", 
    Default = false,
    Callback = function(v)
        if v and checkKaitunLock() then TogSA_AutoPlantBesar:SetValue(false); return end
        isAutoPlantBesar = v
        if isAutoPlantBesar then
            task.spawn(function()
                local RemotesFolder = ReplicatedStorage:WaitForChild("Remotes", 5)
                local plantLahanCrop = RemotesFolder and RemotesFolder:WaitForChild("TutorialRemotes", 5):FindFirstChild("PlantLahanCrop")
                while isAutoPlantBesar do
                    task.wait(1)
                    if isPriorityTaskActive then continue end

                    if not isStandAloneAutoPlant then saStatusText = "Mengecek & Plant Lahan Besar..." end
                    if myLockedLahan and myLockedLahan.Parent then
                        local lahanPos = myLockedLahan:GetPivot().Position; local char = player.Character;
                        local hrp = char and char:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            local hasSawit = false; local hasDurian = false; local activeCrops = workspace:FindFirstChild("ActiveCrops")
                            if activeCrops then
                                for _, crop in ipairs(activeCrops:GetChildren()) do
                                    if string.find(crop.Name, tostring(player.UserId)) and (crop:GetPivot().Position - lahanPos).Magnitude < 45 then
                                        local cName = string.lower(crop:GetAttribute("SeedType") or crop.Name)
                                        if string.find(cName, "sawit") then hasSawit = true end;
                                        if string.find(cName, "durian") then hasDurian = true end
                                    end
                                end
                            end

                            local originalPos = hrp.CFrame; local didTeleport = false
                            if not hasSawit and cariDanPegang("Bibit Sawit") then 
                                if not isStandAloneAutoPlant then saStatusText = "Menanam Sawit (TP)..." end
                                hrp.CFrame = CFrame.new(lahanPos + Vector3.new(0, 3, 0)); didTeleport = true; task.wait(0.5); if plantLahanCrop then plantLahanCrop:FireServer(lahanPos + Vector3.new(3.5, 0, 3.5)) end;
                                task.wait(1) 
                            end
                            if not hasDurian and cariDanPegang("Bibit Durian") then 
                                if not isStandAloneAutoPlant then saStatusText = "Menanam Durian (TP)..." end
                                hrp.CFrame = CFrame.new(lahanPos + Vector3.new(0, 3, 0)); didTeleport = true; task.wait(0.5); if plantLahanCrop then plantLahanCrop:FireServer(lahanPos + Vector3.new(-3.5, 0, -3.5)) end;
                                task.wait(1) 
                            end
                            if didTeleport then hrp.CFrame = originalPos end
                        end
                    end
                end
                if not isStandAloneAutoPlant then saStatusText = "Standby" end
            end)
        else if not isStandAloneAutoPlant then saStatusText = "Standby" end end
    end
})

Tabs.StandAlone:AddParagraph({ Title = "🌾 AUTO PANEN / HARVEST", Content = "Panen dan Teleport ke tanaman yang sudah siap." })

local TogSA_AutoHarvest
TogSA_AutoHarvest = Tabs.StandAlone:AddToggle({ 
    Text = "🌾 Auto Harvest (Sekitar Posisi)", 
    Default = false,
    Callback = function(v)
        if v and checkKaitunLock() then TogSA_AutoHarvest:SetValue(false); return end
        isStandAloneAutoHarvest = v
        local toggleRemote = nil; pcall(function() toggleRemote = ReplicatedStorage.Remotes.TutorialRemotes.ToggleAutoHarvest end)
        if isStandAloneAutoHarvest then
            if toggleRemote then pcall(function() toggleRemote:FireServer(true) end) end
            task.spawn(function()
                local myUserId = tostring(player.UserId)
                while isStandAloneAutoHarvest do
                    task.wait(1)
                    if not isStandAloneAutoPlant then saStatusText = "Auto Harvest (Sekitar)..." end
                    local char = player.Character;
                    local hrp = char and char:FindFirstChild("HumanoidRootPart"); local activeCrops = workspace:FindFirstChild("ActiveCrops")
                    if hrp and activeCrops then
                        for _, crop in ipairs(activeCrops:GetChildren()) do
                            if not isStandAloneAutoHarvest then break end
                            if string.find(crop.Name, "Crop_") and string.find(crop.Name, myUserId) then
                                local prompt = crop:FindFirstChildWhichIsA("ProximityPrompt", true)
                                if prompt and prompt.Enabled then
                                    local cropPos = crop:IsA("Model") and crop:GetPivot().Position or crop.Position
                                    if (cropPos - hrp.Position).Magnitude <= 20 then pcall(function() if fireproximityprompt then fireproximityprompt(prompt, 1, true) end end);
                                    task.wait(0.2) end
                                end
                            end
                        end
                    end
                end
                if not isStandAloneAutoPlant then saStatusText = "Standby" end
            end)
        else 
            if not isStandAloneAutoPlant then saStatusText = "Standby" end
            if toggleRemote then pcall(function() toggleRemote:FireServer(false) end) end 
        end
    end
})

local TogAutoTPBiasa
TogAutoTPBiasa = Tabs.StandAlone:AddToggle({ 
    Text = "🚀 Auto TP Harvest (Lahan Biasa)", 
    Default = false,
    Callback = function(v)
        if v and checkKaitunLock() then TogAutoTPBiasa:SetValue(false); return end
        isAutoTPHarvestBiasaOn = v
        local toggleRemote = nil; pcall(function() toggleRemote = ReplicatedStorage.Remotes.TutorialRemotes.ToggleAutoHarvest end)
        if isAutoTPHarvestBiasaOn then
            if toggleRemote then pcall(function() toggleRemote:FireServer(true) end) end
            task.spawn(function()
                local myUserId = tostring(player.UserId)
                while isAutoTPHarvestBiasaOn do
                    local hasHarvested = false; local activeCrops = workspace:FindFirstChild("ActiveCrops")
                    if activeCrops then
                        for _, crop in ipairs(activeCrops:GetChildren()) do
                            if not isAutoTPHarvestBiasaOn then break end
                            if string.find(crop.Name, "Crop_") and string.find(crop.Name, myUserId) then
                                if not isCropBesar(crop) then
                                    local prompt = crop:FindFirstChildWhichIsA("ProximityPrompt", true)
                                    if prompt and prompt.Enabled then
                                        if not isStandAloneAutoPlant then saStatusText = "TP Harvest Lahan Biasa..." end
                                        local char = player.Character;
                                        local hrp = char and char:FindFirstChild("HumanoidRootPart")
                                        if hrp then
                                            pcall(function() hrp.CFrame = (crop:IsA("Model") and crop:GetPivot() or crop.CFrame) * CFrame.new(0, 3, 0) end);
                                            task.wait(0.4)
                                            if isAutoTPHarvestBiasaOn and fireproximityprompt then pcall(function() fireproximityprompt(prompt, 1, true) end);
                                            hasHarvested = true; task.wait(0.5) end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if not hasHarvested then 
                        if not isStandAloneAutoPlant then saStatusText = "Mencari Tanaman Biasa Siap..." end
                        task.wait(2) 
                    else task.wait(0.5) end
                end
                if not isStandAloneAutoPlant then saStatusText = "Standby" end
            end)
        else 
            if not isStandAloneAutoPlant then saStatusText = "Standby" end
            if toggleRemote then pcall(function() toggleRemote:FireServer(false) end) end 
        end
    end
})

local TogAutoTPBesar
TogAutoTPBesar = Tabs.StandAlone:AddToggle({ 
    Text = "🚀 Auto TP Harvest (Sawit/Durian)", 
    Default = false,
    Callback = function(v)
        if v and checkKaitunLock() then TogAutoTPBesar:SetValue(false); return end
        isAutoTPHarvestBesarOn = v
        local toggleRemote = nil; pcall(function() toggleRemote = ReplicatedStorage.Remotes.TutorialRemotes.ToggleAutoHarvest end)
        if isAutoTPHarvestBesarOn then
            if toggleRemote then pcall(function() toggleRemote:FireServer(true) end) end
            task.spawn(function()
                local myUserId = tostring(player.UserId)
                while isAutoTPHarvestBesarOn do
                    local hasHarvested = false; local didTeleport = false; local initialCFrame = nil; local activeCrops = workspace:FindFirstChild("ActiveCrops")
                    if activeCrops then
                        for _, crop in ipairs(activeCrops:GetChildren()) do
                            if not isAutoTPHarvestBesarOn then break end
                            if string.find(crop.Name, "Crop_") and string.find(crop.Name, myUserId) then
                                if isCropBesar(crop) then
                                    local prompt = crop:FindFirstChildWhichIsA("ProximityPrompt", true)
                                    if prompt and prompt.Enabled then
                                        if not isStandAloneAutoPlant then saStatusText = "TP Harvest Lahan Besar..." end
                                        local char = player.Character; local hrp = char and char:FindFirstChild("HumanoidRootPart")
                                        if hrp then
                                            if not didTeleport then initialCFrame = hrp.CFrame; didTeleport = true end
                                            pcall(function() hrp.CFrame = (crop:IsA("Model") and crop:GetPivot() or crop.CFrame) * CFrame.new(0, 3, 0) end);
                                            task.wait(0.4)
                                            if isAutoTPHarvestBesarOn and fireproximityprompt then pcall(function() fireproximityprompt(prompt, 1, true) end);
                                            hasHarvested = true; task.wait(0.5) end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if didTeleport and initialCFrame then task.wait(0.5); local char = player.Character; local hrp = char and char:FindFirstChild("HumanoidRootPart"); if hrp then pcall(function() hrp.CFrame = initialCFrame end) end end
                    if not hasHarvested then 
                        if not isStandAloneAutoPlant then saStatusText = "Mencari Lahan Besar Siap..." end
                        task.wait(2) 
                    else task.wait(0.5) end
                end
                if not isStandAloneAutoPlant then saStatusText = "Standby" end
            end)
        else 
            if not isStandAloneAutoPlant then saStatusText = "Standby" end
            if toggleRemote then pcall(function() toggleRemote:FireServer(false) end) end 
        end
    end
})

Tabs.StandAlone:AddParagraph({ Title = "🐮 HEWAN TERNAK (AYAM & SAPI)", Content = "Urus hasil ternak secara otomatis." })

local TogCollectEgg
TogCollectEgg = Tabs.StandAlone:AddToggle({ 
    Text = "🥚 Auto Collect Egg & Kasih Makan", 
    Default = false,
    Callback = function(v)
        if v and checkKaitunLock() then TogCollectEgg:SetValue(false); return end
        isAutoCollectEggOn = v
        if isAutoCollectEggOn then
            task.spawn(function()
                while isAutoCollectEggOn do
                    local plot = getPlot("Coop_CoopPlot_")
                    if plot then
                        if not isStandAloneAutoPlant then saStatusText = "Collect & Feed Ayam..." end
                        local hasCollected = false; local preCycleCFrame = nil
                        for i = 1, 12 do
                            if not isAutoCollectEggOn then break end
                            local currentChar = player.Character; local hrp = currentChar and currentChar:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                local eggVisual = plot:FindFirstChild("EggVisual_" .. tostring(i))
                                if eggVisual then
                                    local eggPrompt = eggVisual:FindFirstChildWhichIsA("ProximityPrompt", true)
                                    if eggPrompt and eggPrompt.Enabled then
                                        if not preCycleCFrame then preCycleCFrame = hrp.CFrame end
                                        pcall(function() hrp.CFrame = (eggVisual:IsA("Model") and eggVisual:GetPivot() or eggVisual.CFrame) * CFrame.new(0, 3, 0) end);
                                        task.wait(0.3)
                                        if isAutoCollectEggOn and fireproximityprompt then pcall(function() fireproximityprompt(eggPrompt, 1, true) end);
                                        task.wait(0.5); hasCollected = true end
                                    end
                                end
                                local slotMarkers = plot:FindFirstChild("SlotMarkers");
                                if slotMarkers then local slot = slotMarkers:FindFirstChild("Slot" .. tostring(i)); if slot then local feedPrompt = slot:FindFirstChildWhichIsA("ProximityPrompt", true);
                                if feedPrompt and feedPrompt.Enabled then if not preCycleCFrame then preCycleCFrame = hrp.CFrame end;
                                pcall(function() hrp.CFrame = (slot:IsA("Model") and slot:GetPivot() or slot.CFrame) * CFrame.new(0, 3, 0) end); task.wait(0.3);
                                if isAutoCollectEggOn and fireproximityprompt then pcall(function() fireproximityprompt(feedPrompt, 1, true) end); autoConfirmUI(); task.wait(0.6);
                                hasCollected = true end end end end
                            end
                        end
                        if isAutoCollectEggOn then if hasCollected and preCycleCFrame then local returnHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart");
                        if returnHrp then pcall(function() returnHrp.CFrame = preCycleCFrame end) end end;
                        task.wait(5) end
                    else 
                        if not isStandAloneAutoPlant then saStatusText = "Menunggu Kandang Ayam..." end
                        task.wait(5) 
                    end
                end
                if not isStandAloneAutoPlant then saStatusText = "Standby" end
            end)
        else if not isStandAloneAutoPlant then saStatusText = "Standby" end end
    end
})

local TogCollectMilk
TogCollectMilk = Tabs.StandAlone:AddToggle({ 
    Text = "🥛 Auto Collect Milk & Kasih Makan", 
    Default = false,
    Callback = function(v)
        if v and checkKaitunLock() then TogCollectMilk:SetValue(false); return end
        isAutoCollectMilkOn = v
        if isAutoCollectMilkOn then
            task.spawn(function()
                while isAutoCollectMilkOn do
                    local plot = getPlot("Barn_Plot_")
                    if plot then
                        if not isStandAloneAutoPlant then saStatusText = "Collect & Feed Sapi..." end
                        local hasCollected = false; local preCycleCFrame = nil
                        for i = 1, limitSapi do
                            if not isAutoCollectMilkOn then break end
                            local currentChar = player.Character; local hrp = currentChar and currentChar:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                local milkVisual = plot:FindFirstChild("MilkVisual_" .. tostring(i))
                                if milkVisual then
                                    local milkPrompt = milkVisual:FindFirstChildWhichIsA("ProximityPrompt", true)
                                    if milkPrompt and milkPrompt.Enabled then
                                        if not preCycleCFrame then preCycleCFrame = hrp.CFrame end
                                        pcall(function() hrp.CFrame = (milkVisual:IsA("Model") and milkVisual:GetPivot() or milkVisual.CFrame) * CFrame.new(0, 3, 0) end);
                                        task.wait(0.3)
                                        if isAutoCollectMilkOn and fireproximityprompt then pcall(function() fireproximityprompt(milkPrompt, 1, true) end);
                                        task.wait(0.5); hasCollected = true end
                                    end
                                end
                                local slotMarkers = plot:FindFirstChild("SlotMarkers");
                                if slotMarkers then local slot = slotMarkers:FindFirstChild("Slot" .. tostring(i)); if slot then local feedPrompt = slot:FindFirstChildWhichIsA("ProximityPrompt", true);
                                if feedPrompt and feedPrompt.Enabled then if not preCycleCFrame then preCycleCFrame = hrp.CFrame end;
                                pcall(function() hrp.CFrame = (slot:IsA("Model") and slot:GetPivot() or slot.CFrame) * CFrame.new(0, 3, 0) end); task.wait(0.3);
                                if isAutoCollectMilkOn and fireproximityprompt then pcall(function() fireproximityprompt(feedPrompt, 1, true) end); autoConfirmUI(); task.wait(0.6);
                                hasCollected = true end end end end
                            end
                        end
                        if isAutoCollectMilkOn then if hasCollected and preCycleCFrame then local returnHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart");
                        if returnHrp then pcall(function() returnHrp.CFrame = preCycleCFrame end) end end;
                        task.wait(5) end
                    else 
                        if not isStandAloneAutoPlant then saStatusText = "Menunggu Kandang Sapi..." end
                        task.wait(5) 
                    end
                end
                if not isStandAloneAutoPlant then saStatusText = "Standby" end
            end)
        else if not isStandAloneAutoPlant then saStatusText = "Standby" end end
    end
})

Tabs.StandAlone:AddParagraph({ Title = "💰 AUTO SELL / JUAL", Content = "Otomatis jual hasil panen ke NPC." })

local TogAutoSellEgg
TogAutoSellEgg = Tabs.StandAlone:AddToggle({ 
    Text = "💰 Auto Sell Telur", 
    Default = false,
    Callback = function(v)
        if v and checkKaitunLock() then TogAutoSellEgg:SetValue(false); return end
        isAutoSellEggOn = v
        if isAutoSellEggOn then
            task.spawn(function()
                while isAutoSellEggOn do
                    local char = player.Character; local backpack = player:FindFirstChild("Backpack")
                    local hasEgg = false
                    local function checkEgg(parentObj)
                        if parentObj then for _, item in ipairs(parentObj:GetChildren()) do if item:IsA("Tool") and (string.find(string.lower(item.Name), "egg") or string.find(string.lower(item.Name), "telur")) then hasEgg = true; break end end end
                    end
                    checkEgg(char); checkEgg(backpack)

                    if hasEgg then
                        if not isStandAloneAutoPlant then saStatusText = "Teleport Jual Telur..." end
                        local npcPrompt = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("NPCPedagangTelur") and workspace.NPCs.NPCPedagangTelur:FindFirstChild("NPCPedagangTelur") and workspace.NPCs.NPCPedagangTelur.NPCPedagangTelur:FindFirstChildWhichIsA("ProximityPrompt", true)
                        local hrp = char and char:FindFirstChild("HumanoidRootPart")
                        if npcPrompt and npcPrompt.Enabled and hrp then
                            local oldPos = hrp.CFrame
                            pcall(function() hrp.CFrame = npcPrompt.Parent.CFrame * CFrame.new(0, 3, 0) end)
                            task.wait(0.5)
                            if isAutoSellEggOn and fireproximityprompt then
                                pcall(function() fireproximityprompt(npcPrompt, 1, true) end)
                                autoConfirmUI()
                                task.wait(1.5)
                                pcall(function() hrp.CFrame = oldPos end)
                            end
                        end
                    end
                    task.wait(5)
                end
                if not isStandAloneAutoPlant then saStatusText = "Standby" end
            end)
        else if not isStandAloneAutoPlant then saStatusText = "Standby" end end
    end
})

local TogAutoSellMilk
TogAutoSellMilk = Tabs.StandAlone:AddToggle({ 
    Text = "💰 Auto Sell Susu", 
    Default = false,
    Callback = function(v)
        if v and checkKaitunLock() then TogAutoSellMilk:SetValue(false); return end
        isAutoSellMilkOn = v
        if isAutoSellMilkOn then
            task.spawn(function()
                while isAutoSellMilkOn do
                    local char = player.Character; local backpack = player:FindFirstChild("Backpack")
                    local hasMilk = false
                    local function checkMilk(parentObj)
                        if parentObj then for _, item in ipairs(parentObj:GetChildren()) do if item:IsA("Tool") and (string.find(string.lower(item.Name), "milk") or string.find(string.lower(item.Name), "susu")) then hasMilk = true; break end end end
                    end
                    checkMilk(char); checkMilk(backpack)

                    if hasMilk then
                        if not isStandAloneAutoPlant then saStatusText = "Teleport Jual Susu..." end
                        local npcPrompt = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("NPCPedagangSusu") and workspace.NPCs.NPCPedagangSusu:FindFirstChildWhichIsA("ProximityPrompt", true)
                        local hrp = char and char:FindFirstChild("HumanoidRootPart")
                        if npcPrompt and npcPrompt.Enabled and hrp then
                            local oldPos = hrp.CFrame
                            pcall(function() hrp.CFrame = npcPrompt.Parent.CFrame * CFrame.new(0, 3, 0) end)
                            task.wait(0.5)
                            if isAutoSellMilkOn and fireproximityprompt then
                                pcall(function() fireproximityprompt(npcPrompt, 1, true) end)
                                autoConfirmUI()
                                task.wait(1.5)
                                pcall(function() hrp.CFrame = oldPos end)
                            end
                        end
                    end
                    task.wait(5)
                end
                if not isStandAloneAutoPlant then saStatusText = "Standby" end
            end)
        else if not isStandAloneAutoPlant then saStatusText = "Standby" end end
    end
})

local TogAutoSellDurian
TogAutoSellDurian = Tabs.StandAlone:AddToggle({ 
    Text = "💰 Auto Sell Durian", 
    Default = false,
    Callback = function(v)
        if v and checkKaitunLock() then TogAutoSellDurian:SetValue(false); return end
        isAutoSellDurianOn = v
        if isAutoSellDurianOn then
            task.spawn(function()
                while isAutoSellDurianOn do
                    local char = player.Character
                    local backpack = player:FindFirstChild("Backpack")
                    local hasDurian = false
                    local function checkDurian(parentObj)
                        if parentObj then for _, item in ipairs(parentObj:GetChildren()) do if item:IsA("Tool") and string.find(string.lower(item.Name), "durian") and not string.find(string.lower(item.Name), "bibit") then hasDurian = true; break end end end
                    end
                    checkDurian(char); checkDurian(backpack)

                    if hasDurian then
                        if not isStandAloneAutoPlant then saStatusText = "Teleport Jual Durian..." end
                        local npcPrompt = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("NPC_PedagangSawit") and workspace.NPCs.NPC_PedagangSawit:FindFirstChild("NPCPedagangSawit") and workspace.NPCs.NPC_PedagangSawit.NPCPedagangSawit:FindFirstChildWhichIsA("ProximityPrompt", true)
                        local hrp = char and char:FindFirstChild("HumanoidRootPart")
                        if npcPrompt and npcPrompt.Enabled and hrp then
                            local oldPos = hrp.CFrame
                            pcall(function() hrp.CFrame = npcPrompt.Parent.CFrame * CFrame.new(0, 3, 0) end)
                            task.wait(0.5)
                            if isAutoSellDurianOn and fireproximityprompt then
                                pcall(function() fireproximityprompt(npcPrompt, 1, true) end)
                                task.wait(1)
                                autoClickBuahUI("Durian")
                                task.wait(1.5)
                                pcall(function() hrp.CFrame = oldPos end)
                            end
                        end
                    end
                    task.wait(5)
                end
                if not isStandAloneAutoPlant then saStatusText = "Standby" end
            end)
        else if not isStandAloneAutoPlant then saStatusText = "Standby" end end
    end
})

local TogAutoSellSawit
TogAutoSellSawit = Tabs.StandAlone:AddToggle({ 
    Text = "💰 Auto Sell Sawit", 
    Default = false,
    Callback = function(v)
        if v and checkKaitunLock() then TogAutoSellSawit:SetValue(false); return end
        isAutoSellSawitOn = v
        if isAutoSellSawitOn then
            task.spawn(function()
                while isAutoSellSawitOn do
                    local char = player.Character
                    local backpack = player:FindFirstChild("Backpack")
                    local hasSawit = false
                    local function checkSawit(parentObj)
                        if parentObj then for _, item in ipairs(parentObj:GetChildren()) do if item:IsA("Tool") and string.find(string.lower(item.Name), "sawit") and not string.find(string.lower(item.Name), "bibit") then hasSawit = true; break end end end
                    end
                    checkSawit(char); checkSawit(backpack)

                    if hasSawit then
                        if not isStandAloneAutoPlant then saStatusText = "Teleport Jual Sawit..." end
                        local npcPrompt = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("NPC_PedagangSawit") and workspace.NPCs.NPC_PedagangSawit:FindFirstChild("NPCPedagangSawit") and workspace.NPCs.NPC_PedagangSawit.NPCPedagangSawit:FindFirstChildWhichIsA("ProximityPrompt", true)
                        local hrp = char and char:FindFirstChild("HumanoidRootPart")
                        if npcPrompt and npcPrompt.Enabled and hrp then
                            local oldPos = hrp.CFrame
                            pcall(function() hrp.CFrame = npcPrompt.Parent.CFrame * CFrame.new(0, 3, 0) end)
                            task.wait(0.5)
                            if isAutoSellSawitOn and fireproximityprompt then
                                pcall(function() fireproximityprompt(npcPrompt, 1, true) end)
                                task.wait(1)
                                autoClickBuahUI("Sawit")
                                task.wait(1.5)
                                pcall(function() hrp.CFrame = oldPos end)
                            end
                        end
                    end
                    task.wait(5)
                end
                if not isStandAloneAutoPlant then saStatusText = "Standby" end
            end)
        else if not isStandAloneAutoPlant then saStatusText = "Standby" end end
    end
})

-- =========================================
-- TAB BARU: ETC FITUR
-- =========================================
Tabs.EtcFitur:AddParagraph({ Title = "🛏️ FITUR TIDUR (SLEEP)", Content = "Fitur untuk istirahat / tidur otomatis. Akan mendeteksi waktu tidur." })

Tabs.EtcFitur:AddButton({
    Text = "🛏️ Manual Sleep (Teleport & Tidur)",
    Callback = function()
        if checkKaitunLock() then return end
        
        local foundPrompt = nil
        local sleepFolder = workspace:FindFirstChild("Sleep")
        if sleepFolder then
            for _, bed in ipairs(sleepFolder:GetChildren()) do
                local p = bed:FindFirstChildWhichIsA("ProximityPrompt", true)
                if p and p.Enabled then foundPrompt = p; break end
            end
        end
        
        if foundPrompt then
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local originalPos = hrp.CFrame
                pcall(function() hrp.CFrame = foundPrompt.Parent.CFrame * CFrame.new(0, 3, 0) end)
                task.wait(0.5)
                if fireproximityprompt then pcall(function() fireproximityprompt(foundPrompt, 1, true) end) end
                sendNotification("Berhasil teleport ke kasur!")
                
                task.spawn(function()
                    task.wait(3) 
                    local isSleeping = true
                    while isSleeping do
                        isSleeping = false
                        pcall(function()
                            local currChar = player.Character
                            if currChar then
                                for _, desc in ipairs(currChar:GetDescendants()) do
                                    if desc:IsA("TextLabel") and desc.Visible then
                                        local txt = string.lower(desc.Text)
                                        if string.find(txt, "tidur") or string.find(txt, "malam") or string.find(txt, "⏰") then
                                            if not desc:FindFirstAncestor("MigiiFloatingMonitor") and not desc:FindFirstAncestor("MigiiHubToggleUI") then
                                                isSleeping = true; break
                                            end
                                        end
                                    end
                                end
                            end
                            if not isSleeping then
                                local pGui = player:FindFirstChild("PlayerGui")
                                if pGui then
                                    for _, desc in ipairs(pGui:GetDescendants()) do
                                        if desc:IsA("TextLabel") and desc.Visible then
                                            local txt = string.lower(desc.Text)
                                            if string.find(txt, "tidur") or string.find(txt, "malam") or string.find(txt, "⏰") then
                                                if not desc:FindFirstAncestor("MigiiFloatingMonitor") and not desc:FindFirstAncestor("MigiiHubToggleUI") then
                                                    isSleeping = true; break
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end)
                        task.wait(1)
                    end
                    local currHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if currHrp then
                        pcall(function() currHrp.CFrame = originalPos end)
                        sendNotification("Kamu sudah bangun! Kembali ke posisi semula.")
                    end
                end)
            end
        else
            sendNotification("Semua tempat tidur sedang dipakai atau tidak ditemukan!")
        end
    end
})

local TogAutoSleep
TogAutoSleep = Tabs.EtcFitur:AddToggle({ 
    Text = "💤 Auto Sleep (Mode AFK)", 
    Default = false,
    Callback = function(v)
        if v and checkKaitunLock() then TogAutoSleep:SetValue(false); return end
        
        isAutoSleepOn = v
        if isAutoSleepOn then
            task.spawn(function()
                local preSleepCFrame = nil
                local wasSleeping = false
                
                while isAutoSleepOn do
                    local isSleeping = false
                    local sleepText = "🚶 Belum Tidur"
                    
                    pcall(function()
                        local function scanForSleepText(parentObj)
                            for _, desc in ipairs(parentObj:GetDescendants()) do
                                if desc:IsA("TextLabel") and desc.Visible then
                                    local txt = string.lower(desc.Text)
                                    if string.find(txt, "tidur") or string.find(txt, "malam") or string.find(txt, "⏰") then
                                        if not desc:FindFirstAncestor("MigiiFloatingMonitor") and not desc:FindFirstAncestor("MigiiHubToggleUI") then
                                            isSleeping = true
                                            sleepText = desc.Text
                                            break
                                        end
                                    end
                                end
                            end
                        end
                        if player.Character then scanForSleepText(player.Character) end
                        if not isSleeping then
                            local pGui = player:FindFirstChild("PlayerGui")
                            if pGui then scanForSleepText(pGui) end
                        end
                    end)

                    globalSleepStatus = isSleeping and ("💤 " .. stripRichText(sleepText)) or "🚶 Belum Tidur"

                    if isSleeping then
                        wasSleeping = true
                        if not isStandAloneAutoPlant then saStatusText = "AFK Memulihkan Energi..." end
                        task.wait(1)
                    else
                        if wasSleeping then
                            if preSleepCFrame then
                                local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                                if hrp then
                                    pcall(function() hrp.CFrame = preSleepCFrame end)
                                end
                                sendNotification("Kamu sudah bangun! Kembali ke posisi semula.")
                            end
                            wasSleeping = false
                            preSleepCFrame = nil
                            task.wait(1) 
                        end
                        
                        if not isStandAloneAutoPlant then saStatusText = "Mencari Kasur Kosong..." end
                        local foundPrompt = nil
                        local sleepFolder = workspace:FindFirstChild("Sleep")
                        if sleepFolder then
                            for _, bed in ipairs(sleepFolder:GetChildren()) do
                                local p = bed:FindFirstChildWhichIsA("ProximityPrompt", true)
                                if p and p.Enabled then foundPrompt = p; break end
                            end
                        end
                        
                        if foundPrompt then
                            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                if not preSleepCFrame then
                                    preSleepCFrame = hrp.CFrame 
                                end
                                pcall(function() hrp.CFrame = foundPrompt.Parent.CFrame * CFrame.new(0, 3, 0) end)
                                task.wait(0.5)
                                if isAutoSleepOn and fireproximityprompt then pcall(function() fireproximityprompt(foundPrompt, 1, true) end) end
                                task.wait(2) 
                            end
                        else
                            task.wait(2)
                        end
                    end
                end
                globalSleepStatus = "🚶 Belum Tidur"
                if not isStandAloneAutoPlant then saStatusText = "Standby" end
            end)
        else 
            globalSleepStatus = "🚶 Belum Tidur"
            if not isStandAloneAutoPlant then saStatusText = "Standby" end 
        end
    end
})

Tabs.EtcFitur:AddParagraph({ Title = "🎒 AKSESORIS (TOPI & TAS)", Content = "Teleport dan pakai aksesoris yang tersedia." })

Tabs.EtcFitur:AddButton({
    Text = "🎩 Pakai Topi",
    Callback = function()
        if checkKaitunLock() then return end
        local prompt = workspace:FindFirstChild("PinjamTopi") and workspace.PinjamTopi:FindFirstChild("ProximityPrompt")
        if prompt and prompt.Enabled then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local oldPos = hrp.CFrame
                pcall(function() hrp.CFrame = prompt.Parent.CFrame * CFrame.new(0, 3, 0) end)
                task.wait(0.5)
                if fireproximityprompt then pcall(function() fireproximityprompt(prompt, 1, true) end) end
                task.wait(0.5)
                pcall(function() hrp.CFrame = oldPos end)
                sendNotification("Berhasil pakai Topi!")
            end
        else
            sendNotification("Topi tidak ditemukan atau sedang dipakai!")
        end
    end
})

Tabs.EtcFitur:AddButton({
    Text = "🎒 Pakai Tas",
    Callback = function()
        if checkKaitunLock() then return end
        local prompt = workspace:FindFirstChild("PinjamTas") and workspace.PinjamTas:FindFirstChild("ProximityPrompt")
        if prompt and prompt.Enabled then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local oldPos = hrp.CFrame
                pcall(function() hrp.CFrame = prompt.Parent.CFrame * CFrame.new(0, 3, 0) end)
                task.wait(0.5)
                if fireproximityprompt then pcall(function() fireproximityprompt(prompt, 1, true) end) end
                task.wait(0.5)
                pcall(function() hrp.CFrame = oldPos end)
                sendNotification("Berhasil pakai Tas!")
            end
        else
            sendNotification("Tas tidak ditemukan atau sedang dipakai!")
        end
    end
})

-- ======================================================== --
--  ITEM & ACC (COLLAB SHOPE) - EVENT SEMENTARA
-- ======================================================== --
-- HAPUS BLOK INI KE BAWAH JIKA EVENT SUDAH SELESAI
Tabs.EtcFitur:AddParagraph({ Title = "🛒 ITEM & ACC (COLLAB SHOPE)", Content = "Koleksi item event kolaborasi. Fitur ini bisa dihapus jika event berakhir." })

Tabs.EtcFitur:AddButton({
    Text = "👕 Pakai Baju Shope",
    Callback = function()
        if checkKaitunLock() or checkSALock() then return end
        local prompt = workspace:FindFirstChild("PinjamBajuS") and workspace.PinjamBajuS:FindFirstChild("ProximityPrompt")
        if prompt and prompt.Enabled then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local oldPos = hrp.CFrame
                pcall(function() hrp.CFrame = prompt.Parent.CFrame * CFrame.new(0, 3, 0) end)
                task.wait(0.5)
                if fireproximityprompt then pcall(function() fireproximityprompt(prompt, 1, true) end) end
                task.wait(0.5)
                pcall(function() hrp.CFrame = oldPos end)
                sendNotification("✅ Berhasil pakai Baju Shope!")
            end
        else
            sendNotification("❌ Baju Shope tidak ditemukan atau sedang dipakai!")
        end
    end
})

Tabs.EtcFitur:AddButton({
    Text = "⛑️ Pakai Helm Shope",
    Callback = function()
        if checkKaitunLock() or checkSALock() then return end
        local prompt = workspace:FindFirstChild("PinjamHelmS") and workspace.PinjamHelmS:FindFirstChild("ProximityPrompt")
        if prompt and prompt.Enabled then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local oldPos = hrp.CFrame
                pcall(function() hrp.CFrame = prompt.Parent.CFrame * CFrame.new(0, 3, 0) end)
                task.wait(0.5)
                if fireproximityprompt then pcall(function() fireproximityprompt(prompt, 1, true) end) end
                task.wait(0.5)
                pcall(function() hrp.CFrame = oldPos end)
                sendNotification("✅ Berhasil pakai Helm Shope!")
            end
        else
            sendNotification("❌ Helm Shope tidak ditemukan atau sedang dipakai!")
        end
    end
})

Tabs.EtcFitur:AddButton({
    Text = "🎒 Pakai Tas Shope",
    Callback = function()
        if checkKaitunLock() or checkSALock() then return end
        local prompt = workspace:FindFirstChild("PinjamTasS") and workspace.PinjamTasS:FindFirstChild("ProximityPrompt")
        if prompt and prompt.Enabled then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local oldPos = hrp.CFrame
                pcall(function() hrp.CFrame = prompt.Parent.CFrame * CFrame.new(0, 3, 0) end)
                task.wait(0.5)
                if fireproximityprompt then pcall(function() fireproximityprompt(prompt, 1, true) end) end
                task.wait(0.5)
                pcall(function() hrp.CFrame = oldPos end)
                sendNotification("✅ Berhasil pakai Tas Shope!")
            end
        else
            sendNotification("❌ Tas Shope tidak ditemukan atau sedang dipakai!")
        end
    end
})
-- BATAS AKHIR ITEM EVENT COLLAB

-- ====== FITUR MANDI ================================================== --
Tabs.EtcFitur:AddParagraph({ Title = " FITUR MANDI (Manual)", Content = "Jika badan kamu sudah menguning, lalu mengeluarkan suara kentut segeralah pergi mandi" })
Tabs.EtcFitur:AddButton({
    Text = "🛁 Mandi Sekarang",
    Callback = function()
        if checkKaitunLock() or checkSALock() then return end
        
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local mandiFolder = workspace:FindFirstChild("Mandi")
        
        if hrp and mandiFolder then
            local bilikKosongPrompt = nil
            
            for _, bilik in ipairs(mandiFolder:GetChildren()) do
                local prompt = bilik:FindFirstChildWhichIsA("ProximityPrompt", true)
                
                if prompt and prompt.Enabled then
                    local adaOrangLain = false
                    
                    for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
                        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            local jarak = (p.Character.HumanoidRootPart.Position - prompt.Parent.Position).Magnitude
                            if jarak < 5 then 
                                adaOrangLain = true
                                break
                            end
                        end
                    end
                    
                    if not adaOrangLain then
                        bilikKosongPrompt = prompt
                        break
                    end
                end
            end
            
            if bilikKosongPrompt then
                local oldPos = hrp.CFrame 
                
                sendNotification("🛁 Menemukan bilik kosong! Sedang mandi...")
                
                pcall(function() hrp.CFrame = bilikKosongPrompt.Parent.CFrame * CFrame.new(0, 3, 0) end)
                task.wait(0.2)
                
                if fireproximityprompt then pcall(function() fireproximityprompt(bilikKosongPrompt, 1, true) end) end
                task.wait(0.2)
                
                pcall(function() hrp.CFrame = oldPos end)
                sendNotification("✅ Segar! Berhasil Mandi Instan.")
            else
                sendNotification("⚠️ Gagal: Semua kamar mandi sedang penuh!")
            end
        else
            sendNotification("❌ Gagal: Folder Mandi tidak ditemukan.")
        end
    end
})

-- ======================================================== --
-- FITUR TROLL DROP ITEM (PAYUNG & LAYANG-LAYANG)
-- ======================================================== --
Tabs.EtcFitur:AddParagraph({ Title = "🤪 TROLL DROP ITEM", Content = "Drop item ke tanah secara instan (Troll teman kamu)" })

Tabs.EtcFitur:AddButton({
    Text = "☂️ Drop 1 Payung",
    Callback = function()
        if checkKaitunLock() or checkSALock() then return end
        
        local char = player.Character
        local hum = char and char:FindFirstChild("Humanoid")
        local backpack = player:FindFirstChild("Backpack")
        
        if char and hum and backpack then
            local targetItem = nil
            
            for _, item in ipairs(backpack:GetChildren()) do
                if item:IsA("Tool") and string.find(string.lower(item.Name), "payung") then
                    targetItem = item
                    break
                end
            end
            
            if not targetItem then
                for _, item in ipairs(char:GetChildren()) do
                    if item:IsA("Tool") and string.find(string.lower(item.Name), "payung") then
                        targetItem = item
                        break
                    end
                end
            end
            
            if targetItem then
                if targetItem.Parent == backpack then
                    hum:EquipTool(targetItem)
                    task.wait(0.15)
                end
                
                targetItem.Parent = workspace
                sendNotification("☂️ 1 Payung berhasil di-drop!")
            else
                sendNotification("⚠️ Tidak ada payung di tas atau tangan!")
            end
        end
    end
})

Tabs.EtcFitur:AddButton({
    Text = "🪁 Drop 1 Layang-layang",
    Callback = function()
        local char = player.Character
        local hum = char and char:FindFirstChild("Humanoid")
        local backpack = player:FindFirstChild("Backpack")
        
        if char and hum and backpack then
            local targetItem = nil
            
            for _, item in ipairs(backpack:GetChildren()) do
                if item:IsA("Tool") and string.find(string.lower(item.Name), "layang") then
                    targetItem = item
                    break
                end
            end
            
            if not targetItem then
                for _, item in ipairs(char:GetChildren()) do
                    if item:IsA("Tool") and string.find(string.lower(item.Name), "layang") then
                        targetItem = item
                        break
                    end
                end
            end
            
            if targetItem then
                if targetItem.Parent == backpack then
                    hum:EquipTool(targetItem)
                    task.wait(0.15)
                end
                
                targetItem.Parent = workspace
                sendNotification("🪁 1 Layang-layang berhasil di-drop!")
            else
                sendNotification("⚠️ Tidak ada layang-layang di tas atau tangan!")
            end
        end
    end
})

-- =========================================
-- TAB BARU: TELEPORT
-- =========================================
Tabs.Teleport:AddParagraph({ Title = "🚜 TELEPORT AREA FARMING", Content = "Teleport cepat ke area farming milikmu." })

Tabs.Teleport:AddButton({
    Text = "📍 Teleport ke Lahan Biasa (Saved Pos)",
    Callback = function()
        if checkKaitunLock() then return end
        if savedPlantLocationCFrame then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Velocity = Vector3.zero
                hrp.CFrame = savedPlantLocationCFrame
                sendNotification("✅ Teleport ke Lahan Biasa!")
            end
        else
            sendNotification("⚠️ Kamu belum Set Posisi Lahan Biasa!")
        end
    end
})

Tabs.Teleport:AddButton({
    Text = "🌴 Teleport ke Lahan Besar",
    Callback = function()
        if checkKaitunLock() then return end
        local lahan = myLockedLahan
        if not lahan or not lahan.Parent then
            for _, plot in ipairs(workspace:GetChildren()) do
                if string.find(string.lower(plot.Name), "besar") and (string.find(plot.Name, player.Name) or string.find(plot.Name, tostring(player.UserId))) then
                    lahan = plot; break
                end
            end
        end
        
        if lahan then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = (lahan:IsA("Model") and lahan:GetPivot() or lahan.CFrame) + Vector3.new(0, 3, 0)
                sendNotification("✅ Teleport ke Lahan Besar!")
            end
        else
            sendNotification("⚠️ Lahan Besar tidak ditemukan atau belum di-claim!")
        end
    end
})

Tabs.Teleport:AddButton({
    Text = "🔒 Teleport ke Lahan Private (Kandang)",
    Callback = function()
        if checkKaitunLock() then return end
        local coopPlot = getPlot("Coop_CoopPlot_")
        if coopPlot then
            local areaBesar = coopPlot:FindFirstChild("AreaTanamBesarPrivate") or coopPlot:FindFirstChild("AreaTanamBesar")
            if areaBesar then
                local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local targetCF = CFrame.new(0,0,0)
                    if areaBesar:IsA("Model") then targetCF = areaBesar:GetPivot()
                    elseif areaBesar:IsA("BasePart") then targetCF = areaBesar.CFrame
                    else
                        for _, child in ipairs(areaBesar:GetDescendants()) do
                            if child:IsA("BasePart") then targetCF = child.CFrame; break end
                        end
                    end
                    hrp.CFrame = targetCF + Vector3.new(0, 3, 0)
                    sendNotification("✅ Teleport ke Lahan Private!")
                end
            else
                sendNotification("⚠️ Lahan Private tidak ditemukan di dalam kandang!")
            end
        else
            sendNotification("⚠️ Kandang Ayam belum di-claim!")
        end
    end
})

Tabs.Teleport:AddButton({
    Text = "🐔 Teleport ke Kandang Ayam",
    Callback = function()
        if checkKaitunLock() then return end
        local plot = getPlot("Coop_CoopPlot_")
        if plot then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame = (plot:IsA("Model") and plot:GetPivot() or plot.CFrame) + Vector3.new(0, 3, 0); sendNotification("✅ Teleport ke Kandang Ayam!") end
        else sendNotification("⚠️ Kandang Ayam belum di-claim!") end
    end
})

Tabs.Teleport:AddButton({
    Text = "🐄 Teleport ke Kandang Sapi",
    Callback = function()
        if checkKaitunLock() then return end
        local plot = getPlot("Barn_Plot_")
        if plot then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame = (plot:IsA("Model") and plot:GetPivot() or plot.CFrame) + Vector3.new(0, 3, 0); sendNotification("✅ Teleport ke Kandang Sapi!") end
        else sendNotification("⚠️ Kandang Sapi belum di-claim!") end
    end
})

Tabs.Teleport:AddParagraph({ Title = "🛒 TELEPORT SHOP / NPC", Content = "Teleport ke berbagai penjual." })

Tabs.Teleport:AddButton({
    Text = "💰 Teleport NPC Beli Bibit",
    Callback = function()
        if checkKaitunLock() then return end
        local p = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("NPC_Bibit") and workspace.NPCs.NPC_Bibit:FindFirstChild("npcbibit")
        if p then local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart"); if hrp then hrp.CFrame = getCFrameFromObj(p) * CFrame.new(0, 0, 3); sendNotification("✅ Teleport ke NPC Beli Bibit!") end end
    end
})

Tabs.Teleport:AddButton({
    Text = "💰 Teleport NPC Jual Panen Biasa",
    Callback = function()
        if checkKaitunLock() then return end
        local p = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("NPC_Penjual") and workspace.NPCs.NPC_Penjual:FindFirstChild("npcpenjual")
        if p then local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart"); if hrp then hrp.CFrame = getCFrameFromObj(p) * CFrame.new(0, 0, 3); sendNotification("✅ Teleport ke NPC Penjual Biasa!") end end
    end
})

Tabs.Teleport:AddButton({
    Text = "💰 Teleport NPC Jual Telur",
    Callback = function()
        if checkKaitunLock() then return end
        local p = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("NPCPedagangTelur") and workspace.NPCs.NPCPedagangTelur:FindFirstChild("NPCPedagangTelur")
        if p then local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart"); if hrp then hrp.CFrame = getCFrameFromObj(p) * CFrame.new(0, 0, 3); sendNotification("✅ Teleport ke NPC Telur!") end end
    end
})

Tabs.Teleport:AddButton({
    Text = "💰 Teleport NPC Jual Sawit/Durian",
    Callback = function()
        if checkKaitunLock() then return end
        local p = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("NPC_PedagangSawit") and workspace.NPCs.NPC_PedagangSawit:FindFirstChild("NPCPedagangSawit")
        if p then local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart"); if hrp then hrp.CFrame = getCFrameFromObj(p) * CFrame.new(0, 0, 3); sendNotification("✅ Teleport ke NPC Sawit & Durian!") end end
    end
})

Tabs.Teleport:AddButton({
    Text = "💰 Teleport NPC Jual Susu",
    Callback = function()
        if checkKaitunLock() then return end
        local npcs = workspace:FindFirstChild("NPCs"); local p = npcs and npcs:FindFirstChild("NPCPedagangSusu")
        if p then local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart"); if hrp then hrp.CFrame = getCFrameFromObj(p) * CFrame.new(0, 0, 3); sendNotification("✅ Teleport ke NPC Susu!") end end
    end
})

Tabs.Teleport:AddParagraph({ Title = "🌍 TELEPORT AREA MAP PUBLIC", Content = "Teleport ke area publik yang ada di map." })

local selectedAreaTanam = nil
local selectedAreaTanamBesar = nil

Tabs.Teleport:AddButton({
    Text = "🔄 Scan Area Map",
    Callback = function()
        if _G.DropAreaTanam then _G.DropAreaTanam:Refresh(getAreaTanamBiasa()) end
        if _G.DropAreaTanamBesar then _G.DropAreaTanamBesar:Refresh(getAreaTanamBesar()) end
        sendNotification("✅ Daftar Area Map berhasil diperbarui!")
    end
})

_G.DropAreaTanam = Tabs.Teleport:AddDropdown({
    Text = "🔽 Pilih Area Tanam (Biasa)",
    Items = getAreaTanamBiasa(),
    Multi = false,
    Default = getAreaTanamBiasa()[1],
    Callback = function(v)
        selectedAreaTanam = v
    end
})

Tabs.Teleport:AddButton({
    Text = "🚀 Teleport ke Area Tanam",
    Callback = function()
        if checkKaitunLock() then return end
        if not selectedAreaTanam or selectedAreaTanam == "❌ Tidak ditemukan" then
            sendNotification("⚠️ Pilih Area Tanam yang valid!")
            return
        end
        local targetObj = workspace:FindFirstChild(selectedAreaTanam)
        if targetObj then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = getCFrameFromObj(targetObj) + Vector3.new(0, 3, 0)
                sendNotification("✅ Berhasil teleport ke " .. selectedAreaTanam)
            end
        else
            sendNotification("⚠️ Area Tanam tidak ditemukan di Workspace!")
        end
    end
})

_G.DropAreaTanamBesar = Tabs.Teleport:AddDropdown({
    Text = "🔽 Pilih Area Tanam Besar",
    Items = getAreaTanamBesar(),
    Multi = false,
    Default = getAreaTanamBesar()[1],
    Callback = function(v)
        selectedAreaTanamBesar = v
    end
})

Tabs.Teleport:AddButton({
    Text = "🚀 Teleport ke Area Tanam Besar",
    Callback = function()
        if checkKaitunLock() then return end
        if not selectedAreaTanamBesar or selectedAreaTanamBesar == "❌ Tidak ditemukan" then
            sendNotification("⚠️ Pilih Area Tanam Besar yang valid!")
            return
        end
        local targetObj = workspace:FindFirstChild(selectedAreaTanamBesar)
        if targetObj then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = getCFrameFromObj(targetObj) + Vector3.new(0, 3, 0)
                sendNotification("✅ Berhasil teleport ke " .. selectedAreaTanamBesar)
            end
        else
            sendNotification("⚠️ Area Tanam Besar tidak ditemukan di Workspace!")
        end
    end
})

Tabs.Teleport:AddParagraph({ Title = "👥 TELEPORT KE PLAYER", Content = "Pilih player dari daftar untuk teleport ke lokasi mereka." })

local selectedPlayerToTP = nil

Tabs.Teleport:AddButton({
    Text = "🔄 Scan Player",
    Callback = function()
        if _G.DropTeleportPlayer then
            _G.DropTeleportPlayer:Refresh(getPlayerNames())
            sendNotification("✅ Daftar player berhasil diperbarui!")
        end
    end
})

_G.DropTeleportPlayer = Tabs.Teleport:AddDropdown({
    Text = "🔽 Pilih Player",
    Items = getPlayerNames(),
    Multi = false,
    Default = getPlayerNames()[1],
    Callback = function(v)
        selectedPlayerToTP = v
    end
})

Tabs.Teleport:AddButton({
    Text = "🚀 Teleport ke Player",
    Callback = function()
        if checkKaitunLock() then return end
        if not selectedPlayerToTP or selectedPlayerToTP == "❌ Tidak ada player lain" then
            sendNotification("⚠️ Pilih player yang valid!")
            return
        end
        
        local targetName = string.match(selectedPlayerToTP, "^(.-)%s*%(") or selectedPlayerToTP
        local targetPlayer = Players:FindFirstChild(targetName)
        
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3) 
                sendNotification("✅ Berhasil teleport ke " .. targetName)
            end
        else
            sendNotification("⚠️ Player tidak ditemukan atau belum spawn!")
        end
    end
})

-- ==== KOMPONEN TAB SHOP & LOCATION & CONFIG ====
Tabs.Shop:AddButton({ Text = "🌱 Buy Bibit", Callback = function() autoInteract(workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("NPC_Bibit") and workspace.NPCs.NPC_Bibit:FindFirstChild("npcbibit") and workspace.NPCs.NPC_Bibit.npcbibit:FindFirstChild("ProximityPrompt")) end })
Tabs.Shop:AddButton({ Text = "🏪 Sell Bibit", Callback = function() autoInteract(workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("NPC_Penjual") and workspace.NPCs.NPC_Penjual:FindFirstChild("npcpenjual") and workspace.NPCs.NPC_Penjual.npcpenjual:FindFirstChild("ProximityPrompt")) end })
Tabs.Shop:AddButton({ Text = "🥚 Shop Telur", Callback = function() autoInteract(workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("NPCPedagangTelur") and workspace.NPCs.NPCPedagangTelur:FindFirstChild("NPCPedagangTelur") and workspace.NPCs.NPCPedagangTelur.NPCPedagangTelur:FindFirstChild("ProximityPrompt")) end })
Tabs.Shop:AddButton({ Text = "🌴 Shop Sawit & Durian", Callback = function() autoInteract(workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("NPC_PedagangSawit") and workspace.NPCs.NPC_PedagangSawit:FindFirstChild("NPCPedagangSawit") and workspace.NPCs.NPC_PedagangSawit.NPCPedagangSawit:FindFirstChild("ProximityPrompt")) end })
Tabs.Shop:AddButton({ Text = "🥛 Shop Susu", Callback = function() autoInteract(workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("NPCPedagangSusu") and workspace.NPCs.NPCPedagangSusu:FindFirstChild("ProximityPrompt", true)) end })
Tabs.Shop:AddButton({
    Text = "📦 Buka Storage",
    Callback = function()
        if checkKaitunLock() or checkSALock() then return end        
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        
        -- Path Storage yang kamu berikan
        local storageFolder = workspace:FindFirstChild("Storage")
        local storage1 = storageFolder and storageFolder:FindFirstChild("storage1")
        local prompt = storage1 and storage1:FindFirstChildWhichIsA("ProximityPrompt", true)
        
        if hrp and prompt and prompt.Enabled then
            local oldPos = hrp.CFrame
            
            -- Teleport Hantu ke Storage
            pcall(function() hrp.CFrame = prompt.Parent.CFrame * CFrame.new(0, 3, 0) end)
            task.wait(0.2)
            
            -- Trigger UI
            if fireproximityprompt then pcall(function() fireproximityprompt(prompt, 1, true) end) end
            task.wait(0.2)
            
            -- Balik ke posisi asal
            pcall(function() hrp.CFrame = oldPos end)
            sendNotification("✅ Menu Storage Terbuka!")
        else
            sendNotification("❌ Gagal: Storage tidak ditemukan atau tidak aktif.")
        end
    end
})

-- ======================================================== --
--  MENU UI BELI BIBIT INSTAN (MAX 99)
-- ======================================================== --
Tabs.Shop:AddParagraph({ Title = "🛒 BELI BIBIT INSTAN", Content = "Beli bibit tanpa berjalan ke NPC. Instan masuk tas! (Maks 99)" })

local listBibitToko = {"Bibit Padi", "Bibit Jagung", "Bibit Tomat", "Bibit Terong", "Bibit Strawberry", "Bibit Sawit", "Bibit Durian"}
local bibitYangDipilih = "Bibit Padi"
local jumlahYangDibeli = 1

Tabs.Shop:AddDropdown({ 
    Text = "🔽 Pilih Bibit", 
    Items = listBibitToko, 
    Multi = false, 
    Default = listBibitToko[1], 
    Callback = function(v) 
        bibitYangDipilih = v 
    end 
})

Tabs.Shop:AddTextBox({
    Text = "Masukkan Jumlah",
    Default = "1",
    Placeholder = "Maksimal 99",
    Callback = function(text)
        local num = tonumber(text)
        if num and num > 0 then
            if num > 99 then
                jumlahYangDibeli = 99
                sendNotification("⚠️ Maksimal pembelian dibatasi 99!")
            else
                jumlahYangDibeli = math.floor(num)
            end
        else
            jumlahYangDibeli = 1
        end
    end
})

Tabs.Shop:AddButton({
    Text = "🚀 Beli Sekarang",
    Callback = function()        
        task.spawn(function()
            local remotesFolder = ReplicatedStorage:FindFirstChild("Remotes")
            local tutorialRemotes = remotesFolder and remotesFolder:FindFirstChild("TutorialRemotes")
            local requestShopRemote = tutorialRemotes and tutorialRemotes:FindFirstChild("RequestShop")
            
            if requestShopRemote then
                pcall(function()
                    sendNotification("🛒 Membeli " .. jumlahYangDibeli .. "x " .. bibitYangDipilih .. "...")
                    
                    if requestShopRemote:IsA("RemoteFunction") then
                        requestShopRemote:InvokeServer("BUY", bibitYangDipilih, jumlahYangDibeli)
                    elseif requestShopRemote:IsA("RemoteEvent") then
                        requestShopRemote:FireServer("BUY", bibitYangDipilih, jumlahYangDibeli)
                    end
                    
                    task.wait(0.5)
                    sendNotification("✅ Berhasil membeli bibit!")
                end)
            else
                sendNotification("❌ Gagal: Sistem Toko tidak ditemukan!")
            end
        end)
    end
})

-- ======================================================== --
--  MENU UI JUAL PANEN INSTAN (VERSI PROFIT TRACKER)
-- ======================================================== --
Tabs.Shop:AddParagraph({ Title = "💸 JUAL PANEN INSTAN", Content = "Jual panen langsung ke server dan lacak profit yang didapat." })

local listPanen = {"Padi", "Jagung", "Tomat", "Terong", "Strawberry", "Sawit", "Durian"}
local panenYangDijual = "Padi"
local jumlahJual = 1

Tabs.Shop:AddDropdown({ 
    Text = "🔽 Pilih Panen", 
    Items = listPanen, 
    Multi = false, 
    Default = listPanen[1], 
    Callback = function(v) 
        panenYangDijual = v 
    end 
})

Tabs.Shop:AddTextBox({
    Text = "Masukkan Jumlah",
    Default = "1",
    Placeholder = "Contoh: 10",
    Callback = function(text)
        local num = tonumber(text)
        if num and num > 0 then
            jumlahJual = math.floor(num)
        else
            jumlahJual = 1
        end
    end
})

-- Tombol 1: Jual Berdasarkan Jumlah Input
Tabs.Shop:AddButton({
    Text = "🚀 Jual Sekarang",
    Callback = function()
        task.spawn(function()
            local remotesFolder = ReplicatedStorage:FindFirstChild("Remotes")
            local tutorialRemotes = remotesFolder and remotesFolder:FindFirstChild("TutorialRemotes")
            local requestSellRemote = tutorialRemotes and tutorialRemotes:FindFirstChild("RequestSell")
            
            if requestSellRemote then
                pcall(function()
                    -- 1. Catat koin awal
                    local ls = player:FindFirstChild("leaderstats")
                    local koinAwal = ls and ls:FindFirstChild("Coins") and ls.Coins.Value or 0
                    
                    sendNotification("💸 Memproses Jual " .. jumlahJual .. "x " .. panenYangDijual .. "...")
                    
                    -- 2. Tembak server
                    if requestSellRemote:IsA("RemoteFunction") then
                        requestSellRemote:InvokeServer("SELL", panenYangDijual, jumlahJual)
                    elseif requestSellRemote:IsA("RemoteEvent") then
                        requestSellRemote:FireServer("SELL", panenYangDijual, jumlahJual)
                    end
                    
                    -- 3. Jeda waktu agar server merespon dan menambah uang kita
                    task.wait(0.8)
                    
                    -- 4. Catat koin akhir & hitung profit
                    local koinAkhir = ls and ls:FindFirstChild("Coins") and ls.Coins.Value or 0
                    local profit = koinAkhir - koinAwal
                    
                    if profit > 0 then
                        sendNotification("✅ Berhasil menjual " .. jumlahJual .. " " .. panenYangDijual .. "!\n💰 Profit: +Rp" .. tostring(profit))
                    else
                        sendNotification("⚠️ Gagal mendapat profit. Pastikan stok kamu tidak kosong!")
                    end
                end)
            else
                sendNotification("❌ Gagal: Sistem Jual tidak ditemukan!")
            end
        end)
    end
})

-- Tombol 2: Jual Semuanya (Trik Max Value + Profit Tracker)
Tabs.Shop:AddButton({
    Text = "📦 Jual Semuanya",
    Callback = function()
        local trikJumlahMax = 999999 

        task.spawn(function()
            local remotesFolder = ReplicatedStorage:FindFirstChild("Remotes")
            local tutorialRemotes = remotesFolder and remotesFolder:FindFirstChild("TutorialRemotes")
            local requestSellRemote = tutorialRemotes and tutorialRemotes:FindFirstChild("RequestSell")
            
            if requestSellRemote then
                pcall(function()
                    -- 1. Catat koin awal
                    local ls = player:FindFirstChild("leaderstats")
                    local koinAwal = ls and ls:FindFirstChild("Coins") and ls.Coins.Value or 0
                    
                    sendNotification("💸 Memproses Jual Semua " .. panenYangDijual .. "...")
                    
                    -- 2. Tembak server dengan jumlah max
                    if requestSellRemote:IsA("RemoteFunction") then
                        requestSellRemote:InvokeServer("SELL", panenYangDijual, trikJumlahMax)
                    elseif requestSellRemote:IsA("RemoteEvent") then
                        requestSellRemote:FireServer("SELL", panenYangDijual, trikJumlahMax)
                    end
                    
                    -- 3. Jeda waktu agar server merespon
                    task.wait(0.8)
                    
                    -- 4. Catat koin akhir & hitung profit
                    local koinAkhir = ls and ls:FindFirstChild("Coins") and ls.Coins.Value or 0
                    local profit = koinAkhir - koinAwal
                    
                    if profit > 0 then
                        sendNotification("✅ Lunas! Semua stok " .. panenYangDijual .. " berhasil dijual.\n💰 Profit: +Rp" .. tostring(profit))
                    else
                        sendNotification("⚠️ Request terkirim, tapi stok " .. panenYangDijual .. " kamu sepertinya sedang kosong (0 profit).")
                    end
                end)
            else
                sendNotification("❌ Gagal: Sistem Jual tidak ditemukan!")
            end
        end)
    end
})

local inputPosName = ""
Tabs.Location:AddTextBox({ Text = "Nama Posisi", Placeholder = "Ketik Nama Tempat...", Callback = function(txt) inputPosName = txt end })
Tabs.Location:AddButton({ Text = "💾 Save Posisi", Callback = function() local name = inputPosName;
name = string.gsub(name, '[^%w%s]', ''); if name == "" or name:match("^%s*$") then name = gameFolderName .. "_Config_" .. tostring(math.random(10,99)) end;
local savePath = fullFolderPath .. "/" .. name .. ".json"; local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart");
if hrp and writefile then local success = pcall(function() writefile(savePath, HttpService:JSONEncode({x = hrp.Position.X, y = hrp.Position.Y, z = hrp.Position.Z})) end);
if success then selectedFilePath = savePath; sendNotification("✅ Posisi Berhasil Disimpan!") else sendNotification("❌ Gagal menyimpan!") end end end })
local function getConfigs() local options = {};
if listfiles and isfolder(fullFolderPath) then for _, filePath in ipairs(listfiles(fullFolderPath)) do if filePath:match("%.json$") then local cleanName = filePath:match("([^/\\]+)$");
cleanName = cleanName:gsub("%.json", ""); table.insert(options, cleanName) end end end; if #options == 0 then table.insert(options, "Kosong") end;
return options end
Tabs.Location:AddButton({ Text = "🔄 Scan Lokasi", Callback = function() _G.DropConfig:Refresh(getConfigs()); sendNotification("✅ Daftar Lokasi Diperbarui!") end })
_G.DropConfig = Tabs.Location:AddDropdown({ Text = "🔽 Pemilihan Lokasi", Items = getConfigs(), Multi = false, Default = getConfigs()[1], Callback = function(v) if listfiles and isfolder(fullFolderPath) then for _, filePath in ipairs(listfiles(fullFolderPath)) do local cleanName = filePath:match("([^/\\]+)$"); cleanName = cleanName:gsub("%.json", ""); if cleanName == v then selectedFilePath = filePath; sendNotification("Lokasi Dipilih: " .. v) end end end end })
Tabs.Location:AddButton({ Text = "🚀 TELEPORT (Load Lokasi)", Callback = function() if not selectedFilePath then sendNotification("⚠️ Pilih file lokasi di Dropdown dulu!"); return end; if isfile and isfile(selectedFilePath) then local success, posData = pcall(function() return HttpService:JSONDecode(readfile(selectedFilePath)) end); local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart");
if success and posData and posData.x and hrp then player.Character:PivotTo(CFrame.new(posData.x, posData.y, posData.z));
sendNotification("✅ Teleport Berhasil!") end end end })
Tabs.Location:AddButton({ Text = "🗑️ Delete Lokasi Terpilih", Callback = function() if selectedFilePath and isfile and delfile and isfile(selectedFilePath) then if isAutoLoadOn and isfile(autoLoadFile) and readfile(autoLoadFile) == selectedFilePath then isAutoLoadOn = false; delfile(autoLoadFile) end; delfile(selectedFilePath); selectedFilePath = nil; sendNotification("🗑️ Lokasi Berhasil Dihapus!"); _G.DropConfig:Refresh(getConfigs()) else sendNotification("⚠️ Pilih file lokasi di Dropdown dulu!") end end })
Tabs.Location:AddToggle({ Text = "🔄 Auto Teleport ketika Discconect", Default = isAutoLoadOn, Callback = function(v) isAutoLoadOn = v end })

Tabs.Config:AddParagraph({ Title = "⚙️ PENGATURAN SCRIPT", Content = "Fitur-fitur otomatis (Auto) berada di sini." })
Tabs.Config:AddToggle({ Text = "📱 Munculkan Logo Mobile (Tutup UI)", Default = true, Callback = function(v) ScreenGuiLogo.Enabled = v end })
Tabs.Config:AddToggle({ Text = "☠️ Auto Return Death", Default = isAutoReturnOn, Callback = function(v) isAutoReturnOn = v end })

-- Fitur Anti Gelap Malam (Terang Terus)
Tabs.Config:AddToggle({ 
    Text = "☀️ Mode Terang (Anti Gelap Malam)", 
    Default = false,
    Callback = function(v)
        isFullbrightOn = v
        if isFullbrightOn then
            task.spawn(function()
                while isFullbrightOn do
                    pcall(function()
                        game:GetService("Lighting").ClockTime = 12
                        game:GetService("Lighting").Brightness = 2
                    end)
                    task.wait(1)
                end
            end)
        end
    end
})

local spyConnection = nil; local isSpyOn = false
Tabs.Config:AddToggle({ Text = "🔍 Deteksi Path Prompt (Spy to Clipboard)", Default = false, Callback = function(v) isSpyOn = v; if isSpyOn then spyConnection = ProximityPromptService.PromptTriggered:Connect(function(prompt, playerWhoTriggered) if playerWhoTriggered == player then if setclipboard then pcall(function() setclipboard(prompt:GetFullName()) end); sendNotification("✅ Path tercopy ke Clipboard!") end end end) else if spyConnection then spyConnection:Disconnect(); spyConnection = nil end end end })

-- ======================================================== --
--  PENGATURAN TEMA UI (DROPDOWN)
-- ======================================================== --
Tabs.Config:AddParagraph({ Title = "🎨 PENGATURAN TEMA UI", Content = "Pilih tema untuk tampilan menu. Script harus dieksekusi ulang (Re-execute) agar tema berubah." })
local themeList = {"Dark", "Midnight", "Ocean", "Rose", "Monochrome"}
local currentSavedTheme = "Dark"
pcall(function() 
    if isfile and isfile("MigiiHub/_ThemeConfig.txt") then 
        currentSavedTheme = readfile("MigiiHub/_ThemeConfig.txt") 
    end 
end)

Tabs.Config:AddDropdown({ 
    Text = "🎨 Pilih Tema UI", 
    Items = themeList, 
    Multi = false, 
    Default = currentSavedTheme, 
    Callback = function(v) 
        pcall(function()
            if writefile then
                if not isfolder("MigiiHub") then makefolder("MigiiHub") end
                writefile("MigiiHub/_ThemeConfig.txt", v)
                sendNotification("✅ Tema " .. v .. " tersimpan! Execute ulang script untuk melihat hasil.")
            end
        end)
    end 
})

-- ======================================================== --
--  FITUR KILL SWITCH (FORCE CLOSE SCRIPT)
-- ======================================================== --
Tabs.Config:AddParagraph({ Title = "🛑 FORCE CLOSE SCRIPT", Content = "Gunakan tombol ini untuk menghentikan seluruh proses Auto, menghapus UI, dan mematikan script sepenuhnya tanpa harus keluar game." })

Tabs.Config:AddButton({
    Text = "🛑 DESTROY SCRIPT (FORCE CLOSE)",
    Color = Color3.fromRGB(237, 66, 69), -- Warna merah peringatan
    Callback = function()
        -- 1. Matikan semua logic Auto Farming (Kaitun & StandAlone)
        isKaitunActive = false
        isAutoClaimLahan = false
        isAutoClaimAyam = false
        isAutoClaimSapi = false
        isStandAloneAutoPlant = false
        isAutoPlantBesar = false
        isStandAloneAutoHarvest = false
        isAutoTPHarvestBiasaOn = false
        isAutoTPHarvestBesarOn = false
        isAutoCollectEggOn = false
        isAutoCollectMilkOn = false
        isAutoSellEggOn = false
        isAutoSellMilkOn = false
        isAutoSellDurianOn = false
        isAutoSellSawitOn = false
        isAutoSleepOn = false
        isFullbrightOn = false
        
        -- 2. Matikan Loop ESP & Webhook
        isESPKandangOn = false
        isESPTanamanOn = false
        isWebhookOn = false
        
        -- 3. Bersihkan sisa-sisa ESP di layar
        pcall(function() hapusSemuaESP("ESP_Migii_") end)
        
        -- 4. Putuskan koneksi event yang berjalan (Spy)
        if spyConnection then spyConnection:Disconnect(); spyConnection = nil end
        
        -- 5. Hancurkan semua UI sampai bersih
        if Window then Window:Destroy() end
        pcall(function() ScreenGuiLogo:Destroy() end)
        pcall(function() MonitorGui:Destroy() end)
        
        -- 6. Munculkan notifikasi sistem bawaan Roblox
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "MIGII-HUB",
                Text = "Script berhasil dimatikan secara total!",
                Duration = 5
            })
        end)
    end
})
