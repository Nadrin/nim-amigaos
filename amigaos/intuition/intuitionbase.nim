#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  DMODECOUNT* = 0x00000002
  HIRESPICK* = 0x00000000
  LOWRESPICK* = 0x00000001

const
  EVENTMAX* = 10

const
  RESCOUNT* = 2
  HIRESGADGET* = 0
  LOWRESGADGET* = 1
  GADGETCOUNT* = 8
  UPFRONTGADGET* = 0
  DOWNBACKGADGET* = 1
  SIZEGADGET* = 2
  CLOSEGADGET* = 3
  DRAGGADGET* = 4
  SUPFRONTGADGET* = 5
  SDOWNBACKGADGET* = 6
  SDRAGGADGET* = 7

type
  IntuitionBase* {.bycopy.} = object
    libNode*: Library
    viewLord*: View
    activeWindow*: ptr Window
    activeScreen*: ptr Screen
    firstScreen*: ptr Screen
    flags*: uint32
    mouseY*: int16
    mouseX*: int16
    seconds*: uint32
    micros*: uint32
