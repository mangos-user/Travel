local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

-- all our frames that we want being movable.
T.MoverFrames = {
	TukuiMinimap,
	TukuiTooltipAnchor,
	TukuiAurasPlayerBuffs,
	TukuiShiftBar,
	TukuiRollAnchor,
	TukuiAchievementHolder,
	TukuiWatchFrameAnchor,
	TukuiGMFrameAnchor,
	TukuiVehicleAnchor,
	TukuiBnetHolder,
	RaidBuffReminder,
	TukuiExtraActionBarFrameHolder,
}

-- used to exec various code if we enable or disable moving
local function exec(self, enable)

	if self == TukuiGMFrameAnchor or self == TukuiBnetHolder then
		if enable then
			self:Show()
		else
			self:Hide()
		end
	end
	
	if self == TukuiMinimap then
		if enable then 
			Minimap:Hide()
			self:SetBackdropBorderColor(1,0,0,1)
		else 
			Minimap:Show()
			self:SetBackdropBorderColor(unpack(C.media.bordercolor))
		end
	end
	
	if self == TukuiAurasPlayerBuffs then
		if not self:GetBackdrop() then self:SetTemplate("Default") end

		local buffs = TukuiAurasPlayerBuffs
		local debuffs = TukuiAurasPlayerDebuffs

		if enable then
			buffs:SetBackdropColor(unpack(C.media.backdropcolor))
			buffs:SetBackdropBorderColor(1,0,0,1)	
		else
			local position = self:GetPoint()
			if position:match("TOPLEFT") or position:match("BOTTOMLEFT") or position:match("BOTTOMRIGHT") or position:match("TOPRIGHT") then
				buffs:SetAttribute("point", position)
				debuffs:SetAttribute("point", position)
			end
			if position:match("LEFT") then
				buffs:SetAttribute("xOffset", 35)
				debuffs:SetAttribute("xOffset", 35)
			else
				buffs:SetAttribute("xOffset", -35)
				debuffs:SetAttribute("xOffset", -35)
			end
			if position:match("BOTTOM") then
				buffs:SetAttribute("wrapYOffset", 67.5)
				debuffs:SetAttribute("wrapYOffset", 67.5)
			else
				buffs:SetAttribute("wrapYOffset", -67.5)
				debuffs:SetAttribute("wrapYOffset", -67.5)
			end
			buffs:SetBackdropColor(0,0,0,0)
			buffs:SetBackdropBorderColor(0,0,0,0)
		end
	end
	
	if self == TukuiTooltipAnchor or self == TukuiRollAnchor or self == TukuiAchievementHolder or self == TukuiVehicleAnchor then
		if enable then
			self:SetAlpha(1)
		else
			self:SetAlpha(0)
			if self == TukuiTooltipAnchor then 
				local position = TukuiTooltipAnchor:GetPoint()
				local healthBar = GameTooltipStatusBar
				if position:match("TOP") then
					healthBar:ClearAllPoints()
					healthBar:Point("TOPLEFT", healthBar:GetParent(), "BOTTOMLEFT", 2, -5)
					healthBar:Point("TOPRIGHT", healthBar:GetParent(), "BOTTOMRIGHT", -2, -5)
					if healthBar.text then healthBar.text:Point("CENTER", healthBar, 0, -6) end
				else
					healthBar:ClearAllPoints()
					healthBar:Point("BOTTOMLEFT", healthBar:GetParent(), "TOPLEFT", 2, 5)
					healthBar:Point("BOTTOMRIGHT", healthBar:GetParent(), "TOPRIGHT", -2, 5)
					if healthBar.text then healthBar.text:Point("CENTER", healthBar, 0, 6) end			
				end
			end
		end		
	end
	
	if self == TukuiWatchFrameAnchor or self == TukuiExtraActionBarFrameHolder then
		if enable then
			self:SetBackdropBorderColor(1,0,0,1)
			self:SetBackdropColor(unpack(C.media.backdropcolor))		
		else
			self:SetBackdropBorderColor(0,0,0,0)
			self:SetBackdropColor(0,0,0,0)		
		end
	end
	
	if C["actionbar"].panels == false then
		if self == TukuiShiftBar then
			if enable then
				TukuiShapeShiftHolder:SetAlpha(1)
			else
				TukuiShapeShiftHolder:SetAlpha(0)
				-- used for shaman totembar update
				if T.myclass == "SHAMAN" and self.moving == false and HasMultiCastActionBar() then
					T.TotemOrientationDown = T.TotemBarOrientation()
				end
			end
		end
	end
	
	if C["misc"].rbf == true then
		if self == RaidBuffReminder then
			if enable then
				RaidBuffReminderHolder:SetAlpha(1)
			else
				RaidBuffReminderHolder:SetAlpha(0)
			end
		end
	end
end

local enable = true
local origa1, origf, origa2, origx, origy

local function moving()
	-- don't allow moving while in combat
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	
	if C.misc.sComboenable and C.unitframes.enable then SlashCmdList.MOVESCOMBO() end
	if C.misc.swingtimerenable and C.unitframes.enable then 
		if TukuiSwingtimerHolder:IsShown() then
			TukuiSwingtimerHolder:Hide()
			TukuiSwingtimerHolder:EnableMouse(false)
		else
			TukuiSwingtimerHolder:Show()
			TukuiSwingtimerHolder:EnableMouse(true)
		end
	end
	
	if TukuiRaidUtilityAnchor then
		if TukuiRaidUtilityAnchor:IsShown() then TukuiRaidUtilityAnchor:Hide() else TukuiRaidUtilityAnchor:Show() end
	end
	
	for i = 1, getn(T.MoverFrames) do
		if T.MoverFrames[i] then		
			if enable then
				T.MoverFrames[i]:EnableMouse(true)
				T.MoverFrames[i]:RegisterForDrag("LeftButton", "RightButton")
				T.MoverFrames[i]:SetScript("OnDragStart", function(self) 
					origa1, origf, origa2, origx, origy = T.MoverFrames[i]:GetPoint() 
					self.moving = true 
					self:SetUserPlaced(true) 
					self:StartMoving() 
				end)			
				T.MoverFrames[i]:SetScript("OnDragStop", function(self) 
					self.moving = false 
					self:StopMovingOrSizing() 
				end)			
				exec(T.MoverFrames[i], enable)			
				if T.MoverFrames[i].text then 
					T.MoverFrames[i].text:Show() 
					T.MoverFrames[i].text:SetFont(C["media"].font, 12)
				end
			else			
				T.MoverFrames[i]:EnableMouse(false)
				if T.MoverFrames[i].moving == true then
					T.MoverFrames[i]:StopMovingOrSizing()
					T.MoverFrames[i]:ClearAllPoints()
					T.MoverFrames[i]:SetPoint(origa1, origf, origa2, origx, origy)
				end
				exec(T.MoverFrames[i], enable)
				if T.MoverFrames[i].text then T.MoverFrames[i].text:Hide() end
				T.MoverFrames[i].moving = false
			end
		end
	end
	
	if T.MoveUnitFrames then T.MoveUnitFrames() end
	
	if enable then enable = false else enable = true end
end
SLASH_MOVING1 = "/mtukui"
SLASH_MOVING2 = "/moveui"
SLASH_MOVING3 = "/uf"
SlashCmdList["MOVING"] = moving

local protection = CreateFrame("Frame")
protection:RegisterEvent("PLAYER_REGEN_DISABLED")
protection:SetScript("OnEvent", function(self, event)
	if enable then return end
	print(ERR_NOT_IN_COMBAT)
	enable = false
	moving()
end)