#Requires AutoHotkey v2.0



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global variables

KeyEnterPressed := 0 ; 0 - not pressed, 1 - pressed

;; Time delays
TimeDelayDefault := 100


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Other actions

;; Detect if the Enter key is pressed (for disable other action while in D4 chat)
Enter::
{
    EnterKeyToggler()
}

;; This can be used in case you want to change D4 control settings but you don't have numepad keys

; alt + 1 = Numpad1
!1::
{
    Send "{Numpad1}"
}

; alt + 2 = Numpad2
!2::
{
    Send "{Numpad2}"
}

; alt + 3 = Numpad3
!3::
{
    Send "{Numpad3}"
}

; alt + 4 = Numpad4
!4::
{
    Send "{Numpad4}"
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Other functions

/*
    Function: EnterKeyToggler

    Toggles the behavior of the Enter key.

    Description:
    This function toggles the behavior of the Enter key by setting the global variable KeyEnterPressed to its opposite value. 
    When KeyEnterPressed is true, pressing the Enter key will send the Enter keystroke. 
    When KeyEnterPressed is false, pressing the Enter key will have no effect.

    Global Variables:
    - KeyEnterPressed: A global variable that stores the current state of the Enter key behavior.

    Example Usage:
    ```
    EnterKeyToggler()
    ```
*/
EnterKeyToggler()
{
    global KeyEnterPressed
    KeyEnterPressed := ~KeyEnterPressed

    Send "{Enter}"
}


/*
    AutoSuspendScrip()

    This function checks if the active window title contains the word "Diablo". 
    If it does, the script is enabled, otherwise it is suspended.

    Parameters:
        None

    Returns:
        None
*/
AutoSuspendScrip()
{
    Try
    {
        WindowMatch := WinGetTitle("A")

        WindowMatch := InStr(WindowMatch, "Diablo")
    }
    catch
    {
        WindowMatch := False
    }

    ;OutputDebug("Windows match:" WindowMatch)
    OutputDebug("Windows match:" WindowMatch)
    if (WindowMatch)
    {
        ;OutputDebug("Enable script")
        Suspend False
    }
    else
    {
        ;OutputDebug("Suspending script")
        Suspend True
    }

}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Other functions/tasks running in the background

;; Disable the script when Diablo is not in focus
SetTimer AutoSuspendScrip, 250

;OutputDebug("Script started" WindowMatch)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End of script