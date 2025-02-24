toggle := false

^+c:: {  ; Ctrl + Shift + C toggles Caps Lock disabling
    global toggle
    toggle := !toggle
    if toggle {
        Hotkey("CapsLock", "Off")  ; Enable Caps Lock
        ToolTip("Caps Lock is ENABLED", , , 1)
    } else {
        Hotkey("CapsLock", "On")   ; Disable Caps Lock
        ToolTip("Caps Lock is DISABLED", , , 1)
    }
    SetTimer(RemoveToolTip, -1000)
}

CapsLock::Return  ; Disable Caps Lock when it's off

RemoveToolTip() {
    ToolTip()
}
