#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type DisplayInfoHandle* = distinct pointer

const
  DTAG_DISP* = 0x80000000
  DTAG_DIMS* = 0x80001000
  DTAG_MNTR* = 0x80002000
  DTAG_NAME* = 0x80003000
  DTAG_VEC* = 0x80004000

type
  QueryHeader* {.bycopy.} = object
    structID*: uint32
    displayID*: uint32
    skipID*: uint32
    length*: uint32

  DisplayInfo* {.bycopy.} = object
    header*: QueryHeader
    notAvailable*: uint16
    propertyFlags*: uint32
    resolution*: Point
    pixelSpeed*: uint16
    numStdSprites*: uint16
    paletteRange*: uint16
    spriteResolution*: Point
    pad: array[4, uint8]
    redBits*: uint8
    greenBits*: uint8
    blueBits*: uint8
    pad2: array[5, uint8]
    reserved: array[2, uint32]

const
  DI_AVAIL_NOCHIPS* = 0x00000001
  DI_AVAIL_NOMONITOR* = 0x00000002
  DI_AVAIL_NOTWITHGENLOCK* = 0x00000004

const
  DIPF_IS_LACE* = 0x00000001
  DIPF_IS_DUALPF* = 0x00000002
  DIPF_IS_PF2PRI* = 0x00000004
  DIPF_IS_HAM* = 0x00000008
  DIPF_IS_ECS* = 0x00000010
  DIPF_IS_AA* = 0x00010000
  DIPF_IS_PAL* = 0x00000020
  DIPF_IS_SPRITES* = 0x00000040
  DIPF_IS_GENLOCK* = 0x00000080
  DIPF_IS_WB* = 0x00000100
  DIPF_IS_DRAGGABLE* = 0x00000200
  DIPF_IS_PANELLED* = 0x00000400
  DIPF_IS_BEAMSYNC* = 0x00000800
  DIPF_IS_EXTRAHALFBRITE* = 0x00001000
  DIPF_IS_SPRITES_ATT* = 0x00002000
  DIPF_IS_SPRITES_CHNG_RES* = 0x00004000
  DIPF_IS_SPRITES_BORDER* = 0x00008000
  DIPF_IS_SCANDBL* = 0x00020000
  DIPF_IS_SPRITES_CHNG_BASE* = 0x00040000
  DIPF_IS_SPRITES_CHNG_PRI* = 0x00080000
  DIPF_IS_DBUFFER* = 0x00100000
  DIPF_IS_PROGBEAM* = 0x00200000
  DIPF_IS_FOREIGN* = 0x80000000

type
  DimensionInfo* {.bycopy.} = object
    header*: QueryHeader
    maxDepth*: uint16
    minRasterWidth*: uint16
    minRasterHeight*: uint16
    maxRasterWidth*: uint16
    maxRasterHeight*: uint16
    nominal*: Rectangle
    maxOScan*: Rectangle
    videoOScan*: Rectangle
    txtOScan*: Rectangle
    stdOScan*: Rectangle
    pad: array[14, uint8]
    reserved: array[2, uint32]

  MonitorInfo* {.bycopy.} = object
    header*: QueryHeader
    mspc*: ptr MonitorSpec
    viewPosition*: Point
    viewResolution*: Point
    viewPositionRange*: Rectangle
    totalRows*: uint16
    totalColorClocks*: uint16
    minRow*: uint16
    compatibility*: int16
    pad: array[32, uint8]
    mouseTicks*: Point
    defaultViewPosition*: Point
    preferredModeID*: uint32
    reserved: array[2, uint32]

const
  MCOMPAT_MIXED* = 0
  MCOMPAT_SELF* = 1
  MCOMPAT_NOBODY* = -1
  DISPLAYNAMELEN* = 32

type
  NameInfo* {.bycopy.} = object
    header*: QueryHeader
    name*: array[DISPLAYNAMELEN, char]
    reserved: array[2, uint32]

type
  VecInfo* {.bycopy.} = object
    header*: QueryHeader
    vec*: pointer
    data*: pointer
    `type`*: uint16
    pad: array[3, uint16]
    reserved: array[2, uint32]
