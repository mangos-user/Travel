-- Shapeshiftbar for DuffedUI --

local T, C, L, G = unpack(Tukui)

if(C["actionbar"].enable ~= true) then return end

local bar = G.ActionBars.Stance

if C["actionbar"].shapeshiftborder then
	local sbb = CreateFrame("Frame", "sbb", StanceButton1)
	sbb:SetTemplate("Transparent")
	sbb:SetFrameLevel(1)
	sbb:SetFrameStrata("BACKGROUND")
	
	TukuiStance:HookScript("OnEvent", function(self, event, ...)
		if C["actionbar"].verticalshapeshift == true then
			sbb:Point("TOP", 0, T.buttonspacing)
			sbb:Size(StanceButton1:GetHeight() + 2 * T.buttonspacing, ((StanceButton1:GetWidth() + T.buttonspacing) * GetNumShapeshiftForms()) + T.buttonspacing)
		else
			sbb:Point("LEFT", -T.buttonspacing, 0)
			sbb:Size(((StanceButton1:GetWidth() + T.buttonspacing) * GetNumShapeshiftForms()) + T.buttonspacing, StanceButton1:GetHeight() + 2 * T.buttonspacing)
		end
	end)
end

-- mouseover --
if C["actionbar"].shapeshiftmouseover == true then
	TukuiStance:HookScript("OnEvent", function(self, event, ...)
		local function mouseover(alpha)
			for i = 1, NUM_STANCE_SLOTS do
				local sb = G.ActionBars.Stance["Button"..i]
				sb:SetAlpha(alpha)
			end
		end

		for i = 1, NUM_STANCE_SLOTS do		
			_G["StanceButton"..i]:SetAlpha(0)
			_G["StanceButton"..i]:HookScript("OnEnter", function(self) mouseover(1) end)
			_G["StanceButton"..i]:HookScript("OnLeave", function(self) mouseover(0) end)
		end
		if C["actionbar"].shapeshiftborder then
			--local sbb
			
			sbb:EnableMouse(true)
			sbb:HookScript("OnEnter", function(self) mouseover(1) end)
			sbb:HookScript("OnLeave", function(self) mouseover(0) end)
		end
	end)
end

bar:HookScript("OnEvent", function(self, event, unit)
	if InCombatLockdown() then return end
	local button
	for i = 1, NUM_STANCE_SLOTS do
		button = _G["StanceButton" .. i]
		button:ClearAllPoints()
		button:SetParent(self)
		button:SetFrameStrata("LOW")
		if i == 1 then
			if C["actionbar"].verticalshapeshift == true then
				button:Point("TOPLEFT", 5, -5)
			else
				button:Point("BOTTOMLEFT", 5, 5)
			end
		else
			local previous = _G["StanceButton" .. i - 1]
			if C["actionbar"].verticalshapeshift == true then
				button:Point("TOP", previous, "BOTTOM", 0, -T.buttonspacing)
			else
				button:Point("LEFT", previous, "RIGHT", T.buttonspacing, 0)
			end
		end
		local _, name = GetShapeshiftFormInfo(i)
		if name then
			button:Show()
		end
	end
end)