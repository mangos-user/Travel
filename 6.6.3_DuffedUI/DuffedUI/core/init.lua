local T, C, L, G = unpack(Tukui)

T.GetDuffedVersion = GetAddOnMetadata("DuffedUI", "Version")

if IsAddOnLoaded("CyborgMMO7") then
	OpenButtonPageOpenMainForm:Hide()
end