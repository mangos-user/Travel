-- Actionbar3 for DuffedUI --

local T, C, L, G = unpack(Tukui)
if C["actionbar"].enable ~= true then return end

if C["actionbar"].layout == 1 then
	local bar = G.ActionBars.Bar2
	MultiBarBottomRight:SetParent(bar)
	
	for i= 1, 12 do
		local b = _G["MultiBarBottomRightButton"..i]
		local b2 = _G["MultiBarBottomRightButton"..i-1]
		b:SetSize(T.buttonsize, T.buttonsize)
		b:ClearAllPoints()
		b:SetFrameStrata("MEDIUM")
		b:SetFrameLevel(15)

		if i == 1 then
			if C["actionbar"].swap then
				b:SetPoint("BOTTOMLEFT", G.ActionBars.Bar1, T.buttonspacing, T.buttonspacing)
			else
				b:SetPoint("BOTTOMLEFT", bar, T.buttonspacing, T.buttonspacing)
			end
		else
			b:SetPoint("LEFT", b2, "RIGHT", T.buttonspacing, 0)
		end
	end
	
	UnregisterStateDriver(bar, "visibility")
else
	local barL = G.ActionBars.Bar2
	local barR = DuffedPanel
	barR:SetParent(barL)
	MultiBarBottomRight:SetParent(barL)
	
	for i= 1, 12 do
		local b = _G["MultiBarBottomRightButton"..i]
		local b2 = _G["MultiBarBottomRightButton"..i-1]
		b:SetSize(T.buttonsize, T.buttonsize)
		b:ClearAllPoints()
		b:SetFrameStrata("MEDIUM")
		b:SetFrameLevel(15)

		if i == 1 then
			b:SetPoint("TOPLEFT", barL, T.buttonspacing, -T.buttonspacing)
		elseif i == 4 then
			b:SetPoint("BOTTOMLEFT", barL, T.buttonspacing, T.buttonspacing)
		elseif i == 7 then
			b:SetPoint ("TOPLEFT", barR, T.buttonspacing, -T.buttonspacing)
		elseif i == 10 then
			b:SetPoint ("BOTTOMLEFT", barR, T.buttonspacing, T.buttonspacing)
		else
			b:SetPoint ("LEFT", b2, "RIGHT", T.buttonspacing, 0)
		end
	end
	
	UnregisterStateDriver(barL, "visibility")
	UnregisterStateDriver(barR, "visibility")
end