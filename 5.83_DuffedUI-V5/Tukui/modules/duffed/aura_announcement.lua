local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
if C["duffed"].ccannouncement ~= true then return end

SpellsAN = {
	aura = { -- true means you announce start and end of aura; false only start
		-- [GetSpellInfo(139)]		= false, 	-- test
		-- CC
		[GetSpellInfo(6770)] 	= false, 	-- Sap
		[GetSpellInfo(118)] 	= false, 	-- Polymorph
		[GetSpellInfo(61305)] 	= false, 	-- Polymorph (Black Cat)
		[GetSpellInfo(28272)] 	= false, 	-- Polymorph (Pig)
		[GetSpellInfo(61721)] 	= false, 	-- Polymorph (Rabbit)
		[GetSpellInfo(61780)] 	= false, 	-- Polymorph (Turkey)
		[GetSpellInfo(28271)] 	= false, 	-- Polymorph (Turtle)
		[GetSpellInfo(61025)] 	= false, 	-- Polymorph (Serpent)
		[GetSpellInfo(33786)] 	= false, 	-- Cyclone
		[GetSpellInfo(5782)] 	= false, 	-- Fear
		[GetSpellInfo(2094)] 	= false, 	-- Blind
		[GetSpellInfo(51514)] 	= false, 	-- Hex
		[GetSpellInfo(5246)] 	= false,	-- Intimidating Shout
		[GetSpellInfo(65543)] 	= false,	-- Psychic Scream
		[GetSpellInfo(60192)]	= false,	-- Freezing Trap
		[GetSpellInfo(19386)]	= false,	-- Wyvern Sting
		[GetSpellInfo(6358)]	= false,	-- Seduction
		[GetSpellInfo(710)]		= false,	-- Banish
		[GetSpellInfo(2637)]	= false,	-- Hibernate
		
		-- Def Skills
		[GetSpellInfo(22812)] 	= true, 	-- Barkskin
		[GetSpellInfo(871)] 	= true, 	-- Shield Wall
		[GetSpellInfo(5277)] 	= true, 	-- Evasion
		[GetSpellInfo(74001)] 	= true, 	-- Combat Readiness
		[GetSpellInfo(48707)]	= true,		-- Anti-Magic Shell
		[GetSpellInfo(48792)]	= true,		-- Icebound Fortitude
		[GetSpellInfo(19263)]	= true,		-- Deterrence
		[GetSpellInfo(31224)]	= true,		-- Cloak of Shadows
		[GetSpellInfo(498)]    	= true,    	-- Divine Protection
		--[GetSpellInfo( 33206 )]	= true,		-- Pain Suppression
		[GetSpellInfo(86150)]  	= true,    	-- Guardian of Ancient Kings
		[GetSpellInfo(31850)]  	= true,    	-- Ardent Defender
	},
	
	-- casts that doesnt apply a buff or debuff (true/false doesnt do anything here)
	cast = {
		[GetSpellInfo(16190)]	= true, 	-- Mana Tide Totem
		[GetSpellInfo( 98007 )]	= true,		-- Spirit Link Totem
	},
}

-- Buff/Debuff Announcement
local f = CreateFrame("Frame")
local function Update(self, event, ...)
	if not C["duffed"].ccannouncement then return end
	
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
		
		local timestamp, eventType, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags = ...
		local spellName = select(13, ...)
		for spell, check in pairs(SpellsAN.aura) do
			if (eventType == "SPELL_AURA_APPLIED") and destName == UnitName("player") then
				if spellName == spell and check == true then
					SendChatMessage("+ "..GetSpellLink(spell).."!", channel)
				elseif spellName == spell and check ~= true then
					SendChatMessage(spell.."!", channel)
				end
			elseif eventType == "SPELL_AURA_REMOVED" and destName == UnitName("player") then
				if spellName == spell and check ~= false then
					SendChatMessage("- "..GetSpellLink(spell).."!", channel) 
				end
			end
		end
		for spell, check in pairs(SpellsAN.cast) do
			if eventType == "SPELL_CAST_SUCCESS" and sourceName == UnitName("player") and spellName == spell then
				SendChatMessage(GetSpellLink(spell).."!", channel)
			end
		end
	end
end
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
f:SetScript("OnEvent", Update)