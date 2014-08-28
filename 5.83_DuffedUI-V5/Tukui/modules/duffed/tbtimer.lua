local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
if C["duffed"].tbtimer ~= false then return end

-- TB Timer (show watchframe when entering tb)
local function Update(self, event)
	if event == "ZONE_CHANGED_NEW_AREA" then
		if GetRealZoneText() == "Tol Barad" then
			StopwatchFrame:Show()
			Stopwatch_Play()
		elseif GetRealZoneText() == "Halbinsel von Tol Barad" then
			StopwatchFrame:Hide()
			Stopwatch_Clear()
		end
	end
end

local f = CreateFrame("Frame")
f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
f:SetScript("OnEvent", Update)