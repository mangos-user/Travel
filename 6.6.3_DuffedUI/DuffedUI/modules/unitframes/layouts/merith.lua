-- Unitframelayout 4 for DuffedUI --

local T, C, L, G = unpack(Tukui)
if not C["unitframes"].enable == true then return end

if C["unitframes"].layout == 2 then
	-- general --
	G.UnitFrames.Player:SetBackdrop(nil)
	G.UnitFrames.Player:SetBackdropColor(0, 0, 0)
	G.UnitFrames.Player.shadow:Kill()
	G.UnitFrames.Player.panel:Kill()
	if C["misc"].sComboenable == true and T.myclass == "ROGUE" then G.UnitFrames.Player.ComboPointsBar:Kill() end
	TukuiCombo:Kill()
	G.UnitFrames.Target:SetBackdrop(nil)
	G.UnitFrames.Target:SetBackdropColor(0, 0, 0)
	G.UnitFrames.Target.shadow:Kill()
	G.UnitFrames.Target.panel:Kill()
	G.UnitFrames.TargetTarget:SetBackdrop(nil)
	G.UnitFrames.TargetTarget:SetBackdropColor(0, 0, 0)
	G.UnitFrames.TargetTarget.shadow:Kill()
	if not T.lowversion then G.UnitFrames.TargetTarget.panel:Kill() end
	G.UnitFrames.Pet:SetBackdrop(nil)
	G.UnitFrames.Pet:SetBackdropColor(0, 0, 0)
	G.UnitFrames.Pet.shadow:Kill()
	if not T.lowversion then G.UnitFrames.Pet.panel:Kill() end
	G.UnitFrames.Focus:SetBackdrop(nil)
	G.UnitFrames.Focus:SetBackdropColor(0, 0, 0)
	G.UnitFrames.Focus.shadow:Kill()
	G.UnitFrames.FocusTarget:SetBackdrop(nil)
	G.UnitFrames.FocusTarget:SetBackdropColor(0, 0, 0)
	G.UnitFrames.FocusTarget.shadow:Kill()
	G.UnitFrames.FocusTarget.Castbar:Kill()
	if C["unitframes"].showboss then
		for i = 1, MAX_BOSS_FRAMES do G.UnitFrames["Boss" .. i]:SetBackdrop(nil) G.UnitFrames["Boss" .. i]:SetBackdropColor(0, 0, 0) G.UnitFrames["Boss" .. i].shadow:Kill() end
	end
	if C["unitframes"].arena then
		for i = 1, 5 do G.UnitFrames["Arena" .. i]:SetBackdrop(nil) G.UnitFrames["Arena" .. i]:SetBackdropColor(0, 0, 0) G.UnitFrames["Arena" .. i].shadow:Kill() end
	end

	-- player --
	-- health --
	G.UnitFrames.Player.Health:Height(20)
	G.UnitFrames.Player.Health:SetFrameLevel(9)
	G.UnitFrames.Player.Health:SetFrameStrata("LOW")
	G.UnitFrames.Player.Health:CreateBorder(false, true)
	G.UnitFrames.Player.Health.bg:SetTexture(0.05, 0.05, 0.05, 1)
	G.UnitFrames.Player.Health:SetStatusBarTexture(C["media"].normTex)
		
	-- border for the health bar --
	local healthBG = CreateFrame("Frame", healthBG, G.UnitFrames.Player.Health)
	healthBG:ClearAllPoints()
	healthBG:SetPoint("TOPLEFT", -2, 2)
	healthBG:SetPoint("BOTTOMRIGHT", 2, -2)
	healthBG:Size(1, 1)
	healthBG:SetTemplate("Default")
	healthBG:CreateBorder(true, true)
	healthBG:CreateShadow("Default")
	healthBG:SetFrameStrata("Low")
	healthBG:SetFrameLevel(G.UnitFrames.Player.Health:GetFrameLevel())

	if C["unitframes"].unicolor == true then
		G.UnitFrames.Player.Health.colorTapping = false
		G.UnitFrames.Player.Health.colorDisconnected = false
		G.UnitFrames.Player.Health.colorClass = false
		G.UnitFrames.Player.Health:SetStatusBarColor(0.125, 0.125, 0.125)
		G.UnitFrames.Player.Health.bg:SetVertexColor(unpack(C["unitframes"].healthbg))
		if C["unitframes"].colorgradient then
			G.UnitFrames.Player.Health.colorSmooth = true
			G.UnitFrames.Player.Health.bg:SetTexture(.2, .2, .2)
		end	
	else
		G.UnitFrames.Player.Health.colorDisconnected = true
		G.UnitFrames.Player.Health.colorTapping = true
		G.UnitFrames.Player.Health.colorClass = true
		G.UnitFrames.Player.Health.colorReaction = true
	end

	G.UnitFrames.Player.Health.value = T.SetFontString(G.UnitFrames.Player.Health, T.CreateFontString())
	G.UnitFrames.Player.Health.value:Point("RIGHT", G.UnitFrames.Player.Health, "RIGHT", -4, 1)
	G.UnitFrames.Player.Health.value:SetShadowOffset(0, 0)

	G.UnitFrames.Player.Health.PostUpdate = T.PostUpdateHealth

	-- power --
	G.UnitFrames.Player.Power:Size(232, 18)
	G.UnitFrames.Player.Power:ClearAllPoints()
	G.UnitFrames.Player.Power:SetFrameLevel(1)
	G.UnitFrames.Player.Power:SetFrameStrata("Background")
	G.UnitFrames.Player.Power:Point("BOTTOMRIGHT", G.UnitFrames.Player.Health, "BOTTOMRIGHT", 6, -8)
	G.UnitFrames.Player.Power:CreateBorder(false, true)
	G.UnitFrames.Player.Power:SetStatusBarTexture(C["media"].normTex)
	
	if C["unitframes"].unicolor == true then
		G.UnitFrames.Player.Power.colorTapping = true
		G.UnitFrames.Player.Power.colorClass = true
		G.UnitFrames.Player.Power.bg.colorClass = true
		G.UnitFrames.Player.Power.bg.multiplier = 0.1
	else
		G.UnitFrames.Player.Power.colorPower = true
		G.UnitFrames.Player.Power.bg.colorClass = true
		G.UnitFrames.Player.Power.colorTapping = true
	end

	G.UnitFrames.Player.Power.value = T.SetFontString(G.UnitFrames.Player.Health, T.CreateFontString())
	G.UnitFrames.Player.Power.value:Point("LEFT", G.UnitFrames.Player.Health, "LEFT", 4, 1)
	G.UnitFrames.Player.Power.value:SetShadowOffset(0, 0)
	
	G.UnitFrames.Player.Power.PreUpdate = T.PreUpdatePower
	G.UnitFrames.Player.Power.PostUpdate = T.PostUpdatePower

	-- border for the powerbar --
	local powerBG = CreateFrame("Frame", powerBG, G.UnitFrames.Player.Power)
	powerBG:ClearAllPoints()
	powerBG:SetPoint("TOPLEFT", -2, 2)
	powerBG:SetPoint("BOTTOMRIGHT", 2, -2)
	powerBG:Size(1, 1)
	powerBG:SetTemplate("Default")
	powerBG:CreateBorder(true, true)
	powerBG:HideInsets()
	powerBG:CreateShadow("Default")
	powerBG:SetFrameStrata("Background")
	powerBG:SetFrameLevel(G.UnitFrames.Player.Power:GetFrameLevel())
		
	-- portraits --
	if C["unitframes"].charportrait == true then
		G.UnitFrames.Player.Portrait:ClearAllPoints()
		G.UnitFrames.Player.Portrait:SetAllPoints(G.UnitFrames.Player.Health)
		G.UnitFrames.Player.Portrait:SetAlpha(0.2)
		G.UnitFrames.Player.Portrait.SetAlpha = T.dummy
		G.UnitFrames.Player.Health:ClearAllPoints()
		G.UnitFrames.Player.Health:SetPoint("TOPLEFT", 0, 0)
		G.UnitFrames.Player.Health:SetPoint("TOPRIGHT")
	end

	-- combat icon --
	G.UnitFrames.Player.Combat:Size(14)
	G.UnitFrames.Player.Combat:ClearAllPoints()
	G.UnitFrames.Player.Combat:SetPoint("CENTER", 0, 0)
	G.UnitFrames.Player.Combat:SetVertexColor(0.69, 0.31, 0.31)

	-- mana flash --
	G.UnitFrames.Player.FlashInfo:ClearAllPoints()
	G.UnitFrames.Player.FlashInfo:SetAllPoints(G.UnitFrames.Player.Health)
	G.UnitFrames.Player.FlashInfo:SetFrameLevel(G.UnitFrames.Player.Health:GetFrameLevel() + 2)
	G.UnitFrames.Player.FlashInfo.ManaLevel:ClearAllPoints()
	G.UnitFrames.Player.FlashInfo.ManaLevel:SetPoint("CENTER", 0, 1)
	G.UnitFrames.Player.FlashInfo.ManaLevel:SetFont(T.CreateFontString())
	G.UnitFrames.Player.FlashInfo.ManaLevel:SetShadowOffset(0, 0)

	-- experience --
	if C["unitframes"].epbar then
		if T.level ~= MAX_PLAYER_LEVEL then
			G.UnitFrames.Player.Experience:ClearAllPoints()
			G.UnitFrames.Player.Experience:SetStatusBarColor(0, 0.4, 1, 0.8)

			G.UnitFrames.Player.Experience:Size(T.Scale(TukuiMinimap:GetWidth() - 4), T.Scale(3))
			G.UnitFrames.Player.Experience:Point("TOP", TukuiMinimapStatsRight, "BOTTOM", -36, -24)
			G.UnitFrames.Player.Experience:SetFrameLevel(2)
			G.UnitFrames.Player.Experience:SetAlpha(1)
			G.UnitFrames.Player.Experience:CreateBorder(false, true)
			G.UnitFrames.Player.Experience:SetStatusBarTexture(C["media"].normTex)
				
			-- border for the experience bar
			local epBG = CreateFrame("Frame", epBG, G.UnitFrames.Player.Experience)
			epBG:ClearAllPoints()
			epBG:SetPoint("TOPLEFT", -2, 2)
			epBG:SetPoint("BOTTOMRIGHT", 2, -2)
			epBG:Size(1, 1)
			epBG:SetTemplate("Default")
			epBG:CreateBorder(false, true)
			epBG:SetFrameStrata("Background")

			G.UnitFrames.Player.Experience:HookScript("OnLeave", function(self) self:SetAlpha(1) end)

			G.UnitFrames.Player.Resting:ClearAllPoints()
			G.UnitFrames.Player.Resting:Size(18)
			G.UnitFrames.Player.Resting:SetAlpha(0)
			G.UnitFrames.Player.Resting:SetPoint("TOPLEFT", G.UnitFrames.Player.Health, "TOPLEFT", -10, 10)
		end
	end

	-- reputation --
	if T.level == MAX_PLAYER_LEVEL then
		G.UnitFrames.Player.Reputation:ClearAllPoints()
			
		G.UnitFrames.Player.Reputation:Size(T.Scale(TukuiMinimap:GetWidth() - 4), T.Scale(3))
		G.UnitFrames.Player.Reputation:Point("TOP", TukuiMinimapStatsRight, "BOTTOM", -36, -24)
		G.UnitFrames.Player.Reputation:SetFrameLevel(2)
		G.UnitFrames.Player.Reputation:SetAlpha(1)
		G.UnitFrames.Player.Reputation:CreateBorder(false, true)
		G.UnitFrames.Player.Reputation:SetStatusBarTexture(C["media"].normTex)
		G.UnitFrames.Player.Reputation:SetScript("OnLeave", function(self) self:SetAlpha(1) end)
			
		-- border for the reputation bar --
		local repBG = CreateFrame("Frame", repBG, G.UnitFrames.Player.Reputation)
		repBG:ClearAllPoints()
		repBG:SetPoint("TOPLEFT", -2, 2)
		repBG:SetPoint("BOTTOMRIGHT", 2, -2)
		repBG:Size(1, 1)
		repBG:SetTemplate("Default")
		repBG:CreateBorder(true, true)
		repBG:SetFrameStrata("Background")
	end

	-- combat feedback --
	if C["unitframes"].combatfeedback == true then G.UnitFrames.Player.CombatFeedbackText:SetFont(T.CreateFontString()) G.UnitFrames.Player.CombatFeedbackText:SetShadowOffset(0, 0) end

	-- druidmana --
	if T.myclass == "DRUID" then G.UnitFrames.Player.DruidManaText:SetFont(T.CreateFontString()) end

	-- classbars --
	-- druid --
	if T.myclass == "DRUID" then
		if C["unitframes"].druidmanabar then
			G.UnitFrames.Player.DruidManaBackground:ClearAllPoints()
			G.UnitFrames.Player.DruidManaBackground:SetPoint("TOPLEFT", G.UnitFrames.Player.Power, "BOTTOMLEFT", 0, -6)
			G.UnitFrames.Player.DruidManaBackground:Size(232, 4)
			G.UnitFrames.Player.DruidManaBackground:CreateBorder(false, true)

			G.UnitFrames.Player.DruidMana:SetSize(G.UnitFrames.Player.DruidManaBackground:GetWidth(), G.UnitFrames.Player.DruidManaBackground:GetHeight())
		end
			
		-- eclipse bar --
		G.UnitFrames.Player.EclipseBar:ClearAllPoints()
		G.UnitFrames.Player.EclipseBar:SetPoint("TOPLEFT", G.UnitFrames.Player.Power, "BOTTOMLEFT", 0, -5)
		G.UnitFrames.Player.EclipseBar:Size(232, 4)
		G.UnitFrames.Player.EclipseBar:CreateBorder(false, true)
				
		--Border for the classbar.
		local classBG = CreateFrame("Frame", classBG, G.UnitFrames.Player.EclipseBar)
		classBG:ClearAllPoints()
		classBG:SetPoint("TOPLEFT", -2, 2)
		classBG:SetPoint("BOTTOMRIGHT", 2, -2)
		classBG:Size(1, 1)
		classBG:SetTemplate("Default")
		classBG:CreateBorder(true, true)
		classBG:SetFrameStrata("Background")
		classBG:CreateShadow("Default")

		G.UnitFrames.Player.EclipseBar.LunarBar:SetSize(G.UnitFrames.Player.EclipseBar:GetWidth(), G.UnitFrames.Player.EclipseBar:GetHeight())
		G.UnitFrames.Player.EclipseBar.SolarBar:SetSize(G.UnitFrames.Player.EclipseBar:GetWidth(), G.UnitFrames.Player.EclipseBar:GetHeight())

		G.UnitFrames.Player.EclipseBar.Text:ClearAllPoints()
		G.UnitFrames.Player.EclipseBar.Text:SetPoint("CENTER", G.UnitFrames.Player.Health, 0, 0)
		G.UnitFrames.Player.EclipseBar.Text:SetFont(T.CreateFontString())
				
				
			
		if C["unitframes"].mushroombar == true then	
			-- mushroom bar --
			G.UnitFrames.Player.WildMushroom:ClearAllPoints()
			G.UnitFrames.Player.WildMushroom:SetPoint("TOPLEFT", G.UnitFrames.Player.Power, "BOTTOMLEFT", 0, -18)
			G.UnitFrames.Player.WildMushroom:Size(232, 4)
					
			-- border for the mushroom bar --
			local mushroomBG = CreateFrame("Frame", mushroomBG, G.UnitFrames.Player.WildMushroom)
			mushroomBG:ClearAllPoints()
			mushroomBG:SetPoint("TOPLEFT", -2, 2)
			mushroomBG:SetPoint("BOTTOMRIGHT", 2, -2)
			mushroomBG:Size(1, 1)
			mushroomBG:SetTemplate("Default")
			mushroomBG:CreateBorder(true, true)
			mushroomBG:SetFrameStrata("Background")
			mushroomBG:CreateShadow("Default")
					
			for i = 1, 3 do
				if i == 1 then
					G.UnitFrames.Player.WildMushroom[i]:Size(T.Scale(232 / 3) - 2, 4)
					G.UnitFrames.Player.WildMushroom[i]:SetPoint("LEFT", G.UnitFrames.Player.WildMushroom, "LEFT", 0, 0)
				else
					G.UnitFrames.Player.WildMushroom[i]:Size(T.Scale(232 / 3), 4)
					G.UnitFrames.Player.WildMushroom[i]:Point("LEFT", G.UnitFrames.Player.WildMushroom[i - 1], "RIGHT", 1, 0)
				end
			end
		else
			G.UnitFrames.Player.WildMushroom:Kill()
		end
	end

	-- warlock --
	if T.myclass == "WARLOCK" then
		G.UnitFrames.Player.WarlockSpecBars:ClearAllPoints()
		G.UnitFrames.Player.WarlockSpecBars:SetPoint("TOPLEFT", G.UnitFrames.Player.Power, "BOTTOMLEFT", 0, -6)
		G.UnitFrames.Player.WarlockSpecBars:Size(232, 4)
		
		-- border for the classbar --
		local classBG = CreateFrame("Frame", classBG, G.UnitFrames.Player.WarlockSpecBars)
		classBG:ClearAllPoints()
		classBG:SetPoint("TOPLEFT", -2, 2)
		classBG:SetPoint("BOTTOMRIGHT", 2, -2)
		classBG:Size(1, 1)
		classBG:SetTemplate("Default")
		classBG:CreateBorder(true, true)
		classBG:SetFrameStrata("Background")
		classBG:CreateShadow("Default")

		for i = 1, 4 do
			G.UnitFrames.Player.WarlockSpecBars[i]:Size(T.Scale(232 / 4), 4)

			if i == 1 then
				G.UnitFrames.Player.WarlockSpecBars[i]:SetPoint("LEFT", G.UnitFrames.Player.WarlockSpecBars, "LEFT", 0, 0)
			else
				G.UnitFrames.Player.WarlockSpecBars[i]:Point("LEFT", G.UnitFrames.Player.WarlockSpecBars[i - 1], "RIGHT", 1, 0)
			end
		end
	end

	-- paladin --
	if T.myclass == "PALADIN" then
		G.UnitFrames.Player.HolyPower:ClearAllPoints()
		G.UnitFrames.Player.HolyPower:SetPoint("TOPLEFT", G.UnitFrames.Player.Power, "BOTTOMLEFT", 0, -6)
		G.UnitFrames.Player.HolyPower:Size(232, 4)
		G.UnitFrames.Player.HolyPower:CreateBorder(false, true)
		
		-- border for the classbar --
		local classBG = CreateFrame("Frame", classBG, G.UnitFrames.Player.HolyPower)
		classBG:ClearAllPoints()
		classBG:SetPoint("TOPLEFT", -2, 2)
		classBG:SetPoint("BOTTOMRIGHT", 2, -2)
		classBG:Size(1, 1)
		classBG:SetTemplate("Default")
		classBG:CreateBorder(true, true)
		classBG:SetFrameStrata("Background")
		classBG:CreateShadow("Default")

		local maxHolyPower
		if T.level == MAX_PLAYER_LEVEL then
			maxHolyPower = 5
		else
			maxHolyPower = 3
		end

		for i = 1, maxHolyPower do
			G.UnitFrames.Player.HolyPower[i]:SetStatusBarColor(228 / 255, 225 / 255, 16 / 255)
			if maxHolyPower == 3 then
				for i = 1, 3 do
					G.UnitFrames.Player.HolyPower[i]:Size(T.Scale(232 / 3), 4)
				end
				G.UnitFrames.Player.HolyPower[i].width = G.UnitFrames.Player.HolyPower[i]:GetWidth()
			elseif maxHolyPower == 5 then
				if i == 5 then
					G.UnitFrames.Player.HolyPower[i]:Size(T.Scale(220 / 5) - 4, 4)
				else
					G.UnitFrames.Player.HolyPower[i]:Size(T.Scale(234 / 5), 4)
				end
				G.UnitFrames.Player.HolyPower[i].width = G.UnitFrames.Player.HolyPower[i]:GetWidth()
			end

			if i == 1 then
				G.UnitFrames.Player.HolyPower[i]:SetPoint("LEFT", G.UnitFrames.Player.HolyPower)
			else
				G.UnitFrames.Player.HolyPower[i]:Point("LEFT", G.UnitFrames.Player.HolyPower[i - 1], "RIGHT", 1, 0)
			end
			G.UnitFrames.Player.HolyPower[i].width = G.UnitFrames.Player.HolyPower[i]:GetWidth()
		end
	end
		
	-- mage --
	if T.myclass == "MAGE" then
		G.UnitFrames.Player.ArcaneChargeBar:ClearAllPoints()
		G.UnitFrames.Player.ArcaneChargeBar:Point("TOPLEFT", G.UnitFrames.Player.Power, "BOTTOMLEFT", 0, -6)
		G.UnitFrames.Player.ArcaneChargeBar:Size(232, 4)
		
		local classBG = CreateFrame("Frame", classBG, G.UnitFrames.Player.ArcaneChargeBar)
		classBG:ClearAllPoints()
		classBG:SetPoint("TOPLEFT", -2, 2)
		classBG:SetPoint("BOTTOMRIGHT", 2, -2)
		classBG:Size(1, 1)
		classBG:SetTemplate("Default")
		classBG:CreateBorder(true, true)
		classBG:SetFrameStrata("Background")
		classBG:CreateShadow("Default")
		
		for i = 1, 6 do
			if i == 6 then
				G.UnitFrames.Player.ArcaneChargeBar[i]:Size(T.Scale(220 / 6), 4)
			else
				G.UnitFrames.Player.ArcaneChargeBar[i]:Size(T.Scale(234 / 6) - 1, 4)
			end
			
			if i == 1 then
				G.UnitFrames.Player.ArcaneChargeBar[i]:Point("LEFT", G.UnitFrames.Player.ArcaneChargeBar, "LEFT", 0, 0)
			else
				G.UnitFrames.Player.ArcaneChargeBar[i]:Point("LEFT", G.UnitFrames.Player.ArcaneChargeBar[i - 1], "RIGHT", 1, 0)
			end
		end
	end
		
	-- rogue
	if T.myclass == "ROGUE" and C["misc"].sComboenable == false then
		G.UnitFrames.Player.ComboPointsBar:ClearAllPoints()
		G.UnitFrames.Player.ComboPointsBar:SetPoint("TOPLEFT", G.UnitFrames.Player.Power, "BOTTOMLEFT", 0, -6)
		G.UnitFrames.Player.ComboPointsBar:Size(232, 4)
		
		--Border for the classbar.
		local classBG = CreateFrame("Frame", classBG, G.UnitFrames.Player.ComboPointsBar)
		classBG:ClearAllPoints()
		classBG:SetPoint("TOPLEFT", -2, 2)
		classBG:SetPoint("BOTTOMRIGHT", 2, -2)
		classBG:Size(1, 1)
		classBG:SetTemplate("Default")
		classBG:CreateBorder(true, true)
		classBG:SetFrameStrata("Background")
		classBG:CreateShadow("Default")

		for i = 1, 5 do
			if i == 5 then
				G.UnitFrames.Player.ComboPointsBar[i]:Size(T.Scale(220 / 5) - 4, 4)
			else
				G.UnitFrames.Player.ComboPointsBar[i]:Size(T.Scale(234 / 5), 4)
			end

			if i == 1 then
				G.UnitFrames.Player.ComboPointsBar[i]:SetPoint("LEFT", G.UnitFrames.Player.ComboPointsBar, "LEFT", 0, 0)
			else
				G.UnitFrames.Player.ComboPointsBar[i]:Point("LEFT", G.UnitFrames.Player.ComboPointsBar[i - 1], "RIGHT", 1, 0)
			end
		end
	end

	-- deathknight --
	if T.myclass == "DEATHKNIGHT" then
		G.UnitFrames.Player.Runes:ClearAllPoints()
		G.UnitFrames.Player.Runes:SetPoint("TOPLEFT", G.UnitFrames.Player.Power, "BOTTOMLEFT", 0, -6)
		G.UnitFrames.Player.Runes:Size(232, 4)
		G.UnitFrames.Player.Runes:CreateBorder(false, true)
		
		-- border for the classbar --
		local classBG = CreateFrame("Frame", classBG, G.UnitFrames.Player.Runes)
		classBG:ClearAllPoints()
		classBG:SetPoint("TOPLEFT", -2, 2)
		classBG:SetPoint("BOTTOMRIGHT", 2, -2)
		classBG:Size(1, 1)
		classBG:SetTemplate("Default")
		classBG:CreateBorder(true, true)
		classBG:SetFrameStrata("Background")
		classBG:CreateShadow("Default")

		for i = 1, 6 do
			G.UnitFrames.Player.Runes[i]:Size(T.Scale(220 / 6), 4)
			if i == 1 then
				G.UnitFrames.Player.Runes[i]:Size(T.Scale(220 / 6) - 4, 4)
				G.UnitFrames.Player.Runes[i]:ClearAllPoints()
				G.UnitFrames.Player.Runes[i]:SetPoint("LEFT", G.UnitFrames.Player.Runes, "LEFT", 0, 0)
			else
				G.UnitFrames.Player.Runes[i]:Size(T.Scale(234 / 6), 4)
				G.UnitFrames.Player.Runes[i]:Point("LEFT", G.UnitFrames.Player.Runes[i - 1], "RIGHT", 1, 0)
			end
		end
		
		-- statuebar --
		if C["unitframes"].showstatuebar then
			G.UnitFrames.Player.Statue:ClearAllPoints()
			G.UnitFrames.Player.Statue:Point("RIGHT", G.UnitFrames.Player.Power, "LEFT", -7, -4)
			G.UnitFrames.Player.Statue:SetOrientation'VERTICAL'
			G.UnitFrames.Player.Statue:Size(3, G.UnitFrames.Player.Power:GetHeight() + 8)

			-- border for the statuebar --
			local statueBG = CreateFrame("Frame", statueBG, G.UnitFrames.Player.Statue)
			statueBG:ClearAllPoints()
			statueBG:SetPoint("TOPLEFT", -2, 2)
			statueBG:SetPoint("BOTTOMRIGHT", 2, -2)
			statueBG:Size(1, 1)
			statueBG:SetTemplate("Default")
			statueBG:CreateBorder(true, true)
			statueBG:SetFrameStrata("Background")
			statueBG:CreateShadow("Default")
		end
	end

	-- monk
	if T.myclass == "MONK" then
		G.UnitFrames.Player.HarmonyBar:ClearAllPoints()
		G.UnitFrames.Player.HarmonyBar:SetPoint("TOP", G.UnitFrames.Player, "BOTTOM", 0, -8)
		G.UnitFrames.Player.HarmonyBar:Size(232, 4)
		G.UnitFrames.Player.HarmonyBar:CreateBackdrop("Default")
		G.UnitFrames.Player.HarmonyBar.backdrop:CreateShadow("Default")

		local maxChi = UnitPowerMax("player", SPELL_POWER_LIGHT_FORCE)

		for i = 1, maxChi do
			if maxChi == 4 then
				if i == 4 or i == 3 then
					G.UnitFrames.Player.HarmonyBar[i]:Size((232 / 4) - 1, 4)
				else
					G.UnitFrames.Player.HarmonyBar[i]:Size(232 / 4, 4)
				end
			elseif maxChi == 5 then
				if i == 5 then
					G.UnitFrames.Player.HarmonyBar[i]:Size(T.Scale(232 / 5) - 1, 4)
				else
					G.UnitFrames.Player.HarmonyBar[i]:Size(T.Scale(232 / 5), 4)
				end
			end

			if i == 1 then
				G.UnitFrames.Player.HarmonyBar[i]:SetPoint("TOP", G.UnitFrames.Player, "BOTTOM", 0, -8)
			else
				G.UnitFrames.Player.HarmonyBar[i]:Point("LEFT", G.UnitFrames.Player.HarmonyBar[i - 1], "RIGHT", 1, 0)
			end
		end
		
		-- statuebar --
		if C["unitframes"].showstatuebar then
			G.UnitFrames.Player.Statue:ClearAllPoints()
			G.UnitFrames.Player.Statue:Point("RIGHT", G.UnitFrames.Player.Power, "LEFT", -7, -4)
			G.UnitFrames.Player.Statue:SetOrientation'VERTICAL'
			G.UnitFrames.Player.Statue:Size(3, G.UnitFrames.Player.Power:GetHeight() + 8)

			-- border for the statuebar --
			local statueBG = CreateFrame("Frame", statueBG, G.UnitFrames.Player.Statue)
			statueBG:ClearAllPoints()
			statueBG:SetPoint("TOPLEFT", -2, 2)
			statueBG:SetPoint("BOTTOMRIGHT", 2, -2)
			statueBG:Size(1, 1)
			statueBG:SetTemplate("Default")
			statueBG:CreateBorder(true, true)
			statueBG:SetFrameStrata("Background")
			statueBG:CreateShadow("Default")
		end
	end

	-- shaman --
	if T.myclass == "SHAMAN" then
		for i = 1, 4 do
			G.UnitFrames.Player.TotemBar[i]:ClearAllPoints()
			G.UnitFrames.Player.TotemBar[i]:Size(T.Scale(232 / 4) - 5, 4)

			if i == 1 then
				G.UnitFrames.Player.TotemBar[i]:SetPoint("TOPLEFT", G.UnitFrames.Player, "BOTTOMLEFT", -6, -8)
			else
				G.UnitFrames.Player.TotemBar[i]:Point("LEFT", G.UnitFrames.Player.TotemBar[i - 1], "RIGHT", 7, 0)
			end
			
			-- border for the classbar --
			local classBG = CreateFrame("Frame", classBG, G.UnitFrames.Player.TotemBar[i])
			classBG:ClearAllPoints()
			classBG:SetPoint("TOPLEFT", -2, 2)
			classBG:SetPoint("BOTTOMRIGHT", 2, -2)
			classBG:Size(1, 1)
			classBG:SetTemplate("Default")
			classBG:CreateBorder(true, true)
			classBG:SetFrameStrata("Background")
			classBG:CreateShadow("Default")
		end
	end
	
	if T.myclass == "PRIEST" then
		G.UnitFrames.Player.ShadowOrbsBar:ClearAllPoints()
		G.UnitFrames.Player.ShadowOrbsBar:SetPoint("TOPLEFT", G.UnitFrames.Player.Power, "BOTTOMLEFT", 0, -6)
		G.UnitFrames.Player.ShadowOrbsBar:Size(232, 4)
		G.UnitFrames.Player.ShadowOrbsBar:CreateBackdrop("Default")
		G.UnitFrames.Player.ShadowOrbsBar.backdrop:CreateShadow("Default")

		for i = 1, 3 do
			G.UnitFrames.Player.ShadowOrbsBar[i]:Size(T.Scale(232 / 3), 4)

			if i == 1 then
				G.UnitFrames.Player.ShadowOrbsBar[i]:SetPoint("LEFT", G.UnitFrames.Player.ShadowOrbsBar, "LEFT", 0, 0)
			else
				G.UnitFrames.Player.ShadowOrbsBar[i]:Point("LEFT", G.UnitFrames.Player.ShadowOrbsBar[i - 1], "RIGHT", 1, 0)
			end
		end

		-- statuebar --
		if C["unitframes"].showstatuebar then
			G.UnitFrames.Player.Statue:ClearAllPoints()
			G.UnitFrames.Player.Statue:Point("RIGHT", G.UnitFrames.Player.Power, "LEFT", -7, -4)
			G.UnitFrames.Player.Statue:SetOrientation'VERTICAL'
			G.UnitFrames.Player.Statue:Size(3, G.UnitFrames.Player.Power:GetHeight() + 8)

			-- border for the statuebar --
			local statueBG = CreateFrame("Frame", statueBG, G.UnitFrames.Player.Statue)
			statueBG:ClearAllPoints()
			statueBG:SetPoint("TOPLEFT", -2, 2)
			statueBG:SetPoint("BOTTOMRIGHT", 2, -2)
			statueBG:Size(1, 1)
			statueBG:SetTemplate("Default")
			statueBG:CreateBorder(true, true)
			statueBG:SetFrameStrata("Background")
			statueBG:CreateShadow("Default")
		end
	end

	-- castbar
	if C["unitframes"].unitcastbar == true then
		G.UnitFrames.Player.Castbar:ClearAllPoints()
		G.UnitFrames.Player.Castbar:SetHeight(19)
		if C["actionbar"].layout == 1 then
			G.UnitFrames.Player.Castbar:Point("BOTTOMRIGHT", G.ActionBars.Bar2, "TOPRIGHT", -2, 5)
		else
			G.UnitFrames.Player.Castbar:Point("BOTTOMRIGHT", G.ActionBars.Bar1, "TOPRIGHT", -2, 5)
		end
		G.UnitFrames.Player.Castbar:CreateBorder(false, true)
		G.UnitFrames.Player.Castbar:SetStatusBarTexture(C["media"].normTex)
		G.UnitFrames.Player.Castbar:SetStatusBarColor(unpack(C["media"].datatextcolor1))
		G.UnitFrames.Player.Castbar.bg:SetVertexColor(0, 0, 0, .25)
		
		-- border for the castbar --
		local castBG = CreateFrame("Frame", castBG, G.UnitFrames.Player.Castbar)
		castBG:ClearAllPoints()
		castBG:SetPoint("TOPLEFT", -2, 2)
		castBG:SetPoint("BOTTOMRIGHT", 2, -2)
		castBG:Size(1, 1)
		castBG:SetTemplate("Transparent")
		castBG:CreateBorder(true, true)
		castBG:SetFrameStrata("Background")
		castBG:CreateShadow("Default")

		if C["unitframes"].cbicons == true then
			if C["actionbar"].layout == 1 then
				G.UnitFrames.Player.Castbar:Width(T.Scale(G.ActionBars.Bar2:GetWidth() - 4) - 26)
			else
				G.UnitFrames.Player.Castbar:Width(T.Scale(G.ActionBars.Bar1:GetWidth() - 4) - 26)
			end

			G.UnitFrames.Player.Castbar.button:ClearAllPoints()
			G.UnitFrames.Player.Castbar.button:SetPoint("RIGHT", G.UnitFrames.Player.Castbar, "LEFT", -5, 0)
			G.UnitFrames.Player.Castbar.button:Size(23)
			G.UnitFrames.Player.Castbar.button:CreateShadow("Default")
		else
			if C["actionbar"].layout == 1 then
				G.UnitFrames.Player.Castbar:Width(G.ActionBars.Bar2:GetWidth() - 4)
			else
				G.UnitFrames.Player.Castbar:Width(G.ActionBars.Bar1:GetWidth() - 4)
			end
		end

		G.UnitFrames.Player.Castbar.PostCastStart = T.PostCastStart
		G.UnitFrames.Player.Castbar.PostChannelStart = T.PostCastStart

		G.UnitFrames.Player.Castbar.Time = T.SetFontString(G.UnitFrames.Player.Castbar, T.CreateFontString())
		G.UnitFrames.Player.Castbar.Time:Point("RIGHT", G.UnitFrames.Player.Castbar, "RIGHT", -4, 1)
		G.UnitFrames.Player.Castbar.Time:SetTextColor(1, 1, 1)
		G.UnitFrames.Player.Castbar.Time:SetShadowOffset(0, 0)

		G.UnitFrames.Player.Castbar.Text = T.SetFontString(G.UnitFrames.Player.Castbar, T.CreateFontString())
		G.UnitFrames.Player.Castbar.Text:Point("LEFT", G.UnitFrames.Player.Castbar, "LEFT", 4, 1)
		G.UnitFrames.Player.Castbar.Text:SetTextColor(1, 1, 1)
		G.UnitFrames.Player.Castbar.Text:SetShadowOffset(0, 0)

		if C["unitframes"].cblatency == true then
			G.UnitFrames.Player.Castbar.SafeZone:SetVertexColor(0.69, 0.31, 0.31, 0.75)
		end
	end

	-- size --
	G.UnitFrames.Player:Size(220, 27)

	-- target --
	-- health --
	G.UnitFrames.Target.Health:Height(20)
	G.UnitFrames.Target.Health:SetFrameLevel(9)
	G.UnitFrames.Target.Health:SetFrameStrata("LOW")
	G.UnitFrames.Target.Health:CreateBorder(false, true)
	G.UnitFrames.Target.Health.bg:SetTexture(0.05, 0.05, 0.05, 1)
	G.UnitFrames.Target.Health:SetStatusBarTexture(C["media"].normTex)

	-- border for the health bar --
	local healthBG = CreateFrame("Frame", healthBG, G.UnitFrames.Target.Health)
	healthBG:ClearAllPoints()
	healthBG:SetPoint("TOPLEFT", -2, 2)
	healthBG:SetPoint("BOTTOMRIGHT", 2, -2)
	healthBG:Size(1, 1)
	healthBG:SetTemplate("Default")
	healthBG:CreateBorder(true, true)
	healthBG:SetFrameStrata("Low")
	healthBG:SetFrameLevel(G.UnitFrames.Player.Health:GetFrameLevel())
	healthBG:CreateShadow("Default")

	if C["unitframes"].unicolor == true then
		G.UnitFrames.Target.Health.colorTapping = false
		G.UnitFrames.Target.Health.colorDisconnected = false
		G.UnitFrames.Target.Health.colorClass = false
		G.UnitFrames.Target.Health:SetStatusBarColor(unpack(C["unitframes"].health))
		G.UnitFrames.Target.Health.bg:SetVertexColor(unpack(C["unitframes"].healthbg))
		if C["unitframes"].colorgradient then
			G.UnitFrames.Player.Health.colorSmooth = true
			G.UnitFrames.Player.Health.bg:SetTexture(.2, .2, .2)
		end	
	else
		G.UnitFrames.Target.Health.colorDisconnected = true
		G.UnitFrames.Target.Health.colorTapping = true
		G.UnitFrames.Target.Health.colorClass = true
		G.UnitFrames.Target.Health.colorReaction = true
	end

	G.UnitFrames.Target.Name:SetFont(T.CreateFontString())
	G.UnitFrames.Target.Name:ClearAllPoints()
	G.UnitFrames.Target.Name:Point("LEFT", G.UnitFrames.Target.Health, "LEFT", 4, 1)
	G.UnitFrames.Target.Name:SetShadowOffset(0, 0)

	G.UnitFrames.Target.Health.value = T.SetFontString(G.UnitFrames.Target.Health, T.CreateFontString())
	G.UnitFrames.Target.Health.value:Point("RIGHT", G.UnitFrames.Target.Health, "RIGHT", -4, 1)
	G.UnitFrames.Target.Health.value:SetShadowOffset(0, 0)

	G.UnitFrames.Target.Health.PostUpdate = T.PostUpdateHealth

	-- power --
	G.UnitFrames.Target.Power:Size(232, 18)
	G.UnitFrames.Target.Power:ClearAllPoints()
	G.UnitFrames.Target.Power:SetFrameLevel(1)
	G.UnitFrames.Target.Power:SetFrameStrata("Background")
	G.UnitFrames.Target.Power:Point("BOTTOMRIGHT", G.UnitFrames.Target.Health, "BOTTOMRIGHT", 6, -8)
	G.UnitFrames.Target.Power:CreateBorder(false, true)
	G.UnitFrames.Target.Power:SetStatusBarTexture(C["media"].normTex)

	-- border for the powerbar --
	local powerBG = CreateFrame("Frame", powerBG, G.UnitFrames.Target.Power)
	powerBG:ClearAllPoints()
	powerBG:SetPoint("TOPLEFT", -2, 2)
	powerBG:SetPoint("BOTTOMRIGHT", 2, -2)
	powerBG:Size(1, 1)
	powerBG:SetTemplate("Default")
	powerBG:CreateBorder(true, true)
	powerBG:SetFrameStrata("Background")
	powerBG:SetFrameLevel(G.UnitFrames.Player.Power:GetFrameLevel())
	powerBG:CreateShadow("Default")

	if C["unitframes"].unicolor == true then
		G.UnitFrames.Target.Power.colorTapping = true
		G.UnitFrames.Target.Power.colorClass = true
		G.UnitFrames.Target.Power.bg.multiplier = 0.1
	else
		G.UnitFrames.Target.Power.colorPower = true
		G.UnitFrames.Target.Power.bg.colorClass = true
	end

	-- portraits --
	if C["unitframes"].charportrait == true then
		G.UnitFrames.Target.Portrait:ClearAllPoints()
		G.UnitFrames.Target.Portrait:SetAllPoints(G.UnitFrames.Target.Health)
		G.UnitFrames.Target.Portrait:SetAlpha(0.2)
		G.UnitFrames.Target.Portrait.SetAlpha = T.dummy
		G.UnitFrames.Target.Health:ClearAllPoints()
		G.UnitFrames.Target.Health:SetPoint("TOPLEFT", 0, 0)
		G.UnitFrames.Target.Health:SetPoint("TOPRIGHT")
	end

	-- combat feedback --
	if C["unitframes"].combatfeedback == true then G.UnitFrames.Target.CombatFeedbackText:SetFont(T.CreateFontString()) G.UnitFrames.Target.CombatFeedbackText:SetShadowOffset(0, 0) end

	-- castbar
	if C["unitframes"].unitcastbar == true then
		-- anchor for targetcastbar --
		local tcb = CreateFrame("Frame", "TCBanchor", UIParent)
		tcb:SetSize(C["unitframes"].castbarwidth, C["unitframes"].castbarheight)
		tcb:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 220)
		tcb:SetFrameLevel(10)
		tcb:SetClampedToScreen(true)
		tcb:SetMovable(true)
		tcb:SetTemplate("Default")
		tcb:SetBackdropBorderColor(1, 0, 0)
		tcb.text = T.SetFontString(tcb, C["media"].font, 12)
		tcb.text:SetPoint("CENTER")
		tcb.text:SetText("Move Targetcastbar")
		tcb:Hide()
		tinsert(T.AllowFrameMoving, tcb)
		
		G.UnitFrames.Target.Castbar:ClearAllPoints()
		G.UnitFrames.Target.Castbar:SetHeight(C["unitframes"].castbarheight)
		G.UnitFrames.Target.Castbar:Point("LEFT", TCBanchor, "LEFT", 0, 0)
		G.UnitFrames.Target.Castbar:CreateBorder(false, true)
		G.UnitFrames.Target.Castbar:SetStatusBarTexture(C["media"].normTex)
		G.UnitFrames.Target.Castbar:SetStatusBarColor(.31, .43, .59, 1)
		G.UnitFrames.Target.Castbar.bg:SetVertexColor(0, 0, 0, .25)
		
		-- border for the castbar --
		local castBG = CreateFrame("Frame", castBG, G.UnitFrames.Target.Castbar)
		castBG:ClearAllPoints()
		castBG:SetPoint("TOPLEFT", -2, 2)
		castBG:SetPoint("BOTTOMRIGHT", 2, -2)
		castBG:Size(1, 1)
		castBG:SetTemplate("Transparent")
		castBG:CreateBorder(true, true)
		castBG:SetFrameStrata("Background")
		castBG:CreateShadow("Default")

		if C["unitframes"].cbicons == true then
			G.UnitFrames.Target.Castbar:Width(250)
			G.UnitFrames.Target.Castbar.button:ClearAllPoints()
			G.UnitFrames.Target.Castbar.button:SetPoint("BOTTOM", G.UnitFrames.Target.Castbar, "TOP", 0, 5)
			G.UnitFrames.Target.Castbar.button:Size(23)
			G.UnitFrames.Target.Castbar.button:CreateShadow("Default")
		else
			G.UnitFrames.Target.Castbar:Width(250)
		end

		G.UnitFrames.Target.Castbar.PostCastStart = T.PostCastStart
		G.UnitFrames.Target.Castbar.PostChannelStart = T.PostCastStart

		G.UnitFrames.Target.Castbar.Time = T.SetFontString(G.UnitFrames.Target.Castbar, T.CreateFontString())
		G.UnitFrames.Target.Castbar.Time:Point("RIGHT", G.UnitFrames.Target.Castbar, "RIGHT", -4, 1)
		G.UnitFrames.Target.Castbar.Time:SetTextColor(1, 1, 1)
		G.UnitFrames.Target.Castbar.Time:SetShadowOffset(0, 0)

		G.UnitFrames.Target.Castbar.Text = T.SetFontString(G.UnitFrames.Target.Castbar, T.CreateFontString())
		G.UnitFrames.Target.Castbar.Text:Point("LEFT", G.UnitFrames.Target.Castbar, "LEFT", 4, 1)
		G.UnitFrames.Target.Castbar.Text:SetTextColor(1, 1, 1)
		G.UnitFrames.Target.Castbar.Text:SetShadowOffset(0, 0)
	end

	-- buffs, debuffs --
	-- skin target auras --
	local player = G.UnitFrames.Player
	local target = G.UnitFrames.Target
	local targettarget = G.UnitFrames.TargetTarget

	-- hook PostCreateAura --
	local function PostCreateAura(self, button)
		-- kill the glow
		button.Glow:Kill()

		-- move icon just 1px inside the black inset (it hide 1px borders)
		button:CreateBorder(true, true)
		button:CreateShadow("Default")
		button.icon:Point("TOPLEFT", 2, -2)
		button.icon:Point("BOTTOMRIGHT", -2, 2)

		-- resize the cooldown tex to fix new icon size
		button.cd:Point("TOPLEFT", button, "TOPLEFT", 0, 0)
		button.cd:Point("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 0)

		-- change the font
		button.remaining:SetFont(T.CreateFontString())
	end
	hooksecurefunc(T, "PostCreateAura", PostCreateAura)

	if C["unitframes"].targetauras then
		if target then
			local buffs = target.Buffs
			local debuffs = target.Debuffs
			
			buffs:SetHeight(24.5)
			buffs:SetWidth(220)
			buffs.size = 24.5
			buffs.num = 8
			buffs.spacing = 3
			buffs.initialAnchor = 'TOPLEFT'
			buffs["growth-y"] = "UP"
			buffs["growth-x"] = "RIGHT"
			buffs:SetPoint("BOTTOMLEFT", target, "TOPLEFT", -2, 5)
			buffs.PostCreateIcon = T.PostCreateAura
			buffs.PostUpdateIcon = T.PostUpdateAura
			
			debuffs:SetHeight(24.5)
			debuffs:SetWidth(220)
			debuffs.size = 24.5
			debuffs.num = 21
			debuffs.spacing = 3
			debuffs.initialAnchor = 'TOPRIGHT'
			debuffs["growth-y"] = "UP"
			debuffs["growth-x"] = "LEFT"
			debuffs:ClearAllPoints()
			debuffs:SetPoint("BOTTOMRIGHT", buffs, "TOPRIGHT", 4, 0)
			debuffs.PostCreateIcon = T.PostCreateAura
			debuffs.PostUpdateIcon = T.PostUpdateAura

			buffs.ClearAllPoints = T.dummy
			buffs.SetPoint = T.dummy
		end
	end

	-- size
	G.UnitFrames.Target:Size(220, 27)

	-- tot --
	-- health --
	G.UnitFrames.TargetTarget.Health:Size(129, 17)
	G.UnitFrames.TargetTarget.Health:SetFrameLevel(5)
	G.UnitFrames.TargetTarget.Health:CreateBorder(false, true)
	G.UnitFrames.TargetTarget.Health:SetStatusBarTexture(C["media"].normTex)
	G.UnitFrames.TargetTarget.Health.bg:SetTexture(0.05, 0.05, 0.05)

	-- border for the health bar --
	local healthBG = CreateFrame("Frame", healthBG, G.UnitFrames.TargetTarget.Health)
	healthBG:ClearAllPoints()
	healthBG:SetPoint("TOPLEFT", -2, 2)
	healthBG:SetPoint("BOTTOMRIGHT", 2, -2)
	healthBG:Size(1, 1)
	healthBG:SetTemplate("Default")
	healthBG:CreateBorder(true, true)
	healthBG:SetFrameStrata("Low")
	healthBG:SetFrameLevel(G.UnitFrames.TargetTarget.Health:GetFrameLevel())
	healthBG:CreateShadow("Default")

	if C["unitframes"].unicolor == true then
		G.UnitFrames.TargetTarget.Health.colorTapping = false
		G.UnitFrames.TargetTarget.Health.colorDisconnected = false
		G.UnitFrames.TargetTarget.Health.colorClass = false
		G.UnitFrames.TargetTarget.Health:SetStatusBarColor(0.2, 0.2, 0.2)
		G.UnitFrames.TargetTarget.Health.bg:SetVertexColor(0.05, 0.05, 0.05, 1)
	else
		G.UnitFrames.TargetTarget.Health.bg:SetVertexColor(.05, .05, .05)
		G.UnitFrames.TargetTarget.Health.colorDisconnected = true
		G.UnitFrames.TargetTarget.Health.colorTapping = true
		G.UnitFrames.TargetTarget.Health.colorClass = true
		G.UnitFrames.TargetTarget.Health.colorReaction = true
	end

	G.UnitFrames.TargetTarget.Name:SetFont(T.CreateFontString())
	G.UnitFrames.TargetTarget.Name:ClearAllPoints()
	G.UnitFrames.TargetTarget.Name:SetPoint("CENTER", G.UnitFrames.TargetTarget.Health ,"CENTER", 0, 2)
	G.UnitFrames.TargetTarget.Name:SetShadowOffset(0, 0)
		
	-- power --
	local TargetTargetPower = CreateFrame("StatusBar", nil, G.UnitFrames.TargetTarget)
	TargetTargetPower:Size(3)
	TargetTargetPower:SetFrameStrata("High")
	TargetTargetPower:Point("TOPLEFT", G.UnitFrames.TargetTarget.Health, "BOTTOMLEFT", 9, 0)
	TargetTargetPower:Point("TOPRIGHT", G.UnitFrames.TargetTarget.Health, "BOTTOMRIGHT", -9, -3)
	TargetTargetPower:SetStatusBarTexture(C["media"].normTex)
	TargetTargetPower:CreateBorder(false, true)

	-- border for the powerbar --
	local powerBG = CreateFrame("Frame", powerBG, TargetTargetPower)
	powerBG:ClearAllPoints()
	powerBG:SetPoint("TOPLEFT", -2, 2)
	powerBG:SetPoint("BOTTOMRIGHT", 2, -2)
	powerBG:Size(1, 1)
	powerBG:SetTemplate("Default")
	powerBG:CreateBorder(true, true)
	powerBG:SetFrameStrata("High")
	powerBG:SetFrameLevel(G.UnitFrames.Player.Power:GetFrameLevel())
	powerBG:CreateShadow("Default")

	local TargetTargetPowerBackground = TargetTargetPower:CreateTexture(nil, "BORDER")
	TargetTargetPowerBackground:SetAllPoints(TargetTargetPower)
	TargetTargetPowerBackground:SetTexture(C["media"].normTex)
	TargetTargetPowerBackground.multiplier = 0.1
	TargetTargetPower.frequentUpdates = true
	TargetTargetPower.colorDisconnected = true
	if C["unitframes"].showsmooth == true then TargetTargetPower.Smooth = true end

	if C["unitframes"].unicolor == true then
		TargetTargetPower.colorTapping = true
		TargetTargetPower.colorClass = true
		TargetTargetPower.colorReaction = true
		TargetTargetPowerBackground.multiplier = 0.1
	else
		TargetTargetPower.colorPower = true
	end

	G.UnitFrames.TargetTarget.Power = TargetTargetPower
	G.UnitFrames.TargetTarget.Power.bg = TargetTargetPowerBackground
	G.UnitFrames.TargetTarget:EnableElement("Power")

	-- buffs, debuffs for tot --
	if C["unitframes"].totdebuffs == true then
		G.UnitFrames.TargetTarget.Debuffs:SetHeight(25)
		G.UnitFrames.TargetTarget.Debuffs:SetWidth(120)
		G.UnitFrames.TargetTarget.Debuffs.size = 19
		G.UnitFrames.TargetTarget.Debuffs.num = 3
		G.UnitFrames.TargetTarget.Debuffs.spacing = 3

		G.UnitFrames.TargetTarget.Debuffs:ClearAllPoints()
		G.UnitFrames.TargetTarget.Debuffs:Point("BOTTOMLEFT", G.UnitFrames.TargetTarget, "TOPLEFT", -1, 3)
		G.UnitFrames.TargetTarget.Debuffs.ClearAllPoints = T.dummy
		G.UnitFrames.TargetTarget.Debuffs.SetPoint = T.dummy

		G.UnitFrames.TargetTarget.Debuffs.initialAnchor = "LEFT"
		G.UnitFrames.TargetTarget.Debuffs["growth-x"] = "RIGHT"
	end

	-- size --
	G.UnitFrames.TargetTarget:Size(120, 19)

	-- pet --
	-- health
	G.UnitFrames.Pet.Health:Size(129, 17)
	G.UnitFrames.Pet.Health:SetFrameLevel(5)
	G.UnitFrames.Pet.Health:CreateBorder(false, true)
	G.UnitFrames.Pet.Health:SetStatusBarTexture(C["media"].normTex)
	G.UnitFrames.Pet.Health.bg:SetTexture(0.05, 0.05, 0.05)

	--Border for the health bar.
	local healthBG = CreateFrame("Frame", healthBG, G.UnitFrames.Pet.Health)
	healthBG:ClearAllPoints()
	healthBG:SetPoint("TOPLEFT", -2, 2)
	healthBG:SetPoint("BOTTOMRIGHT", 2, -2)
	healthBG:Size(1, 1)
	healthBG:SetTemplate("Default")
	healthBG:CreateBorder(true, true)
	healthBG:SetFrameStrata("Low")
	healthBG:SetFrameLevel(G.UnitFrames.Pet.Health:GetFrameLevel())
	healthBG:CreateShadow("Default")

	if C["unitframes"].unicolor == true then
		G.UnitFrames.Pet.Health.colorTapping = false
		G.UnitFrames.Pet.Health.colorDisconnected = false
		G.UnitFrames.Pet.Health.colorClass = false
		G.UnitFrames.Pet.Health:SetStatusBarColor(0.2, 0.2, 0.2)
		G.UnitFrames.Pet.Health.bg:SetVertexColor(0.05, 0.05, 0.05, 1)
	else
		G.UnitFrames.Pet.Health.bg:SetVertexColor(.05, .05, .05)
		G.UnitFrames.Pet.Health.colorDisconnected = true
		G.UnitFrames.Pet.Health.colorTapping = true
		G.UnitFrames.Pet.Health.colorClass = true
		G.UnitFrames.Pet.Health.colorReaction = true
	end

	G.UnitFrames.Pet.Name:SetFont(T.CreateFontString())
	G.UnitFrames.Pet.Name:ClearAllPoints()
	G.UnitFrames.Pet.Name:SetPoint("CENTER", G.UnitFrames.Pet.Health ,"CENTER", 0, 2)
	G.UnitFrames.Pet.Name:SetShadowOffset(0, 0)
		
	-- power --
	G.UnitFrames.Pet.Power:Size(3)
	G.UnitFrames.Pet.Power:SetFrameStrata("High")
	G.UnitFrames.Pet.Power:Point("TOPLEFT", G.UnitFrames.Pet.Health, "BOTTOMLEFT", 9, 0)
	G.UnitFrames.Pet.Power:Point("TOPRIGHT", G.UnitFrames.Pet.Health, "BOTTOMRIGHT", -9, -3)
	G.UnitFrames.Pet.Power:SetStatusBarTexture(C["media"].normTex)
	G.UnitFrames.Pet.Power:CreateBorder(false, true)

	-- border for the powerbar --
	local powerBG = CreateFrame("Frame", powerBG, G.UnitFrames.Pet.Power)
	powerBG:ClearAllPoints()
	powerBG:SetPoint("TOPLEFT", -2, 2)
	powerBG:SetPoint("BOTTOMRIGHT", 2, -2)
	powerBG:Size(1, 1)
	powerBG:SetTemplate("Default")
	powerBG:CreateBorder(true, true)
	powerBG:SetFrameStrata("High")
	powerBG:SetFrameLevel(G.UnitFrames.Player.Power:GetFrameLevel())
	powerBG:CreateShadow("Default")

	-- castbar --
	G.UnitFrames.Pet.Castbar:Kill()

	-- size --
	G.UnitFrames.Pet:Size(120, 19)

	-- focus --
	-- health --
	G.UnitFrames.Focus.Health:Height(17)
	G.UnitFrames.Focus.Health:SetFrameLevel(5)
	G.UnitFrames.Focus.Health:CreateBorder(false, true)
	G.UnitFrames.Focus.Health:SetStatusBarTexture(C["media"].normTex)
	G.UnitFrames.Focus.Health.bg:SetTexture(0.05, 0.05, 0.05)

	-- border for the health bar --
	local healthBG = CreateFrame("Frame", healthBG, G.UnitFrames.Focus.Health)
	healthBG:ClearAllPoints()
	healthBG:SetPoint("TOPLEFT", -2, 2)
	healthBG:SetPoint("BOTTOMRIGHT", 2, -2)
	healthBG:Size(1, 1)
	healthBG:SetTemplate("Default")
	healthBG:CreateBorder(true, true)
	healthBG:SetFrameStrata("Low")
	healthBG:SetFrameLevel(G.UnitFrames.TargetTarget.Health:GetFrameLevel())
	healthBG:CreateShadow("Default")

	if C["unitframes"].unicolor == true then
		G.UnitFrames.Focus.Health.colorTapping = false
		G.UnitFrames.Focus.Health.colorDisconnected = false
		G.UnitFrames.Focus.Health.colorClass = false
		G.UnitFrames.Focus.Health:SetStatusBarColor(0.125, 0.125, 0.125, 1)
		G.UnitFrames.Focus.Health.bg:SetVertexColor(0.05, 0.05, 0.05, 1)
	else
		G.UnitFrames.Focus.Health.colorDisconnected = true
		G.UnitFrames.Focus.Health.colorTapping = true
		G.UnitFrames.Focus.Health.colorClass = true
		G.UnitFrames.Focus.Health.colorReaction = true
	end

	G.UnitFrames.Focus.Name:SetFont(T.CreateFontString())
	G.UnitFrames.Focus.Name:Point("CENTER", G.UnitFrames.Focus.Health, "CENTER", 0, 1)
	G.UnitFrames.Focus.Name:SetShadowOffset(0, 0)

	G.UnitFrames.Focus.Health.value = T.SetFontString(G.UnitFrames.Focus.Health, T.CreateFontString())
	G.UnitFrames.Focus.Health.value:Point("RIGHT", G.UnitFrames.Focus.Health, "RIGHT", -4, 1)
	G.UnitFrames.Focus.Health.value:SetShadowOffset(0, 0)

	-- power --
	G.UnitFrames.Focus.Power:Height(3)
	G.UnitFrames.Focus.Power:ClearAllPoints()
	G.UnitFrames.Focus.Power:Point("TOPLEFT", G.UnitFrames.Focus.Health, "BOTTOMLEFT", 85, 0)
	G.UnitFrames.Focus.Power:Point("TOPRIGHT", G.UnitFrames.Focus.Health, "BOTTOMRIGHT", -9, -3)
	G.UnitFrames.Focus.Power:CreateBorder(false, true)
	G.UnitFrames.Focus.Power:SetStatusBarTexture(C["media"].normTex)
	G.UnitFrames.Focus.Power:SetFrameStrata("High")

	-- border for the powerbar --
	local powerBG = CreateFrame("Frame", powerBG, G.UnitFrames.Focus.Power)
	powerBG:ClearAllPoints()
	powerBG:SetPoint("TOPLEFT", -2, 2)
	powerBG:SetPoint("BOTTOMRIGHT", 2, -2)
	powerBG:Size(1, 1)
	powerBG:SetTemplate("Default")
	powerBG:CreateBorder(true, true)
	powerBG:SetFrameStrata("High")
	powerBG:SetFrameLevel(G.UnitFrames.Player.Power:GetFrameLevel())
	powerBG:CreateShadow("Default")

	G.UnitFrames.Focus.Power.value = T.SetFontString(G.UnitFrames.Focus.Health, T.CreateFontString())
	G.UnitFrames.Focus.Power.value:Point("LEFT", G.UnitFrames.Focus.Health, "LEFT", 4, 1)
	G.UnitFrames.Focus.Power.value:SetShadowOffset(0, 0)
	
	-- castbar --
	if C["unitframes"].unitcastbar == true then
		G.UnitFrames.Focus.Castbar:ClearAllPoints()
		G.UnitFrames.Focus.Castbar:SetHeight(12)
		G.UnitFrames.Focus.Castbar:Point("TOPRIGHT", G.UnitFrames.Focus.Power, "BOTTOMRIGHT", -10, -7)
		G.UnitFrames.Focus.Castbar:CreateBorder(false, true)
		G.UnitFrames.Focus.Castbar:SetStatusBarTexture(C["media"].normTex)
		G.UnitFrames.Focus.Castbar:SetStatusBarColor(.31, .43, .59, 1)
		
		-- border for the castbar --
		local castBG = CreateFrame("Frame", castBG, G.UnitFrames.Focus.Castbar)
		castBG:ClearAllPoints()
		castBG:SetPoint("TOPLEFT", -2, 2)
		castBG:SetPoint("BOTTOMRIGHT", 2, -2)
		castBG:Size(1, 1)
		castBG:SetTemplate("Default")
		castBG:CreateBorder(true, true)
		castBG:SetFrameStrata("Background")
		castBG:CreateShadow("Default")

		G.UnitFrames.Focus.Castbar.bg:Kill()

		G.UnitFrames.Focus.Castbar.bg = G.UnitFrames.Focus.Castbar:CreateTexture(nil, "BORDER")
		G.UnitFrames.Focus.Castbar.bg:SetAllPoints(G.UnitFrames.Focus.Castbar)
		G.UnitFrames.Focus.Castbar.bg:SetTexture(C["media"]["normTex"])
		G.UnitFrames.Focus.Castbar.bg:SetVertexColor(.05, .05, .05, .5)

		G.UnitFrames.Focus.Castbar.Time = T.SetFontString(G.UnitFrames.Focus.Castbar, T.CreateFontString())
		G.UnitFrames.Focus.Castbar.Time:Point("RIGHT", G.UnitFrames.Focus.Castbar, "RIGHT", -4, 1)
		G.UnitFrames.Focus.Castbar.Time:SetTextColor(1, 1, 1)
		G.UnitFrames.Focus.Castbar.Time:SetShadowOffset(0, 0)

		G.UnitFrames.Focus.Castbar.Text = T.SetFontString(G.UnitFrames.Focus.Castbar, T.CreateFontString())
		G.UnitFrames.Focus.Castbar.Text:Point("LEFT", G.UnitFrames.Focus.Castbar, "LEFT", 4, 1)
		G.UnitFrames.Focus.Castbar.Text:SetTextColor(1, 1, 1)
		G.UnitFrames.Focus.Castbar.Text:SetShadowOffset(0, 0)

		G.UnitFrames.Focus.Castbar.PostCastStart = T.PostCastStart
		G.UnitFrames.Focus.Castbar.PostChannelStart = T.PostCastStart

		if C["unitframes"].cbicons == true then
			G.UnitFrames.Focus.Castbar:Width(196 - 15)
			G.UnitFrames.Focus.Castbar.button:ClearAllPoints()
			G.UnitFrames.Focus.Castbar.button:SetPoint("LEFT", G.UnitFrames.Focus.Castbar, "RIGHT", 5, 0)
			G.UnitFrames.Focus.Castbar.button:Size(16)
			G.UnitFrames.Focus.Castbar.button:CreateShadow("Default")
		else
			G.UnitFrames.Focus.Castbar:Width(196)

			G.UnitFrames.Focus.Castbar.button:Kill()
		end
	end

	-- size
	G.UnitFrames.Focus:Size(200, 30)

	-- focus target --
	-- health --
	G.UnitFrames.FocusTarget.Health:Height(10)
	G.UnitFrames.FocusTarget.Health:SetFrameLevel(5)
	G.UnitFrames.FocusTarget.Health:CreateBorder(false, true)
	G.UnitFrames.FocusTarget.Health:SetStatusBarTexture(C["media"].normTex)
	G.UnitFrames.FocusTarget.Health.bg:SetTexture(0.05, 0.05, 0.05)

	-- border for the health bar --
	local healthBG = CreateFrame("Frame", healthBG, G.UnitFrames.FocusTarget.Health)
	healthBG:ClearAllPoints()
	healthBG:SetPoint("TOPLEFT", -2, 2)
	healthBG:SetPoint("BOTTOMRIGHT", 2, -2)
	healthBG:Size(1, 1)
	healthBG:SetTemplate("Default")
	healthBG:CreateBorder(true, true)
	healthBG:SetFrameStrata("Low")
	healthBG:SetFrameLevel(G.UnitFrames.TargetTarget.Health:GetFrameLevel())
	healthBG:CreateShadow("Default")

	if C["unitframes"].unicolor == true then
		G.UnitFrames.FocusTarget.Health.colorTapping = false
		G.UnitFrames.FocusTarget.Health.colorDisconnected = false
		G.UnitFrames.FocusTarget.Health.colorClass = false
		G.UnitFrames.FocusTarget.Health:SetStatusBarColor(0.125, 0.125, 0.125, 1)
		G.UnitFrames.FocusTarget.Health.bg:SetVertexColor(0.05, 0.05, 0.05, 1)
	else
		G.UnitFrames.FocusTarget.Health.colorDisconnected = true
		G.UnitFrames.FocusTarget.Health.colorTapping = true
		G.UnitFrames.FocusTarget.Health.colorClass = true
		G.UnitFrames.FocusTarget.Health.colorReaction = true
	end

	G.UnitFrames.FocusTarget.Name:SetFont(T.CreateFontString())
	G.UnitFrames.FocusTarget.Name:SetShadowOffset(0, 0)
	G.UnitFrames.FocusTarget.Name:Point("CENTER", G.UnitFrames.FocusTarget.Health, "CENTER", 0, 0)

	-- kill buffs / debuffs and other stuff --
	G.UnitFrames.FocusTarget.Debuffs:Kill()
	G.UnitFrames.FocusTarget.Power.value:Kill()
	G.UnitFrames.FocusTarget.Health.value:Kill()
	G.UnitFrames.FocusTarget.Power:Kill()
		
	-- size --
	G.UnitFrames.FocusTarget:Size(75, 10)

	-- boss --
	if C["unitframes"].showboss then
		for i = 1, MAX_BOSS_FRAMES do
			-- health --
			G.UnitFrames["Boss" .. i].Health:Height(22)
			G.UnitFrames["Boss" .. i].Health:SetFrameLevel(5)
			G.UnitFrames["Boss" .. i].Health:CreateBorder(false, true)
			G.UnitFrames["Boss" .. i].Health:SetStatusBarTexture(C["media"].normTex)
			G.UnitFrames["Boss" .. i].Health.bg:SetTexture(0.05, 0.05, 0.05)
			
			-- border for the health bar --
			local healthBG = CreateFrame("Frame", healthBG, G.UnitFrames["Boss" .. i])
			healthBG:ClearAllPoints()
			healthBG:SetPoint("TOPLEFT", -2, 2)
			healthBG:SetPoint("BOTTOMRIGHT", 2, -2)
			healthBG:Size(1, 1)
			healthBG:SetTemplate("Default")
			healthBG:CreateBorder(true, true)
			healthBG:SetFrameStrata("Low")
			healthBG:SetFrameLevel(G.UnitFrames.TargetTarget.Health:GetFrameLevel())
			healthBG:CreateShadow("Default")

			if C["unitframes"].unicolor == true then
				G.UnitFrames["Boss" .. i].Health.colorTapping = false
				G.UnitFrames["Boss" .. i].Health.colorDisconnected = false
				G.UnitFrames["Boss" .. i].Health.colorClass = false
				G.UnitFrames["Boss" .. i].Health:SetStatusBarColor(0.125, 0.125, 0.125, 1)
				G.UnitFrames["Boss" .. i].Health.bg:SetVertexColor(0.05, 0.05, 0.05, 1)
			else
				G.UnitFrames["Boss" .. i].Health.colorDisconnected = true
				G.UnitFrames["Boss" .. i].Health.colorTapping = true
				G.UnitFrames["Boss" .. i].Health.colorClass = true
				G.UnitFrames["Boss" .. i].Health.colorReaction = true
			end

			G.UnitFrames["Boss" .. i].Name:SetFont(T.CreateFontString())
			G.UnitFrames["Boss" .. i].Name:Point("CENTER", G.UnitFrames["Boss" .. i].Health, "CENTER", 0, 1)
			G.UnitFrames["Boss" .. i].Name:SetShadowOffset(0, 0)

			G.UnitFrames["Boss" .. i].Health.value = T.SetFontString(G.UnitFrames["Boss" .. i].Health, T.CreateFontString())
			G.UnitFrames["Boss" .. i].Health.value:Point("RIGHT", G.UnitFrames["Boss" .. i].Health, "RIGHT", -4, 1)
			G.UnitFrames["Boss" .. i].Health.value:SetShadowOffset(0, 0)

			-- power --
			G.UnitFrames["Boss" .. i].Power:Height(3)
			G.UnitFrames["Boss" .. i].Power:ClearAllPoints()
			G.UnitFrames["Boss" .. i].Power:Point("TOPLEFT", G.UnitFrames["Boss" .. i].Health, "BOTTOMLEFT", 85, 0)
			G.UnitFrames["Boss" .. i].Power:Point("TOPRIGHT", G.UnitFrames["Boss" .. i].Health, "BOTTOMRIGHT", -9, -3)
			G.UnitFrames["Boss" .. i].Power:CreateBorder(false, true)
			G.UnitFrames["Boss" .. i].Power:SetStatusBarTexture(C["media"].normTex)
			G.UnitFrames["Boss" .. i].Power:SetFrameStrata("High")

			-- border for the powerbar --
			local powerBG = CreateFrame("Frame", powerBG,G.UnitFrames["Boss" .. i].Power)
			powerBG:ClearAllPoints()
			powerBG:SetPoint("TOPLEFT", -2, 2)
			powerBG:SetPoint("BOTTOMRIGHT", 2, -2)
			powerBG:Size(1, 1)
			powerBG:SetTemplate("Default")
			powerBG:CreateBorder(true, true)
			powerBG:SetFrameStrata("High")
			powerBG:SetFrameLevel(G.UnitFrames.Player.Power:GetFrameLevel())
			powerBG:CreateShadow("Default")

			G.UnitFrames["Boss" .. i].Power.value = T.SetFontString(G.UnitFrames["Boss" .. i].Health, T.CreateFontString())
			G.UnitFrames["Boss" .. i].Power.value:Point("LEFT", G.UnitFrames["Boss" .. i].Health, "LEFT", 4, 1)
			G.UnitFrames["Boss"..i].Power.value:SetShadowOffset(0,0)

			-- castbar
			if C["unitframes"].unitcastbar == true then
				G.UnitFrames["Boss" .. i].Castbar:ClearAllPoints()
				G.UnitFrames["Boss" .. i].Castbar:SetHeight(12)
				G.UnitFrames["Boss" .. i].Castbar:Point("TOPRIGHT", G.UnitFrames["Boss" .. i].Power, "BOTTOMRIGHT", 9, -7)
				G.UnitFrames["Boss" .. i].Castbar:CreateBorder(false, true)
				G.UnitFrames["Boss" .. i].Castbar:SetStatusBarTexture(C["media"].normTex)
				G.UnitFrames["Boss" .. i].Castbar:SetStatusBarColor(.31, .43, .59, 1)

				-- border for the castbar --
				local castBG = CreateFrame("Frame", castBG, G.UnitFrames["Boss" .. i].Castbar)
				castBG:ClearAllPoints()
				castBG:SetPoint("TOPLEFT", -2, 2)
				castBG:SetPoint("BOTTOMRIGHT", 2, -2)
				castBG:Size(1, 1)
				castBG:SetTemplate("Default")
				castBG:CreateBorder(true, true)
				castBG:SetFrameStrata("Background")
				castBG:CreateShadow("Default")
				
				G.UnitFrames["Boss" .. i].Castbar.bg:Kill()

				G.UnitFrames["Boss" .. i].Castbar.bg = G.UnitFrames["Boss" .. i].Castbar:CreateTexture(nil, "BORDER")
				G.UnitFrames["Boss" .. i].Castbar.bg:SetAllPoints(G.UnitFrames["Boss" .. i].Castbar)
				G.UnitFrames["Boss" .. i].Castbar.bg:SetTexture(C["media"].normTex)
				G.UnitFrames["Boss" .. i].Castbar.bg:SetVertexColor(0, 0, 0, .75)

				G.UnitFrames["Boss" .. i].Castbar.Time = T.SetFontString(G.UnitFrames["Boss" .. i].Castbar, T.CreateFontString())
				G.UnitFrames["Boss" .. i].Castbar.Time:Point("RIGHT", G.UnitFrames["Boss" .. i].Castbar, "RIGHT", -4, 0)
				G.UnitFrames["Boss" .. i].Castbar.Time:SetTextColor(1, 1, 1)
				G.UnitFrames["Boss" .. i].Castbar.Time:SetShadowOffset(0, 0)

				G.UnitFrames["Boss" .. i].Castbar.Text = T.SetFontString(G.UnitFrames["Boss" .. i].Castbar, T.CreateFontString())
				G.UnitFrames["Boss" .. i].Castbar.Text:Point("LEFT", G.UnitFrames["Boss" .. i].Castbar, "LEFT", 4, 0)
				G.UnitFrames["Boss" .. i].Castbar.Text:SetTextColor(1, 1, 1)
				G.UnitFrames["Boss" .. i].Castbar.Text:SetShadowOffset(0, 0)

				G.UnitFrames["Boss" .. i].Castbar.PostCastStart = T.PostCastStart
				G.UnitFrames["Boss" .. i].Castbar.PostChannelStart = T.PostCastStart

				if C["unitframes"].cbicons == true then
					G.UnitFrames["Boss" .. i].Castbar:Width(196 - 15)
					G.UnitFrames["Boss" .. i].Castbar.button:ClearAllPoints()
					G.UnitFrames["Boss" .. i].Castbar.button:SetPoint("RIGHT", G.UnitFrames["Boss" .. i].Castbar, "LEFT", -5, 0)
					G.UnitFrames["Boss" .. i].Castbar.button:Size(16)
					G.UnitFrames["Boss" .. i].Castbar.button:CreateShadow("Default")
				else
					G.UnitFrames["Boss" .. i].Castbar:Width(196)
					G.UnitFrames["Boss" .. i].Castbar.button:Kill()
				end
			end

			-- altpowerbar --
			G.UnitFrames["Boss" .. i].AltPowerBar:SetStatusBarTexture(C["media"].normal)

			-- size
			G.UnitFrames["Boss" .. i]:Size(200, 22)
		end
	end
	
	-- arena --
	if C["unitframes"].arena then
		for i = 1, 5 do
			-- health --
			G.UnitFrames["Arena" .. i].Health:Height(22)
			G.UnitFrames["Arena" .. i].Health:SetFrameLevel(5)
			G.UnitFrames["Arena" .. i].Health:CreateBorder(false, true)
			G.UnitFrames["Arena" .. i].Health:SetStatusBarTexture(C["media"].normTex)
			G.UnitFrames["Arena" .. i].Health.bg:SetTexture(0.05, 0.05, 0.05)
			
			-- border for the health bar --
			local healthBG = CreateFrame("Frame", healthBG, G.UnitFrames["Arena" .. i])
			healthBG:ClearAllPoints()
			healthBG:SetPoint("TOPLEFT", -2, 2)
			healthBG:SetPoint("BOTTOMRIGHT", 2, -2)
			healthBG:Size(1, 1)
			healthBG:SetTemplate("Default")
			healthBG:CreateBorder(true, true)
			healthBG:SetFrameStrata("Low")
			healthBG:SetFrameLevel(G.UnitFrames.TargetTarget.Health:GetFrameLevel())
			healthBG:CreateShadow("Default")

			if C["unitframes"].unicolor == true then
				G.UnitFrames["Arena" .. i].Health.colorTapping = false
				G.UnitFrames["Arena" .. i].Health.colorDisconnected = false
				G.UnitFrames["Arena" .. i].Health.colorClass = false
				G.UnitFrames["Arena" .. i].Health:SetStatusBarColor(0.125, 0.125, 0.125, 1)
				G.UnitFrames["Arena" .. i].Health.bg:SetVertexColor(0.05, 0.05, 0.05, 1)
			else
				G.UnitFrames["Arena" .. i].Health.colorDisconnected = true
				G.UnitFrames["Arena" .. i].Health.colorTapping = true
				G.UnitFrames["Arena" .. i].Health.colorClass = true
				G.UnitFrames["Arena" .. i].Health.colorReaction = true
			end

			G.UnitFrames["Arena" .. i].Name:SetFont(T.CreateFontString())
			G.UnitFrames["Arena" .. i].Name:Point("CENTER", G.UnitFrames["Arena" .. i].Health, "CENTER", 0, 1)
			G.UnitFrames["Arena" .. i].Name:SetShadowOffset(0, 0)

			G.UnitFrames["Arena" .. i].Health.value = T.SetFontString(G.UnitFrames["Arena" .. i].Health, T.CreateFontString())
			G.UnitFrames["Arena" .. i].Health.value:Point("RIGHT", G.UnitFrames["Arena" .. i].Health, "RIGHT", -4, 1)
			G.UnitFrames["Arena" .. i].Health.value:SetShadowOffset(0, 0)

			-- power --
			G.UnitFrames["Arena" .. i].Power:Height(3)
			G.UnitFrames["Arena" .. i].Power:ClearAllPoints()
			G.UnitFrames["Arena" .. i].Power:Point("TOPLEFT", G.UnitFrames["Arena" .. i].Health, "BOTTOMLEFT", 85, 0)
			G.UnitFrames["Arena" .. i].Power:Point("TOPRIGHT", G.UnitFrames["Arena" .. i].Health, "BOTTOMRIGHT", -9, -3)
			G.UnitFrames["Arena" .. i].Power:CreateBorder(false, true)
			G.UnitFrames["Arena" .. i].Power:SetStatusBarTexture(C["media"].normTex)
			G.UnitFrames["Arena" .. i].Power:SetFrameStrata("High")

			-- border for the powerbar --
			local powerBG = CreateFrame("Frame", powerBG,G.UnitFrames["Arena" .. i].Power)
			powerBG:ClearAllPoints()
			powerBG:SetPoint("TOPLEFT", -2, 2)
			powerBG:SetPoint("BOTTOMRIGHT", 2, -2)
			powerBG:Size(1, 1)
			powerBG:SetTemplate("Default")
			powerBG:CreateBorder(true, true)
			powerBG:SetFrameStrata("High")
			powerBG:SetFrameLevel(G.UnitFrames.Player.Power:GetFrameLevel())
			powerBG:CreateShadow("Default")

			G.UnitFrames["Arena" .. i].Power.value = T.SetFontString(G.UnitFrames["Arena" .. i].Health, T.CreateFontString())
			G.UnitFrames["Arena" .. i].Power.value:Point("LEFT", G.UnitFrames["Arena" .. i].Health, "LEFT", 4, 1)
			G.UnitFrames["Arena"..i].Power.value:SetShadowOffset(0,0)

			-- castbar
			if C["unitframes"].unitcastbar == true then
				G.UnitFrames["Arena" .. i].Castbar:ClearAllPoints()
				G.UnitFrames["Arena" .. i].Castbar:SetHeight(12)
				G.UnitFrames["Arena" .. i].Castbar:Point("TOPRIGHT", G.UnitFrames["Arena" .. i].Power, "BOTTOMRIGHT", 9, -7)
				G.UnitFrames["Arena" .. i].Castbar:CreateBorder(false, true)
				G.UnitFrames["Arena" .. i].Castbar:SetStatusBarTexture(C["media"].normTex)
				G.UnitFrames["Arena" .. i].Castbar:SetStatusBarColor(.31, .43, .59, 1)

				-- border for the castbar --
				local castBG = CreateFrame("Frame", castBG, G.UnitFrames["Arena" .. i].Castbar)
				castBG:ClearAllPoints()
				castBG:SetPoint("TOPLEFT", -2, 2)
				castBG:SetPoint("BOTTOMRIGHT", 2, -2)
				castBG:Size(1, 1)
				castBG:SetTemplate("Default")
				castBG:CreateBorder(true, true)
				castBG:SetFrameStrata("Background")
				castBG:CreateShadow("Default")
				
				G.UnitFrames["Arena" .. i].Castbar.bg:Kill()

				G.UnitFrames["Arena" .. i].Castbar.bg = G.UnitFrames["Arena" .. i].Castbar:CreateTexture(nil, "BORDER")
				G.UnitFrames["Arena" .. i].Castbar.bg:SetAllPoints(G.UnitFrames["Arena" .. i].Castbar)
				G.UnitFrames["Arena" .. i].Castbar.bg:SetTexture(C["media"].normTex)
				G.UnitFrames["Arena" .. i].Castbar.bg:SetVertexColor(0, 0, 0, .75)

				G.UnitFrames["Arena" .. i].Castbar.Time = T.SetFontString(G.UnitFrames["Arena" .. i].Castbar, T.CreateFontString())
				G.UnitFrames["Arena" .. i].Castbar.Time:Point("RIGHT", G.UnitFrames["Arena" .. i].Castbar, "RIGHT", -4, 0)
				G.UnitFrames["Arena" .. i].Castbar.Time:SetTextColor(1, 1, 1)
				G.UnitFrames["Arena" .. i].Castbar.Time:SetShadowOffset(0, 0)

				G.UnitFrames["Arena" .. i].Castbar.Text = T.SetFontString(G.UnitFrames["Arena" .. i].Castbar, T.CreateFontString())
				G.UnitFrames["Arena" .. i].Castbar.Text:Point("LEFT", G.UnitFrames["Arena" .. i].Castbar, "LEFT", 4, 0)
				G.UnitFrames["Arena" .. i].Castbar.Text:SetTextColor(1, 1, 1)
				G.UnitFrames["Arena" .. i].Castbar.Text:SetShadowOffset(0, 0)

				G.UnitFrames["Arena" .. i].Castbar.PostCastStart = T.PostCastStart
				G.UnitFrames["Arena" .. i].Castbar.PostChannelStart = T.PostCastStart

				if C["unitframes"].cbicons == true then
					G.UnitFrames["Arena" .. i].Castbar:Width(196 - 15)
					G.UnitFrames["Arena" .. i].Castbar.button:ClearAllPoints()
					G.UnitFrames["Arena" .. i].Castbar.button:SetPoint("RIGHT", G.UnitFrames["Arena" .. i].Castbar, "LEFT", -5, 0)
					G.UnitFrames["Arena" .. i].Castbar.button:Size(16)
					G.UnitFrames["Arena" .. i].Castbar.button:CreateShadow("Default")
				else
					G.UnitFrames["Arena" .. i].Castbar:Width(196)
					G.UnitFrames["Arena" .. i].Castbar.button:Kill()
				end
			end

			-- size
			G.UnitFrames["Arena" .. i]:Size(200, 22)
		end
	end

	-- position --
	local FramePositions = CreateFrame("Frame")
	FramePositions:RegisterEvent("PLAYER_ENTERING_WORLD")
	FramePositions:SetScript("OnEvent", function(self, event, addon)
		G.UnitFrames.Player:ClearAllPoints()
		G.UnitFrames.Target:ClearAllPoints()
		G.UnitFrames.TargetTarget:ClearAllPoints()
		G.UnitFrames.Pet:ClearAllPoints()
		G.UnitFrames.Focus:ClearAllPoints()
		G.UnitFrames.FocusTarget:ClearAllPoints()
		
		G.UnitFrames.Player:SetPoint("BOTTOM", G.ActionBars.Bar1, "TOP", -300, 120)
		G.UnitFrames.Target:SetPoint("BOTTOM", G.ActionBars.Bar1, "TOP", 300, 120)

		G.UnitFrames.TargetTarget:SetPoint("TOPRIGHT", G.UnitFrames.Target, "BOTTOMLEFT", 0, -15)
		G.UnitFrames.Pet:SetPoint("TOPLEFT", G.UnitFrames.Player, "BOTTOMRIGHT", 0, -15)
		G.UnitFrames.Focus:SetPoint("BOTTOMLEFT", UIParent, "BOTTOM", 275, 500)
		G.UnitFrames.FocusTarget:SetPoint("TOPRIGHT", G.UnitFrames.Focus, "BOTTOMLEFT", -10, -2)
		
		if C["unitframes"].showboss then
			for i = 1, MAX_BOSS_FRAMES do
				G.UnitFrames["Boss" .. i]:ClearAllPoints()
				if i == 1 then
					G.UnitFrames["Boss" .. i]:SetPoint("RIGHT", UIParent, "RIGHT", -163, -250)
				else
					G.UnitFrames["Boss" .. i]:SetPoint("BOTTOM", G.UnitFrames["Boss" .. i - 1], "TOP", 0, 43)
				end
			end
		end

		if C["unitframes"].arena then
			for i = 1, 5 do
				G.UnitFrames["Arena" .. i]:ClearAllPoints()
				if i == 1 then
					G.UnitFrames["Arena" .. i]:SetPoint("RIGHT", UIParent, "RIGHT", -163, -250)
				else
					G.UnitFrames["Arena" .. i]:SetPoint("BOTTOM", G.UnitFrames["Arena" .. i - 1], "TOP", 0, 43)
				end
			end
		end
	end)
end