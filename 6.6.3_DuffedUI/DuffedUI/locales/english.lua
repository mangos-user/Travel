local T, C, L, G = unpack(Tukui)

if T.client ~= "deDE" then
	L.Duffed_GLOBAL_WELCOME1 = "Hello |cffC41F3B" .. T.myname .. "!|r"
	L.Duffed_GLOBAL_WELCOME2 = "Thanks for using |cffC41F3BDuffedUI|r. For detailed information visit |cffC41F3Bhttp://www.tukui.org/addons/index.php?act=view&id=114|r or |cffC41F3Bhttp://www.wowinterface.com/downloads/info19994-DuffedV6.html|r"

	-- helpframe
	L.Duffed_HELP_HEADER = "|cffc41f3bDuffedUI|r - Help"
	L.Duffed_HELP_BUTTON1 = "Slashcommands"
	L.Duffed_HELP_BUTTON2 = "Specswitcher"
	L.Duffed_HELP_BUTTON3 = "Buttons"
	L.Duffed_HELP_BUTTON4 = "Actionbars"
	L.Duffed_HELP_BUTTON5 = "coming soon"
	L.Duffed_HELP_BUTTON6 = "coming soon"
	L.Duffed_HELP_BUTTON7 = "coming soon"
	L.Duffed_HELP_BUTTON8 = "coming soon"
	L.Duffed_HELP_BUTTON9 = "Credits"

	L.Duffed_HELP_CONTENT0_TITLE = "General"
	L.Duffed_HELP_CONTENT0_LINE1 = "Welcome to the HelpPanel from |cffc41f3bDuffedUI|r!\nThis Panel will help you to find the importants settings and commands for |cffc41f3bDuffedUI|r :)"
	L.Duffed_HELP_CONTENT0_LINE2 = "Please select a category."
	L.Duffed_HELP_CONTENT0_LINE3 = "Have Fun !"
	L.Duffed_HELP_CONTENT0_LINE4 = "greetz Merith - Zirkel des Cenarius EU"

	L.Duffed_HELP_CONTENT9_TITLE = "Credits"
	L.Duffed_HELP_CONTENT9_LINE1 = ""
	L.Duffed_HELP_CONTENT9_LINE2 = "Tukz, Elv, nightcracker, Ecl�ps�, Hydra, Asphyxia, Jasje, Epicgrimm, JerichoHM and all others who help Tukz and the Editors for the awesome Tukui"
	L.Duffed_HELP_CONTENT9_LINE3 = "Special Thanks goes to my Betatester:"
	L.Duffed_HELP_CONTENT9_LINE4 = "Kanestorm, Juhawny, Elenarda, macgee, loveran, transform, Optional, Pixelfcuk, Shera, lefirez, jones7 and all other Betatester :)"

	L.Duffed_HELP_CONTENT8_TITLE = "coming soon"
	L.Duffed_HELP_CONTENT8_LINE1 = ""
	L.Duffed_HELP_CONTENT8_LINE2 = ""
	L.Duffed_HELP_CONTENT8_LINE3 = ""
	L.Duffed_HELP_CONTENT8_LINE4 = ""

	L.Duffed_HELP_CONTENT7_TITLE = "coming soon"
	L.Duffed_HELP_CONTENT7_LINE1 = ""
	L.Duffed_HELP_CONTENT7_LINE2 = ""
	L.Duffed_HELP_CONTENT7_LINE3 = ""
	L.Duffed_HELP_CONTENT7_LINE4 = ""

	L.Duffed_HELP_CONTENT6_TITLE = "coming soon"
	L.Duffed_HELP_CONTENT6_LINE1 = ""
	L.Duffed_HELP_CONTENT6_LINE2 = ""
	L.Duffed_HELP_CONTENT6_LINE3 = ""
	L.Duffed_HELP_CONTENT6_LINE4 = ""

	L.Duffed_HELP_CONTENT5_TITLE = "coming soon"
	L.Duffed_HELP_CONTENT5_LINE1 = ""
	L.Duffed_HELP_CONTENT5_LINE2 = ""
	L.Duffed_HELP_CONTENT5_LINE3 = ""
	L.Duffed_HELP_CONTENT5_LINE4 = ""

	L.Duffed_HELP_CONTENT4_TITLE = "Actionbars"
	L.Duffed_HELP_CONTENT4_LINE1 = ""
	L.Duffed_HELP_CONTENT4_LINE2 = "In DuffedUI you have three different layouts for your actionbars. The layouts are:\n\n1x24 & 1x12 bottombars and 2x12 rightbars\nx12 bottombars, 2x6 splitbars, 2x12 rightbars\n3x12 bottombars, 2x12 rightbars"
	L.Duffed_HELP_CONTENT4_LINE3 = "For the layout with 2x12 bottombars you have to set the layout to 2 in the ingameConfig. The third layout can you activate if you set the option Enable lowres-layout on highres in the ingameConfig. Every layout has an button to hide one of the bottombars. Only the default layout has no one if the actionbarswap is active."
	L.Duffed_HELP_CONTENT4_LINE4 = "If you have suggestions or problems with the layouts please use the forum."

	L.Duffed_HELP_CONTENT3_TITLE = "Buttons"
	L.Duffed_HELP_CONTENT3_LINE1 = "Below the Minimap you have a row of several buttons which all have an own function."
	L.Duffed_HELP_CONTENT3_LINE2 = "R => Reload the UI\nH => Switch to heallayout (Raidframes)"
	L.Duffed_HELP_CONTENT3_LINE3 = "D => Switch to DPS-Layout (Raidframes)\nA => Addonmanager"
	L.Duffed_HELP_CONTENT3_LINE4 = "M => Move your frames\nC => Open the ingameConfig\nK => Set your keybindings"

	L.Duffed_HELP_CONTENT2_TITLE = "Specswitcher"
	L.Duffed_HELP_CONTENT2_LINE1 = "The Specswitcherplugin is located on the right chattabbackground. With this plugin you have the possibility so switch your spec and gearset with one click."
	L.Duffed_HELP_CONTENT2_LINE2 = ""
	L.Duffed_HELP_CONTENT2_LINE3 = "As an option, the plugin also provides to determine the primary equipset for each spec, as well as the automatic switch of armor to enable / disable."
	L.Duffed_HELP_CONTENT2_LINE4 = "It can be created and utilize up to ten equipsets."

	L.Duffed_HELP_CONTENT1_TITLE = "Slashcommands"
	L.Duffed_HELP_CONTENT1_LINE1 = "/dhelp => Open this panel\n/resetui => Reset the position of the entire UI\n/install => Reinstall the entire UI"
	L.Duffed_HELP_CONTENT1_LINE2 = "/moveui or /mtukui => Enable movers to place the UI-Elements\n/kb => Set keybindings via hoverbind\n/rl => Reloads the UI"
	L.Duffed_HELP_CONTENT1_LINE3 = "/heal => Switch to Heal-Layout\n/dps => Switch to DPS-Layout\n/tc => Open ingame-Config\n/ddbm apply => Apply the DBM-Skin"
	L.Duffed_HELP_CONTENT1_LINE4 = "/dbigwigs apply => Apply the BigWigs-Skin\n/am => Open Addonmanager\n/version => Shows the versionframe"

	if TukuiConfigUILocalization then
		TukuiConfigUILocalization.actionbarbutton2 = "Hide the button between datatextpanel (works only without actionbarswap)"
		TukuiConfigUILocalization.actionbarrightbarsmouseover = "Set rightbars on mouseover"
		TukuiConfigUILocalization.actionbarswap = "Swap Bar3 with Bar1"
		TukuiConfigUILocalization.actionbarpetbaralwaysvisible = "Set petbar to always visible"
		TukuiConfigUILocalization.actionbarshapeshiftborder = "Enable Shapeshiftbarborder"
		TukuiConfigUILocalization.actionbarshapeshiftmouseover = "Enable mouseover for Shapeshiftbar"
		TukuiConfigUILocalization.actionbarverticalshapeshift = " Enable vertical Shapeshiftbar"
		TukuiConfigUILocalization.actionbartukzhighlight = "Enable prochighlight from Tukui (default = disabled)"
		TukuiConfigUILocalization.actionbarlayout = "Set actionbarlayout (default = 1)"

		TukuiConfigUILocalization.addonskins = "Addonskins"
		TukuiConfigUILocalization.addonskinsenable = "Enable Addonskins"
		TukuiConfigUILocalization.addonskinsbigwigs = "Enable BigWigs-Skin"
		TukuiConfigUILocalization.addonskinsdbm = "Enable DBM-Skin"
		TukuiConfigUILocalization.addonskinsomen = "Enable Omen-Skin"
		TukuiConfigUILocalization.addonskinstinydps = "Enable TinyDPS-Skin"

		TukuiConfigUILocalization.aurasbuffnotice = "Enable BuffNotice"
		TukuiConfigUILocalization.auraswarning = "Enable warningsound for BuffNotice"
		TukuiConfigUILocalization.aurasbufftracker = "Enable Bufftrackerplugin"

		TukuiConfigUILocalization.classtimer = "Classtimer"
		TukuiConfigUILocalization.classtimerenable = "Enable Classtimer"
		TukuiConfigUILocalization.classtimerspark = "Enable spark"
		TukuiConfigUILocalization.classtimertargetdebuffs = "Enable targetdebuffs"
		TukuiConfigUILocalization.classtimerplayercolor = "Set player color"
		TukuiConfigUILocalization.classtimertargetbuffcolor = "Set target buff color"
		TukuiConfigUILocalization.classtimertargetdebuffcolor = "Set target debuff color"
		TukuiConfigUILocalization.classtimertrinketcolor = "Set trinket color"

		TukuiConfigUILocalization.duffed = "Duffed"
		TukuiConfigUILocalization.duffedbossicons = "Enable numbers instead of bossicons on instancemap"
		TukuiConfigUILocalization.duffeddrinkannouncement = "Enable Drinkannouncement"
		TukuiConfigUILocalization.duffedpriest_sos = "Enable Strength of Soul (Priest only)"
		TukuiConfigUILocalization.duffedsayinterrupt = "Enable Interruptannouncement"
		TukuiConfigUILocalization.duffedannouncechannel = "Set channel for announcement (|cffC41F3BSAY|r, |cffC41F3BPARTY|r or |cffC41F3BRAID|r)"
		TukuiConfigUILocalization.duffeddispelannouncement = "Enable Dispelannouncement"
		
		TukuiConfigUILocalization.chatfading = "Enable chatfading"
		TukuiConfigUILocalization.chattextright = "Set textalign to right for right chatframe"
		
		TukuiConfigUILocalization.generallowres = "Enable Lowreslayout on Highres"
		TukuiConfigUILocalization.generaloutlines = "Set outlines for textelements (correct values: THINOUTLINE, OUTLINE, MONOCHROMEOUTLINE)"

		TukuiConfigUILocalization.misc = "Misc"
		TukuiConfigUILocalization.misccombatanimation = "Enable Combatanimation"
		TukuiConfigUILocalization.miscflightpoint = "Enable Flightpointlist"
		TukuiConfigUILocalization.miscilvlcharacter = "Enable itemlevel on character screen"
		TukuiConfigUILocalization.miscsComboenable = "Enable sCombo-Plugin"
		TukuiConfigUILocalization.miscsComboenergybar = "Enable sCombo-Energybar"
		TukuiConfigUILocalization.miscsesenable = "Enable Specswitcherplugin"
		TukuiConfigUILocalization.miscsesenablegear = "Enable Equipmentsetbuttons"
		TukuiConfigUILocalization.miscsesgearswap = "Enable automatic setswap on respec"
		TukuiConfigUILocalization.miscsesset1 = "Set set for first spec (must be an value between 1 - 10)"
		TukuiConfigUILocalization.miscsesset2 = "Set set for second spec (must be an value between 1 - 10)"

		TukuiConfigUILocalization.nameplateenable = "Enable TukuiNameplates: |cffC41F3BDisable Tukui-Nameplates to use DuffedNameplates|r"
		TukuiConfigUILocalization.nameplateduffed = "Enable DuffedNameplates"
		TukuiConfigUILocalization.nameplatedebuffs = "Enable debuff display"
		TukuiConfigUILocalization.nameplateheight = "Set height of nameplates (default = 7)"
		TukuiConfigUILocalization.nameplatewidth = "Set width of nameplates (default = 110)"
		TukuiConfigUILocalization.nameplateshowcastbarname = "Show castbar name"
		TukuiConfigUILocalization.nameplatenameabbrev = "Show abbreviated names"
		TukuiConfigUILocalization.nameplateaurassize = "Set aura size (default = 20)"

		TukuiConfigUILocalization.rcd = "RaidCooldowns"
		TukuiConfigUILocalization.rcdenable = "Enable RaidCooldowns"
		TukuiConfigUILocalization.rcdraid = "Enable cooldown announcement for raid"
		TukuiConfigUILocalization.rcdparty = "Enable cooldown announcement for party"
		TukuiConfigUILocalization.rcdarena = "Enable cooldown announcement for arena"
		
		TukuiConfigUILocalization.spellcooldowns = "SpellCooldowns"
		TukuiConfigUILocalization.spellcooldownsenable = "Enable the SpellCooldown-Plugin"
		TukuiConfigUILocalization.spellcooldownssize = "Set size for icons (default = 36)"
		TukuiConfigUILocalization.spellcooldownsspacing = "Set spacing of icons (default = 10)"
		TukuiConfigUILocalization.spellcooldownsfade = "Set fading (values: 0 one color, 1 green to red, 2 red to green)"
		TukuiConfigUILocalization.spellcooldownsdisplay = "Set display of cooldown (values: SPIRAL or STATUSBAR, default = STATUSBAR)"
		TukuiConfigUILocalization.spellcooldownsdirection = "Set direction of cooldowndisplay (values: HORIZONTAL or VERTICAL, default = HORIZONTAL)"
		TukuiConfigUILocalization.spellcooldownsfsize = "Set fontsize"

		TukuiConfigUILocalization.tooltipids = "Show spell / item-id on tooltip"
		
		TukuiConfigUILocalization.unitframescastbarwidth = "Set width for castbar (default = 250)"
		TukuiConfigUILocalization.unitframescastbarheight = "Set height for castbar (default = 19)"
		TukuiConfigUILocalization.unitframesclassicons = "Enable class icons"
		TukuiConfigUILocalization.unitframescharportrait = "Enable charportraits"
		TukuiConfigUILocalization.unitframeslayout = "Set UF-Layout (1, 2 or 3, default = 2)"
		TukuiConfigUILocalization.unitframesepbar = "Enable EP-Bar"
		TukuiConfigUILocalization.unitframesshowplayerinparty = "Show player in party"
		TukuiConfigUILocalization.unitframeshealthbg = "Set health background color for player and target"
		TukuiConfigUILocalization.unitframesplayerwidth = "Set player width (only Layout 1)"
		TukuiConfigUILocalization.unitframeslafo = "Enable large focus frame (only Layout 1)"
		TukuiConfigUILocalization.unitframesportraitstyle = "Set portraitstyle (MODEL or ICON)"
		TukuiConfigUILocalization.unitframescolorgradient = "Enable ColorGradient for Healthbar"
		TukuiConfigUILocalization.unitframeshealth = "Set Healthcolor"
	end
end