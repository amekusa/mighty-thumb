/**
IME Control Functions
*/

/**
Returns IME state
@param WinTitle Target window
@return 0:Off, 1:On
*/
GetImeState(WinTitle) {
    WinGet, hWnd, ID, %WinTitle%
    Return SendImeControl(GetDefaultImeWindow(hWnd), 0x005, "") ; 0x005: IMC_GETOPENSTATUS
}

/**
Changes IME state
@param WinTitle Target window
@param State 0:Off, 1:On
*/
SetImeState(WinTitle, State) {
    WinGet, hWnd, ID, %WinTitle%
    SendImeControl(GetDefaultImeWindow(hWnd), 0x006, State) ; 0x006: IMC_SETOPENSTATUS
}

/**
Toggles IME On/Off state
@param WinTitle Target window
*/
ToggleImeState(WinTitle) {
    if (GetImeState(WinTitle))
        SetImeState(WinTitle, 0)
    else
        SetImeState(WinTitle, 1)
}

/**
Invokes IME API call
@return Error
*/
SendImeControl(DefaultIMEWnd, wParam, lParam) {
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows, ON
    SendMessage 0x283, wParam, lParam, , ahk_id %DefaultIMEWnd% ; 0x283: WM_IME_CONTROL
    if (DetectSave <> A_DetectHiddenWindows)
        DetectHiddenWindows, %DetectSave%
    return ErrorLevel
}

/**
Returns default IME window
*/
GetDefaultImeWindow(hWnd) {
    return DllCall("imm32\ImmGetDefaultIMEWnd", Uint, hWnd, Uint)
}
