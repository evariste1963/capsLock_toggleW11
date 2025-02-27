global capsLockDisabled := false

^+c::
{
    if capsLockDisabled
    {
        EnableCapsLock()
        CapsLockGuiSet("Enabling Caps Lock Key", "   Caps Lock is ENABLED - Careful what you wish for !   ", "red")
    }
    else
    {
        DisableCapsLock()
        CapsLockGuiSet("Disabling Caps Lock Key", "   Caps Lock is DISABLED - You can now type like a madman !   ", "green")
    }
}

DisableCapsLock()
{
    global capsLockDisabled
    SetCapsLockState(false)
    Hotkey("CapsLock", (*) => "", "On")
    capsLockDisabled := true
}

EnableCapsLock()
{
    global capsLockDisabled
    Hotkey("CapsLock", "Off")
    capsLockDisabled := false
}

CapsLockGuiSet(Title, Text, colour)
{
    CapsLockgui := Gui(, Title)
    CapsLockgui.BackColor := colour
    CapsLockgui.SetFont("s11 cwhite", "Comic Sans MS")
    CapsLockgui.Add("Text", , Text)
    CapsLockgui.Show("AutoSize Center")
    SetTimer () => CapsLockgui.Destroy(), -2000
}
