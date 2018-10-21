#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

## Intuition specific input event declarations (from devices module).

type
  IEPointerPixelPosition* {.bycopy.} = object
    x*: int16
    y*: int16
  IEPointerPixel* {.bycopy.} = object
    screen*: ptr Screen
    position*: IEPointerPixelPosition
