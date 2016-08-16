local _, ns = ...;

local frame = ns.frame;
frame:RegisterEvent("UNIT_POWER");

function frame:CheckPower(trigger)
	if (not UnitExists(trigger.target)) then return false; end;

	local min = UnitPower(trigger.target, powerType);
	local max = UnitPowerMax(trigger.target, powerType);
	local percent = min / max * 100;

	if (trigger.powerValue) and (trigger.powerValue <= min) then
		return true;
	end;

	if (trigger.powerPercent) and (trigger.powerPercent <= percent) then
		return true;
	end;

	return false;
end;

frame:RegisterTrigger("POWER", frame.CheckPower);
