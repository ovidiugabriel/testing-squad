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

; SDL_AddEventWatch
; SDL_AddHintCallback
; SDL_AddTimer
; SDL_AllocFormat
; SDL_AllocPalette
; SDL_AllocRW
; SDL_AtomicAdd
; SDL_AtomicCAS
; SDL_AtomicCASPtr
; SDL_AtomicGet
; SDL_AtomicGetPtr
; SDL_AtomicLock
; SDL_AtomicSet
; SDL_AtomicSetPtr
; SDL_AtomicTryLock
; SDL_AtomicUnlock
; SDL_AudioInit
; SDL_AudioQuit
; SDL_AudioStreamAvailable
; SDL_AudioStreamClear
; SDL_AudioStreamFlush
; SDL_AudioStreamGet
; SDL_AudioStreamPut
; SDL_BuildAudioCVT
; SDL_CalculateGammaRamp
; SDL_CaptureMouse
; SDL_ClearError
; SDL_ClearHints
; SDL_ClearQueuedAudio
; SDL_CloseAudio
; SDL_CloseAudioDevice
; SDL_ComposeCustomBlendMode
; SDL_CondBroadcast
; SDL_CondSignal
; SDL_CondWait
; SDL_CondWaitTimeout
; SDL_ConvertAudio
; SDL_ConvertPixels
; SDL_ConvertSurface
; SDL_ConvertSurfaceFormat
; SDL_CreateColorCursor
; SDL_CreateCond
; SDL_CreateCursor
; SDL_CreateMutex
; SDL_CreateRGBSurface
; SDL_CreateRGBSurfaceFrom
; SDL_CreateRGBSurfaceWithFormat
; SDL_CreateRGBSurfaceWithFormatFrom

;;
;; Use this function to create a 2D rendering context for a window.
;;
SDL_CreateRenderer(window, index, flags) {
    return DllCall("SDL2\SDL_CreateRenderer", "Ptr", window, "Int", index, "UInt", flags, "Ptr")
}

; SDL_CreateSemaphore
; SDL_CreateShapedWindow
; SDL_CreateSoftwareRenderer
; SDL_CreateSystemCursor
; SDL_CreateTexture
; SDL_CreateTextureFromSurface
; SDL_CreateThread
; SDL_CreateThreadWithStackSize

;;
;; Use this function to create a window with the specified position, dimensions,
;; and flags.
;;
SDL_CreateWindow(title, x, y, w, h, flags) {
    return DllCall("SDL2\SDL_CreateWindow", "AStr", title, "Int", x, "Int", y
        , "Int", w, "Int", h, "UInt", flags, "Ptr")
}

; SDL_CreateWindowAndRenderer
; SDL_CreateWindowFrom
; SDL_DXGIGetOutputInfo
; SDL_DYNAPI_entry
; SDL_DelEventWatch
; SDL_DelHintCallback

;;
;; Use this function to wait a specified number of milliseconds before returning.
;;
SDL_Delay(ms) {
    DllCall("SDL2\SDL_Delay", "UInt", ms)
}

; SDL_DequeueAudio
; SDL_DestroyCond
; SDL_DestroyMutex

;;
;; Use this function to destroy the rendering context for a window and free
;; associated textures.
;;
SDL_DestroyRenderer(renderer) {
    DllCall("SDL2\SDL_DestroyRenderer", "Ptr", renderer)
}

; SDL_DestroySemaphore
; SDL_DestroyTexture

;;
;; Use this function to destroy a window.
;;
SDL_DestroyWindow(window) {
    DllCall("SDL2\SDL_DestroyWindow", "Ptr", window)
}

; SDL_DetachThread
; SDL_DirectGetAdapterIndex
; SDL_DisableScreenSaver
; SDL_DuplicateSurface
; SDL_EnableScreenSaver
; SDL_EnclosePoints
; SDL_Error
; SDL_EventState

;;
;; Use this function to fill a rectangle on the current rendering target with
;; the drawing color.
;;
SDL_RenderFillRect(renderer, rect) {
    return DllCall("SDL2\SDL_RenderFillRect", "Ptr", renderer, "Ptr", rect, "Int")
}

