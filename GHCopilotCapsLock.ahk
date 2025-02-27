;#Include <Gui> ; Include the Gui library
;#Include <GuiCreate.ahk> ; Include the GuiCreate library (ensure this library is available)

global capsLockDisabled := false

^+c::
{
    if capsLockDisabled
    {
        EnableCapsLock()
        ;MsgBox("Caps Lock is ENABLED - careful what you wish for!", "Caps Lock Key", "T2")
        CapsLockgui := Gui(, "Enabling Caps Lock Key")
        CapsLockgui.BackColor := "2e2e2d"
        CapsLockgui.SetFont("s11 cwhite", "Comic Sans MS")
        CapsLockgui.Add("Text", , "   Caps Lock is ENABLED - Careful what you wish for!   ")
        CapsLockgui.Show("AutoSize Center")


    }
    else
    {
        DisableCapsLock()
        ;MsgBox("Caps Lock is Disabled - you can now type like a madman!", "Caps Lock Key", "T2")i
        CapsLockgui := Gui(, "Disabling Caps Lock Key")
        CapsLockgui.BackColor := "2e2e2d"
        CapsLockgui.SetFont("s11 cwhite", "Comic Sans MS")
        CapsLockgui.Add("Text", , "   Caps Lock is DISABLED - You can now type like a madman!   ")
        CapsLockgui.Show("AutoSize Center")

    }

    SetTimer () => CapsLockgui.Destroy(), -2000  ; Close GUI after 2 seconds
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