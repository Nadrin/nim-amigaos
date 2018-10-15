#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  CSource* {.bycopy.} = object
    buffer*: cstring
    length*: int32
    curChr*: int32

type
  RDArgs* {.bycopy.} = object
    source*: CSource
    daList: int32
    buffer*: cstring
    bufSiz*: int32
    extHelp*: cstring
    flags*: int32

const
  RDAB_STDIN* = 0
  RDAB_NOALLOC* = 1
  RDAB_NOPROMPT* = 2

const
  RDAF_STDIN* = 1
  RDAF_NOALLOC* = 2
  RDAF_NOPROMPT* = 4

const
  MAX_TEMPLATE_ITEMS* = 100
  MAX_MULTIARGS* = 128
