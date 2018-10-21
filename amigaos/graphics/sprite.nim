#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  SimpleSprite* {.bycopy.} = object
    posctldata*: ptr uint16
    height*: uint16
    x*: uint16
    y*: uint16
    num*: uint16

  ExtSprite* {.bycopy.} = object
    simpleSprite*: SimpleSprite
    wordwidth*: uint16
    flags*: uint16

const
  SPRITE_ATTACHED* = 0x00000080

const
  SPRITEA_Width* = 0x81000000
  SPRITEA_XReplication* = 0x81000002
  SPRITEA_YReplication* = 0x81000004
  SPRITEA_OutputHeight* = 0x81000006
  SPRITEA_Attached* = 0x81000008
  SPRITEA_OldDataFormat* = 0x8100000A

const
  GSTAG_SPRITE_NUM* = 0x82000020
  GSTAG_ATTACHED* = 0x82000022
  GSTAG_SOFTSPRITE* = 0x82000024
  GSTAG_SCANDOUBLED* = 0x83000000
