-- Buffnotice for DuffedUI - Thanks to Azilroka :) --

local T, C, L, G = unpack(Tukui)
if C["auras"].buffnotice ~= true then return end

T.remindbuffs = {
	PRIEST = {
		588, -- Inner Fire
		73413, -- Inner Will
	},
	HUNTER = {
		13165, -- Aspect of the Hawk
		5118, -- Aspect of the Cheetah
		13159, -- Aspect of the Pack
		82661, -- Aspect of the Fox
		109260, -- Aspect of the Iron Hawk
	},
	MAGE = {
		7302, -- Frost Armor
		6117, -- Mage Armor
		30482, -- Molten Armor
	},
	WARLOCK = {
		109773, -- Dark Intent
	},
	SHAMAN = {
		52127, -- Water Shield
		324, -- Lightning Shield
		974, -- Earth Shield
	},
	WARRIOR = {
		469, -- Commanding Shout
		6673, -- Battle Shout
		93435, -- Roar of Courage (Hunter Pet)
		57330, -- Horn of Winter
		21562, -- PW: Fortitude
	},
	DEATHKNIGHT = {
		57330, -- Horn of Winter
		6673, -- Battle Shout
		93435, -- Roar of Courage (Hunter Pet)
	},
	ROGUE = {
		2823, -- Deadly Poison
		8679, -- Wound Poison
	},
	DRUID = {
		1126, -- Mark of the Wild
		20217, -- Blessing of Kings
		117666, -- Legacy of the Emperor
		90363, -- Embrace of the Shale Spider
	},
	PALADIN = {
		20217, -- Blessing of Kings
		1126, -- Mark of the Wild
		117666, -- Legacy of the Emperor
		90363, -- Embrace of the Shale Spider
		19740, -- Blessing of Might
	},
	MONK = {
		117666, -- Legacy of the Emperor
		20217, -- Blessing of Kings
		1126, -- Mark of the Wild
		90363, -- Embrace of the Shale Spider
		116781, -- Legacy of the White Tiger
	},
}

-- Nasty stuff below. Don't touch.
local buffs = T.remindbuffs[T.myclass]

if not buffs then return end

local sound
local function BuffsOnEvent(self, event)
	if (event == "PLAYER_LOGIN" or event == "LEARNED_SPELL_IN_TAB") then
		for i, buff in pairs(buffs) do
			local name = GetSpellInfo(buff)
			local usable, nomana = IsUsableSpell(name)
			if (usable or nomana) then
				self.icon:SetTexture(select(3, GetSpellInfo(buff)))
				break
			end
		end
		if (not self.icon:GetTexture() and event == "PLAYER_LOGIN") then
			self:UnregisterAllEvents()
			self:RegisterEvent("LEARNED_SPELL_IN_TAB")
			return
		elseif (self.icon:GetTexture() and event == "LEARNED_SPELL_IN_TAB") then
			self:UnregisterAllEvents()
			self:RegisterEvent("UNIT_AURA")
			self:RegisterEvent("PLAYER_LOGIN")
			self:RegisterEvent("PLAYER_REGEN_ENABLED")
			self:RegisterEvent("PLAYER_REGEN_DISABLED")
		end
	end

	if (UnitAffectingCombat("player") and not UnitInVehicle("player")) then
		for i, buff in pairs(buffs) do
			local name = GetSpellInfo(buff)
			if (name and UnitBuff("player", name)) then
				self:Hide()
				sound = true
				return
			end
		end
		self:Show()
		if sound == true then
			if C["auras"].warning then
				PlaySoundFile(C["media"].warning)
			end
			sound = false
		end
	else
		self:Hide()
		sound = true
	end
end

local frame = CreateFrame("Frame", "TukuiBuffsWarningFrame", UIParent)
frame.icon = frame:CreateTexture(nil, "OVERLAY")
frame.icon:SetPoint("CENTER")
frame:SetTemplate("Default")
frame:Size(40)
frame:Point("CENTER", UIParent, "CENTER", -30, 100)
frame.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
frame.icon:Size(36)
frame:Hide()

frame:RegisterEvent("UNIT_AURA")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("UNIT_ENTERING_VEHICLE")
frame:RegisterEvent("UNIT_ENTERED_VEHICLE")
frame:RegisterEvent("UNIT_EXITING_VEHICLE")
frame:RegisterEvent("UNIT_EXITED_VEHICLE")

frame:SetScript("OnEvent", BuffsOnEvent)