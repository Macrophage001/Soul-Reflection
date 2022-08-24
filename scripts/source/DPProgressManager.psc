Scriptname DPProgressManager extends Quest
{Handles the Dragonborn Perk Level Up}

GlobalVariable Property DragonbornSkillUpRatio Auto
GlobalVariable Property DragonbornSkillPerkPoint Auto
GlobalVariable Property DragonbornShowLevelUp Auto

GlobalVariable Property DPCurrentSoulXP Auto
GlobalVariable Property DPMaxSoulXP Auto

GlobalVariable Property DPMaxSoulXPMultiplier Auto

Event OnInit()
    self.RegisterForSingleUpdate(1);
EndEvent

Function UpdateCurrentSoulXP()
    float overflow = DPCurrentSoulXP.GetValue() - DPMaxSoulXP.GetValue();
    if (overflow > 0)
        DPCurrentSoulXP.SetValue(overflow);
    Else
        DPCurrentSoulXP.SetValue(0);
    Endif
EndFunction

Event OnUpdate()
    ; Player has leveled up!
    if (DPCurrentSoulXP.GetValue() >= DPMaxSoulXP.GetValue())
        DragonbornSkillPerkPoint.Mod(1);

        float newMaxSoulXP = DPMaxSoulXP.GetValue() * DPMaxSoulXPMultiplier.GetValue();
        DPMaxSoulXP.SetValue(newMaxSoulXP);

        DragonbornShowLevelUp.Mod(1)

        UpdateCurrentSoulXP();
    EndIf

    ; Update SkillUpRatio.
    float _progress = DPCurrentSoulXP.GetValue() / DPMaxSoulXP.GetValue()
    DragonbornSkillUpRatio.SetValue(_progress);

    self.RegisterForSingleUpdate(1);
EndEvent