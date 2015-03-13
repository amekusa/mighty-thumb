; # App Inspector
; ----------------------------------------------------------------------------------
; This is a script for AutoHotKey (http://www.autohotkey.com/) available on Windows.
; Author: amekusa <post@amekusa.com>

IsMaximized(hwnd) {
	WinGet, _x, MinMax, ahk_id %hwnd%
	Return _x == 1
}

IsAlwaysOnTop(hwnd) {
	WinGet, _x, ExStyle, ahk_id %hwnd%
	Return _x & 0x8 ; NOTE: 0x8 is defined as WS_EX_TOPMOST.
}

; No impl.
IsFullScreen(hwnd) {
}

IsDialogBox(class) {
	Return class == "#32770"
}

IsPopupMenu(class) {
	Return class == "#32768"
}

; Task Manager
IsTaskManager(proc, class) {
	Return proc == "taskmgr.exe" && class == "#32770"
}

; Mozilla Firefox
IsFirefox(proc, class) {
	Return class == "MozillaUIWindowClass"
}

; Eclipse IDE
IsEclipse(proc, class) {
	Return proc == "eclipse.exe" && class == "SWT_Window0"
}

; SonicStage
IsSonicStage(proc, class) {
	Return proc == "Omgjbox.exe"
}

; Avira Antivir Ads
IsAviraAVAds(proc, class) {
	Return proc == "avnotify.exe" && class == "#32770"
}
