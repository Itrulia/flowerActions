local _, ns = ...;
local frame = ns.frame;

local function GlowAction(button, spellId, passed)
	local name = button:GetName();
	local slot = button.action;
	local _, slotSpellId = GetActionInfo(slot);

	if (spellId == slotSpellId) then
		if passed then 
			ActionButton_ShowOverlayGlow(button)
		else
			ActionButton_HideOverlayGlow(button)
		end;
	end;
end;

function frame:SearchActions(action, passed)
	local spellId = action.spellId;
	local button;

	for i=1, 12 do
		button = _G["ActionButton"..i];
		GlowAction(button, spellId, passed);

		button = _G["MultiBarBottomLeftButton"..i];
		GlowAction(button, spellId, passed);

		button = _G["MultiBarBottomRightButton"..i];
		GlowAction(button, spellId, passed);

		button = _G["MultiBarRightButton"..i];
		GlowAction(button, spellId, passed);

		button = _G["MultiBarLeftButton"..i];
		GlowAction(button, spellId, passed);
	end
end;

frame:RegisterAction("GLOW", frame.GlowAction);