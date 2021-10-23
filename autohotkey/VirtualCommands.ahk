;  Virtual Commands
; --------------------- ---- -- -
;  Author: amekusa.com

EditText(X) {
	; 0: Delete line
	; 1: New line below
	; 2: Move line up
	; 3: Move line down

	Critical
	WinGet, proc, ProcessName, A ; Active window's process
	WinGetClass, class, A        ; Active window's class

	; Atom
	If (IsAtom(proc, class)) {
		If (X == 0) {
			Send, +^k
		} Else If (X == 1) {
			Send, ^{Enter}
		} Else If (X == 2) {
			Send, ^{Up}
		} Else If (X == 3) {
			Send, ^{Down}
		}
		Return
	}

	; Eclipse
	If (IsEclipse(proc, class)) {
		If (X == 0) {
			Send, ^d
		} Else If (X == 1) {
			Send, +{Enter}
		} Else If (X == 2) {
			Send, !{Up}
		} Else If (X == 3) {
			Send, !{Down}
		}
		Return
	}

	; Generic text editor
	If (X == 0) {
		Send, {End}{Home}{Home}+{Down}{Delete}
	} Else If (X == 1) {
		Send, {End}{Enter}
	} Else If (X == 2) {
		Clip = %Clipboard%
		Send, {End}{Home}{Home}+{Down}^x{Up}^v{Up}
		Clipboard = %Clip%
	} Else If (X == 3) {
		Clip = %Clipboard%
		Send, {End}{Home}{Home}+{Down}^x{Down}^v{Up}
		Clipboard = %Clip%
	}
}

ControlTab(X) {
	; 0: Switch to the previous tab
	; 1: Switch to the next tab
	; 2: Close the current tab
	; 3: Create a new tab

	Critical
	WinGet, proc, ProcessName, A ; Active window's process
	WinGetClass, class, A        ; Active window's class

	; Eclipse
	If (IsEclipse(proc, class)) {
		If (X == 0) {
			Send, ^{PgUp}
		} Else If (X == 1) {
			Send, ^{PgDn}
		} Else If (X == 2) {
			Send, ^w
		}
		Return
	}

	; Others (Based on Mozilla Firefox)
	If (X == 0) {
		Send, +^{Tab}
	} Else If (X == 1) {
		Send, ^{Tab}
	} Else If (X == 2) {
		Send, ^w
	} Else If (X == 3) {
		Send, ^t
	}
}

ControlBrowser(X) {
	; 0: Go to the previous page
	; 1: Go to the next page

	Critical
	WinGet, proc, ProcessName, A ; Active window's process
	WinGetClass, class, A        ; Active window's class

	; Ordinary browsers
	If (X == 0) {
		Send, !{Left}
	} Else If (X == 1) {
		Send, !{Right}
	}
}

ControlPlayer(X) {
	; 0: Play/Pause
	; 1: Stop
	; 2: Go to the previous track
	; 3: Go to the next track
	; 4: Go to the previous playlist or album
	; 5: Go to the next playlist or album
	; 6: Widgetize the player

	Critical
	WinGet, proc, ProcessName, A ; Active window's process
	WinGetClass, class, A        ; Active window's class

	; XXX No impl.
}

ControlSound(X) {
	; 0: Volume down
	; 1: Volume up

	global VolLv
	global Muted

	Critical
	WinGet, proc, ProcessName, A ; Active window's process
	WinGetClass, class, A        ; Active window's class

	If (X < 2) {
		If (X == 0) {
			VolLv--
		} Else If (X == 1) {
			VolLv++
		}

		If (VolLv <= 0) {
			VolLv := 0
			Vol := 0
		} Else If (VolLv >= 16) {
			VolLv := 16
			Vol := 100
		} Else {
			;Vol := (1.28 ** VolLv) * 2
			Vol := ((1.2 ** VolLv) * 5.7) - 5
		}
		SoundSet, Vol
		Gosub, ShowVolumeLevel
		Return Vol

	} Else If (X == 2) {
		If (Muted) {
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
If (Muted) {
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
