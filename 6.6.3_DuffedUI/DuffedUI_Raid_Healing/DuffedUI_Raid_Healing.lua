local T, C, L, G = unpack( Tukui )

T.RaidFrameAttributes = function()
	return
	"TukuiRaid",
	nil,
	"solo,raid,party",
	"oUF-initialConfigFunction", [[
		local header = self:GetParent()
		self:SetWidth( header:GetAttribute( "initial-width" ) )
		self:SetHeight( header:GetAttribute( "initial-height" ) )
	]],
	"initial-width", T.Scale(68 * T.raidscale),
	"initial-height", T.Scale(40 * T.raidscale),
	"showParty", true,
	"showRaid", true,
	"showPlayer", C["unitframes"].showplayerinparty,
	"xoffset", T.Scale(7),
	"yOffset", T.Scale(7),
	"point", "LEFT",
	"groupFilter", "1,2,3,4,5,6,7,8",
	"groupingOrder", "1,2,3,4,5,6,7,8",
	"groupBy", "GROUP",
	"maxColumns", 8,
	"unitsPerColumn", 5,
	"columnSpacing", T.Scale(7),
	"columnAnchorPoint", "BOTTOM"
end

T.PostUpdateRaidUnit = function( self )
	self.panel:Kill()
	self:SetBackdropColor(0, 0, 0, 0)

	-- health --
	self.Health:ClearAllPoints()
	self.Health:SetAllPoints( self )
	self.Health:SetStatusBarTexture(C["media"].normTex)
	self.Health:CreateBorder(false, true)
	self.Health:SetFrameStrata("LOW")

	self.Health.colorDisconnected = false
	self.Health.colorClass = false
	self.Health:SetStatusBarColor(.125, .125, .125, 1)
	self.Health.bg:SetTexture(.2, .2, .2)
	self.Health.bg:SetVertexColor(.05, .05, .05, .75)

	self.Health.value:Point("CENTER", self.Health, 0, 1)
	self.Health.value:SetFont(T.CreateFontString())
	self.Health.value:SetShadowOffset(0, 0)
	
	--Border for the health bar.
	local healthBG = CreateFrame("Frame", healthBG, self.Health)
	healthBG:SetTemplate("Default")
	healthBG:ClearAllPoints()
	healthBG:SetPoint("TOPLEFT", -2, 2)
	healthBG:SetPoint("BOTTOMRIGHT", 2, -2)
	healthBG:CreateBorder(true, true)
	healthBG:SetFrameStrata("Background")
	healthBG:CreateShadow("Default")
	healthBG:HideInsets()

	if C["unitframes"].unicolor == true then
		self.Health.colorDisconnected = false
		self.Health.colorClass = false
		self.Health:SetStatusBarColor(.125, .125, .125, 1 )
		self.Health.bg:SetVertexColor(unpack(C["unitframes"].healthbg))
		if C["unitframes"].colorgradient then
			G.UnitFrames.Player.Health.colorSmooth = true
			G.UnitFrames.Player.Health.bg:SetTexture(.2, .2, .2)
		end
	else
		self.Health.colorDisconnected = true
		self.Health.colorClass = true
		self.Health.colorReaction = true
	end

	-- power --
	self.Power:ClearAllPoints()
	self.Power:SetPoint("BOTTOM", self.Health, "BOTTOM", 0, 1)
	self.Power:SetHeight(1)
	self.Power:SetWidth(69)
	self.Power:SetFrameLevel(self.Health:GetFrameLevel() + 2)
	self.Power:SetFrameStrata("MEDIUM")
	self.Power:CreateBorder(false, true)
	
	-- name --
	self.Name:SetParent( self.Health )
	self.Name:ClearAllPoints()
	self.Name:SetPoint("CENTER", 0, 6)
	self.Name:SetShadowOffset(0, 0)
	self.Name:SetFont(T.CreateFontString())
	self.Name:SetAlpha(1)

	-- debuffs --
	if C["unitframes"].raidunitdebuffwatch == true then
		self.RaidDebuffs:Height(21 * C["unitframes"].gridscale)
		self.RaidDebuffs:Width( 21 * C["unitframes"].gridscale)
		self.RaidDebuffs:Point("CENTER", self.Health, 2, 1)

		self.RaidDebuffs.count:ClearAllPoints()
		self.RaidDebuffs.count:SetPoint("CENTER", self.Health, -6, 6)
		self.RaidDebuffs.count:SetFont(T.CreateFontString())

		self.RaidDebuffs.time:ClearAllPoints()
		self.RaidDebuffs.time:SetPoint("CENTER", self.Health, 2, 0)
		self.RaidDebuffs.time:SetFont(T.CreateFontString())
	end

	-- icons --
	local LFDRole = self.Health:CreateTexture(nil, "OVERLAY")
	LFDRole:Height(5)
	LFDRole:Width(5)
	LFDRole:Point("RIGHT", -3, 0)
	LFDRole:SetTexture("Interface\\AddOns\\Tukui\\medias\\textures\\lfdicons.blp")
	self.LFDRole = LFDRole

	local Resurrect = CreateFrame("Frame", nil, self.Health)
	Resurrect:SetFrameLevel(self.Health:GetFrameLevel() + 1)
	Resurrect:Size(20)
	Resurrect:SetPoint("CENTER")

	local ResurrectIcon = Resurrect:CreateTexture(nil, "OVERLAY")
	ResurrectIcon:SetAllPoints()
	ResurrectIcon:SetDrawLayer("OVERLAY", 7)
	self.ResurrectIcon = ResurrectIcon
	
	local ReadyCheck = self.Health:CreateTexture(nil, "OVERLAY")
	ReadyCheck:Size(12)
	ReadyCheck:SetPoint("CENTER", self.Health, 0, 2) 	
	self.ReadyCheck = ReadyCheck
	
	local MasterLooter = self.Health:CreateTexture(nil, "OVERLAY")
	MasterLooter:Height(12 * T.raidscale)
	MasterLooter:Width(12 * T.raidscale)
	self.MasterLooter = MasterLooter
	self:RegisterEvent("PARTY_LEADER_CHANGED", T.MLAnchorUpdate)
	self:RegisterEvent("PARTY_MEMBERS_CHANGED", T.MLAnchorUpdate)
	
	table.insert(self.__elements, T.UpdateThreat)
	self:RegisterEvent('PLAYER_TARGET_CHANGED', T.UpdateThreat)
	self:RegisterEvent('UNIT_THREAT_LIST_UPDATE', T.UpdateThreat)
	self:RegisterEvent('UNIT_THREAT_SITUATION_UPDATE', T.UpdateThreat)
