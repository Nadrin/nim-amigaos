#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  Library* {.pure.} = object
    node*: Node
    flags*: uint8
    pad: uint8
    negSize*: uint16
    posSize*: uint16
    version*: uint16
    revision*: uint16
    idString*: cstring
    sum*: uint32
    openCnt*: uint16

const
  LIB_VECTSIZE* = 6
  LIB_RESERVED* = 4
  LIB_BASE* = (-LIB_VECTSIZE)
  LIB_USERDEF* = (LIB_BASE - (LIB_RESERVED*LIB_VECTSIZE))
  LIB_NONSTD* = LIB_USERDEF

const
  LIB_OPEN* =  -6
  LIB_CLOSE* = -12
  LIB_EXPUNGE* = -18
  LIB_EXTFUNC* = -24

const
  LIBF_SUMMING* = (1 shl 0)
  LIBF_CHANGED* = (1 shl 1)
  LIBF_SUMUSED* = (1 shl 2)
  LIBF_DELEXP*  = (1 shl 3)
