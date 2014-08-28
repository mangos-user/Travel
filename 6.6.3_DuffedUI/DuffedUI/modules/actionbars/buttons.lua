-- Buttons for DuffedUI --

local T, C, L, G = unpack(Tukui)

local cp = "|cff319f1b" -- +
local cm = "|cff9a1212" -- -
local function ShowOrHideBar(bar, button)
	local db = TukuiDataPerChar

	if bar:IsShown() then
		if bar == G.ActionBars.Bar2 then
			if button == DuffedBar2Button then
				UnregisterStateDriver(G.ActionBars.Bar2, "visibility")
				bar:Hide()
				db.hidebar4 = true
				if C["actionbar"].layout == 1 then
					bar:SetHeight((T.buttonsize * 1) + (T.buttonspacing * 2))
				else
					bar:SetHeight((T.buttonsize * 2) + (T.buttonspacing * 3))
				end
			end
		end
		
		if bar == G.ActionBars.Bar5 then
			if button == DuffedBar3Button then
				G.ActionBars.Pet.BackgroundLink:Show()
				if db.rightbars == 1 then
					MultiBarRight:Show()
					db.rightbars = 2
					bar:SetWidth((T.buttonsize * 2) + (T.buttonspacing * 3))
				elseif db.rightbars == 2 then
					MultiBarRight:Hide()
					db.rightbars = 1
					bar:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
				end
			elseif button == DuffedBar3Button2 then
				G.ActionBars.Pet.BackgroundLink:Hide()
				db.rightbars = 0
				UnregisterStateDriver(bar, "visibility")
				bar:Hide()
			end
		end
		
		for i = 7, 12 do
			local left = _G["MultiBarBottomLeftButton"..i]
			local right = _G["MultiBarBottomRightButton"..i]
			left:SetAlpha(1)
			right:SetAlpha(1)
		end
	else
		bar:Show()
		if C["actionbar"].swap then
			if bar == G.ActionBars.Bar1 then
				db.hidebar4 = false
				UnregisterStateDriver(G.ActionBars.Bar2, "visibility")
			end
		else
			if bar == G.ActionBars.Bar2 then
				db.hidebar4 = false
				RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle] hide; show")
			end
		end
	
		if bar == G.ActionBars.Bar5 then
			if button == DuffedBar3Button then
				bar:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
				MultiBarRight:Hide()
				db.rightbars = 1
				G.ActionBars.Pet.BackgroundLink:Show()
			end
		end
	end
end

local function MoveButtonBar(button, bar)
	local db = TukuiDataPerChar

	if button == DuffedBar2Button then
		--T.PetbarPosition()
		T.cbPosition()
		if bar:IsShown() then
			button.text:SetText(cm.."-|r")
		else
			button.text:SetText(cp.."+|r")
		end
	end

	if button == DuffedBar3Button then
		if bar:IsShown() then
			if db.rightbars == 2 and button == DuffedBar3Button then
				button.text:SetText("|cff9a1212>|r")
				DuffedBar3Button2:Hide()
				button:Height(130)
				button:ClearAllPoints()
				button:Point("RIGHT", UIParent, "RIGHT", 1, -14)
				TukuiPetBar:Point("RIGHT", UIParent, "RIGHT", -23 -((T.buttonsize * 2) + (T.buttonspacing * 3)), -14)
			elseif db.rightbars == 1 then
				DuffedBar3Button2:Show()
				button:Height(130 / 2)
				button:ClearAllPoints()
				button:Point("BOTTOMRIGHT", UIParent, "RIGHT", 1, -14)
				button.text:SetText("|cff319f1b<|r")
				TukuiPetBar:Point("RIGHT", UIParent, "RIGHT", -23 -((T.buttonsize * 1) + (T.buttonspacing * 2)), -14)
			end
		end
	elseif button == DuffedBar3Button2 then
		if db.rightbars == 0 then
			button:Hide()
			DuffedBar3Button:Height(130)
			DuffedBar3Button:ClearAllPoints()
			DuffedBar3Button:Point("RIGHT", UIParent, "RIGHT", 1, -14)
			TukuiPetBar:Point("RIGHT", UIParent, "RIGHT", -14, -14)
		end
	end
end

local function UpdateBar(self, bar)
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end

	local button = self

	ShowOrHideBar(bar, button)
	MoveButtonBar(button, bar)
end

local DuffedBar2Button = CreateFrame("Button", "DuffedBar2Button", UIParent)
DuffedBar2Button:SetTemplate("Default")
DuffedBar2Button:CreateShadow("Default")
DuffedBar2Button:RegisterForClicks("AnyUp")
DuffedBar2Button.text = T.SetFontString(DuffedBar2Button, T.CreateFontString())
DuffedBar2Button:SetScript("OnClick", function(self, btn)
	if btn == "RightButton" then
		if TukuiInfoLeftBattleGround and UnitInBattleground("player") then
			ToggleFrame(TukuiInfoLeftBattleGround)
		end
	else
		UpdateBar(self, G.ActionBars.Bar2)
	end
end)
if T.lowversion or C["actionbar"].layout == 2 then
	DuffedBar2Button:Size(19, 19)
	DuffedBar2Button:Point("TOPLEFT", TukuiInfoLeft, "TOPRIGHT", 2, 0)