end

local RaidPosition = CreateFrame( "Frame" )
RaidPosition:RegisterEvent( "PLAYER_LOGIN" )
RaidPosition:SetScript( "OnEvent", function( self, event )
	local raid = G.UnitFrames.RaidUnits
	if C["unitframes"].showraidpets == true then
		local pets = G.UnitFrames.RaidPets
		pets:ClearAllPoints()
	end
	
	raid:ClearAllPoints()
	if C["chat"].background then
		raid:SetPoint("BOTTOMLEFT", TukuiChatBackgroundLeft, "TOPLEFT", 2, 5)
	else
		raid:SetPoint("BOTTOMLEFT", ChatFrame1, "TOPLEFT", 2, 5)
	end
end )

local raid40 = CreateFrame("Frame")
raid40:RegisterEvent("PLAYER_ENTERING_WORLD")
raid40:RegisterEvent("ZONE_CHANGED_NEW_AREA")
raid40:SetScript("OnEvent", function(self)
	local inInstance, instanceType = IsInInstance()
	local _, _, _, _, maxPlayers, _, _ = GetInstanceInfo()

	if inInstance and instanceType == "raid" and maxPlayers > 25 then
		G.UnitFrames.RaidUnits:SetAttribute("initial-width", T.Scale(68 * T.raidscale))
		G.UnitFrames.RaidUnits:SetAttribute("initial-height", T.Scale(30 * T.raidscale))
	else
		G.UnitFrames.RaidUnits:SetAttribute("initial-width", T.Scale(68 * T.raidscale))
		G.UnitFrames.RaidUnits:SetAttribute("initial-height", T.Scale(40 * T.raidscale))
	end
end)