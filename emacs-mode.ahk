; Set mode to SendInput, which is faster and more reliable than the default SendEvent mode. 
; Also, SendInput mode will buffer physical keyboard or mouse activity during the send, which avoids the mess.
; See also: 
;   - https://autohotkey.com/docs/commands/Send.htm#SendPlay
;   - https://autohotkey.com/docs/commands/SendMode.htm
SendMode InputThenPlay

; Better responsiveness
; Note: Hotkeys using keyboard hook will not be triggered by Send
#UseHook On

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
    ; For VS Code
    ; Send ^`, note
    ; See also: https://autohotkey.com/boards/viewtopic.php?t=3590
    Send ^``  
}

SwitchToTab()
{
    ; For Google Chrome (TabAhead)
    Send !t
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Keybindings
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^n::
    Send {Down}
Return
    
^b::
    Send {Left}
Return

^f::
    If cxPressed 
    {
        Send ^o
        global cxPressed = 0
    }
    Else
        Send {Right}
Return

^p::
    Send {Up}
Return
    
^s::
    If cxPressed 
    {
        Send ^s
        global cxPressed = 0
    }
    Else
        Send ^f
Return
    
^a::
    Send {HOME}
Return

^e::
    Send {END}
Return
    
^y::
    Send ^v
Return
    
^x::
    CxPressed = 1
Return
    
^/::
    Send ^z
Return
    
^g::
    Send {ESC}
    global cxPressed = 0
Return
    
^v::
    Send {PgDn}
Return
    
!v::
    Send {PgUp}
Return

!x::
    ; For VS Code
    Send {F1}
Return

^w::

    Send ^x
Return
    
^d::
    Send {Del}
Return
    
^k::
    KillLine()
Return    

^o::
    Send {Enter}{Home}{Left}
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
    CxPressed = 0
Return

3::
    SplitWindow()
    CxPressed = 0
Return

o::
    OtherWindow()
    CxPressed = 0
Return

b::
    SwitchToTab()
    CxPressed = 0
Return

#If