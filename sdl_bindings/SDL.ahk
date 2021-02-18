;; ------------------------------------------------------------------------------
;;
;;  Title:       SDL.ahk
;;  Purpose:     Bindings for Simple DirectMedia Layer
;;
;;  Created on:  24.07.2020 at 15:49:38
;;  Email:       ovidiugabriel {at} gmail {punct} com
;;  Copyright:   (C) 2020 SoftICE Development OU. All Rights Reserved.
;;
;; ------------------------------------------------------------------------------

;; === SDL Constants / Defines =================================================

;; from sdl.h

SDL_INIT_VIDEO  := 0x00000020
SDL_INIT_TIMER  := 0x00000001
SDL_INIT_EVENTS := 0x00004000

SDL_WINDOWPOS_CENTERED_MASK := 0x2FFF0000
SDL_WINDOWPOS_CENTERED := SDL_WINDOWPOS_CENTERED_MASK

;; SDL_events.h
;; Application events
SDL_QUIT           := 0x100 ;; User-requested quit

;; Keyboard events
SDL_KEYDOWN        := 0x300 ;; Key pressed
SDL_KEYUP          := SDL_KEYDOWN | 0x001 ;; Key released
SDL_TEXTEDITING    := SDL_KEYDOWN | 0x002 ;; Keyboard text editing (composition)
SDL_TEXTINPUT      := SDL_KEYDOWN | 0x003 ;; Keyboard text input

SDL_KEYMAPCHANGED  := SDL_KEYDOWN | 0x004 ;; Keymap changed due to a system event such as an
                                          ;; input language or keyboard layout change.

;; SDL_render.h
SDL_RENDERER_SOFTWARE      := 0x00000001 ;; The renderer is a software fallback
SDL_RENDERER_ACCELERATED   := 0x00000002 ;; The renderer uses hardware acceleration
SDL_RENDERER_PRESENTVSYNC  := 0x00000004 ;; Present is synchronized with the refresh rate
SDL_RENDERER_TARGETTEXTURE := 0x00000008 ;; The renderer supports rendering to texture

;;  The SDL keyboard scancode representation.

SDL_SCANCODE_A     := 4
SDL_SCANCODE_D     := 7
SDL_SCANCODE_SPACE := 44
SDL_SCANCODE_RIGHT := 79
SDL_SCANCODE_LEFT  := 80

;; === SDL Functions ===========================================================

;;
;; Use this function to initialize the SDL library. This must be called before
;; using most other SDL functions.
;;
SDL_Init(flags) {
    return DllCall("SDL2\SDL_Init", "UInt", flags, "Int")
}

;;
;; Use this function to clean up all initialized subsystems. You should call it
;; upon all exit conditions.
;;
SDL_Quit() {
    DllCall("SDL2\SDL_Quit")
}

;;
;; Use this function to create a window with the specified position, dimensions,
;; and flags.
;;
SDL_CreateWindow(title, x, y, w, h, flags) {
    return DllCall("SDL2\SDL_CreateWindow", "Str", title, "Int", x, "Int", y
        , "Int", w, "Int", h, "UInt", flags, "Ptr")
}

;;
;; Use this function to retrieve a message about the last error that occurred.
;;
SDL_GetError() {
    return DllCall("SDL2\SDL_GetError", "AStr")
}

;;
;; Use this function to wait a specified number of milliseconds before returning.
;;
SDL_Delay(ms) {
    DllCall("SDL2\SDL_Delay", "UInt", ms)
}

;;
;; Use this function to copy the window surface to the screen.
;;
SDL_UpdateWindowSurface(window) {
    return DllCall("SDL2\SDL_UpdateWindowSurface", "Ptr", window, "Int")
}

;;
;; Use this function to poll for currently pending events.
;;
SDL_PollEvent(ByRef event) {
    return DllCall("SDL2\SDL_PollEvent", "Ptr", &event, "Int")
}

;;
;; Use this function to create a 2D rendering context for a window.
;;
SDL_CreateRenderer(window, index, flags) {
    return DllCall("SDL2\SDL_CreateRenderer", "Ptr", window, "Int", index, "UInt", flags, "Ptr")
}

;;
;; Use this function to destroy a window.
;;
SDL_DestroyWindow(window) {
    DllCall("SDL2\SDL_DestroyWindow", "Ptr", window)
}

;;
;; Use this function to set the color used for drawing operations
;; (Rect, Line and Clear).
;;
SDL_SetRenderDrawColor(renderer, r, g, b, a) {
    return DllCall("SDL2\SDL_SetRenderDrawColor", "Ptr", renderer
        , "UChar", r, "UChar", g, "UChar", b, "UChar", a, "Int")
}

;;
;; Use this function to clear the current rendering target with the drawing color.
;;
SDL_RenderClear(renderer) {
    return DllCall("SDL2\SDL_RenderClear", "Ptr", renderer, "Int")
}

;;
;; Use this function to fill a rectangle on the current rendering target with
;; the drawing color.
;;
SDL_RenderFillRect(renderer, rect) {
    return DllCall("SDL2\SDL_RenderFillRect", "Ptr", renderer, "Ptr", rect, "Int")
}

;;
;; Use this function to update the screen with any rendering performed since the
;; previous call.
;;
SDL_RenderPresent(renderer) {
    DllCall("SDL2\SDL_RenderPresent", "Ptr", renderer)
}

;;
;; Use this function to destroy the rendering context for a window and free
;; associated textures.
;;
SDL_DestroyRenderer(renderer) {
    DllCall("SDL2\SDL_DestroyRenderer", "Ptr", renderer)
}