; SDL_FillRects
; SDL_FilterEvents
; SDL_FlushEvent
; SDL_FlushEvents
; SDL_FreeAudioStream
; SDL_FreeCursor
; SDL_FreeFormat
; SDL_FreePalette
; SDL_FreeRW
; SDL_FreeSurface
; SDL_FreeWAV
; SDL_GL_BindTexture
; SDL_GL_CreateContext
; SDL_GL_DeleteContext
; SDL_GL_ExtensionSupported
; SDL_GL_GetAttribute
; SDL_GL_GetCurrentContext
; SDL_GL_GetCurrentWindow
; SDL_GL_GetDrawableSize
; SDL_GL_GetProcAddress
; SDL_GL_GetSwapInterval
; SDL_GL_LoadLibrary
; SDL_GL_MakeCurrent
; SDL_GL_ResetAttributes
; SDL_GL_SetAttribute
; SDL_GL_SetSwapInterval
; SDL_GL_SwapWindow
; SDL_GL_UnbindTexture
; SDL_GL_UnloadLibrary
; SDL_GameControllerAddMapping
; SDL_GameControllerAddMappingsFromRW
; SDL_GameControllerClose
; SDL_GameControllerEventState
; SDL_GameControllerFromInstanceID
; SDL_GameControllerFromPlayerIndex
; SDL_GameControllerGetAttached
; SDL_GameControllerGetAxis
; SDL_GameControllerGetAxisFromString
; SDL_GameControllerGetBindForAxis
; SDL_GameControllerGetBindForButton
; SDL_GameControllerGetButton
; SDL_GameControllerGetButtonFromString
; SDL_GameControllerGetJoystick
; SDL_GameControllerGetNumTouchpadFingers
; SDL_GameControllerGetNumTouchpads
; SDL_GameControllerGetPlayerIndex
; SDL_GameControllerGetProduct
; SDL_GameControllerGetProductVersion
; SDL_GameControllerGetSensorData
; SDL_GameControllerGetSerial
; SDL_GameControllerGetStringForAxis
; SDL_GameControllerGetStringForButton
; SDL_GameControllerGetTouchpadFinger
; SDL_GameControllerGetType
; SDL_GameControllerGetVendor
; SDL_GameControllerHasAxis
; SDL_GameControllerHasButton
; SDL_GameControllerHasLED
; SDL_GameControllerHasSensor
; SDL_GameControllerIsSensorEnabled
; SDL_GameControllerMapping
; SDL_GameControllerMappingForDeviceIndex
; SDL_GameControllerMappingForGUID
; SDL_GameControllerMappingForIndex
; SDL_GameControllerName
; SDL_GameControllerNameForIndex
; SDL_GameControllerNumMappings
; SDL_GameControllerOpen
; SDL_GameControllerRumble
; SDL_GameControllerRumbleTriggers
; SDL_GameControllerSetLED
; SDL_GameControllerSetPlayerIndex
; SDL_GameControllerSetSensorEnabled
; SDL_GameControllerTypeForIndex
; SDL_GameControllerUpdate
; SDL_GetAssertionHandler
; SDL_GetAssertionReport
; SDL_GetAudioDeviceName
; SDL_GetAudioDeviceStatus
; SDL_GetAudioDriver
; SDL_GetAudioStatus
; SDL_GetBasePath
; SDL_GetCPUCacheLineSize
; SDL_GetCPUCount
; SDL_GetClipRect
; SDL_GetClipboardText
; SDL_GetClosestDisplayMode
; SDL_GetColorKey
; SDL_GetCurrentAudioDriver
; SDL_GetCurrentDisplayMode
; SDL_GetCurrentVideoDriver
; SDL_GetCursor
; SDL_GetDefaultAssertionHandler
; SDL_GetDefaultCursor
; SDL_GetDesktopDisplayMode
; SDL_GetDisplayBounds
; SDL_GetDisplayDPI
; SDL_GetDisplayMode
; SDL_GetDisplayName
; SDL_GetDisplayOrientation
; SDL_GetDisplayUsableBounds

