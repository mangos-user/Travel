-- Buttonstyle for DuffedUI --
local T, C, L, G = unpack(Tukui)
if not C["actionbar"].enable == true then return end

local ShowOverlayGlow = function(self)
    if self.overlay then
        if (self.overlay.animOut:IsPlaying()) then
            self.overlay.animOut:Stop()
            self.overlay.animIn:Play()
        end
    else
        self.overlay = ActionButton_GetOverlayGlow()
        local frameWidth, frameHeight = self:GetSize()
        self.overlay:SetParent(self)
        self.overlay:ClearAllPoints()
        self.overlay:SetSize(frameWidth * 1.4, frameHeight * 1.4)
        self.overlay:SetPoint("TOPLEFT", self, "TOPLEFT", -frameWidth * 0.2, frameHeight * 0.2)
        self.overlay:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", frameWidth * 0.2, -frameHeight * 0.2)
        self.overlay.animIn:Play()
    end
end
 
local HideOverlayGlow = function(self)
    if self.overlay then
        if self.overlay.animIn:IsPlaying() then
            self.overlay.animIn:Stop()
        end
        if self:IsVisible() then
            self.overlay.animOut:Play()
        else
            ActionButton_OverlayGlowAnimOutFinished(self.overlay.animOut)
        end
    end
end

T.ShowHighlightActionButton = function(self)
	-- hide ugly blizzard proc highlight
	if C["actionbar"].tukzhighlight then
		if self.overlay then
			self.overlay:Hide()
			ActionButton_HideOverlayGlow(self)
		end

		if not self.Animation then
			local NewProc = CreateFrame("Frame", nil, self)
			NewProc:SetBackdrop(ProcBackdrop)
			NewProc:SetBackdropBorderColor(1, 1, 0)
			NewProc:SetAllPoints(self)

			self.NewProc = NewProc

			local Animation = self.NewProc:CreateAnimationGroup()
			Animation:SetLooping("BOUNCE")

			local FadeOut = Animation:CreateAnimation("Alpha")
			FadeOut:SetChange(-1)
			FadeOut:SetDuration(0.40)
			FadeOut:SetSmoothing("IN_OUT")

			self.Animation = Animation
		end

		if not self.Animation:IsPlaying() then self.Animation:Play() self.NewProc:Show() end
	else
		if self.overlay then
			if self.NewProc then
				self.NewProc:Hide()
			end
			
			self.overlay:Show()
			ShowOverlayGlow(self)
		else
			HideOverlayGlow(self)
		end
	end
end

T.HideHighlightActionButton = function(self)
	if C["actionbar"].tukzhighlight then
		if self.Animation and self.Animation:IsPlaying() then self.Animation:Stop() self.NewProc:Hide() end
	else
		if self.Animation and self.Animation:IsPlaying() then
			self.Animation:Stop()
			self.NewProc:Hide()
		end
	end
end

hooksecurefunc("ActionButton_ShowOverlayGlow", T.ShowHighlightActionButton)
hooksecurefunc("ActionButton_HideOverlayGlow", T.HideHighlightActionButton)