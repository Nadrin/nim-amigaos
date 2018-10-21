#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  FS_NORMAL* = 0
  FSB_UNDERLINED* = 0
  FSF_UNDERLINED* = 0x00000001
  FSB_BOLD* = 1
  FSF_BOLD* = 0x00000002
  FSB_ITALIC* = 2
  FSF_ITALIC* = 0x00000004
  FSB_EXTENDED* = 3
  FSF_EXTENDED* = 0x00000008
  FSB_COLORFONT* = 6
  FSF_COLORFONT* = 0x00000040
  FSB_TAGGED* = 7
  FSF_TAGGED* = 0x00000080

const
  FPB_ROMFONT* = 0
  FPF_ROMFONT* = 0x00000001
  FPB_DISKFONT* = 1
  FPF_DISKFONT* = 0x00000002
  FPB_REVPATH* = 2
  FPF_REVPATH* = 0x00000004
  FPB_TALLDOT* = 3
  FPF_TALLDOT* = 0x00000008
  FPB_WIDEDOT* = 4
  FPF_WIDEDOT* = 0x00000010
  FPB_PROPORTIONAL* = 5
  FPF_PROPORTIONAL* = 0x00000020
  FPB_DESIGNED* = 6
  FPF_DESIGNED* = 0x00000040
  FPB_REMOVED* = 7
  FPF_REMOVED* = (1 shl 7)

type
  TextAttr* {.bycopy.} = object
    name*: cstring
    ySize*: uint16
    style*: uint8
    flags*: uint8

  TTextAttr* {.bycopy.} = object
    name*: cstring
    ySize*: uint16
    style*: uint8
    flags*: uint8
    tags*: ptr TagItem
  
  TextFont* {.bycopy.} = object
    message*: Message
    ySize*: uint16
    style*: uint8
    flags*: uint8
    xSize*: uint16
    baseline*: uint16
    boldSmear*: uint16
    accessors*: uint16
    loChar*: uint8
    hiChar*: uint8
    charData*: pointer
    modulo*: uint16
    charLoc*: pointer
    charSpace*: pointer
    charKern*: pointer
  
  TextFontExtension* {.bycopy.} = object
    matchWord*: uint16
    flags0: uint8
    flags1: uint8
    backPtr*: ptr TextFont
    origReplyPort*: ptr MsgPort
    tags*: ptr TagItem
    oFontPatchS: ptr uint16
    oFontPatchK: ptr uint16

  ColorFontColors* {.bycopy.} = object
    reserved: uint16
    count*: uint16
    colorTable*: ptr uint16

  ColorTextFont* {.bycopy.} = object
    tf*: TextFont
    flags*: uint16
    depth*: uint8
    fgColor*: uint8
    `low`*: uint8
    `high`*: uint8
    planePick*: uint8
    planeOnOff*: uint8
    colorFontColors*: ptr ColorFontColors
    charData*: array[8, pointer]

  TextExtent* {.bycopy.} = object
    width*: uint16
    height*: uint16
    extent*: Rectangle
  
const
  TA_DeviceDPI* = (1 or TAG_USER)

const
  MAXFONTMATCHWEIGHT* = 32767

const
  TE0B_NOREMFONT* = 0
  TE0F_NOREMFONT* = 0x00000001

const
  CT_COLORMASK* = 0x0000000F
  CT_COLORFONT* = 0x00000001
  CT_GREYFONT* = 0x00000002
  CT_ANTIALIAS* = 0x00000004

const
  CTB_MAPCOLOR* = 0
  CTF_MAPCOLOR* = 0x00000001