;;
;; Use this function to retrieve a message about the last error that occurred.
;;
SDL_GetError() {
    return DllCall("SDL2\SDL_GetError", "AStr")
}

; SDL_GetErrorMsg
; SDL_GetEventFilter
; SDL_GetGlobalMouseState
; SDL_GetGrabbedWindow
; SDL_GetHint
; SDL_GetHintBoolean
; SDL_GetKeyFromName
; SDL_GetKeyFromScancode
; SDL_GetKeyName
; SDL_GetKeyboardFocus
; SDL_GetKeyboardState
; SDL_GetMemoryFunctions
; SDL_GetModState
; SDL_GetMouseFocus
; SDL_GetMouseState
; SDL_GetNumAllocations
; SDL_GetNumAudioDevices
; SDL_GetNumAudioDrivers
; SDL_GetNumDisplayModes
; SDL_GetNumRenderDrivers
; SDL_GetNumTouchDevices
; SDL_GetNumTouchFingers
; SDL_GetNumVideoDisplays
; SDL_GetNumVideoDrivers
; SDL_GetPerformanceCounter
; SDL_GetPerformanceFrequency
; SDL_GetPixelFormatName
; SDL_GetPlatform
; SDL_GetPowerInfo
; SDL_GetPrefPath
; SDL_GetPreferredLocales
; SDL_GetQueuedAudioSize
; SDL_GetRGB
; SDL_GetRGBA
; SDL_GetRelativeMouseMode
; SDL_GetRelativeMouseState
; SDL_GetRenderDrawBlendMode

;;
;; Use this function to set the color used for drawing operations
;; (Rect, Line and Clear).
;;
SDL_SetRenderDrawColor(renderer, r, g, b, a) {
    return DllCall("SDL2\SDL_SetRenderDrawColor", "Ptr", renderer
        , "UChar", r, "UChar", g, "UChar", b, "UChar", a, "Int")
}

; SDL_GetRenderDriverInfo
; SDL_GetRenderTarget
; SDL_GetRenderer
; SDL_GetRendererInfo
; SDL_GetRendererOutputSize
; SDL_GetRevision
; SDL_GetRevisionNumber
; SDL_GetScancodeFromKey
; SDL_GetScancodeFromName
; SDL_GetScancodeName
; SDL_GetShapedWindowMode
; SDL_GetSurfaceAlphaMod
; SDL_GetSurfaceBlendMode
; SDL_GetSurfaceColorMod
; SDL_GetSystemRAM
; SDL_GetTextureAlphaMod
; SDL_GetTextureBlendMode
; SDL_GetTextureColorMod
; SDL_GetTextureScaleMode
; SDL_GetThreadID
; SDL_GetThreadName
; SDL_GetTicks
; SDL_GetTouchDevice
; SDL_GetTouchDeviceType
; SDL_GetTouchFinger
; SDL_GetVersion
; SDL_GetVideoDriver
; SDL_GetWindowBordersSize
; SDL_GetWindowBrightness
; SDL_GetWindowData
; SDL_GetWindowDisplayIndex
; SDL_GetWindowDisplayMode
; SDL_GetWindowFlags
; SDL_GetWindowFromID
; SDL_GetWindowGammaRamp
; SDL_GetWindowGrab
; SDL_GetWindowID
; SDL_GetWindowMaximumSize
; SDL_GetWindowMinimumSize
; SDL_GetWindowOpacity
; SDL_GetWindowPixelFormat
; SDL_GetWindowPosition
; SDL_GetWindowSize
; SDL_GetWindowSurface
; SDL_GetWindowTitle
; SDL_GetWindowWMInfo
; SDL_GetYUVConversionMode
; SDL_GetYUVConversionModeForResolution
; SDL_HapticClose
; SDL_HapticDestroyEffect
; SDL_HapticEffectSupported
; SDL_HapticGetEffectStatus
; SDL_HapticIndex
; SDL_HapticName
; SDL_HapticNewEffect
; SDL_HapticNumAxes
; SDL_HapticNumEffects
; SDL_HapticNumEffectsPlaying
; SDL_HapticOpen
; SDL_HapticOpenFromJoystick
; SDL_HapticOpenFromMouse
; SDL_HapticOpened
; SDL_HapticPause
; SDL_HapticQuery
; SDL_HapticRumbleInit
; SDL_HapticRumblePlay
; SDL_HapticRumbleStop
; SDL_HapticRumbleSupported
; SDL_HapticRunEffect
; SDL_HapticSetAutocenter
; SDL_HapticSetGain
; SDL_HapticStopAll
; SDL_HapticStopEffect
; SDL_HapticUnpause
; SDL_HapticUpdateEffect
; SDL_HasNow
; SDL_HasARMSIMD
; SDL_HasAVX
; SDL_HasAVXSDL_HasAVXSDL_HasAltiVec
; SDL_HasClipboardText
; SDL_HasColorKey
; SDL_HasEvent
; SDL_HasEvents
; SDL_HasIntersection
; SDL_HasMMX
; SDL_HasNEON
; SDL_HasRDTSC
; SDL_HasSSE
; SDL_HasSSESDL_HasSSESDL_HasSSESDL_HasSSESDL_HasScreenKeyboardSupport
; SDL_HasSurfaceRLE
; SDL_HideWindow

