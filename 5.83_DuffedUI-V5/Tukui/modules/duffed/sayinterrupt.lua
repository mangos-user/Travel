local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
if C["duffed"].sayinterrupt ~= true then return end

-- Say interrupt
local f = CreateFrame("Frame")
local function Update(self, event, ...)
	if not C["duffed"].sayinterrupt then return end
	
	local pvpType = GetZonePVPInfo()
	if C["duffed"].arenaonly then
		if pvpType ~= "arena" then return end
	else
		f:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
	end
	
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		if UnitInRaid("player") and GetNumRaidMembers() > 5 then
			channel = C["duffed"].announcechannel
		elseif GetNumPartyMembers() > 0 then
			channel = C["duffed"].announcechannel
		else
			channel = "SAY"
		end
		
		local timestamp, eventType, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName, _, extraskillID, extraSkillName = ...
		if eventType == "SPELL_INTERRUPT" and sourceName == UnitName("player") then
			SendChatMessage("Interrupted => "..GetSpellLink(extraskillID).."!", channel)
		end
	end
end
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
f:SetScript("OnEvent", Update)