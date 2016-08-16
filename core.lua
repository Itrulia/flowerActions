local _, ns = ...;
local config = ns.config;
local _, playerClass = UnitClass("player");

local frame = CreateFrame("frame", nil, UIParent);
frame.triggers = {};
frame.actions = {};
frame:RegisterEvent("PLAYER_TARGET_CHANGED");

local function OnEvent(self, event, ...)
	for _, value in ipairs(config) do
		if (playerClass == value.class) then
			self:CheckTriggers(value, event, ...);
		end;
	end;
end;

function frame:CheckTriggers(configObj, event, ...)
	local passed = false;

	for _, value in ipairs(configObj.triggers) do
		if (self.triggers[value.type]) then
			passed = self.triggers[value.type](self, value);
		end;
		
		if (passed) then break; end;
	end;

	for _, action in ipairs(configObj.actions) do
		if (self.actions[action.type]) then
			passed = self.actions[action.type](self, action, passed);
		end;
	end;
end;

function frame:RegisterTrigger(name, method)
	self.triggers[name] = method;
end;

function frame:RegisterAction(name, method)
	self.actions[name] = method;
end;

frame:SetScript("OnEvent", OnEvent);

ns.frame = frame;


