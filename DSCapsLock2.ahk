global capsLockDisabled := false

^+c::
{
    CapsLockToggleState := GetKeyState("CapsLock", "T") 

    if capsLockDisabled
    {
        EnableCapsLock()
        MsgBox("Caps Lock is ENABLED - careful what you wish for!", "Caps Lock Key", "T2")
    }
    else
    {
        SetCapsLockState(false) 
        DisableCapsLock()
        MsgBox("Caps Lock is Disabled - you can now type like a madman!", "Caps Lock Key", "T2")
    }
}

DisableCapsLock()
{
    global capsLockDisabled
    Hotkey("CapsLock", (*) => "", "On")
    capsLockDisabled := true
}

EnableCapsLock()
{
    global capsLockDisabled
    Hotkey("CapsLock", "Off")
    capsLockDisabled := false
}

