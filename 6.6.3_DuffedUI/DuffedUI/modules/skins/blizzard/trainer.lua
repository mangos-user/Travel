-- Skins for DuffedUI --

local T, C, L, G = unpack(Tukui)

if C["general"].blizzardreskin ~= true then return end

local function SkinFrames(self, event, addon)
	if addon == "Blizzard_TrainerUI" then
		ClassTrainerFrame.backdrop:SetTemplate("Transparent")
		ClassTrainerFrame.backdrop:CreateShadow("Default")
	end
end

local Init = CreateFrame("Frame")
Init:RegisterEvent("ADDON_LOADED")
Init:SetScript("OnEvent", SkinFrames)