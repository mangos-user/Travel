-- Panels for DuffedUI --

local T, C, L, G = unpack(Tukui)

if C["auras"].bufftracker then
	G.Maps.Minimap:ClearAllPoints()
	G.Maps.Minimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -35, -5)
	G.Maps.Minimap:CreateShadow("Default")
else
	G.Maps.Minimap:ClearAllPoints()
	G.Maps.Minimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -5, -5)
	G.Maps.Minimap:CreateShadow("Default")
end