;;
;; Use this function to initialize the SDL library. This must be called before
;; using most other SDL functions.
;;
SDL_Init(flags) {
    return DllCall("SDL2\SDL_Init", "UInt", flags, "Int")
}

; SDL_InitSubSystem
; SDL_IntersectRect
; SDL_IntersectRectAndLine
; SDL_IsGameController
; SDL_IsScreenKeyboardShown
; SDL_IsScreenSaverEnabled
; SDL_IsShapedWindow
; SDL_IsTablet
; SDL_IsTextInputActive
; SDL_JoystickAttachVirtual
; SDL_JoystickClose
; SDL_JoystickCurrentPowerLevel
; SDL_JoystickDetachVirtual
; SDL_JoystickEventState
; SDL_JoystickFromInstanceID
; SDL_JoystickFromPlayerIndex
; SDL_JoystickGetAttached
; SDL_JoystickGetAxis
; SDL_JoystickGetAxisInitialState
; SDL_JoystickGetBall
; SDL_JoystickGetButton
; SDL_JoystickGetDeviceGUID
; SDL_JoystickGetDeviceInstanceID
; SDL_JoystickGetDevicePlayerIndex
; SDL_JoystickGetDeviceProduct
; SDL_JoystickGetDeviceProductVersion
; SDL_JoystickGetDeviceType
; SDL_JoystickGetDeviceVendor
; SDL_JoystickGetGUID
; SDL_JoystickGetGUIDFromString
; SDL_JoystickGetGUIDString
; SDL_JoystickGetHat
; SDL_JoystickGetPlayerIndex
; SDL_JoystickGetProduct
; SDL_JoystickGetProductVersion
; SDL_JoystickGetSerial
; SDL_JoystickGetType
; SDL_JoystickGetVendor
; SDL_JoystickHasLED
; SDL_JoystickInstanceID
; SDL_JoystickIsHaptic
; SDL_JoystickIsVirtual
; SDL_JoystickName
; SDL_JoystickNameForIndex
; SDL_JoystickNumAxes
; SDL_JoystickNumBalls
; SDL_JoystickNumButtons
; SDL_JoystickNumHats
; SDL_JoystickOpen
; SDL_JoystickRumble
; SDL_JoystickRumbleTriggers
; SDL_JoystickSetLED
; SDL_JoystickSetPlayerIndex
; SDL_JoystickSetVirtualAxis
; SDL_JoystickSetVirtualButton
; SDL_JoystickSetVirtualHat
; SDL_JoystickUpdate
; SDL_LoadBMP_RW
; SDL_LoadDollarTemplates
; SDL_LoadFile
; SDL_LoadFile_RW
; SDL_LoadFunction
; SDL_LoadObject
; SDL_LoadWAV_RW
; SDL_LockAudio
; SDL_LockAudioDevice
; SDL_LockJoysticks
; SDL_LockMutex
; SDL_LockSensors
; SDL_LockSurface
; SDL_LockTexture
; SDL_LockTextureToSurface
; SDL_Log
; SDL_LogCritical
; SDL_LogDebug
; SDL_LogError
; SDL_LogGetOutputFunction
; SDL_LogGetPriority
; SDL_LogInfo
; SDL_LogMessage
; SDL_LogMessageV
; SDL_LogResetPriorities
; SDL_LogSetAllPriority
; SDL_LogSetOutputFunction
; SDL_LogSetPriority
; SDL_LogVerbose
; SDL_LogWarn
; SDL_LowerBlit
; SDL_LowerBlitScaled
; SDL_MapRGB
; SDL_MapRGBA
; SDL_MasksToPixelFormatEnum
; SDL_MaximizeWindow
; SDL_MemoryBarrierAcquireFunction
; SDL_MemoryBarrierReleaseFunction
; SDL_Metal_CreateView
; SDL_Metal_DestroyView
; SDL_Metal_GetDrawableSize
; SDL_Metal_GetLayer
; SDL_MinimizeWindow
; SDL_MixAudio
; SDL_MixAudioFormat
; SDL_MouseIsHaptic
; SDL_NewAudioStream
; SDL_NumHaptics
; SDL_NumJoysticks
; SDL_NumSensors
; SDL_OnApplicationDidBecomeActive
; SDL_OnApplicationDidEnterBackground
; SDL_OnApplicationDidReceiveMemoryWarning
; SDL_OnApplicationWillEnterForeground
; SDL_OnApplicationWillResignActive
; SDL_OnApplicationWillTerminate
; SDL_OpenAudio
; SDL_OpenAudioDevice
; SDL_OpenURL
; SDL_PauseAudio
; SDL_PauseAudioDevice
; SDL_PeepEvents
; SDL_PixelFormatEnumToMasks

