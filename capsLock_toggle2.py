from pynput import keyboard
import subprocess

caps_lock_disabled = False

def on_activate():
    global caps_lock_disabled
    force_caps_lock_off()
    if caps_lock_disabled:
        enable_caps_lock()
        show_notification("Enabling Caps Lock Key", "Caps Lock is ENABLED - Careful what you wish for!", "red")
    else:
        disable_caps_lock()
        show_notification("Disabling Caps Lock Key", "Caps Lock is DISABLED - You can now type like a madman!", "green")

def force_caps_lock_off():
    subprocess.run(['xdotool', 'key', 'Caps_Lock'])

def disable_caps_lock():
    global caps_lock_disabled
    result = subprocess.run(['xmodmap', '-e', 'keycode 66 = Control_L'], capture_output=True, text=True)
    caps_lock_disabled = True

def enable_caps_lock():
    global caps_lock_disabled
    result = subprocess.run(['xmodmap', '-e', 'keycode 66 = Caps_Lock'], capture_output=True, text=True)
    caps_lock_disabled = False

def show_notification(title, text, color):
    subprocess.run(['notify-send', title, text, '-u', 'normal', '-h', f'string:bgcolor:{color}'])

with keyboard.GlobalHotKeys({
        '<ctrl>+<shift>+i': on_activate}) as h:
    h.join()
