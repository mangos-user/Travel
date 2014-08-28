-- Functions for DuffedUI
local T, C, L, G = unpack(Tukui)

T.CreateFontString = function()
	return C["media"].font, C["datatext"].fontsize, C["general"].outlines
end

local color = RAID_CLASS_COLORS[T.myclass]
T.color = ("|cff%.2x%.2x%.2x"):format(color.r * 255, color.g * 255, color.b * 255)

function T.SetModifiedBackdrop(self)
	local color = RAID_CLASS_COLORS[T.myclass]
	self:SetBackdropColor(color.r*.15, color.g*.15, color.b*.15)
	self:SetBackdropBorderColor(color.r, color.g, color.b)
end

function T.SetOriginalBackdrop(self)
	local color = RAID_CLASS_COLORS[T.myclass]
	if C["general"].classcolortheme == true then
		self:SetBackdropBorderColor(color.r, color.g, color.b)
	else
		self:SetTemplate("Default")
	end
end

T.cbPosition = function()
	if C["unitframes"].enable ~= true then return end

	--T.cbSize()
	local x = 0
	local y = 5
	if C["unitframes"].cbicons then x = 14 end
	if TukuiDataPerChar.hidebar4 == true then
		TukuiPlayerCastBar:ClearAllPoints()
		TukuiPlayerCastBar:Point("BOTTOM", G.ActionBars.Bar1, "TOP", x, y)
	else
		TukuiPlayerCastBar:ClearAllPoints()
		if C["actionbar"].layout == 1 then
			TukuiPlayerCastBar:Point("BOTTOMRIGHT", G.ActionBars.Bar2, "TOPRIGHT", -2, y)
		else
			TukuiPlayerCastBar:Point("BOTTOMRIGHT", G.ActionBars.Bar1, "TOPRIGHT", -2, y)
		end
	end
end

hooksecurefunc(T, "PostNamePosition", function(self)
	if C["unitframes"].layout == 2 then
		self.Name:ClearAllPoints()
		if (self.Power.value:GetText() and UnitIsEnemy("player", "target") and C["unitframes"].targetpowerpvponly == true) or (self.Power.value:GetText() and C["unitframes"].targetpowerpvponly == false) then
			self.Name:SetPoint("LEFT", self.Health, "LEFT", 4, 1)
		else
			self.Power.value:SetAlpha(0)
			self.Name:SetPoint("LEFT", self.Health, "LEFT", 4, 1)
		end
	elseif C["unitframes"].layout == 1 then
		self.Name:ClearAllPoints()
		if (self.Power.value:GetText() and UnitIsEnemy("player", "target") and C["unitframes"].targetpowerpvponly == true) or (self.Power.value:GetText() and C["unitframes"].targetpowerpvponly == false) then
			self.Name:SetPoint("LEFT", self.DTpanel, "LEFT", 4, 1)
		else
			self.Power.value:SetAlpha(0)
			self.Name:SetPoint("LEFT", self.DTpanel, "LEFT", 4, 1)
		end
	elseif C["unitframes"].layout == 3 then
		self.Name:ClearAllPoints()
		if (self.Power.value:GetText() and UnitIsEnemy("player", "target") and C["unitframes"].targetpowerpvponly == true) or (self.Power.value:GetText() and C["unitframes"].targetpowerpvponly == false) then
			self.Name:SetPoint("TOPLEFT", self.Health, "TOPLEFT", 4, 15)
		else
			self.Power.value:SetAlpha(0)
			self.Name:SetPoint("TOPLEFT", self.Health, "TOPLEFT", 4, 15)
		end
	end
end)

local MOVE_UI = false
local function MoveUI()
	if InCombatLockdown() then return end
	if MOVE_UI then MOVE_UI = false else MOVE_UI = true end
	
	local moveframes = {
		TCBanchor,
		RCDAnchor,
		FCBanchor,
		DuffedDM,
		sCombosAnchor,
		TUanchor,
		BNTanchor,
		SCDanchor
	}
	if TCBanchor or RCDAnchor or FCBanchor or DuffedDM or sCombosAnchor or TUanchor or BNTanchor or SCDanchor then
		if MOVE_UI then
			for _, panels in pairs(moveframes) do
				panels:Show()
			end
		else
			for _, panels in pairs(moveframes) do
				panels:Hide()
			end
		end
	end
end
hooksecurefunc(_G.SlashCmdList, "MOVING", MoveUI)

local ShortValueNegative = function(v)
	if v <= 999 then return v end
	if v >= 1000000 then
		local value = string.format("%.1fm", v / 1000000)
		return value
	elseif v >= 1000 then
		local value = string.format("%.1fk", v / 1000)
		return value
	end
end

