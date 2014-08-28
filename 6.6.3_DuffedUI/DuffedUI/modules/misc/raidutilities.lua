-- Repositioning of Raidutility --

local T, C, L, G = unpack(Tukui)

if C["unitframes"].raid == true then
	local tum = CreateFrame("Frame", "TUanchor", UIParent)
	tum:SetSize(TukuiMinimap:GetWidth(), 23)
	tum:SetPoint("TOP", UIParent, "TOP", -150, 0)
	tum:SetFrameLevel(10)
	tum:SetClampedToScreen(true)
	tum:SetMovable(true)
	tum:SetTemplate("Default")
	tum:SetBackdropBorderColor(1, 0, 0)
	tum.text = T.SetFontString(tum, C["media"].font, 12)
	tum.text:SetPoint("CENTER")
	tum.text:SetText("Move RaidUtility")
	tum:Hide()
	tinsert(T.AllowFrameMoving, tum)
	
	TukuiRaidUtilityShowButton:Size(TukuiMinimap:GetWidth(), 23)
	TukuiRaidUtilityShowButton:ClearAllPoints()
	TukuiRaidUtilityShowButton:Point("LEFT", tum, "LEFT", 0, 0)
	TukuiRaidUtility:ClearAllPoints()
	TukuiRaidUtility:Point("TOP", TukuiRaidUtilityShowButton, "BOTTOM", 0, 23)
end