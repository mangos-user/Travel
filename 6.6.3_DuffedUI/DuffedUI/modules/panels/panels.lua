-- Panels for DuffedUI --

local T, C, L, G = unpack(Tukui)

-- Actionbarpanels --
if C["actionbar"].layout == 1 then
	G.ActionBars.Bar1:ClearAllPoints()
	if T.lowversion then
		G.ActionBars.Bar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 3)
		G.ActionBars.Bar1:Size((T.buttonsize * 12) + (T.buttonspacing * 13), (T.buttonsize * 2) + (T.buttonspacing * 3))
	else
		G.ActionBars.Bar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 26)
		G.ActionBars.Bar1:Size((T.buttonsize * 24) + (T.buttonspacing * 25), (T.buttonsize * 1) + (T.buttonspacing * 2))
	end
	G.ActionBars.Bar1:CreateShadow("Default")
	G.ActionBars.Bar1:SetTemplate("Transparent")
else
	G.ActionBars.Bar1:ClearAllPoints()
	G.ActionBars.Bar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 75)
	G.ActionBars.Bar1:Size((T.buttonsize * 12) + (T.buttonspacing * 13), (T.buttonsize * 2) + (T.buttonspacing * 3))
	G.ActionBars.Bar1:CreateShadow("Default")
	G.ActionBars.Bar1:SetTemplate("Transparent")
end

if C["actionbar"].layout == 1 then
	G.ActionBars.Bar2:ClearAllPoints()
	G.ActionBars.Bar2:SetPoint("BOTTOM", G.ActionBars.Bar1, "TOP", 0, 4)
	G.ActionBars.Bar2:Size((T.buttonsize * 12) + (T.buttonspacing * 13), (T.buttonsize * 1) + (T.buttonspacing * 2))
	if T.lowversion then G.ActionBars.Bar2:SetAlpha(1) end
	G.ActionBars.Bar2:CreateShadow("Default")
	G.ActionBars.Bar2:SetTemplate("Transparent")
else
	G.ActionBars.Bar2:ClearAllPoints()
	G.ActionBars.Bar2:SetPoint("RIGHT", G.ActionBars.Bar1, "LEFT", -3, 0)
	G.ActionBars.Bar2:Size((T.buttonsize * 3) + (T.buttonspacing * 4), (T.buttonsize * 2) + (T.buttonspacing * 3))
	G.ActionBars.Bar2:CreateShadow("Default")
	G.ActionBars.Bar2:SetTemplate("Transparent")
end

if C["actionbar"].layout == 2 then
	local DuffedPanel = CreateFrame("Frame", "DuffedPanel", UIParent, "SecureHandlerStateTemplate")
	DuffedPanel:SetPoint("LEFT", G.ActionBars.Bar1, "RIGHT", 3, 0)
	DuffedPanel:Size((T.buttonsize * 3) + (T.buttonspacing * 4), (T.buttonsize * 2) + (T.buttonspacing * 3))
	DuffedPanel:CreateShadow("Default")
	DuffedPanel:SetTemplate("Transparent")
end

G.ActionBars.Bar5:ClearAllPoints()
G.ActionBars.Bar5:SetPoint("RIGHT", UIParent, "RIGHT", -13, -14)
G.ActionBars.Bar5:Size((T.buttonsize * 2) + (T.buttonspacing * 3) + 2, (T.buttonsize * 12) + (T.buttonspacing * 13))
G.ActionBars.Bar5:CreateShadow("Default")
G.ActionBars.Bar5:SetTemplate("Transparent")

-- Datatextpanels --
G.Panels.DataTextLeft:ClearAllPoints()
if T.lowversion or C["actionbar"].layout == 2 then
	G.Panels.DataTextLeft:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 5, 3)
	if C["actionbar"].swap and not C["actionbar"].layout == 2 then
		G.Panels.DataTextLeft:Size(T.Scale(T.InfoLeftRightWidth + 2), 19)
	else
		G.Panels.DataTextLeft:Size(T.Scale(T.InfoLeftRightWidth - 18), 19)
	end
else
	G.Panels.DataTextLeft:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOM", -12, 3)
	G.Panels.DataTextLeft:Size(T.Scale(T.InfoLeftRightWidth - 25), 19)
end
G.Panels.DataTextLeft:CreateShadow("Default")
G.Panels.DataTextLeft:SetTemplate("Default")

G.Panels.DataTextRight:ClearAllPoints()
if T.lowversion or C["actionbar"].layout == 2 then
	G.Panels.DataTextRight:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -5, 3)
	G.Panels.DataTextRight:Size(T.Scale(T.InfoLeftRightWidth + 2), 19)
else
	G.Panels.DataTextRight:SetPoint("BOTTOMLEFT", UIParent, "BOTTOM", 12, 3)
	G.Panels.DataTextRight:Size(T.Scale(T.InfoLeftRightWidth - 25), 19)
end
G.Panels.DataTextRight:CreateShadow("Default")
G.Panels.DataTextRight:SetTemplate("Default")