local ShortValue = function(v)
	if v >= 1e6 then
		return ("%.1fm"):format(v / 1e6):gsub("%.?0+([km])$", "%1")
	elseif(v >= 1e3 or v <= -1e3) then
		return ("%.1fk"):format(v / 1e3):gsub("%.?0+([km])$", "%1")
	else
		return v
	end
end


local function PostUpdateHealth(health, unit, min, max)
	if not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit) then
		if not UnitIsConnected(unit) then
			health.value:SetText("|cffD7BEA5"..L.unitframes_ouf_offline.."|r")
		elseif UnitIsDead(unit) then
			health.value:SetText("|cffD7BEA5"..L.unitframes_ouf_dead.."|r")
		elseif UnitIsGhost(unit) then
			health.value:SetText("|cffD7BEA5"..L.unitframes_ouf_ghost.."|r")
		end
	else
		local r, g, b
		
		-- overwrite healthbar color for enemy player (a tukui option if enabled), target vehicle/pet too far away returning unitreaction nil and friend unit not a player. (mostly for overwrite tapped for friendly)
		-- I don't know if we really need to call C["unitframes"].unicolor but anyway, it's safe this way.
		if (C["unitframes"].unicolor ~= true and C["unitframes"].enemyhcolor and unit == "target" and UnitIsEnemy(unit, "player") and UnitIsPlayer(unit)) or (C["unitframes"].unicolor ~= true and unit == "target" and not UnitIsPlayer(unit) and UnitIsFriend(unit, "player")) then
			local c = T.UnitColor.reaction[UnitReaction(unit, "player")]
			if c then 
				r, g, b = c[1], c[2], c[3]
				health:SetStatusBarColor(r, g, b)
			else
				-- if "c" return nil it's because it's a vehicle or pet unit too far away, we force friendly color
				-- this should fix color not updating for vehicle/pet too far away from yourself.
				r, g, b = 75/255,  175/255, 76/255
				health:SetStatusBarColor(r, g, b)
			end					
		end

		if min ~= max then
			local r, g, b
			r, g, b = oUFTukui.ColorGradient(min, max, 0.69, 0.31, 0.31, 0.65, 0.63, 0.35, 0.33, 0.59, 0.33)
			if unit == "player" and health:GetAttribute("normalUnit") ~= "pet" then
				if C["unitframes"].showtotalhpmp == true then
					health.value:SetFormattedText("|cff559655%s|r |cffD7BEA5|||r |cff559655%s|r", ShortValue(min), ShortValue(max))
				else
					health.value:SetFormattedText("|cffAF5050%s|r |cffD7BEA5-|r |cff%02x%02x%02x%d%%|r", ShortValue(min), r * 255, g * 255, b * 255, floor(min / max * 100))
				end
			elseif unit == "target" or (unit and unit:find("boss%d")) then
				if C["unitframes"].showtotalhpmp == true then
					health.value:SetFormattedText("|cff559655%s|r |cffD7BEA5|||r |cff559655%s|r", ShortValue(min), ShortValue(max))
				else
					health.value:SetFormattedText("|cffAF5050%s|r |cffD7BEA5-|r |cff%02x%02x%02x%d%%|r", ShortValue(min), r * 255, g * 255, b * 255, floor(min / max * 100))
				end
			elseif (unit and unit:find("boss%d")) then
				if C["unitframes"].showtotalhpmp == true then
					health.value:SetFormattedText("|cff559655%s|r |cffD7BEA5|||r |cff559655%s|r", ShortValue(min), ShortValue(max))
				else
					health.value:SetFormattedText("|cffAF5050%s|r |cffD7BEA5-|r |cff%02x%02x%02x%d%%|r", ShortValue(min), r * 255, g * 255, b * 255, floor(min / max * 100))
				end
			elseif (unit and unit:find("arena%d")) or unit == "focus" or unit == "focustarget" then
				health.value:SetText("|cff559655"..ShortValue(min).."|r")
			else
				health.value:SetText("|cff559655-"..ShortValue(max-min).."|r")
			end
		else
			if unit == "player" and health:GetAttribute("normalUnit") ~= "pet" then
				health.value:SetText("|cff559655"..ShortValue(max).."|r")
			elseif unit == "target" or unit == "focus"  or unit == "focustarget" or (unit and unit:find("arena%d")) then
				health.value:SetText("|cff559655"..ShortValue(max).."|r")
			elseif (unit and unit:find("boss%d")) then
				health.value:SetText(" ")
			else
				health.value:SetText(" ")
			end
		end
	end
end
hooksecurefunc(T, "PostUpdateHealth", PostUpdateHealth)

