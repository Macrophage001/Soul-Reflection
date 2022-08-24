Scriptname DPMCM extends SKI_ConfigBase

GlobalVariable Property DPMaxSoulXP Auto
GlobalVariable Property DPMaxSoulXPMultiplier Auto
GlobalVariable Property DPDragonXP Auto
GlobalVariable Property DPWordWallXP Auto

; Default Values
Float _maxSoulXP = 100.0
Float _maxSoulXPMultiplier = 1.07
Float _XPPerDragon = 20.0
Float _XPPerWordWall = 50.0

; OIDs (T:Text, B:Toggle, S:Slider)

Int _sliderBaseMaxXP_S
Int _sliderBaseMaxXPMultiplier_S
Int _sliderXPPerDragon_S
Int _sliderXPPerWordWall_S

Int function GetVersion()
	return 1
endfunction

Event OnVersionUpdate(int version)
	if version >= 1 && CurrentVersion < 1
		Debug.Trace(self + ": Updating {Body Refinement MCM} to Version 1")
	endif
EndEvent

Event OnConfigInit()
	Pages = new string[7]
	Pages[0] = "Options"
EndEvent

Event OnPageReset(string page)
    if (page == "Options")
        SetCursorFillMode(TOP_TO_BOTTOM)

        SetCursorPosition(0)
        _sliderBaseMaxXP_S = AddSliderOption("Base Max XP", _maxSoulXP)
        SetCursorPosition(2)
        _sliderBaseMaxXPMultiplier_S = AddSliderOption("Max XP Multiplier", _maxSoulXPMultiplier)
        SetCursorPosition(4)
        _sliderXPPerDragon_S = AddSliderOption("XP Gained Per Dragon", _XPPerDragon)
        SetCursorPosition(6)
        _sliderXPPerWordWall_S = AddSliderOption("XP Gained Per Word Wall", _XPPerWordWall)
    endif
EndEvent

Event OnOptionSelect(int option)
EndEvent

Event OnOptionHighlight(int option)
EndEvent

Event OnOptionSliderOpen(int option)
	if (option == _sliderBaseMaxXP_S)
		SetSliderDialogInterval(1)
		SetSliderDialogRange(1, 1000)
		SetSliderDialogDefaultValue(_maxSoulXP)
    elseif (option == _sliderBaseMaxXPMultiplier_S)
        SetSliderDialogInterval(0.01)
		SetSliderDialogRange(1, 2)
		SetSliderDialogDefaultValue(_maxSoulXPMultiplier)
    elseif (option == _sliderXPPerDragon_S)
        SetSliderDialogInterval(1)
		SetSliderDialogRange(1, 100)
		SetSliderDialogDefaultValue(_XPPerDragon)
    elseif (option == _sliderXPPerWordWall_S)
        SetSliderDialogInterval(1)
		SetSliderDialogRange(1, 100)
		SetSliderDialogDefaultValue(_XPPerWordWall)
    endif
EndEvent

Event OnOptionSliderAccept(int option, float value)
	if (option == _sliderBaseMaxXP_S)
        DPMaxSoulXP.SetValue(value);
        _maxSoulXP = value;
		SetSliderOptionValue(option, value)
    elseif (option == _sliderBaseMaxXPMultiplier_S)
        DPMaxSoulXPMultiplier.SetValue(value);
        _maxSoulXPMultiplier = value;
		SetSliderOptionValue(option, value)
    elseif (option == _sliderXPPerDragon_S)
        DPDragonXP.SetValue(value);
        _XPPerDragon = value;
		SetSliderOptionValue(option, value)
    elseif (option == _sliderXPPerWordWall_S)
        DPWordWallXP.SetValue(value);
        _XPPerWordWall = value;
		SetSliderOptionValue(option, value)
    endif
EndEvent