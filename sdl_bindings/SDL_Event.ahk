;; ------------------------------------------------------------------------------
;;
;;  Title:       SDL_Event.ahk
;;  Purpose:     Functions to work with SDL Events
;;
;;  Created on:  18.02.2021 at 22:14:17
;;  Email:       ovidiugabriel {at} gmail {punct} com
;;  Copyright:   (C) 2021 SoftICE Development OU. All Rights Reserved.
;;
;; ------------------------------------------------------------------------------

;;
;; Allocates space for SDL_Event structure and initialize the space with 0xFF's
;;
SDL_Event_Init(ByRef event) {
    VarSetCapacity(event, 52, 0xFF)
}

;;
;; Returns the type of SDL_Event.
;;
SDL_Event_GetType(event) {
    return NumGet(event, 0, "UShort")
}

;;
;; Return the scancode in case of keyboard event
;;
SDL_Event_GetScancode(event) {
    return NumGet(event, 16, "UChar")
}
