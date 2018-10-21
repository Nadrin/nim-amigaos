#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

# StringExtend type declaration moved to intuition.nim file.

type
  SGWork* {.bycopy.} = object
    gadget*: ptr Gadget
    stringInfo*: ptr StringInfo
    workBuffer*: ptr uint8
    prevBuffer*: ptr uint8
    modes*: uint32
    ievent*: ptr InputEvent
    code*: uint16
    bufferPos*: int16
    numChars*: int16
    actions*: uint32
    longInt*: int32
    gadgetInfo*: ptr GadgetInfo
    editOp*: uint16

const
  EO_NOOP* = (0x00000001)
  EO_DELBACKWARD* = (0x00000002)
  EO_DELFORWARD* = (0x00000003)
  EO_MOVECURSOR* = (0x00000004)
  EO_ENTER* = (0x00000005)
  EO_RESET* = (0x00000006)
  EO_REPLACECHAR* = (0x00000007)
  EO_INSERTCHAR* = (0x00000008)
  EO_BADFORMAT* = (0x00000009)
  EO_BIGCHANGE* = (0x0000000A)
  EO_UNDO* = (0x0000000B)
  EO_CLEAR* = (0x0000000C)
  EO_SPECIAL* = (0x0000000D)

const
  SGM_REPLACE* = (1 shl 0)
  SGM_FIXEDFIELD* = (1 shl 1)
  SGM_NOFILTER* = (1 shl 2)
  SGM_EXITHELP* = (1 shl 7)
  SGM_NOCHANGE* = (1 shl 3)
  SGM_NOWORKB* = (1 shl 4)
  SGM_CONTROL* = (1 shl 5)
  SGM_int32INT* = (1 shl 6)

const
  SGA_USE* = (0x00000001)
  SGA_END* = (0x00000002)
  SGA_BEEP* = (0x00000004)
  SGA_REUSE* = (0x00000008)
  SGA_REDISPLAY* = (0x00000010)
  SGA_NEXTACTIVE* = (0x00000020)
  SGA_PREVACTIVE* = (0x00000040)

const
  SGH_KEY* = (1)
  SGH_CLICK* = (2)
