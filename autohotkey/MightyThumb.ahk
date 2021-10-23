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

; IME
vk1D::SetImeState("A", 0) ; Thumb    = Turn IME off
vk1C::SetImeState("A", 1) ; Thumb(R) = Turn IME on

#If GetKeyState("vk1D")

; cursor keys
e::Send, {Up}    ; Thumb + E = Up
s::Send, {Left}  ; Thumb + S = Left
d::Send, {Down}  ; Thumb + D = Down
f::Send, {Right} ; Thumb + F = Right

; scroll
w::Send, {PgUp} ; Thumb + W = Page Up
r::Send, {PgDn} ; Thumb + R = Page Down

; edit
c::Send, ^c ; Thumb + C = Copy
x::Send, ^x ; Thumb + X = Cut
v::Send, ^v ; Thumb + V = Paste
z::Send, ^z ; Thumb + Z = Undo

; jumping cursor
a::Send, ^{Left}  ; Thumb + A = Previous word
g::Send, ^{Right} ; Thumb + G = Next word
q::Send, {Home}   ; Thumb + Q = Beginning of line
t::Send, {End}    ; Thumb + T = End of line

; text selection
j::Send, +{Left}                  ; Thumb + J = Shift + Left
l::Send, +{Right}                 ; Thumb + L = Shift + Right
i::Send, +{Up}                    ; Thumb + I = Shift + Up
k::Send, +{Down}                  ; Thumb + K = Shift + Down
p::Send, {End}{Home}{Home}+{Down} ; Thumb + P = Select the current line

; delete
h::Send, {BS}     ; Thumb + H = Backward delete
n::Send, {Delete} ; Thumb + N = Forward delete

; indent
o::Send, {Tab}    ; Thumb + O = Tab       (Indent)
u::Send, +{Tab}   ; Thumb + U = Shift+Tab (Unindent)

; line editing
m::EditText(0)     ; Thumb + M     = Delete line
Enter::EditText(1) ; Thumb + Enter = New line below
,::EditText(2)     ; Thumb + ,     = Move line up
.::EditText(3)     ; Thumb + .     = Move line down

; close window
Escape::WinClose, A ; Thumb + Esc = Close active window

; browser tabs
1::ControlTab(2) ; Thumb + 1 = Close tab
2::ControlTab(0) ; Thumb + 2 = Previous tab
3::ControlTab(1) ; Thumb + 3 = Next tab
4::ControlTab(3) ; Thumb + 4 = New tab

; special key bindings
Tab::Send, {Return} ; Thumb + Tab = Return

; numpad
Control & Space::Send, {Numpad0} ; Thumb + Control + Space = 0
Control & n::Send, {Numpad1}     ; Thumb + Control + N     = 1
Control & m::Send, {Numpad2}     ; Thumb + Control + M     = 2
Control & ,::Send, {Numpad3}     ; Thumb + Control + ,     = 3
Control & j::Send, {Numpad4}     ; Thumb + Control + J     = 4
Control & k::Send, {Numpad5}     ; Thumb + Control + K     = 5
Control & l::Send, {Numpad6}     ; Thumb + Control + L     = 6
Control & u::Send, {Numpad7}     ; Thumb + Control + U     = 7
Control & i::Send, {Numpad8}     ; Thumb + Control + I     = 8
Control & o::Send, {Numpad9}     ; Thumb + Control + O     = 9
Control & .::Send, {NumpadEnter} ; Thumb + Control + .     = Enter
Control & `;::Send, {NumpadAdd}  ; Thumb + Control + ;     = [+]
Control & p::Send, {NumpadSub}   ; Thumb + Control + P     = [-]
Control & h::Send, {BS}          ; Thumb + Control + H     = Backspace

; //////// AHK Directives (Do not edit) ////////
#NoEnv
#SingleInstance Force
#MaxHotkeysPerInterval 200
#Include IME.ahk
#Include VirtualCommands.ahk
