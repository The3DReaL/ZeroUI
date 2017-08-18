if not ModCore then
	log("[ERROR][ZeroUI] BeardLib is not installed!")
	return
end

ZeroUI = ZeroUI or ModCore:new(ModPath .. "Config.xml", false, true)
function ZeroUI:init()
	self:init_modules()
	self.set_position_clbks = {}
	self.Updaters = {}
	self:UpdateSettings()
	self:log("Done Loading")
	self.InitDone = true
end

function ZeroUI:AddUpdateFunc(func)
    table.insert(self.Updaters, func)
end

function ZeroUI:UpdateSettings()
	for _, func in pairs(self.Updaters) do
		func()
	end
end

function ZeroUI:AddSetPositionClbk(clbk)
	table.insert(self.set_position_clbks, clbk)
end

if not ZeroUI.InitDone then 
	ZeroUI:init() 
end

if Hooks then
	Hooks:Add("MenuManager_Base_PopulateModOptionsMenu", "ZeroUIBuildOptionsMenu", function(self)
	end)
end