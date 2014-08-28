local C = {}
local class = RAID_CLASS_COLORS[select(2,UnitClass("player"))]

C["actionbar"] = {
	["button2"] = false,
	["petbaralwaysvisible"] = false,
	["rightbarsmouseover"] = false,
	["shapeshiftborder"] = true,
	["shapeshiftmouseover"] = false,
	["swap"] = true,
	["verticalshapeshift"] = true,
	["tukzhighlight"] = false,
	["layout"] = 1,
}

C["addonskins"] = {
	["enable"] = true,
	["bigwigs"] = true,
	["dbm"] = true,
	["omen"] = true,
	["tinydps"] = true,
	["skada"] = true,
}

C["auras"] = {
	["buffnotice"] = true,
	["classictimer"] = false,
	["bufftracker"] = true,
	["warning"] = true,
}

C["chat"] = {
	["background"] = true,
	["fading"] = true,
	["textright"] = true,
}

C["classtimer"] = {
	["enable"] = true,
	["spark"] = false,
	["targetdebuffs"] = false,
	["playercolor"] = {.2, .2, .2, 1 },
	["targetbuffcolor"] = { 70/255, 150/255, 70/255, 1 },
	["targetdebuffcolor"] = { 150/255, 30/255, 30/255, 1 },
	["trinketcolor"] = {75/255, 75/255, 75/255, 1 },
}

C["duffed"] = {
	["bossicons"] = true,
	["drinkannouncement"] = false,
	["priest_sos"] = false,
	["sayinterrupt"] = true,
	["announcechannel"] = "PARTY",
	["dispelannouncement"] = false,
}

C["general"] = {
	["backdropcolor"] = { .05, .05, .05 },
	["bordercolor"] = { .15, .15, .15 },
	["lowres"] = false,
	["outlines"] = "THINOUTLINE",
}

C["media"] = {
	["datatextcolor1"] = {class.r, class.g, class.b},
	--["datatextcolor1"] = {.4, .4, .4},
	["datatextcolor2"] = {1, 1, 1},
	["duffed"] = [[Interface\Addons\DuffedUI\media\textures\duffed.tga]],
	["warning"] = [[Interface\AddOns\DuffedUI\media\sounds\warning.mp3]],
	["dwts_border"] = [[Interface\AddOns\DuffedUI\media\textures\barborder.tga]],
}

C["misc"] = {
	["combatanimation"] = true,
	["flightpoint"] = true,
	["ilvlcharacter"] = true,
	["sComboenable"] = true,
	["sComboenergybar"] = true,
	["sesenable"] = true,
	["sesenablegear"] = true,
	["sesgearswap"] = true,
	["sesset1"] = 1,
	["sesset2"] = 2,
}

C["nameplate"] = {
	["enable"] = false,
	["debuffs"] = true,
	["duffed"] = true,
	["height"] = 7,
	["width"] = 110,
	["combat"] = false,
	["showhealth"] = false,
	["showcastbarname"] = false,
	["nameabbrev"] = false,
	["aurassize"] = 20,
}
	
C["rcd"] = {
	["enable"] = true,
	["raid"] = true,
	["party"] = false,
	["arena"] = false,
}

C["spellcooldowns"] = {
	["enable"] = true,
	["size"] = 36,
	["spacing"] = 10,
	["fade"] = 0,
	["display"] = "STATUSBAR",
	["direction"] = "HORIZONTAL",
	["fsize"] = 12,
}

C["tooltip"] = {
	["ids"] = true,
}

C["unitframes"] = {
	["castbarwidth"] = 250,
	["castbarheight"] = 19,
	["cblatency"] = true,
	["charportrait"] = true,
	["portraitstyle"] = "MODEL",
	["lafo"] = false,
	["layout"] = 2,
	["epbar"] = true,
	["gridhealthvertical"] = false,
	["healthbg"] = { .05, .05, .05 },
	["health"] = { .125, .125, .125},
	["playerwidth"] = 212,
	["showraidpets"] = false,
	["showplayerinparty"] = true,
	["showstatuebar"] = false,
	["unicolor"] = true,
	["colorgradient"] = false,
}

TukuiEditedDefaultConfig = C