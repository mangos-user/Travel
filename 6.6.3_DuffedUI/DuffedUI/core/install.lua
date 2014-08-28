local T, C, L, G = unpack(Tukui)

local function DuffedUICVarSetup()
	SetCVar("Maxfps", 999)
	SetCVar("autoDismountFlying", 0)
	SetCVar("guildMemberNotify", 1)
	SetCVar("cameraDistanceMax", 50)
	SetCVar("cameraDistanceMaxFactor", 3.4)
	SetCVar("profanityFilter", 0)
	SetCVar("taintLog", 1)
	SetAutoDeclineGuildInvites(0)
	SetCVar("showTutorials", 0)
	SetCVar("autoLootDefault", 1)
	SetCVar("gameTip", "0")
	SetCVar("ConversationMode", "inline")
	SetCVar("WhisperMode", "inline")
	SetCVar("BnWhisperMode", "inline")
	SetCVar("autoDismountFlying", 1)

	ShowAccountAchievements(1)
end

local d = CreateFrame("Button", "DuffedVersionFrame", UIParent)
d:SetSize(300, 66)
d:SetPoint("CENTER")
d:SetTemplate("Transparent")
d:CreateShadow("Default")
d:FontString("text", C["media"].font, 12)
d.text:SetPoint("TOP", 0, -5)
d.text:SetText("|cffC41F3BDuffedUI|r ".. T.GetDuffedVersion)
d:FontString("text2", C["media"].font, 12)
d.text2:SetPoint("CENTER", 0, 0)
d.text2:SetText("Edited by Merith @ Zirkel des Cenarius - EU")
d:FontString("text3", C["media"].font, 12)
d.text3:SetPoint("BOTTOM", 0, 6)
d.text3:SetText("Tukui ".. T.version .." by |cffff0000tukz@tukui.org|r, website at |cffff0000www.tukui.org|r")
d:SetScript("OnClick", function()
	v:Hide()
end)
d:Hide()

local dicon = CreateFrame("Frame", "DuffedVersion", d)
dicon:Size(66, 66)
dicon:Point("RIGHT", d, "LEFT", -2, 0)
dicon:SetFrameStrata("HIGH")
dicon:SetTemplate("Transparent")
dicon:CreateBorder(false, true)
dicon:CreateShadow("Default")

dicon.bg = dicon:CreateTexture(nil, "ARTWORK")
dicon.bg:Point("TOPLEFT", 2, -2)
dicon.bg:Point("BOTTOMRIGHT", -2, 2)
dicon.bg:SetTexture(C["media"].duffed)

G.Install.Frame:SetTemplate("Transparent")

local DuffedInstallFrameIconLeft = CreateFrame("Frame", "DuffedInstallFrameIconLeft", G.Install.Frame)
DuffedInstallFrameIconLeft:Size(58, 58)
DuffedInstallFrameIconLeft:Point("BOTTOMLEFT", G.Install.Frame, "TOPLEFT", 0, 3)
DuffedInstallFrameIconLeft:SetFrameStrata("HIGH")
DuffedInstallFrameIconLeft:CreateShadow("Default")
DuffedInstallFrameIconLeft:SetTemplate("Transparent")

DuffedInstallFrameIconLeft.Texture = DuffedInstallFrameIconLeft:CreateTexture(nil, "ARTWORK")
DuffedInstallFrameIconLeft.Texture:Point("TOPLEFT", 2, -2)
DuffedInstallFrameIconLeft.Texture:Point("BOTTOMRIGHT", -2, 2)
DuffedInstallFrameIconLeft.Texture:SetTexture(C["media"].duffed)

local DuffedInstallFrameIconRight = CreateFrame("Frame", "DuffedInstallFrameIconRight", G.Install.Frame)
DuffedInstallFrameIconRight:Size(58, 58)
DuffedInstallFrameIconRight:Point("BOTTOMRIGHT", G.Install.Frame, "TOPRIGHT", 0, 3)
DuffedInstallFrameIconRight:SetFrameStrata("HIGH")
DuffedInstallFrameIconRight:CreateShadow("Default")
DuffedInstallFrameIconRight:SetTemplate("Transparent")

DuffedInstallFrameIconRight.Texture = DuffedInstallFrameIconRight:CreateTexture(nil, "ARTWORK")
DuffedInstallFrameIconRight.Texture:Point("TOPLEFT", 2, -2)
DuffedInstallFrameIconRight.Texture:Point("BOTTOMRIGHT", -2, 2)
DuffedInstallFrameIconRight.Texture:SetTexture(C["media"].duffed)

local DuffedInstallFrameTitle = CreateFrame("Frame", "DuffedInstallFrameTitle", G.Install.Frame)
DuffedInstallFrameTitle:Size(G.Install.Frame:GetWidth() - 122, 30)
DuffedInstallFrameTitle:Point("BOTTOM", G.Install.Frame, "TOP", 0, 3)
DuffedInstallFrameTitle:SetFrameStrata("HIGH")
DuffedInstallFrameTitle:CreateShadow("Default")
DuffedInstallFrameTitle:SetTemplate("Transparent")

local DuffedInstallFrameTitleText = DuffedInstallFrameTitle:CreateFontString(nil, "OVERLAY")
DuffedInstallFrameTitleText:SetFont(T.CreateFontString())
DuffedInstallFrameTitleText:SetPoint("CENTER", DuffedInstallFrameTitle, 0, 0)
DuffedInstallFrameTitleText:SetText("|cffC41F3BDuffedUI|r" .. " " .. T.GetDuffedVersion)

local DuffedOnLogon = CreateFrame("Frame")
DuffedOnLogon:RegisterEvent("PLAYER_ENTERING_WORLD")
DuffedOnLogon:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	
	DuffedUICVarSetup()
	
	if GetCVar("taintLog") == "1" then
		SetCVar("taintLog", 0)
	end
	
	if C["chat"].background ~= true then
		T.ShowPopup("DUFFEDUI_ENABLE_CHAT_BACKGROUND")
	end
	
	if IsAddOnLoaded("DuffedUI_Raid") and IsAddOnLoaded("DuffedUI_Raid_Healing") then
		T.ShowPopup("DUFFEDUIDISABLE_RAID")
	end
	
	print(L.Duffed_GLOBAL_WELCOME1)
	print(L.Duffed_GLOBAL_WELCOME2)
end)

SLASH_VERSION1 = "/version"
SlashCmdList.VERSION = function() if d:IsShown() then d:Hide() else d:Show() end end