;; ------------------------------------------------------------------------------
;;
;;  Title:       SDL_Rect.ahk
;;  Purpose:     Functions to work with SDL Rectangle
;;
;;  Created on:  18.02.2021 at 22:15:31
;;  Email:       ovidiugabriel {at} gmail {punct} com
;;  Copyright:   (C) 2021 SoftICE Development OU. All Rights Reserved.
;;
;; ------------------------------------------------------------------------------

class SDL_Rect {
    static RECT_X := 0
    static RECT_Y := 4
    static RECT_W := 8
    static RECT_H := 12
}

;;
;; Initialize a SDL_Rect structure
;;
SDL_Rect_Init(ByRef rect, x, y, w, h) {
    VarSetCapacity(rect, 16, 0xFF)
    SDL_Rect_SetX(rect, x)
    SDL_Rect_SetY(rect, y)
    SDL_Rect_SetW(rect, w)
    SDL_Rect_SetH(rect, h)
}

SDL_Rect_GetX(rect) {
    return NumGet(rect, SDL_Rect.RECT_X, "Int")
}

SDL_Rect_GetY(rect) {
    return NumGet(rect, SDL_Rect.RECT_Y, "Int")
}

SDL_Rect_GetW(rect) {
    return NumGet(rect, SDL_Rect.RECT_W, "Int")
}

SDL_Rect_GetH(rect) {
    return NumGet(rect, SDL_Rect.RECT_H, "Int")
}

SDL_Rect_SetX(ByRef rect, x) {
    NumPut(x, rect, SDL_Rect.RECT_X, "Int")
}

SDL_Rect_SetY(ByRef rect, y) {
    NumPut(y, rect, SDL_Rect.RECT_Y, "Int")
}

SDL_Rect_SetW(ByRef rect, w) {
    NumPut(w, rect, SDL_Rect.RECT_W, "Int")
}

SDL_Rect_SetH(ByRef rect, h) {
    NumPut(h, rect, SDL_Rect.RECT_H, "Int")
}
