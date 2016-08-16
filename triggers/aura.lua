local _, ns = ...;

local frame = ns.frame;
frame:RegisterEvent("UNIT_AURA");

function frame:CheckAura(trigger)
	if (not UnitExists(trigger.target)) then return false; end;

	local active = false;

	for i = 1, 40 do
		local _, _, _, count, _, _, expirationTime, unitCaster, _, _, spellId = UnitAura(trigger.target, i, trigger.filter);

		if (spellId == trigger.spellId) then
			active = true;

			--[[ @TODO: Comment ]]
			if (trigger.minCount) or (trigger.maxCount) then
				if (trigger.minCount >= count) or (trigger.maxCount <= count) then 
					return true; 
				end;
				
				return false;
			--[[ @TODO: Comment ]]
			elseif trigger.expiration then
				local expiration = expirationTime - GetTime();

				if trigger.expiration >= expiration then
					return true;
				end;
			elseif (trigger.active) then 
				return true; 
			end;
		end;
	end;

	--[[ If aura is not active ]]
	if (not trigger.active) and (not active) then
		return true;
	end;

	return false;
end;

frame:RegisterTrigger("AURA", frame.CheckAura);