;;
;; Use this function to poll for currently pending events.
;;
SDL_PollEvent(ByRef event) {
    return DllCall("SDL2\SDL_PollEvent", "Ptr", &event, "Int")
}

; SDL_PumpEvents
; SDL_PushEvent
; SDL_QueryTexture
; SDL_QueueAudio

;;
;; Use this function to clean up all initialized subsystems. You should call it
;; upon all exit conditions.
;;
SDL_Quit() {
    DllCall("SDL2\SDL_Quit")
}

; SDL_QuitSubSystem
; SDL_RWFromConstMem
; SDL_RWFromFP
; SDL_RWFromFile
; SDL_RWFromMem
; SDL_RWclose
; SDL_RWread
; SDL_RWseek
; SDL_RWsize
; SDL_RWtell
; SDL_RWwrite
; SDL_RaiseWindow
; SDL_ReadBESDL_ReadBESDL_ReadBESDL_ReadLESDL_ReadLESDL_ReadLESDL_ReadUSDL_RecordGesture
; SDL_RegisterApp
; SDL_RegisterEvents
; SDL_RemoveTimer

;;
;; Use this function to clear the current rendering target with the drawing color.
;;
SDL_RenderClear(renderer) {
    return DllCall("SDL2\SDL_RenderClear", "Ptr", renderer, "Int")
}

; SDL_RenderCopy
; SDL_RenderCopyEx
; SDL_RenderCopyExF
; SDL_RenderCopyF
; SDL_RenderDrawLine
; SDL_RenderDrawLineF
; SDL_RenderDrawLines
; SDL_RenderDrawLinesF
; SDL_RenderDrawPoint
; SDL_RenderDrawPointF
; SDL_RenderDrawPoints
; SDL_RenderDrawPointsF
; SDL_RenderDrawRect
; SDL_RenderDrawRectF
; SDL_RenderDrawRects
; SDL_RenderDrawRectsF
; SDL_RenderFillRect
; SDL_RenderFillRectF
; SDL_RenderFillRects
; SDL_RenderFillRectsF
; SDL_RenderFlush
; SDL_RenderGetClipRect
; SDL_RenderGetDvice
; SDL_RenderGetIntegerScale
; SDL_RenderGetLogicalSize
; SDL_RenderGetMetalCommandEncoder
; SDL_RenderGetMetalLayer
; SDL_RenderGetScale
; SDL_RenderGetViewport
; SDL_RenderIsClipEnabled

