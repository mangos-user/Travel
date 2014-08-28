-- Actionbar1 for DuffedUI --

local T, C, L, G = unpack(Tukui)
if C["actionbar"].enable ~= true then return end

local bar = G.ActionBars.Bar1

bar:HookScript("OnEvent", function(self, event, unit)
	if event == "PLAYER_ENTERING_WORLD" then
		local button

		for i = 1, 12 do
			button = _G["ActionButton" .. i]
			button:SetSize(T.buttonsize, T.buttonsize)
			button:ClearAllPoints()
			button:SetFrameStrata("BACKGROUND")
			button:SetFrameLevel(15)

			if i == 1 then
				if C["actionbar"].layout == 1 then
					if C["actionbar"].swap then
						button:SetPoint("BOTTOMLEFT", G.ActionBars.Bar2, T.buttonspacing, T.buttonspacing)
					else
						button:SetPoint("BOTTOMLEFT", bar, T.buttonspacing, T.buttonspacing)
					end
				else
					if C["actionbar"].swap then
						button:SetPoint("TOPLEFT", bar, T.buttonspacing, -T.buttonspacing)
					else
						button:SetPoint("BOTTOMLEFT", bar, T.buttonspacing, T.buttonspacing)
					end
				end
			else
				local previous = _G["ActionButton" .. i - 1]
				button:SetPoint("LEFT", previous, "RIGHT", T.buttonspacing, 0)
			end
		end
	end
end)
UnregisterStateDriver(bar, "visibility")