-- Chatcopyframe for DuffedUI --
local T, C, L, G = unpack(Tukui)
if C["chat"].enable ~= true then return end

if C["chat"].background then
	TukuiButtonCF1:SetAlpha(1)
	TukuiButtonCF1:ClearAllPoints()
	TukuiButtonCF1:SetPoint("LEFT", G.Panels.LeftChatTabsBackground, "RIGHT", -20, 0)
	TukuiButtonCF1:SetScript("OnEnter", function() TukuiButtonCF1:SetAlpha(1) end)
	TukuiButtonCF1:SetScript("OnLeave", function() TukuiButtonCF1:SetAlpha(1) end)

	TukuiButtonCF2:SetAlpha(1)
	TukuiButtonCF2:ClearAllPoints()
	TukuiButtonCF2:SetPoint("LEFT", G.Panels.LeftChatTabsBackground, "RIGHT", -20, 0)
	TukuiButtonCF2:SetScript("OnEnter", function() TukuiButtonCF1:SetAlpha(1) end)
	TukuiButtonCF2:SetScript("OnLeave", function() TukuiButtonCF1:SetAlpha(1) end)

	TukuiButtonCF3:SetAlpha(1)
	TukuiButtonCF3:ClearAllPoints()
	TukuiButtonCF3:SetPoint("LEFT", G.Panels.LeftChatTabsBackground, "RIGHT", -20, 0)
	TukuiButtonCF3:SetScript("OnEnter", function() TukuiButtonCF1:SetAlpha(1) end)
	TukuiButtonCF3:SetScript("OnLeave", function() TukuiButtonCF1:SetAlpha(1) end)

	TukuiButtonCF4:SetAlpha(1)
	TukuiButtonCF4:ClearAllPoints()
	TukuiButtonCF4:SetPoint("LEFT", G.Panels.RightChatTabsBackground, "RIGHT", -20, 0)
	TukuiButtonCF4:SetScript("OnEnter", function() TukuiButtonCF1:SetAlpha(1) end)
	TukuiButtonCF4:SetScript("OnLeave", function() TukuiButtonCF1:SetAlpha(1) end)
end