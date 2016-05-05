; Set mode to SendInput, which is faster and more reliable than the default SendEvent mode. 
; Also, SendInput mode will buffer physical keyboard or mouse activity during the send, which avoids the mess.
; See also: 
;   - https://autohotkey.com/docs/commands/Send.htm#SendPlay
;   - https://autohotkey.com/docs/commands/SendMode.htm
SendMode InputThenPlay

; Better responsiveness
; Note: Hotkeys using keyboard hook will not be triggered by Send
#UseHook On

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Global Vars
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CxPressed = 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Keybindings
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^n::
CapsLock & n::
    Send {Down}
    Return
    
^b::
CapsLock & b::
    Send {Left}
    Return

^f::
CapsLock & f::
    Send {Right}
    Return

^p::
CapsLock & p::
    Send {Up}
    Return
    
^s::
CapsLock & s::
    If cxPressed {
        Send ^s
        global cxPressed = 0
    }
    Else
        Send ^f
    Return
    
^a::
CapsLock & a::
    Send {HOME}
    Return

^e::
CapsLock & e::
    Send {END}
    Return
    
^y::
CapsLock & y::
    Send ^v
    Return
    
^x::
CapsLock & x::
    CxPressed = 1
    Return
    
^/::
CapsLock & /::
    Send ^z
    Return
    
^g::
CapsLock & g::
    Send {ESC}
    Return
    
^v::
CapsLock & v::
    Send {PgDn}
    Return
    
!v::
    Send {PgUp}
    Return

^w::
CapsLock & w::
    Send ^x
    Return
    
    
#If CxPressed = 1

h::
    Send ^a
    CxPressed = 0
    Return

#If