;;
;; Use this function to update the screen with any rendering performed since the
;; previous call.
;;
SDL_RenderPresent(renderer) {
    DllCall("SDL2\SDL_RenderPresent", "Ptr", renderer)
}

; SDL_RenderReadPixels
; SDL_RenderSetClipRect
; SDL_RenderSetIntegerScale
; SDL_RenderSetLogicalSize
; SDL_RenderSetScale
; SDL_RenderSetViewport
; SDL_RenderTargetSupported
; SDL_ReportAssertion
; SDL_ResetAssertionReport
; SDL_RestoreWindow
; SDL_SIMDAlloc
; SDL_SIMDFree
; SDL_SIMDGetAlignment
; SDL_SIMDRealloc
; SDL_SaveAllDollarTemplates
; SDL_SaveBMP_RW
; SDL_SaveDollarTemplate
; SDL_SemPost
; SDL_SemTryWait
; SDL_SemValue
; SDL_SemWait
; SDL_SemWaitTimeout
; SDL_SensorClose
; SDL_SensorFromInstanceID
; SDL_SensorGetData
; SDL_SensorGetDeviceInstanceID
; SDL_SensorGetDeviceName
; SDL_SensorGetDeviceNonPortableType
; SDL_SensorGetDeviceType
; SDL_SensorGetInstanceID
; SDL_SensorGetName
; SDL_SensorGetNonPortableType
; SDL_SensorGetType
; SDL_SensorOpen
; SDL_SensorUpdate
; SDL_SetAssertionHandler
; SDL_SetClipRect
; SDL_SetClipboardText
; SDL_SetColorKey
; SDL_SetCursor
; SDL_SetError
; SDL_SetEventFilter
; SDL_SetHint
; SDL_SetHintWithPriority
; SDL_SetMainReady
; SDL_SetMemoryFunctions
; SDL_SetModState
; SDL_SetPaletteColors
; SDL_SetPixelFormatPalette
; SDL_SetRelativeMouseMode
; SDL_SetRenderDrawBlendMode
; SDL_SetRenderDrawColor
; SDL_SetRenderTarget
; SDL_SetSurfaceAlphaMod
; SDL_SetSurfaceBlendMode
; SDL_SetSurfaceColorMod
; SDL_SetSurfacePalette
; SDL_SetSurfaceRLE
; SDL_SetTextInputRect
; SDL_SetTextureAlphaMod
; SDL_SetTextureBlendMode
; SDL_SetTextureColorMod
; SDL_SetTextureScaleMode
; SDL_SetThreadPriority
; SDL_SetWindowBordered
; SDL_SetWindowBrightness
; SDL_SetWindowData
; SDL_SetWindowDisplayMode
; SDL_SetWindowFullscreen
; SDL_SetWindowGammaRamp
; SDL_SetWindowGrab
; SDL_SetWindowHitTest
; SDL_SetWindowIcon
; SDL_SetWindowInputFocus
; SDL_SetWindowMaximumSize
; SDL_SetWindowMinimumSize
; SDL_SetWindowModalFor
; SDL_SetWindowOpacity
; SDL_SetWindowPosition
; SDL_SetWindowResizable
; SDL_SetWindowShape
; SDL_SetWindowSize
; SDL_SetWindowTitle
; SDL_SetWindowsMessageHook
; SDL_SetYUVConversionMode
; SDL_ShowCursor
; SDL_ShowMessageBox
; SDL_ShowSimpleMessageBox
; SDL_ShowWindow
; SDL_SoftStretch
; SDL_StartTextInput
; SDL_StopTextInput
; SDL_TLSCreate
; SDL_TLSGet
; SDL_TLSSet
; SDL_ThreadID
; SDL_TryLockMutex
; SDL_UnionRect
; SDL_UnloadObject
; SDL_UnlockAudio
; SDL_UnlockAudioDevice
; SDL_UnlockJoysticks
; SDL_UnlockMutex
; SDL_UnlockSensors
; SDL_UnlockSurface
; SDL_UnlockTexture
; SDL_UnregisterApp
; SDL_UpdateTexture

