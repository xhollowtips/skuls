/*
        __         .__                  ____ 
  _____|  | ____ __|  |   ______ ___  _/_   |
 /  ___/  |/ /  |  \  |  /  ___/ \  \/ /|   |
 \___ \|    <|  |  /  |__\___ \   \   / |   |
/____  >__|_ \____/|____/____  >   \_/  |___|
     \/     \/               \/              
Script written by xhollowtips
(.) to start macro
(0) to end macro (must re-open file to start again)
*/

#Requires AutoHotkey v2.0-a
#SingleInstance Force

SendMode('Event')
SetKeyDelay 40

gunSlot := ""
scriptEnabled := false
isJumping := false

EnableScript() {
    global scriptEnabled
    scriptEnabled := !scriptEnabled

    if (scriptEnabled) {
        Send "{RButton Down}"
    } else {
        Send "{RButton Up}"
    }
}

SetGunSlot(slot) {
    global gunSlot
    global isJumping

    gunSlot := slot
    if (!isJumping) {
        if (slot = 1) {
            Send "{1}"
        } else if (slot = 2) {
            Send "{2}"
        } else if (slot = 3) {
            Send "{3}"
        }
    }
}

KnifeJump() {
    global scriptEnabled
    global gunSlot
    global isJumping

    if (scriptEnabled && !isJumping) {
        isJumping := true

        Send "{4}"
        Send "{Space down}"
	Send "{Space up}"

        if (gunSlot = 1) {
            Send "{1}"
        } else if (gunSlot = 2) {
            Send "{2}"
        } else if (gunSlot = 3) {
            Send "{3}"
        }

        isJumping := false
    } else if (!scriptEnabled) {
        Send "{Space down}"
	Send "{Space up}"
    }
}

*.:: {
    EnableScript()
}

*1:: {
    SetGunSlot(1)
}

*2:: {
    SetGunSlot(2)
}

*3:: {
    SetGunSlot(3)
}

*Space:: {
    KnifeJump()
}

0:: {
    ExitApp
}
