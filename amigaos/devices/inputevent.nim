#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  IECLASS_NULL* = 0x00000000
  IECLASS_RAWKEY* = 0x00000001
  IECLASS_RAWMOUSE* = 0x00000002
  IECLASS_EVENT* = 0x00000003
  IECLASS_POINTERPOS* = 0x00000004
  IECLASS_TIMER* = 0x00000006
  IECLASS_GADGETDOWN* = 0x00000007
  IECLASS_GADGETUP* = 0x00000008
  IECLASS_REQUESTER* = 0x00000009
  IECLASS_MENULIST* = 0x0000000A
  IECLASS_CLOSEWINDOW* = 0x0000000B
  IECLASS_SIZEWINDOW* = 0x0000000C
  IECLASS_REFRESHWINDOW* = 0x0000000D
  IECLASS_NEWPREFS* = 0x0000000E
  IECLASS_DISKREMOVED* = 0x0000000F
  IECLASS_DISKINSERTED* = 0x00000010
  IECLASS_ACTIVEWINDOW* = 0x00000011
  IECLASS_INACTIVEWINDOW* = 0x00000012
  IECLASS_NEWPOINTERPOS* = 0x00000013
  IECLASS_MENUHELP* = 0x00000014
  IECLASS_CHANGEWINDOW* = 0x00000015
  IECLASS_MAX* = 0x00000015
  IESUBCLASS_COMPATIBLE* = 0x00000000
  IESUBCLASS_PIXEL* = 0x00000001
  IESUBCLASS_TABLET* = 0x00000002
  IESUBCLASS_NEWTABLET* = 0x00000003

# IEPointerPixel type declaration moved to intuition module.

type
  IEPointerTabletRange* {.bycopy.} = object
    x*: uint16
    y*: uint16
  IEPointerTabletValue* {.bycopy.} = object
    x*: uint16
    y*: uint16
  IEPointerTablet* {.bycopy.} = object
    `range`*: IEPointerTabletRange
    value*: IEPointerTabletValue
    pressure*: int16

type
  IENewTablet* {.bycopy.} = object
    callBack*: ptr Hook
    scaledX*: uint16
    scaledY*: uint16
    scaledXFraction*: uint16
    scaledYFraction*: uint16
    tabletX*: uint32
    tabletY*: uint32
    rangeX*: uint32
    rangeY*: uint32
    tagList*: ptr TagItem

const
  IECODE_UP_PREFIX* = 0x00000080
  IECODE_KEY_CODE_FIRST* = 0x00000000
  IECODE_KEY_CODE_LAST* = 0x00000077
  IECODE_COMM_CODE_FIRST* = 0x00000078
  IECODE_COMM_CODE_LAST* = 0x0000007F
  IECODE_C0_FIRST* = 0x00000000
  IECODE_C0_LAST* = 0x0000001F
  IECODE_ASCII_FIRST* = 0x00000020
  IECODE_ASCII_LAST* = 0x0000007E
  IECODE_ASCII_DEL* = 0x0000007F
  IECODE_C1_FIRST* = 0x00000080
  IECODE_C1_LAST* = 0x0000009F
  IECODE_LATIN1_FIRST* = 0x000000A0
  IECODE_LATIN1_LAST* = 0x000000FF
  IECODE_LBUTTON* = 0x00000068
  IECODE_RBUTTON* = 0x00000069
  IECODE_MBUTTON* = 0x0000006A
  IECODE_NOBUTTON* = 0x000000FF
  IECODE_NEWACTIVE* = 0x00000001
  IECODE_NEWSIZE* = 0x00000002
  IECODE_REFRESH* = 0x00000003
  IECODE_REQSET* = 0x00000001
  IECODE_REQCLEAR* = 0x00000000

const
  IEQUALIFIER_LSHIFT* = 0x00000001
  IEQUALIFIER_RSHIFT* = 0x00000002
  IEQUALIFIER_CAPSLOCK* = 0x00000004
  IEQUALIFIER_CONTROL* = 0x00000008
  IEQUALIFIER_LALT* = 0x00000010
  IEQUALIFIER_RALT* = 0x00000020
  IEQUALIFIER_LCOMMAND* = 0x00000040
  IEQUALIFIER_RCOMMAND* = 0x00000080
  IEQUALIFIER_NUMERICPAD* = 0x00000100
  IEQUALIFIER_REPEAT* = 0x00000200
  IEQUALIFIER_INTERRUPT* = 0x00000400
  IEQUALIFIER_MULTIBROADCAST* = 0x00000800
  IEQUALIFIER_MIDBUTTON* = 0x00001000
  IEQUALIFIER_RBUTTON* = 0x00002000
  IEQUALIFIER_LEFTBUTTON* = 0x00004000
  IEQUALIFIER_RELATIVEMOUSE* = 0x00008000

const
  IEQUALIFIERB_LSHIFT* = 0
  IEQUALIFIERB_RSHIFT* = 1
  IEQUALIFIERB_CAPSLOCK* = 2
  IEQUALIFIERB_CONTROL* = 3
  IEQUALIFIERB_LALT* = 4
  IEQUALIFIERB_RALT* = 5
  IEQUALIFIERB_LCOMMAND* = 6
  IEQUALIFIERB_RCOMMAND* = 7
  IEQUALIFIERB_NUMERICPAD* = 8
  IEQUALIFIERB_REPEAT* = 9
  IEQUALIFIERB_INTERRUPT* = 10
  IEQUALIFIERB_MULTIBROADCAST* = 11
  IEQUALIFIERB_MIDBUTTON* = 12
  IEQUALIFIERB_RBUTTON* = 13
  IEQUALIFIERB_LEFTBUTTON* = 14
  IEQUALIFIERB_RELATIVEMOUSE* = 15

type
  InputEventPositionUnionXY* {.bycopy.} = object
    x*: int16
    y*: int16
  InputEventPositionUnionDead* {.bycopy.} = object
    prev1DownCode*: uint8
    prev1DownQual*: uint8
    prev2DownCode*: uint8
    prev2DownQual*: uint8
  InputEventPositionUnion* {.bycopy.} = object {.union.}
    xy*: InputEventPositionUnionXY
    `addr`*: pointer
    dead*: InputEventPositionUnionDead
  InputEvent* {.bycopy.} = object
    nextEvent*: ptr InputEvent
    class*: uint8
    subClass*: uint8
    code*: uint16
    qualifier*: uint16
    position*: InputEventPositionUnion
    timeStamp*: TimeVal

#const
#  ie_X* = ie_position.ie_xy.ie_x
#  ie_Y* = ie_position.ie_xy.ie_y
#  ie_EventAddress* = ie_position.ie_addr
#  ie_Prev1DownCode* = ie_position.ie_dead.ie_prev1DownCode
#  ie_Prev1DownQual* = ie_position.ie_dead.ie_prev1DownQual
#  ie_Prev2DownCode* = ie_position.ie_dead.ie_prev2DownCode
#  ie_Prev2DownQual* = ie_position.ie_dead.ie_prev2DownQual
