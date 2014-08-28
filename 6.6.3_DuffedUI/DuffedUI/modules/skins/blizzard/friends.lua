-- Skins for DuffedUI --

local T, C, L, G = unpack(Tukui)

if C["general"].blizzardreskin ~= true then return end

local function SkinFrames(self, event, addon)
	if addon == "DuffedUI" then
		FriendsFrame:SetTemplate("Transparent")
		FriendsFrame:CreateShadow("Default")

		AddFriendFrame:SetTemplate("Transparent")
		AddFriendFrame:CreateShadow("Default")

		ScrollOfResurrectionSelectionFrame:SetTemplate("Transparent")
		ScrollOfResurrectionSelectionFrame:CreateShadow("Default")
	end
end

local Init = CreateFrame("Frame")
Init:RegisterEvent("ADDON_LOADED")
Init:SetScript("OnEvent", SkinFrames)