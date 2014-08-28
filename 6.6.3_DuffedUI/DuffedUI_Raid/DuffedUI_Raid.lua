local T, C, L, G = unpack(Tukui)

T.RaidFrameAttributes = function()
	return
	"TukuiRaid",
	nil,
	"custom [petbattle] hide;show",
	"oUF-initialConfigFunction",  [[
		local header = self:GetParent()
		self:SetWidth(header:GetAttribute("initial-width"))
		self:SetHeight( header:GetAttribute("initial-height"))
	]],
	"initial-width", T.Scale(120*T.raidscale),
	"initial-height", T.Scale(13*T.raidscale),
	"initial-anchor", "BOTTOM",
	"showParty", true,
	"showRaid", true,
	"showPlayer", C["unitframes"].showplayerinparty,
	"yOffset", T.Scale(8),
	"point", "BOTTOM",
	"groupFilter", "1,2,3,4,5,6,7,8",
	"groupingOrder", "1,2,3,4,5,6,7,8",
	"groupBy", "GROUP"
end
	
T.PostUpdateRaidUnit = function(self)
	self.panel:Kill()
	self:SetBackdropColor( 0.0, 0.0, 0.0, 0.0 )
	
	-- health
	self.Health:Height(10)
	self.Health:ClearAllPoints()
	self.Health:SetAllPoints(self)
	self.Health:CreateBackdrop("Default")
	self.Health:SetFrameLevel(1)
	self.Health.value:Point("CENTER", self.Health, 0, 1)
	self.Health.value:SetFont(C["media"].font, 10, "THINOUTLINE")
	self.Health.PostUpdate = T.PostUpdateHealthRaid
	self.Health.bg:SetVertexColor(0.6, 0.6, 0.6)
	if C["unitframes"].unicolor == true then
		self.Health:SetStatusBarColor(0.125, 0.125, 0.125)
		self.Health.bg:SetTexture(0.6, 0.6, 0.6)
		self.Health.bg:SetVertexColor(unpack(C["unitframes"].healthbg))
		if C["unitframes"].colorgradient then
			G.UnitFrames.Player.Health.colorSmooth = true
			G.UnitFrames.Player.Health.bg:SetTexture(.2, .2, .2)
		end
	end
	
	self.Power:Height(2)
	self.Power:Point("TOPLEFT", self.Health, "BOTTOMLEFT", 0, 2)
	self.Power:Point("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, 2)
	self.Power:SetStatusBarTexture(C["media"].normTex)
	
	self.Power.frequentUpdates = true
	self.Power.colorDisconnected = true
	
	-- name --
	self.Name:SetParent(self.Health)
	self.Name:ClearAllPoints()
	self.Name:Point("LEFT", self, "RIGHT", 5, 0)
	self.Name:SetShadowOffset(0, 0)
	self.Name:SetFont(T.CreateFontString())
	
	-- kill raiddebuffs --
	self.RaidDebuffs:Kill()

	-- icons --
	local LFDRole = self.Health:CreateTexture(nil, "OVERLAY")
	LFDRole:Height(5)
	LFDRole:Width(5)
	LFDRole:Point("RIGHT", -3, 0)
	LFDRole:SetTexture("Interface\\AddOns\\Tukui\\medias\\textures\\lfdicons.blp")
	self.LFDRole = LFDRole
	
	local leader = self.Health:CreateTexture(nil, "OVERLAY")
	leader:Height(12 * T.raidscale)
	leader:Width(12 * T.raidscale)
	leader:SetPoint("TOPLEFT", 0, 6)
	self.Leader = leader

	local MasterLooter = self.Health:CreateTexture(nil, "OVERLAY")
	MasterLooter:Height(12 * T.raidscale)
	MasterLooter:Width(12 * T.raidscale)
	self.MasterLooter = MasterLooter
	self:RegisterEvent("PARTY_LEADER_CHANGED", T.MLAnchorUpdate)
	self:RegisterEvent("PARTY_MEMBERS_CHANGED", T.MLAnchorUpdate)

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
	
	table.insert(self.__elements, T.UpdateThreat)
	self:RegisterEvent('PLAYER_TARGET_CHANGED', T.UpdateThreat)
	self:RegisterEvent('UNIT_THREAT_LIST_UPDATE', T.UpdateThreat)
	self:RegisterEvent('UNIT_THREAT_SITUATION_UPDATE', T.UpdateThreat)
end

local RaidPosition = CreateFrame("Frame")
RaidPosition:RegisterEvent("PLAYER_LOGIN")
RaidPosition:SetScript("OnEvent", function( self, event)
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
end)

--[[local raid40 = CreateFrame("Frame")
raid40:RegisterEvent("PLAYER_ENTERING_WORLD")
raid40:RegisterEvent("ZONE_CHANGED_NEW_AREA")
raid40:SetScript("OnEvent", function(self)
	local inInstance, instanceType = IsInInstance()
	local _, _, _, _, maxPlayers, _, _ = GetInstanceInfo()

	if inInstance and instanceType == "raid" and maxPlayers > 25 then
		G.UnitFrames.RaidUnits:SetAttribute("initial-width", T.Scale(110*T.raidscale))
		G.UnitFrames.RaidUnits:SetAttribute("initial-height", T.Scale(10*T.raidscale))
	else
		G.UnitFrames.RaidUnits:SetAttribute("initial-width", T.Scale(140*T.raidscale))
		G.UnitFrames.RaidUnits:SetAttribute("initial-height", T.Scale(19*T.raidscale))
	end
end)]]--