local function PostUpdateHealthRaid(health, unit, min, max)
	if not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit) then
		if not UnitIsConnected(unit) then
			health.value:SetText("|cffD7BEA5" .. L.unitframes_ouf_offline .. "|r")
		elseif UnitIsDead(unit) then
			health.value:SetText("|cffD7BEA5" .. L.unitframes_ouf_dead .. "|r")
		elseif UnitIsGhost(unit) then
			health.value:SetText("|cffD7BEA5" .. L.unitframes_ouf_ghost .. "|r")
		end
	else
		if not UnitIsPlayer(unit) and UnitIsFriend(unit, "player") and C["unitframes"].unicolor ~= true then
			local c = T.UnitColor.reaction[5]
			local r, g, b = c[1], c[2], c[3]
			health:SetStatusBarColor(r, g, b)
			health.bg:SetTexture(0.1, 0.1, 0.1)
		end

		if C["unitframes"].gradienthealth == true and C["unitframes"].unicolor == true  then
			if not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit)  then return end
			if not health.classcolored  then
				local r, g, b = oUFTukui.ColorGradient(min, max, unpack(C["unitframes"].gradient))
				health:SetStatusBarColor(r, g, b)
			end
		end
		
		if(min ~= max) then
			health.value:SetText("|cff559655-" .. ShortValueNegative(max - min) .. "|r")
		else
			health.value:SetText(" ")
		end
	end
end
hooksecurefunc(T, "PostUpdateHealthRaid", PostUpdateHealthRaid)

-- function to update power text on unit frames
local function PostUpdatePower(power, unit, min, max)
	local self = power:GetParent()
	local pType, pToken = UnitPowerType(unit)
	local color = T.UnitColor.power[pToken]

	if color then
		power.value:SetTextColor(color[1], color[2], color[3])
	end

	if not UnitIsPlayer(unit) and not UnitPlayerControlled(unit) or not UnitIsConnected(unit) then
		power.value:SetText()
	elseif UnitIsDead(unit) or UnitIsGhost(unit) then
		power.value:SetText()
	else
		if min ~= max then
			if pType == 0 then
				if unit == "target" then
					if C["unitframes"].showtotalhpmp == true then
						power.value:SetFormattedText("%s |cffD7BEA5|||r %s", ShortValue(max - (max - min)), ShortValue(max))
					else
						power.value:SetFormattedText("%d%% |cffD7BEA5-|r %s", floor(min / max * 100), ShortValue(max - (max - min)))
					end
				elseif unit == "player" and self:GetAttribute("normalUnit") == "pet" or unit == "pet" then
					if C["unitframes"].showtotalhpmp == true then
						power.value:SetFormattedText("%s |cffD7BEA5|||r %s", ShortValue(max - (max - min)), ShortValue(max))
					else
						power.value:SetText(ShortValue(min))
					end
				elseif(unit and unit:find("arena%d")) or unit == "focus" or unit == "focustarget" then
					power.value:SetText(ShortValue(min))
				else
					if C["unitframes"].showtotalhpmp == true then
						power.value:SetFormattedText("%s |cffD7BEA5|||r %s", ShortValue(max - (max - min)), ShortValue(max))
					else
						power.value:SetFormattedText("%d%% |cffD7BEA5-|r %s", floor(min / max * 100), ShortValue(max - (max - min)))
					end
				end
			else
				power.value:SetText(max - (max - min))
			end
		else
			if unit == "pet" or unit == "target" or unit == "focus" or unit == "focustarget" or (unit and unit:find("arena%d")) then
				power.value:SetText(ShortValue(min))
			else
				power.value:SetText(ShortValue(min))
			end
		end
	end
	if self.Name then
		if unit == "target" then T.PostNamePosition(self, power) end
	end
end
hooksecurefunc(T, "PostUpdatePower", PostUpdatePower)

T.UTF = function(string, i, dots)
	if not string then return end

	local bytes = string:len()
	if bytes <= i then
		return string
	else
		local len, pos = 0, 1
		while pos <= bytes do
			len = len + 1
			local c = string:byte(pos)

			if c > 0 and c <= 127 then
				pos = pos + 1
			elseif c >= 192 and c <= 223 then
				pos = pos + 2
			elseif c >= 224 and c <= 239 then
				pos = pos + 3
			elseif c >= 240 and c <= 247 then
				pos = pos + 4
			end
			if len == i then break end
		end

		if len == i and pos <= bytes then
			return string:sub(1, pos - 1) .. (dots and "..." or "")
		else
			return string
		end
	end
end

T.CreateBtn = function(name, parent, w, h, tt_txt, txt)
	local b = CreateFrame("Button", name, parent, "SecureActionButtonTemplate")
	b:Width(w)
	b:Height(h)
	b:SetTemplate("Default")

	b:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_LEFT")
		GameTooltip:AddLine(tt_txt, 1, 1, 1, 1, 1, 1)
		GameTooltip:Show()
	end)
	b:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	b:FontString(nil, C["media"].font, 10, "THINOUTLINE")
	b.text:SetText(T.color..txt)
	b.text:SetPoint("CENTER", b, "CENTER", 1, 0)
	b.text:SetJustifyH("CENTER")

	b:SetAttribute("type1", "macro")
end