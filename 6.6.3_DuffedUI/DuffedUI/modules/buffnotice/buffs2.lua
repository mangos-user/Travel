-- Buffnotice for DuffedUI - Thanks to Azilroka :) --

local T, C, L, G = unpack(Tukui)
if C["auras"].buffnotice ~= true then return end

T.remindbuffs2 = {
	PRIEST = {
		21562, -- PW: Fortitude
	},
	MAGE = {
		1459, -- Arcane Brilliance
		61316, -- Dalaran Brilliance
	},
	DEATHKNIGHT = {
		48263, -- Blood Presence
		48265, -- Unholy Presence
		48266, -- Frost Presence
	},
	ROGUE = {
		5761, -- Mind-numbing Poison
		3408, -- Crippling Poison
		108211, -- Leeching Poison
		108215, -- Paralytic Poison
	},
}

-- Nasty stuff below. Don't touch.
local buffs = T.remindbuffs2[T.myclass]

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

local frame = CreateFrame("Frame", "TukuiBuffsWarningFrame2", UIParent)
frame.icon = frame:CreateTexture(nil, "OVERLAY")
frame.icon:SetPoint("CENTER")
frame:SetTemplate("Default")
frame:Size(40)
frame:Point("CENTER", UIParent, "CENTER", 30, 100)
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