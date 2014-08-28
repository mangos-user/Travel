-- Actionbar4 for DuffedUI --

local T, C, L, G = unpack(Tukui)
if C["actionbar"].enable ~= true then return end

local bar = G.ActionBars.Bar5
MultiBarLeft:SetParent(bar)

for i= 1, 12 do
	local b = _G["MultiBarLeftButton"..i]
	local b2 = _G["MultiBarLeftButton"..i-1]
	b:SetSize(T.buttonsize, T.buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if i == 1 then
		b:SetPoint("TOPLEFT", bar, T.buttonspacing, -T.buttonspacing)
	else
		b:SetPoint("TOP", b2, "BOTTOM", 0, -T.buttonspacing)
	end
end
RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle] hide; show")

-----------------------------------
-- setup MultiBarRight as bar #5 --
-----------------------------------

local bar = G.ActionBars.Bar5
MultiBarRight:SetParent(bar)
	
for i= 1, 12 do
	local b = _G["MultiBarRightButton"..i]
	local b2 = _G["MultiBarRightButton"..i-1]
	b:SetSize(T.buttonsize, T.buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("MEDIUM")
	b:SetFrameLevel(13)
	
	if i == 1 then
		b:SetPoint("TOPRIGHT", bar, -T.buttonspacing, -T.buttonspacing)
	else
		b:SetPoint("TOP", b2, "BOTTOM", 0, -T.buttonspacing)
	end
end
RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle] hide; show")

---------------
-- Mouseover --
---------------
if C["actionbar"].rightbarsmouseover ~= true then return end

-- Frame i created cause mouseover rightbars sux if it fades out when ur mouse is behind (right) of them ..
local rbmoh = CreateFrame("Frame", nil, G.ActionBars.Bar5)
rbmoh:Point("RIGHT", UIParent, "RIGHT", 0, -14)
rbmoh:SetSize(24, (T.buttonsize * 12) + (T.buttonspacing * 13))

function DuffedRightBarsMouseover(alpha)
	G.ActionBars.Bar5:SetAlpha(alpha)
	DuffedBar3Button2:SetAlpha(alpha)
	DuffedBar3Button:SetAlpha(alpha)
	MultiBarRight:SetAlpha(alpha)
	MultiBarLeft:SetAlpha(alpha)
	G.ActionBars.Pet.BackgroundLink:SetAlpha(alpha)
	if C["actionbar"].petbaralwaysvisible ~= true then
		TukuiPetBar:SetAlpha(alpha)
		for i=1, NUM_PET_ACTION_SLOTS do
			_G["PetActionButton"..i]:SetAlpha(alpha)
		end
	end
end

local function mouseover(f)
	f:EnableMouse(true)
	f:SetAlpha(0)
	f:HookScript("OnEnter", function() DuffedRightBarsMouseover(1) end)
	f:HookScript("OnLeave", function() DuffedRightBarsMouseover(0) end)
end
mouseover(G.ActionBars.Bar5)
mouseover(rbmoh)

for i = 1, 12 do
	_G["MultiBarRightButton"..i]:EnableMouse(true)
	_G["MultiBarRightButton"..i]:HookScript("OnEnter", function() DuffedRightBarsMouseover(1) end)
	_G["MultiBarRightButton"..i]:HookScript("OnLeave", function() DuffedRightBarsMouseover(0) end)

	_G["MultiBarLeftButton"..i]:EnableMouse(true)
	_G["MultiBarLeftButton"..i]:HookScript("OnEnter", function() DuffedRightBarsMouseover(1) end)
	_G["MultiBarLeftButton"..i]:HookScript("OnLeave", function() DuffedRightBarsMouseover(0) end)
end

if C["actionbar"].petbaralwaysvisible ~= true then
	for i = 1, NUM_PET_ACTION_SLOTS do
		_G["PetActionButton"..i]:EnableMouse(true)
		_G["PetActionButton"..i]:HookScript("OnEnter", function() DuffedRightBarsMouseover(1) end)
		_G["PetActionButton"..i]:HookScript("OnLeave", function() DuffedRightBarsMouseover(0) end)
	end
	mouseover(TukuiPetBar)
else
	G.ActionBars.Pet.BackgroundLink:Hide()
end