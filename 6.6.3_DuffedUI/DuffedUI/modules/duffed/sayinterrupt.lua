local T, C, L, G = unpack(Tukui)
if C["duffed"].sayinterrupt ~= true then return end

--[[local DuffedSayInterrupt = CreateFrame("Frame")
DuffedSayInterrupt:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
DuffedSayInterrupt:SetScript("OnEvent", function(self, _, ...)
	local _, event, _, sourceGUID, _, _, _, _, destName, _, _, _, _, _, spellID = ...
	if not event == "SPELL_INTERRUPT" and sourceGUID == UnitGUID("player") then return end

	if IsInRaid() then
		SendChatMessage("Interrupt" .. " " .. destName .. "=> " .. GetSpellLink(spellID), "RAID")
	elseif IsInGroup() then
		SendChatMessage("Interrupt" .. " " .. destName .. "=> " .. GetSpellLink(spellID), C["duffed"].announcechannel)
	else
		SendChatMessage("Interrupt" .. " " .. destName .. "=> " .. GetSpellLink(spellID), C["duffed"].announcechannel)
	end
end)]]--

-- Say interrupt
local f = CreateFrame("Frame")
local function Update(self, event, ...)
	if not C["duffed"].sayinterrupt then return end
	
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		if IsInRaid("player") then
			channel = C["duffed"].announcechannel
		elseif IsInGroup("player") then
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