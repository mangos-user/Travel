-- Actionbar2 for DuffedUI --

local T, C, L, G = unpack(Tukui)
if C["actionbar"].enable ~= true then  return end

local bar = G.ActionBars.Bar1
MultiBarBottomLeft:SetParent(bar)

for i = 1, 12 do
	local b = _G["MultiBarBottomLeftButton"..i]
	local b2 = _G["MultiBarBottomLeftButton"..i - 1]
	b:SetSize(T.buttonsize, T.buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)

	if i == 1 then
		if T.lowversion or C["actionbar"].layout == 2 then
			if C["actionbar"].swap then
				b:Point("BOTTOMLEFT", bar, T.buttonspacing, T.buttonspacing)
			else
				b:Point("TOPLEFT", bar, T.buttonspacing, -T.buttonspacing)
			end
		else
			b:Point("BOTTOMLEFT", bar, "BOTTOM", T.buttonspacing / 2, T.buttonspacing)
		end
	else
		b:Point("LEFT", b2, "RIGHT", T.buttonspacing, 0)
	end
end