else
	DuffedBar2Button:Point("TOPLEFT", TukuiInfoLeft, "TOPRIGHT", 2, 0)
	DuffedBar2Button:Point("BOTTOMRIGHT", TukuiInfoRight, "BOTTOMLEFT", -2, 0)
end
DuffedBar2Button.text:Point("CENTER", 2, 0)
if C["actionbar"].swap and C["actionbar"].layout == 1 then DuffedBar2Button:Hide() end
if C["actionbar"].button2 == true then DuffedBar2Button:SetAlpha(0) else DuffedBar2Button:SetAlpha(1) end
DuffedBar2Button:SetScript("OnEnter", function(self) self:SetBackdropBorderColor(unpack(C["media"].datatextcolor1)) end)
DuffedBar2Button:SetScript("OnLeave", function(self) self:SetBackdropBorderColor(unpack(C["media"].bordercolor)) end)
DuffedBar2Button.text:SetText(cm.."-|r")

local DuffedBar3Button = CreateFrame("Button", "DuffedBar3Button", UIParent)
DuffedBar3Button:Size(12, 130)
DuffedBar3Button:Point("RIGHT", UIParent, "RIGHT", 1, -14)
DuffedBar3Button:SetTemplate("Default")
DuffedBar3Button:RegisterForClicks("AnyUp")
DuffedBar3Button:SetAlpha(0)
DuffedBar3Button:SetScript("OnClick", function(self) UpdateBar(self, G.ActionBars.Bar5) end)
if C["actionbar"].rightbarsmouseover == true then
	DuffedBar3Button:SetScript("OnEnter", function(self) DuffedRightBarsMouseover(1) end)
	DuffedBar3Button:SetScript("OnLeave", function(self) DuffedRightBarsMouseover(0) end)
else
	DuffedBar3Button:SetScript("OnEnter", function(self) self:SetAlpha(1) DuffedBar3Button2:SetAlpha(1) end)
	DuffedBar3Button:SetScript("OnLeave", function(self) self:SetAlpha(0) DuffedBar3Button2:SetAlpha(0) end)
end
DuffedBar3Button.text = T.SetFontString(DuffedBar3Button, T.CreateFontString())
DuffedBar3Button.text:Point("CENTER", 0, 0)
DuffedBar3Button.text:SetText(cm..">|r")

local DuffedBar3Button2 = CreateFrame("Button", "DuffedBar3Button2", UIParent)
DuffedBar3Button2:Size(12, 66)
DuffedBar3Button2:Point("TOP", DuffedBar3Button, "BOTTOM", 0, 1)
DuffedBar3Button2:SetTemplate("Default")
DuffedBar3Button2:RegisterForClicks("AnyUp")
DuffedBar3Button2:SetAlpha(0)
DuffedBar3Button2:Hide()
DuffedBar3Button2:SetScript("OnClick", function(self) UpdateBar(self, G.ActionBars.Bar5) end)
if C["actionbar"].rightbarsmouseover == true then
	DuffedBar3Button2:SetScript("OnEnter", function(self) DuffedRightBarsMouseover(1) end)
	DuffedBar3Button2:SetScript("OnLeave", function(self) DuffedRightBarsMouseover(0) end)
else
	DuffedBar3Button2:SetScript("OnEnter", function(self) self:SetAlpha(1) DuffedBar3Button:SetAlpha(1) end)
	DuffedBar3Button2:SetScript("OnLeave", function(self) self:SetAlpha(0) DuffedBar3Button:SetAlpha(0) end)
end
DuffedBar3Button2.text = T.SetFontString(DuffedBar3Button2, T.CreateFontString())
DuffedBar3Button2.text:Point("CENTER", 0, 0)
DuffedBar3Button2.text:SetText(cm..">|r")

local init = CreateFrame("Frame")
init:RegisterEvent("VARIABLES_LOADED")
init:SetScript("OnEvent", function(self, event)
	if not TukuiDataPerChar then TukuiDataPerChar = {} end
	local db = TukuiDataPerChar
	if db.hidebar4 == nil then db.hidebar4 = false end
	if db.hidebar2 == true or db.hidebar2 == false then db.hidebar2 = nil end
	if db.hidebar3 == true or db.hidebar3 == false then db.hidebar3 = nil end
	if db.hidebar5 == true or db.hidebar5 == false then db.hidebar5 = nil end
	if db.hidebar6 == true or db.hidebar6 == false then db.hidebar6 = nil end
	if db.hidebar7 == true or db.hidebar7 == false then db.hidebar7 = nil end
	if C["actionbar"].swap and not C["actionbar"].layout == 2 then DuffedBar2Button:Hide() db.hidebar4 = false end

	T.cbPosition()
	--T.PetbarPosition()

	if db.hidebar4 then
		UpdateBar(DuffedBar2Button, G.ActionBars.Bar2)
	end

	if db.rightbars == nil then	db.rightbars = 2 end
	if db.rightbars == 1 then
		MoveButtonBar(DuffedBar3Button, G.ActionBars.Bar5)
		G.ActionBars.Bar5:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
	elseif db.rightbars == 0 then
		DuffedBar3Button.text:SetText("|cff319f1b<|r")
		G.ActionBars.Bar5:Hide()
	end
end)