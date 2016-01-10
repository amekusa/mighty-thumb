; # App Inspector
; ----------------------------------------------------------------------------------
; This is a script for AutoHotKey (http://www.autohotkey.com/) available on Windows.
; Author: amekusa <post@amekusa.com>

IsMaximized(Wn) {
	WinGet, r, MinMax, ahk_id %Wn%
	Return r == 1
}

IsAlwaysOnTop(Wn) {
	WinGet, r, ExStyle, ahk_id %Wn%
	Return r & 0x8 ; NOTE: 0x8 is defined as WS_EX_TOPMOST.
}

; XXX No impl.
IsFullScreen(Wn) {
}

IsDialogBox(Cl) {
	Return Cl == "#32770"
}

IsPopupMenu(Cl) {
	Return Cl == "#32768"
}

; Atom
IsAtom(Pr, Cl) {
	Return Pr == "atom.exe"
}

; Eclipse IDE
IsEclipse(Pr, Cl) {
	Return Pr == "eclipse.exe" && Cl == "SWT_Window0"
}

; Mozilla Firefox
IsFirefox(Pr, Cl) {
	Return Pr == "firefox.exe"
}

; Task Manager
IsTaskManager(Pr, Cl) {
	Return Pr == "taskmgr.exe"
}
