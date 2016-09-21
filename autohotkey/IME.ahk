/*
# IME Control Functions

## IME state getter/setter
IME_CHECK(WinTitle)
IME_ON(WinTitle)
IME_OFF(WinTitle)
IME_TOGGLE(WinTitle)

## IME input mode getter/setter
IME_GetConvMode(WinTitle)
IME_SetConvMode(WinTitle, ConvMode)

## IME conversion mode getter/setter
IME_GetSentenceMode(WinTitle)
IME_SetSentenceMode(WinTitle, SentenceMode)
*/

IME_CHECK(WinTitle)
{   ; IMC_GETOPENSTATUS
    WinGet,hWnd,ID,%WinTitle%
    Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"")
}
IME_ON(WinTitle)
{   ; IMC_SETOPENSTATUS
    WinGet,hWnd,ID,%WinTitle%
    Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x006,1)
}
IME_OFF(WinTitle)
{   ; IMC_SETOPENSTATUS
    WinGet,hWnd,ID,%WinTitle%
    Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x006,0)
}
IME_TOGGLE(WinTitle)
{
    if (IME_CHECK(WinTitle))
            IME_OFF(WinTitle)
    else    IME_ON(WinTitle)
}

IME_GetConvMode(WinTitle)
{   ; IMC_GETCONVERSIONMODE
    WinGet,hWnd,ID,%WinTitle%
    Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x001,"")
}

IME_SetConvMode(WinTitle,ConvMode)
{   ; IMC_SETCONVERSIONMODE
    WinGet,hWnd,ID,%WinTitle%
    Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x002,ConvMode)
}

IME_GetSentenceMode(WinTitle)
{   ; IMC_GETSENTENCEMODE
    WinGet,hWnd,ID,%WinTitle%
    Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x003,"")
}

IME_SetSentenceMode(WinTitle,SentenceMode)
{   ; IMC_SETSENTENCEMODE
    WinGet,hWnd,ID,%WinTitle%
    Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x004,SentenceMode)
}

Send_ImeControl(DefaultIMEWnd, wParam, lParam)
{ ;SendMessage WM_IME_CONTROL
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON
    SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd%
    if (DetectSave <> A_DetectHiddenWindows)
        DetectHiddenWindows,%DetectSave%
    return ErrorLevel
}
ImmGetDefaultIMEWnd(hWnd)
{
    return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
}
