local T, C, L, G = unpack(Tukui)

-- switch to heal layout via a command
SLASH_TUKUIHEAL1 = "/heal"
SlashCmdList.TUKUIHEAL = function()
	DisableAddOn("DuffedUI_Raid")
	EnableAddOn("DuffedUI_Raid_Healing")
	ReloadUI()
end

-- switch to dps layout via a command
SLASH_TUKUIDPS1 = "/dps"
SlashCmdList.TUKUIDPS = function()
	DisableAddOn("DuffedUI_Raid_Healing")
	EnableAddOn("DuffedUI_Raid")
	ReloadUI()
end

if C["general"].lowres then T.lowversion = true end