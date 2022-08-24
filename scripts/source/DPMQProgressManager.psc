Scriptname DPMQProgressManager extends Quest
{Gives player the 'Soul Reflection' ability after they've killed their first dragon}

Quest Property MQ104 Auto
Spell Property DPOpenMenuAb Auto

Bool MessageDisplayed = False;

Event OnInit()
    self.RegisterForSingleUpdate(1);
EndEvent

Event OnUpdate()
    if (MQ104.GetStage() >= 90)      
        ;Player has killed the dragon and absorbed its soul, give them 'Soul Reflection'
        Game.GetPlayer().AddSpell(DPOpenMenuAb);
        
        if (MessageDisplayed == False)
            Debug.MessageBox("You've unsealed the gates to your Dragon Soul. Use the 'Soul Reflection' ability to look within and discover your hidden power!")
            MessageDisplayed = True;
        Endif
        UnregisterForUpdate();
        Stop();
    EndIf
    self.RegisterForSingleUpdate(1);
EndEvent