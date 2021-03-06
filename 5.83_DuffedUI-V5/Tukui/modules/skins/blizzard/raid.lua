local T, C, L = unpack(select(2, ...)) -- Import Functions/Constants, Config, Locales
if not C["skins"].bskins == true then return end

local function LoadSkin()
	local buttons = {
		"RaidFrameRaidBrowserButton",
		"RaidFrameRaidInfoButton",
		"RaidFrameReadyCheckButton",
	}

	for i = 1, #buttons do
		T.SkinButton(_G[buttons[i]])
	end

	local StripAllTextures = {
		"RaidGroup1",
		"RaidGroup2",
		"RaidGroup3",
		"RaidGroup4",
		"RaidGroup5",
		"RaidGroup6",
		"RaidGroup7",
		"RaidGroup8",
	}

	for _, object in pairs(StripAllTextures) do
		_G[object]:StripTextures()
	end

	for i=1, MAX_RAID_GROUPS*5 do
		T.SkinButton(_G["RaidGroupButton"..i], true)
	end
	
	for i=1,8 do
		for j=1,5 do
			_G["RaidGroup"..i.."Slot"..j]:StripTextures()
			_G["RaidGroup"..i.."Slot"..j]:SetTemplate("Default")
		end
	end
end

T.SkinFuncs["Blizzard_RaidUI"] = LoadSkin