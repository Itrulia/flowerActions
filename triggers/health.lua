local _, ns = ...;

local frame = ns.frame;
frame:RegisterEvent("UNIT_HEALTH");

function frame:CheckHealth(trigger)
	if (not UnitExists(trigger.target)) then return false; end;

	local min = UnitHealth(trigger.target, powerType);
	local max = UnitHealthMax(trigger.target, powerType);
	local percent = min / max * 100;

	if (trigger.healthValue) and (trigger.healthValue <= min) then
		return true;
	end;

	if (trigger.healthPercent) and (trigger.healthPercent <= percent) then
		return true;
	end;

	return false;
end;

frame:RegisterTrigger("HEALTH", frame.CheckHealth);