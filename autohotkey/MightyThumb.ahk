; # Mighty Thumb
; Turn your thumb key into an extra modifier key.
; ----------------------------------------------------------------------------------
; This is a script for AutoHotKey (http://www.autohotkey.com/) available on Windows.
; You can compile this as a single .EXE-cutable file via context menu.
;
; Mighty Thumb is hosted on: https://github.com/amekusa/mighty-thumb
; Contributions are welcomed :)

Process, Priority, , R
SendMode Event
SetWorkingDir %A_ScriptDir%
Return


; ## Cursor
; Thumb + E/S/D/F = Up/Left/Down/Right
vk1D & e::Send, {Up}
vk1D & s::Send, {Left}
vk1D & d::Send, {Down}
vk1D & f::Send, {Right}


; ## View
; Thumb + W/R = Page Up/Down
vk1D & w::Send, {PgUp}
vk1D & r::Send, {PgDn}


; ## Edit
; Thumb + C/X/V/Z = Copy/Cut/Paste/Undo
vk1D & c::Send, ^c
vk1D & x::Send, ^x
vk1D & v::
Send, ^v
Return
vk1D & z::Send, ^z

; ### Carriage
; Thumb + A/G = Previous/Next word
vk1D & a::Send, ^{Left}  ; Ctrl + Left
vk1D & g::Send, ^{Right} ; Ctrl + Right

; Thumb + Q/T = Beginning/End of line
vk1D & q::Send, {Home}
vk1D & t::Send, {End}

; ### Select
; Thumb + U/H/K/L = Shift + Up/Left/Down/Right
vk1D & j::Send, +{Left}
vk1D & l::Send, +{Right}
vk1D & i::Send, +{Up}
vk1D & k::Send, +{Down}

; Thumb + P = Select the current line
vk1D & p::Send, {End}{Home}{Home}+{Down}

; ### Delete
; Thumb + H/N = Backward/Forward delete
vk1D & n::Send, {Delete}
vk1D & h::Send, {BS}

; ### Spacing
; Thumb + ; = Space
vk1D & `;::Send, {Space}

; Thumb + O/U = Tab/Shift+Tab (Indent/Unindent)
vk1D & o::Send, {Tab}
vk1D & u::Send, +{Tab}

; ### Complex Operations
vk1D & m::EditText(0)     ; Delete line
vk1D & Enter::EditText(1) ; New line below
vk1D & ,::EditText(2)     ; Move line up
vk1D & .::EditText(3)     ; Move line down


; ## System Control

; ### IME
vk1D::SetImeState("A", 0) ; EISU = Turn IME off
vk1C::SetImeState("A", 1) ; KANA = Turn IME on

; ### GUI windows
vk1D & Escape::WinClose, A ; Close active window

; ### GUI tabs
; Go to the previous tab
#u::
#w::
ControlTab(0)
Return

; Go to the next tab
#o::
#r::
ControlTab(1)
Return

; Close the current tab
#m::
#d::
ControlTab(2)
Return

; Create a new tab
#i::
#e::
ControlTab(3)
Return

; Browsing Operations
#s::ControlBrowser(0) ; Go to the previous page
#f::ControlBrowser(1) ; Go to the next page

; Media players
vk1D & 1::ControlPlayer(0) ; Play/Pause
vk1D & 2::ControlPlayer(1) ; Stop
vk1D & 3::ControlPlayer(2) ; Go to the previous track
vk1D & 4::ControlPlayer(3) ; Go to the next track
vk1D & 8::ControlPlayer(4) ; Go to the previous playlist or album
vk1D & 9::ControlPlayer(5) ; Go to the next playlist or album
vk1D & 0::ControlPlayer(6) ; Widgetize the player


; //////// AHK Directives (Do not edit) ////////
#NoEnv
#SingleInstance Force
#MaxHotkeysPerInterval 200
#Include IME.ahk
#Include VirtualCommands.ahk
