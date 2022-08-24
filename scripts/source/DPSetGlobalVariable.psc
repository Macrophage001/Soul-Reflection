Scriptname DPSetGlobalVariable extends ActiveMagicEffect

GlobalVariable Property Variable Auto

Int Property OnEffectStartValue Auto
Int Property OnEffectFinishedValue Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if (akTarget == Game.GetPlayer())
        Variable.SetValue(OnEffectStartValue);
    EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    if (akTarget == Game.GetPlayer())
        Variable.SetValue(OnEffectFinishedValue);
    EndIf
EndEvent