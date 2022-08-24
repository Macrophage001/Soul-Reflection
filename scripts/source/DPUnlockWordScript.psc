Scriptname DPUnlockWordScript extends ActiveMagicEffect

WordofPower Property Word Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if (akTarget == Game.GetPlayer())
        game.TeachWord(Word)
    endif
EndEvent