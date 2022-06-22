local combatLogParseFrame = CreateFrame("Frame")
combatLogParseFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
combatLogParseFrame:SetScript("OnEvent", function(self, event)
    self:EventParser(CombatLogGetCurrentEventInfo())
end)
 
 
 
 
 function combatLogParseFrame:EventParser(...)
    local timestamp, subevent, _, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags,
        destRaidFlags = ...
    if subevent == "SPELL_HEAL" then
        local spellId, spellName, spellSchool, amount, overheal, school, resisted, blocked, absorbed, critical = select(
            12, ...)

        if (spellId == 48153) then
            print('Guardian Spirit procced for ' .. amount .. ' on ' .. destName)
            PlaySoundFile("Interface\\AddOns\\myaddon\\mercy.ogg", 'master')
        end
    end
end