;;
;; Use this function to copy the window surface to the screen.
;;
SDL_UpdateWindowSurface(window) {
    return DllCall("SDL2\SDL_UpdateWindowSurface", "Ptr", window, "Int")
}

; SDL_UpdateWindowSurfaceRects
; SDL_UpdateYUVTexture
; SDL_UpperBlit
; SDL_UpperBlitScaled
; SDL_VideoInit
; SDL_VideoQuit
; SDL_Vulkan_CreateSurface
; SDL_Vulkan_GetDrawableSize
; SDL_Vulkan_GetInstanceExtensions
; SDL_Vulkan_GetVkGetInstanceProcAddr
; SDL_Vulkan_LoadLibrary
; SDL_Vulkan_UnloadLibrary
; SDL_WaitEvent
; SDL_WaitEventTimeout
; SDL_WaitThread
; SDL_WarpMouseGlobal
; SDL_WarpMouseInWindow
; SDL_WasInit
; SDL_WriteBESDL_WriteBESDL_WriteBESDL_WriteLESDL_WriteLESDL_WriteLESDL_WriteUSDL_abs
; SDL_acos
; SDL_acosf
; SDL_asin
; SDL_asinf
; SDL_atan
; SDL_atanSDL_atanSDL_atanf
; SDL_atof
; SDL_atoi
; SDL_calloc
; SDL_ceil
; SDL_ceilf
; SDL_copysign
; SDL_copysignf
; SDL_cos
; SDL_cosf
; SDL_crcSDL_exp
; SDL_expf
; SDL_fabs
; SDL_fabsf
; SDL_floor
; SDL_floorf
; SDL_fmod
; SDL_fmodf
; SDL_free
; SDL_getenv
; SDL_iconv
; SDL_iconv_close
; SDL_iconv_open
; SDL_iconv_string
; SDL_isdigit
; SDL_islower
; SDL_isspace
; SDL_isupper
; SDL_itoa
; SDL_lltoa
; SDL_log
; SDL_logSDL_logSDL_logf
; SDL_ltoa
; SDL_malloc
; SDL_memcmp
; SDL_memcpy
; SDL_memmove
; SDL_memset
; SDL_pow
; SDL_powf
; SDL_qsort
; SDL_realloc
; SDL_scalbn
; SDL_scalbnf
; SDL_setenv
; SDL_sin
; SDL_sinf
; SDL_snprintf
; SDL_sqrt
; SDL_sqrtf
; SDL_sscanf
; SDL_strcasecmp
; SDL_strchr
; SDL_strcmp
; SDL_strdup
; SDL_strlcat
; SDL_strlcpy
; SDL_strlen
; SDL_strlwr
; SDL_strncasecmp
; SDL_strncmp
; SDL_strrchr
; SDL_strrev
; SDL_strstr
; SDL_strtod
; SDL_strtokr
; SDL_strtol
; SDL_strtoll
; SDL_strtoul
; SDL_strtoull
; SDL_strupr
; SDL_tan
; SDL_tanf
; SDL_tolower
; SDL_toupper
; SDL_trunc
; SDL_truncf
; SDL_uitoa
; SDL_ulltoa
; SDL_ultoa
; SDL_utf8strlcpy
; SDL_utf8strlen
; SDL_vsnprintf
; SDL_vsscanf
; SDL_wcscasecmp
; SDL_wcscmp
; SDL_wcsdup
; SDL_wcslcat
; SDL_wcslcpy
; SDL_wcslen
; SDL_wcsncasecmp
; SDL_wcsncmp
; SDL_wcsstr
