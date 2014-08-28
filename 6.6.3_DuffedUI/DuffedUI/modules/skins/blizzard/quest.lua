-- Skins for DuffedUI --

local T, C, L, G = unpack(Tukui)

if C["general"].blizzardreskin ~= true then return end

local function SkinFrames(self, event, addon)
	if addon == "DuffedUI" then
		QuestFrame.backdrop:SetTemplate("Transparent")

		QuestNPCModel.backdrop:SetTemplate("Transparent")
		QuestNPCModel.backdrop:CreateShadow("Default")

		QuestNPCModelTextFrame.backdrop:SetTemplate("Transparent")
		QuestNPCModelTextFrame.backdrop:CreateShadow("Default")

		QuestLogDetailFrame:SetTemplate("Transparent")
		QuestLogDetailFrame:CreateShadow("Default")
	end
end

local Init = CreateFrame("Frame")
Init:RegisterEvent("ADDON_LOADED")
Init:SetScript("OnEvent", SkinFrames)