local emoteBTN = CreateFrame("Button", "emoteBTN", UIParent)
emoteBTN:Size(20, 20)
if C["chat"].background then
	emoteBTN:SetPoint("RIGHT", TukuiButtonCF1, "LEFT", -1, 0)
else
	emoteBTN:SetPoint("TOPLEFT", ChatFrame1, "TOPLEFT", 2, 0)
	emoteBTN:SetAlpha(1)
end
emoteBTN:SetTemplate("Default")
emoteBTN.text = T.SetFontString(emoteBTN, T.CreateFontString())
emoteBTN.text:SetPoint("CENTER", 1, 0)
emoteBTN.text:SetText(T.color .. "E")
emoteBTN:SetScript("OnMouseDown", function(self, btn)
	if btn == "LeftButton" then	
		ToggleFrame(ChatMenu)
	end
end)

-- Lines --
if C["chat"].background then
	if C["actionbar"].buttonsize > 26 and C["actionbar"].layout == 1 and not T.lowversion then
		G.Panels.LeftDataTextToActionBarLine:ClearAllPoints()
		G.Panels.LeftDataTextToActionBarLine:SetPoint("RIGHT", G.Panels.DataTextLeft, "LEFT", 0, 0)
		G.Panels.LeftDataTextToActionBarLine:Size(10, 2)
		G.Panels.LeftDataTextToActionBarLine:CreateShadow("Default")
		G.Panels.LeftDataTextToActionBarLine:SetTemplate("Transparent")

		G.Panels.RightDataTextToActionBarLine:ClearAllPoints()
		G.Panels.RightDataTextToActionBarLine:SetPoint("LEFT", G.Panels.DataTextRight, "RIGHT", 0, 0)
		G.Panels.RightDataTextToActionBarLine:Size(10, 2)
		G.Panels.RightDataTextToActionBarLine:CreateShadow("Default")
		G.Panels.RightDataTextToActionBarLine:SetTemplate("Transparent")

		local dlvl = CreateFrame("Frame", "DatatextLineVerticalLeft", G.Panels.LeftDataTextToActionBarLine)
		dlvl:Point("BOTTOMRIGHT", G.Panels.LeftDataTextToActionBarLine, "TOPLEFT", 0, -2)
		dlvl:Size(2, 13)
		dlvl:SetTemplate("Default")
		dlvl:SetFrameLevel(2)
		dlvl:SetFrameStrata("BACKGROUND")

		local dlvr = CreateFrame("Frame", "DatatextRightVerticalLeft", G.Panels.RightDataTextToActionBarLine)
		dlvr:Point("BOTTOMLEFT", G.Panels.RightDataTextToActionBarLine, "TOPRIGHT", 0, -2)
		dlvr:Size(2, 13)
		dlvr:SetTemplate("Default")
		dlvr:SetFrameLevel(2)
		dlvr:SetFrameStrata("BACKGROUND")
	else
		G.Panels.LeftDataTextToActionBarLine:Hide()
		G.Panels.RightDataTextToActionBarLine:Hide()
	end
end

-- Chatbackground and tabs --
if C["chat"].background then
	G.Panels.LeftChatBackground:ClearAllPoints()
	if T.lowversion or C["actionbar"].layout == 2 then
		G.Panels.LeftChatBackground:SetPoint("BOTTOMLEFT", G.Panels.DataTextLeft, "TOPLEFT", 0, 3)
	else
		G.Panels.LeftChatBackground:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 5, 3)
	end
	G.Panels.LeftChatBackground:Size(372, 149)
	G.Panels.LeftChatBackground:CreateShadow("Default")
	G.Panels.LeftChatBackground:SetTemplate("Transparent")

	G.Panels.RightChatBackground:ClearAllPoints()
	if T.lowversion or C["actionbar"].layout == 2 then
		G.Panels.RightChatBackground:SetPoint("BOTTOMRIGHT", G.Panels.DataTextRight, "TOPRIGHT", 0, 3)
	else
		G.Panels.RightChatBackground:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -5, 3)
	end
	G.Panels.RightChatBackground:Size(372, 149)
	G.Panels.RightChatBackground:CreateShadow("Default")
	G.Panels.RightChatBackground:SetTemplate("Transparent")
	
	G.Panels.LeftChatTabsBackground:Size((T.InfoLeftRightWidth - 20), 20)
	G.Panels.RightChatTabsBackground:Size((T.InfoLeftRightWidth - 20), 20)
end

if C["chat"].background then
	G.Panels.LeftChatTabsBackground:Size((G.Panels.LeftChatBackground:GetWidth() - 8), 20)
	G.Panels.RightChatTabsBackground:Size((G.Panels.RightChatBackground:GetWidth() - 8), 20)
end

-- minimap --
if TukuiMinimap then
	G.Panels.DataTextMinimapLeft:CreateShadow("Default")
	G.Panels.DataTextMinimapRight:CreateShadow("Default")
end