-- Killscript for DuffedUI --

local T, C, L, G = unpack(Tukui)

local killAll = {
	G.Panels.BottomPanelOverActionBars,
	TukuiLineToABLeft,
	TukuiLineToABRight,
	G.ActionBars.Bar2.ShowHideButton,
	G.ActionBars.Bar3.ShowHideButton,
	G.ActionBars.Bar4.ShowHideButton,
	G.ActionBars.Bar5.ShowHideButtonTop,
	G.ActionBars.Bar5.ShowHideButtonBottom,
	G.Install.Version,
	TukuiInfoRightLineVertical,
	TukuiInfoLeftLineVertical,
	TukuiCubeRight,
	TukuiCubeLeft,
}
	
for _, Panels in pairs(killAll) do
	Panels:Kill()
end

G.ActionBars.Bar3:ClearAllPoints()
G.ActionBars.Bar3:SetParent(TukuiUIHider)

G.ActionBars.Bar4:ClearAllPoints()
G.ActionBars.Bar4:SetParent(TukuiUIHider)

G.ActionBars.Bar6:ClearAllPoints()
G.ActionBars.Bar6:SetParent(TukuiUIHider)

G.ActionBars.Bar7:ClearAllPoints()
G.ActionBars.Bar7:SetParent(TukuiUIHider)