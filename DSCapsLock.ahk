; Global variable to track if Caps Lock is disabled
global capsLockDisabled := false

; Hotkey: Ctrl + Shift + C
^+c::
{
    ; Get the current toggle state of Caps Lock
    CapsLockToggleState := GetKeyState("CapsLock", "T")  ; "T" checks the toggle state

    if capsLockDisabled  ; If Caps Lock is currently disabled
    {
        EnableCapsLock()  ; Enable the Caps Lock key
        ;ToolTip("Caps Lock is ENABLED - careful what you wish for!", , , 1)
		MsgBox("Caps Lock is ENABLED - careful what you wish for!", "Caps Lock Key","T2")
    }
    else  ; If Caps Lock is not disabled
    {
        ; If Caps Lock is ON, turn it OFF before disabling
        if CapsLockToggleState
        {
            SetCapsLockState(false)  ; Force Caps Lock OFF and update the light
        }
        DisableCapsLock()  ; Disable the Caps Lock key
        ;ToolTip("Caps Lock is DISABLED - you can now type like a madman!", , , 1)
		MsgBox("Caps Lock is Disabled - you can now type like a madman!", "Caps Lock Key","T2")
    }
    ;SetTimer(RemoveToolTip, -2000)
}

; Function to disable the Caps Lock key
DisableCapsLock()
{
    global capsLockDisabled
    ; Remap Caps Lock to do nothing
    Hotkey("CapsLock", (*) => "", "On")
    capsLockDisabled := true

}

; Function to enable the Caps Lock key
EnableCapsLock()
{
    global capsLockDisabled
    ; Restore the Caps Lock key to its default behavior
    Hotkey("CapsLock", "Off")
    capsLockDisabled := false

}
;RemoveToolTip() {
  ;  ToolTip()
;}