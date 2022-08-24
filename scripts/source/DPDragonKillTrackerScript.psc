Scriptname DPDragonKillTrackerScript extends ObjectReference
{Applies Soul XP on Dragon Kill}

Quest Property DPDragonKilledQuest Auto
GlobalVariable Property DPCurrentSoulXP Auto
ReferenceAlias property Victim Auto

Event OnInit()
    Int xpGained = 20;

    DPCurrentSoulXP.Mod(xpGained);
    Debug.Notification("+" + xpGained + " Soul XP");
    
    DPDragonKilledQuest.Reset();
    DPDragonKilledQuest.Stop();

    Victim.GetActorReference().RemoveItem(self);
EndEvent