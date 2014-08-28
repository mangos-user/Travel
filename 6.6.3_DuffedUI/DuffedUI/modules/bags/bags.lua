-- Bagscript for DuffedUI --

local T, C, L, G = unpack(Tukui)

if C["bags"].enable ~= true then return end

local bags_BACKPACK = { 0, 1, 2, 3, 4 }
local bags_BANK = { -1, 5, 6, 7, 8, 9, 10, 11 }
local ST_NORMAL = 1
local ST_FISHBAG = 2
local ST_SPECIAL = 3
local bag_bars = 0

local function Stuffing_Sort(args)
	if not args then
		args = ""
	end

	Stuffing.itmax = 0
	Stuffing:SetBagsForSorting(args)
	Stuffing:SortBags()
end

local function BagsUpdateBagsPosition(self)
	TukuiBags:ClearAllPoints()
	
	if C["chat"].background ~= true then
		TukuiBags:SetPoint("BOTTOMLEFT", ChatFrame4, "TOPLEFT", -3, 25)
	else
		TukuiBags:SetPoint("BOTTOMRIGHT", G.Panels.RightChatBackground, "TOPRIGHT", 0, 3)
	end
end
TukuiBags:HookScript("OnUpdate", BagsUpdateBagsPosition)

local function BagsUpdateBankPosition(self, value)
	local bag = _G["Tukui" .. value]
	if value == "Bank" then
		bag:ClearAllPoints()
		if C["chat"].background ~= true then
			bag:SetPoint("BOTTOMLEFT", ChatFrame1, "TOPLEFT", 3, 25)
		else
			bag:SetPoint("BOTTOMLEFT", G.Panels.LeftChatBackground, "TOPLEFT", 0, 3)
		end
	end
	
	local cnt, full = GetNumBankSlots()

	purchaseBagButton = CreateFrame("Button", nil, bag)
	purchaseBagButton:Size(150, 15)
	purchaseBagButton:Point("TOP", bag, "TOP", 0, -4)
	purchaseBagButton:SetTemplate("Default")
	purchaseBagButton.Text = T.SetFontString(purchaseBagButton, T.CreateFontString())
	purchaseBagButton.Text:Point("CENTER", purchaseBagButton, "CENTER", 0, 0)

	if full then
		purchaseBagButton.Text:SetText("No Slots available")
	else
		purchaseBagButton.Text:SetText("Buy Bankslot ("..GetBankSlotCost() / 10000 .."Gold)")
	end

	purchaseBagButton:SetScript("OnEnter", T.SetModifiedBackdrop)
	purchaseBagButton:SetScript("OnLeave", T.SetOriginalBackdrop)
	purchaseBagButton:SetScript("OnClick", function()
		local cnt, full = GetNumBankSlots()

		if full then
			print("No Slots")
			return
		end

		PurchaseSlot()
		print(string.format(L.bags_costs, GetBankSlotCost() / 10000))
	end)
end
hooksecurefunc(Stuffing, "CreateBagFrame", BagsUpdateBankPosition)

local function BagsLayout(self, lb)
	local slots = 0
	local rows = 0
	local off = 26
	local cols
	local f
	local bs

	if lb then
		cols = 10
		f = self.bankFrame
	else
		bs = bags_BACKPACK
		cols = 10
		f = self.frame

		f.detail:ClearAllPoints()
		f.detail:Point("TOPLEFT", f, 12, -10)
		f.detail:Point("RIGHT", -(16 + 24), 0)
	end

	f:SetClampedToScreen(1)
	f:SetTemplate("Transparent")


	-- bag frame stuff
	local fb = f.bags_frame
	if bag_bars == 1 then
		fb:SetTemplate("Transparent")

		local bsize = 30
		if lb then bsize = 37 end

		fb:Height(bsize + 16)
		fb:Width(f:GetWidth())
		fb:Show()
	else
		fb:Hide()
	end
end
hooksecurefunc(Stuffing, "Layout", BagsLayout)

function Stuffing.Menu(self, level)
	if not level then
		return
	end

	local info = self.info

	wipe(info)

	if level ~= 1 then
		return
	end

	wipe(info)
	info.text = L.bags_sortmenu
	info.notCheckable = 1
	info.func = function()
		Stuffing_Sort("d")
	end
	UIDropDownMenu_AddButton(info, level)

	wipe(info)
	info.text = L.bags_stackmenu
	info.notCheckable = 1
	info.func = function()
		Stuffing:SetBagsForSorting("d")
		Stuffing:Restack()
	end
	UIDropDownMenu_AddButton(info, level)

	wipe(info)
	info.text = L.bags_showbags
	info.checked = function()
		return bag_bars == 1
	end

	info.func = function()
		if bag_bars == 1 then
			bag_bars = 0
		else
			bag_bars = 1
		end
		Stuffing:Layout()
		if Stuffing.bankFrame and Stuffing.bankFrame:IsShown() then
			Stuffing:Layout(true)
		end
	end
	UIDropDownMenu_AddButton(info, level)

	wipe(info)
	info.disabled = nil
	info.notCheckable = 1
	info.text = CLOSE
	info.func = self.HideMenu
	info.tooltipTitle = CLOSE
	UIDropDownMenu_AddButton(info, level)
end