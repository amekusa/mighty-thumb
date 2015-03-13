; # Virtual Commands
; ----------------------------------------------------------------------------------
; This is a script for AutoHotKey (http://www.autohotkey.com/) available on Windows.
; Author: amekusa <post@amekusa.com>

EditText(Id) {
	; 0: Drop the current line
	; 1: Add a new line next to current one
	; 2: Swap the current line with the previous one
	; 3: Swap the current line with the next one

	Critical

	; Eclipse
	IfWinActive, ahk_class SWT_Window0
	{
		If(Id == 0) {
			Send, ^d
		} Else If(Id == 1) {
			Send, +{Enter}
		} Else If(Id == 2) {
			Send, !{Up}
		} Else If(Id == 3) {
			Send, !{Down}
		}
		Return
	}

	; Others (Ordinary text editors)
	If(Id == 0) {
		Send, {End}{Home}{Home}+{Down}{Delete}
	} Else If(Id == 1) {
		Send, {End}{Enter}
	} Else If(Id == 2) {
		Clip = %Clipboard%
		Send, {End}{Home}{Home}+{Down}^x{Up}^v{Up}
		Clipboard = %Clip%
	} Else If(Id == 3) {
		Clip = %Clipboard%
		Send, {End}{Home}{Home}+{Down}^x{Down}^v{Up}
		Clipboard = %Clip%
	}
}

ControlTab(Id) {
	; 0: Switch to the previous tab
	; 1: Switch to the next tab
	; 2: Close the current tab
	; 3: Create a new tab

	Critical

	; Eclipse
	IfWinActive, ahk_class SWT_Window0
	{
		If(Id == 0) {
			Send, ^{PgUp}
		} Else If(Id == 1) {
			Send, ^{PgDn}
		} Else If(Id == 2) {
			Send, ^w
		}
		Return
	}

	; Others (Based on Mozilla Firefox)
	If(Id == 0) {
		Send, +^{Tab}
	} Else If(Id == 1) {
		Send, ^{Tab}
	} Else If(Id == 2) {
		Send, ^w
	} Else If(Id == 3) {
		Send, ^t
	}
}

ControlBrowser(Id) {
	; 0: Go to the previous page
	; 1: Go to the next page

	Critical

	; Ordinary browsers
	If(Id == 0) {
		Send, !{Left}
	} Else If(Id == 1) {
		Send, !{Right}
	}
}

ControlPlayer(Id) {
	; 0: Play/Pause
	; 1: Stop
	; 2: Go to the previous track
	; 3: Go to the next track
	; 4: Go to the previous playlist or album
	; 5: Go to the next playlist or album
	; 6: Widgetize the player

	Critical

	; SonicStage
	IfWinExist, SonicStage ahk_class #32770
	{
		If(Id == 0) {
			ControlSend, ahk_parent, {F6}, ahk_class #32770
		} Else if(Id == 1) {
			ControlSend, ahk_parent, {F7}, ahk_class #32770
		} Else if(Id == 2) {
			ControlSend, ahk_parent, ^{Left}, ahk_class #32770
		} Else if(Id == 3) {
			ControlSend, ahk_parent, ^{Right}, ahk_class #32770
		} Else if(Id == 4) {
			ControlSend, ahk_parent, ^b, ahk_class #32770
		} Else if(Id == 5) {
			ControlSend, ahk_parent, ^f, ahk_class #32770
		} Else if(Id == 6) {
			ControlSend, ahk_parent, {F12}, ahk_class #32770
		}
		Return
	}

	; Winamp
	IfWinExist, ahk_class BaseWindow_RootWnd
	{
		If(Id == 0) {
			ControlSend, ahk_parent, x, ahk_class BaseWindow_RootWnd
		} Else if(Id == 1) {
			ControlSend, ahk_parent, v, ahk_class BaseWindow_RootWnd
		} Else if(Id == 2) {
			ControlSend, ahk_parent, z, ahk_class BaseWindow_RootWnd
		} Else if(Id == 3) {
			ControlSend, ahk_parent, b, ahk_class BaseWindow_RootWnd
		} Else if(Id == 4) {
			;ControlSend, ahk_parent, , ahk_class BaseWindow_RootWnd
		} Else if(Id == 5) {
			;ControlSend, ahk_parent, , ahk_class BaseWindow_RootWnd
		} Else if(Id == 6) {
			ControlSend, ahk_parent, !l, ahk_class BaseWindow_RootWnd
		}
		Return
	}
}

ControlSound(Id) {
	global VolLv
	global Muted

	Critical

	If(Id < 2) {
		If(Id == 0) {
			VolLv--
		} Else if(Id == 1) {
			VolLv++
		}

		If(VolLv <= 0) {
			VolLv := 0
			Vol := 0
		} Else if(VolLv >= 16) {
			VolLv := 16
			Vol := 100
		} Else {
			;Vol := (1.28 ** VolLv) * 2
			Vol := ((1.2 ** VolLv) * 5.7) - 5
		}
		SoundSet, Vol
		Gosub, ShowVolumeLevel
		Return Vol

	} Else if(Id == 2) {
		If(Muted) {
			Muted := False
			Label := "Unmuted"
		} Else {
			Muted := True
			Label := "Muted"
		}
		SoundSet, Muted, , MUTE
		Gosub, ShowVolumeLevel
		Return
	}
}

ShowVolumeLevel:
If(Muted) {
	Progress, B2 ZH6 W240 FS9 WS400 FM9 WM700 CBC0C0C0, Volume Level: %VolLv% /16, MUTED
} Else {
	Progress, B2 ZH6 W240 FS9 WS700 CB3EBDDE, Volume Level: %VolLv% /16
}
Prg := (100 / 16) * VolLv
Progress, %Prg%
SetTimer, OffProgress, 1500
Return

OffProgress:
SetTimer, OffProgress, Off
Progress, Off
Return

#NoEnv
#Include AppInspector.ahk
