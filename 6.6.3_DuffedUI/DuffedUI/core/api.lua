-- API-Core for DuffedUI --

local T, C, L, G = unpack(Tukui)

-- function to create specific lines --
local function CreateLine(f, w, h)
	f:SetHeight(T.Scale)
	f:SetWidth(T.Scale)
	f:SetFrameLevel(2)
	f:SetFrameStrata("BACKGROUND")

	f:SetBackdrop({bgFile = C["media"].blank})
	f:SetBackdropColor(unpack(C["media"].bordercolor))
end

-- function to create borders --
local function CreateBorder(f, i, o)
	if i then
		if f.iborder then return end
		local border = CreateFrame("Frame", f:GetName() and f:GetName() .. "InnerBorder" or nil, f)
		border:Point("TOPLEFT", T.mult, -T.mult)
		border:Point("BOTTOMRIGHT", -T.mult, T.mult)
		border:SetBackdrop({
			edgeFile = C["media"].blank, 
			edgeSize = T.mult, 
			insets = { left = T.mult, right = T.mult, top = T.mult, bottom = T.mult }
		})
		border:SetBackdropBorderColor(0,0,0)
		f.iborder = border
	end
	
	if o then
		if f.oborder then return end
		local border = CreateFrame("Frame", f:GetName() and f:GetName() .. "OuterBorder" or nil, f)
		border:Point("TOPLEFT", -T.mult, T.mult)
		border:Point("BOTTOMRIGHT", T.mult, -T.mult)
		border:SetFrameLevel(f:GetFrameLevel() + 1)
		border:SetBackdrop({
			edgeFile = C["media"].blank, 
			edgeSize = T.mult, 
			insets = { left = T.mult, right = T.mult, top = T.mult, bottom = T.mult }
		})
		border:SetBackdropBorderColor(0,0,0)
		f.oborder = border
	end
end

-- function for overlay --
local function CreateOverlay(frame)
	if frame.overlay then return end

	local overlay = frame:CreateTexture(frame:GetName() and frame:GetName() .. "Overlay" or nil, "BORDER", frame)
	overlay:ClearAllPoints()
	overlay:Point("TOPLEFT", 2, -2)
	overlay:Point("BOTTOMRIGHT", -2, 2)
	overlay:SetTexture(C["media"].normTex)
	overlay:SetVertexColor(0.05, 0.05, 0.05)
	frame.overlay = overlay
end

-- API-Function --
local function addapi(object)
	local mt = getmetatable(object).__index

	if not object.CreateLine then mt.CreateLine = CreateLine end
	if not object.CreateBorder then mt.CreateBorder = CreateBorder end
	if not object.CreateOverlay then mt.CreateOverlay = CreateOverlay end
end

local handled = {["Frame"] = true}
local object = CreateFrame("Frame")
addapi(object)
addapi(object:CreateTexture())
addapi(object:CreateFontString())

object = EnumerateFrames()
while object do
	if not handled[object:GetObjectType()] then
		addapi( object )
		handled[object:GetObjectType()] = true
	end

	object = EnumerateFrames(object)
end