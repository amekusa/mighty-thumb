;  Mighty Thumb
;  Use the thumb key as an special modifier key.
; -------------------------------------------------------------------------------------
;  This is a script for AutoHotKey (http://www.autohotkey.com/) available for Windows.
;  You can compile this file as a single executable file from context menu if you
;  have installed AutoHotKey in your system.
;
;  Mighty Thumb is hosted on: https://github.com/amekusa/mighty-thumb
;  Contributions are welcomed!

Process, Priority, , R
SendMode Event
SetWorkingDir %A_ScriptDir%
Return

; cursor keys
vk1D & e::Send, {Up}    ; Thumb + E = Up
vk1D & s::Send, {Left}  ; Thumb + S = Left
vk1D & d::Send, {Down}  ; Thumb + D = Down
vk1D & f::Send, {Right} ; Thumb + F = Right

; scroll
vk1D & w::Send, {PgUp} ; Thumb + W = Page Up
vk1D & r::Send, {PgDn} ; Thumb + R = Page Down

; edit
vk1D & c::Send, ^c ; Thumb + C = Copy
vk1D & x::Send, ^x ; Thumb + X = Cut
vk1D & v::Send, ^v ; Thumb + V = Paste
vk1D & z::Send, ^z ; Thumb + Z = Undo

; jumping cursor
vk1D & a::Send, ^{Left}  ; Thumb + A = Previous word
vk1D & g::Send, ^{Right} ; Thumb + G = Next word
vk1D & q::Send, {Home}   ; Thumb + Q = Beginning of line
vk1D & t::Send, {End}    ; Thumb + T = End of line

; text selection
vk1D & j::Send, +{Left}                  ; Thumb + J = Shift + Left
vk1D & l::Send, +{Right}                 ; Thumb + L = Shift + Right
vk1D & i::Send, +{Up}                    ; Thumb + I = Shift + Up
vk1D & k::Send, +{Down}                  ; Thumb + K = Shift + Down
vk1D & p::Send, {End}{Home}{Home}+{Down} ; Thumb + P = Select the current line

; delete
vk1D & h::Send, {BS}     ; Thumb + H = Backward delete
vk1D & n::Send, {Delete} ; Thumb + N = Forward delete

; spacing
vk1D & `;::Send, {Space} ; Thumb + ; = Space
vk1D & o::Send, {Tab}    ; Thumb + O = Tab       (Indent)
vk1D & u::Send, +{Tab}   ; Thumb + U = Shift+Tab (Unindent)

; line editing
vk1D & m::EditText(0)     ; Thumb + M     = Delete line
vk1D & Enter::EditText(1) ; Thumb + Enter = New line below
vk1D & ,::EditText(2)     ; Thumb + ,     = Move line up
vk1D & .::EditText(3)     ; Thumb + .     = Move line down

; IME
vk1D::SetImeState("A", 0) ; Thumb    = Turn IME off
vk1C::SetImeState("A", 1) ; Thumb(R) = Turn IME on

; close window
vk1D & Escape::WinClose, A ; Thumb + Esc = Close active window

; browser tabs
vk1D & 1::ControlTab(2) ; Thumb + 1 = Close tab
vk1D & 2::ControlTab(0) ; Thumb + 2 = Previous tab
vk1D & 3::ControlTab(1) ; Thumb + 3 = Next tab
vk1D & 4::ControlTab(3) ; Thumb + 4 = New tab

; special key bindings
vk1D & Tab::Send, {Return} ; Thumb + Tab = Return

; numpad
LControl & vk1D & Space::Send, {Numpad0} ; Thumb + Control + Space = 0
LControl & vk1D & n::Send, {Numpad1}     ; Thumb + Control + N     = 1
LControl & vk1D & m::Send, {Numpad2}     ; Thumb + Control + M     = 2
LControl & vk1D & ,::Send, {Numpad3}     ; Thumb + Control + ,     = 3
LControl & vk1D & j::Send, {Numpad4}     ; Thumb + Control + J     = 4
LControl & vk1D & k::Send, {Numpad5}     ; Thumb + Control + K     = 5
LControl & vk1D & l::Send, {Numpad6}     ; Thumb + Control + L     = 6
LControl & vk1D & u::Send, {Numpad7}     ; Thumb + Control + U     = 7
LControl & vk1D & i::Send, {Numpad8}     ; Thumb + Control + I     = 8
LControl & vk1D & o::Send, {Numpad9}     ; Thumb + Control + O     = 9
LControl & vk1D & .::Send, {NumpadEnter} ; Thumb + Control + .     = Enter
LControl & vk1D & `;::Send, {NumpadAdd}  ; Thumb + Control + ;     = [+]
LControl & vk1D & p::Send, {NumpadSub}   ; Thumb + Control + P     = [-]
LControl & vk1D & h::Send, {BS}          ; Thumb + Control + H     = Backspace

Return

; //////// AHK Directives (Do not edit) ////////
#NoEnv
#SingleInstance Force
#MaxHotkeysPerInterval 200
#Include IME.ahk
#Include VirtualCommands.ahk
