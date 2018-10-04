#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  Device* {.bycopy.} = object
    library*: Library

  Unit* {.bycopy.} = object
    msgPort*: MsgPort
    flags*: uint8
    pad: uint8
    openCnt*: uint16

const
  UINTF_ACTIVE* = (1 shl 0)
  UINTF_INTASK* = (1 shl 1)
