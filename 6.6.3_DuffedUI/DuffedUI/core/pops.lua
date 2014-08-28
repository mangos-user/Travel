local T, C, L, G = unpack(Tukui)

T.CreatePopup["DUFFEDUIDISABLE_RAID"] = {
	question = "Choose your favorite Raidlayout:",
	answer1 = "DPS, Tank",
	answer2 = "Healing",
	function1 = function() DisableAddOn("DuffedUI_Raid_Healing") EnableAddOn("DuffedUI_Raid") ReloadUI() end,
	function2 = function() EnableAddOn("DuffedUI_Raid_Healing") DisableAddOn("DuffedUI_Raid") ReloadUI() end,
}

T.CreatePopup["DUFFEDUI_ENABLE_CHAT_BACKGROUND"] = {
	question = "Enable chatbackgrounds",
	answer1 = ACCEPT,
	answer2 = CANCEL,
	function1 = function()
		if IsAddOnLoaded("Tukui_ConfigUI") then
			if not TukuiEditedDefaultConfig["chat"] then
				TukuiEditedDefaultConfig["chat"] = {}
			end
			TukuiEditedDefaultConfig["chat"].background = true
		end
		ReloadUI()
	end,
}