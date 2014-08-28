-- Buffposition for DuffedUI
local T, C, L, G = unpack(Tukui)
if not C["auras"].enable == false then return end

local bwrap = 20
local dwrap = 14
local font, size, flags = C["media"].font, 12, "THINOUTLINE"

local DuffedDM = CreateFrame("Frame", "DuffedDM", UIParent)
DuffedDM:Size(422, 30)
DuffedDM:SetPoint("TOPRIGHT", G.Maps.Minimap, "BOTTOMLEFT", -5, -15)
DuffedDM:SetTemplate("Default")
DuffedDM:SetBackdropBorderColor(1, 0, 0)
DuffedDM:SetClampedToScreen(true)
DuffedDM:SetMovable(true)
DuffedDM:SetFrameStrata("LOW")
DuffedDM:Hide()
DuffedDM:FontString("Text", font, size, flags)
DuffedDM.Text:SetPoint("CENTER", DuffedDM, "CENTER", 0, 0)
DuffedDM.Text:SetText("Move Debuffs")
tinsert(T.AllowFrameMoving, DuffedDM)

TukuiAurasPlayerBuffs:SetPoint("TOPRIGHT", G.Maps.Minimap, "TOPLEFT", -5, 0)
TukuiAurasPlayerBuffs:SetAttribute("wrapAfter", bwrap)
TukuiAurasPlayerBuffs:SetAttribute("xOffset", -33)
TukuiAurasPlayerBuffs:SetAttribute("wrapYOffset", -39)

TukuiAurasPlayerDebuffs:SetPoint("RIGHT", DuffedDM)
TukuiAurasPlayerDebuffs:SetAttribute("wrapAfter", dwrap)
TukuiAurasPlayerDebuffs:SetAttribute("xOffset", -33)

local hooks = {
	TukuiAurasPlayerBuffs,
	TukuiAurasPlayerDebuffs,
	TukuiAurasPlayerConsolidate,
}

local OnAttributeChanged = function(self)
	for i = 1, self:GetNumChildren() do
		local child = select(i, self:GetChildren())

		if child.Duration then
			child.Duration:SetFont(font, size, flags)
			child.Duration:ClearAllPoints()
			child.Duration:SetPoint("BOTTOM", 0, -15)
		end

		if child.Count then
			child.Count:SetFont(font, size, flags)
			child.Count:ClearAllPoints()
			child.Count:SetPoint("BOTTOMRIGHT", -1, 1)
		end
	end
end

for _, frame in pairs(hooks) do
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	frame:HookScript("OnAttributeChanged", OnAttributeChanged)
	frame:HookScript("OnEvent", OnAttributeChanged)
end