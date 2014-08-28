-- Chatframes for DuffedUI --

local T, C, L, G = unpack(Tukui)
if C["chat"].enable ~= true then return end

-- chattabstyle --
local function SetChatStyle(frame)
	local id = frame:GetID()
	local chat = frame:GetName()
	local tab = _G[chat.."Tab"]
	
	_G[chat]:SetFading(C["chat"].fading)
	
	_G[chat]:SetMinResize(371, 111)
	_G[chat]:SetMinResize(T.InfoLeftRightWidth + 1, 111)
end

local function SetTabStyle(frame)
	local id = frame:GetID()
	local chat = frame:GetName()
	local tab = _G[chat .. "Tab"]

	_G[chat .. "TabText"]:Show()
	_G[chat .. "TabText"].Hide = function() end

	_G[chat .. "TabText"]:SetTextColor(unpack(C["media"].datatextcolor1))
	_G[chat .. "TabText"].SetTextColor = T.dummy
end

local function SetupChatStyle(self)
	for i = 1, NUM_CHAT_WINDOWS do
	local frame = _G[format("ChatFrame%s", i)]
		SetChatStyle(frame)
		SetTabStyle(frame)
	end
end

TukuiChat:HookScript("OnEvent", function(self, event, ...)
	for i = 1, NUM_CHAT_WINDOWS do
		local chat = _G[format("ChatFrame%s", i)]
		SetupChatStyle(chat)
	end
end)

local bnta = CreateFrame("Frame", "BNTanchor", UIParent)
bnta:SetSize(BNToastFrame:GetWidth(), 15)
if C["chat"].background and G.Panels.LeftChatBackground then
	bnta:Point("BOTTOMLEFT", G.Panels.LeftChatBackground, "TOPLEFT", 0, 6)
else
	bnta:Point("BOTTOMLEFT", ChatFrame1, "TOPLEFT", 0, 6)
end
bnta:SetTemplate("Default")
bnta:SetClampedToScreen(true)
bnta:SetMovable(true)
bnta:SetBackdropBorderColor(1,0,0)
bnta.text = T.SetFontString(bnta, C["media"].font, 12)
bnta.text:SetPoint("CENTER")
bnta.text:SetText("Move BNToastframe")
bnta:SetFrameLevel(10)
bnta:Hide()
tinsert(T.AllowFrameMoving, bnta)

BNToastFrame:HookScript("OnShow", function(self)
	self:ClearAllPoints()
	self:Point("BOTTOMLEFT", bnta, "BOTTOMLEFT", 0, 0)
end)

-- chatposition --
T.SetDefaultChatPosition = function(frame)
	if frame then
		local id = frame:GetID()
		local name = FCF_GetChatWindowInfo(id)
		local fontSize = select(2, frame:GetFont())

		-- well... tukui font under fontsize 12 is unreadable. Just a small protection!
		if fontSize < 12 then		
			FCF_SetChatWindowFontSize(nil, frame, 12)
		else
			FCF_SetChatWindowFontSize(nil, frame, fontSize)
		end
		
		if id == 1 then
			frame:ClearAllPoints()
			frame:Point("BOTTOMLEFT", G.Panels.LeftChatBackground, "BOTTOMLEFT", 0, 7)
		elseif id == 4 and name == LOOT then
			if not frame.isDocked then
				frame:ClearAllPoints()
				frame:Point("BOTTOMRIGHT", G.Panels.RightChatBackground, "BOTTOMRIGHT", 0, 7)
				if C["chat"].textright then
					frame:SetJustifyH("RIGHT")
				else
					frame:SetJustifyH("LEFT")
				end
			end
		end
		
		-- lock them if unlocked
		if not frame.isLocked then FCF_SetLocked(frame, 1) end
	end
end
hooksecurefunc("FCF_RestorePositionAndDimensions", T.SetDefaultChatPosition)