Scriptname DPDragonKillTrackerScript extends ObjectReference
{Applies Soul XP on Dragon Kill}

Quest Property DPDragonKilledQuest Auto
GlobalVariable Property DPCurrentSoulXP Auto
GlobalVariable Property DPDragonXP Auto
ReferenceAlias property Victim Auto

Event OnInit()
    ;In case I want to apply multipliers to xp gain later, storing in seperate variable first.
    Float xpGained = DPDragonXP.GetValue();

    DPCurrentSoulXP.Mod(xpGained);
    ; Debug.Notification("+" + xpGained + " Soul XP");
    
    DPDragonKilledQuest.Reset();
    DPDragonKilledQuest.Stop();

    Victim.GetActorReference().RemoveItem(self);
EndEvent