; Set mode to SendInput, which is faster and more reliable than the default SendEvent mode. 
; Also, SendInput mode will buffer physical keyboard or mouse activity during the send, which avoids the mess.
; See also: 
;   - https://autohotkey.com/docs/commands/Send.htm#SendPlay
;   - https://autohotkey.com/docs/commands/SendMode.htm
SendMode InputThenPlay

; Better responsiveness
; Note: Hotkeys using keyboard hook will not be triggered by Send
#UseHook On

Capslock::Ctrl

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Global Vars
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CxPressed = 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Edit Functions
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

KillLine()
{
    Send {SHIFT}+{END}
    Send ^x 
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Window Functions
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SplitWindow()
{
    ; For VS Code
    Send ^\
}

OtherWindow()
{
    ; For VS CodeC029
    ; Send ^`, note
    ; See also: https://autohotkey.com/boards/viewtopic.php?t=3590
    Send ^``  
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Keybindings
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
    If cxPressed 
    {
        Send ^o
        global cxPressed = 0
    }
    Else
        Send {Right}
Return

^p::
CapsLock & p::
    Send {Up}
Return
    
^s::
CapsLock & s::
    If cxPressed 
    {
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
    global cxPressed = 0
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
    
^d::
CapsLock & d::
    Send {Del}
Return
    
^k::
CapsLock & k::
    KillLine()
Return    
    
#If CxPressed = 1

h::
    Send ^a
    CxPressed = 0
Return

k::
    Send ^w
    CxPressed = 0
Return

2::
    SplitWindow()
Return

3::
    SplitWindow()
Return

o::
    OtherWindow()
Return

#If