#Warn All

;; A simple game to test SDL bindings

#include SDL.ahk
#include SDL_Rect.ahk
#include SDL_Event.ahk

;; === Helper functions ========================================================

debug(msg) {
    v := Format("{1}", msg)
    OutputDebug, % v
}

die(msg) {
    global sdlModule
    MsgBox, % msg

    DllCall("FreeLibrary", "Ptr", sdlModule)
    ExitApp
}

; structToArray(struct, size, type, ByRef byteArray) {
;     i := 0
;     while (i < size) {
;         byteArray.push(NumGet(struct, i, type))
;         i := i + 1
;     }
; }

; printArray(array) {
;     str := ""
;     for i, v in array {
;         str .= Format("{1:d}: 0x{2:02x} ", i, v)
;     }
;     debug(str)
; }

;; -----------------------------------------------------------------------------

WIDTH   := 640
HEIGHT  := 480
SIZE    := 200
SPEED   := 600
GRAVITY := 60
FPS     := 60
JUMP    := -1200

sdlModule := DllCall("LoadLibrary", "Str", "SDL2.dll", "UPtr")
if (! sdlModule) {
    die("LoadLibrary DLL call failed with windows error code: " A_LastError)
}

if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_TIMER | SDL_INIT_EVENTS) < 0) {
    err := SDL_GetError()
    MsgBox, , Error, Failed to initialize SDL err=%err%
    ExitApp, 1
}

;; create a window

window := SDL_CreateWindow("SDL2 Window", SDL_WINDOWPOS_CENTERED
    , SDL_WINDOWPOS_CENTERED, 680, 480, 0)

if (!window) {
    die("Failed to create window " . SDL_GetError())
}

; window_surface = SDL_GetWindowSurface(window)
; if (!window_surface) {
;     die("Failed to get the surface from the window" . SDL_GetError())
; }


;; Create a renderer
rend := SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC)
if (!rend) {
    debug("Error creating renderer: " . SDL_GetError())
    SDL_DestroyWindow(window)
    SDL_Quit()
    exit 1
}

;; main loop

debug("Start")

running       := true
jump_pressed  := false
can_jump      := true
left_pressed  := false
right_pressed := false

x_pos := (WIDTH-SIZE)/2
y_pos := (HEIGHT-SIZE)/2
x_vel := 0
y_vel := 0

SDL_Rect_Init(rect, x_pos, y_pos, SIZE, SIZE)

SDL_Event_Init(event)

running := true
while (running) {

    while (SDL_PollEvent(event) > 0) {

        switch (SDL_Event_GetType(event)) {
            case SDL_QUIT:
                debug("SDL_QUIT")
                running := false

            case SDL_KEYDOWN:
                switch (SDL_Event_GetScancode(event)) {
                    case SDL_SCANCODE_SPACE:
                        jump_pressed := true
                        debug("jump_pressed")

                    case SDL_SCANCODE_A, SDL_SCANCODE_LEFT:
                        left_pressed := true
                        debug("left_pressed")

                    case SDL_SCANCODE_D, SDL_SCANCODE_RIGHT:
                        right_pressed := true
                        debug("right_pressed")
                }

            case SDL_KEYUP:
                switch (SDL_Event_GetScancode(event)) {
                    case SDL_SCANCODE_SPACE:
                        jump_pressed := false

                    case SDL_SCANCODE_A, SDL_SCANCODE_LEFT:
                        left_pressed := false

                    case SDL_SCANCODE_D, SDL_SCANCODE_RIGHT:
                        right_pressed := false
                }
        }
    }

    ;; Clear screen
    SDL_SetRenderDrawColor(rend, 0, 0, 0, 255)
    SDL_RenderClear(rend)

    ;; Move the rectangle
    x_vel := (right_pressed - left_pressed)*SPEED
    y_vel += GRAVITY

    if (jump_pressed && can_jump) {
        can_jump := false
        y_vel := JUMP
    }

    x_pos += x_vel / 60
    y_pos += y_vel / 60

    if (x_pos <= 0) {
        x_pos := 0
    }

    rect_w := SDL_Rect_GetW(rect)
    ;; debug(Format("rect_w = {1} w = {2}", rect_w, rectObj.w))

    if (x_pos >= WIDTH - rect_w) {
        x_pos := WIDTH - rect_w
    }

    if (y_pos <= 0) {
        y_pos := 0
    }

    rect_h := SDL_Rect_GetH(rect)

    ;;debug(Format("rect_h = {1} h = {2}", rect_h, rectObj.h))


    if (y_pos >= HEIGHT - rect_h) {
        y_pos := HEIGHT - rect_h
        y_vel := 0

        if (!jump_pressed) {
            can_jump := true
        }
    }

    ;;debug(Format("x={1} y={2}", x_pos, y_pos))

    SDL_Rect_SetX(rect, x_pos)
    SDL_Rect_SetY(rect, y_pos)

    ;; Draw the rectangle

    SDL_SetRenderDrawColor(rend, 255, 0, 0, 255)
    SDL_RenderFillRect(rend, &rect)

    ;; Draw to window and loop

    SDL_RenderPresent(rend)

    SDL_Delay(1000/FPS)
}

;; Release resources

SDL_DestroyRenderer(rend)
SDL_DestroyWindow(window)
SDL_Quit()

DllCall("FreeLibrary", "Ptr", sdlModule)
