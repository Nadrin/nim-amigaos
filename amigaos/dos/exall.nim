#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  ExAllData* {.bycopy.} = object
    next*: ptr ExAllData
    name*: cstring
    `type`*: int32
    size*: uint32
    prot*: uint32
    days*: uint32
    mins*: uint32
    ticks*: uint32
    comment*: cstring
    ownerUID*: uint16
    ownerGID*: uint16

  ExAllControl* {.bycopy.} = object
    entries*: uint32
    lastKey*: uint32
    matchString*: cstring
    matchFunc*: ptr Hook

const
  ED_NAME* = 1
  ED_TYPE* = 2
  ED_SIZE* = 3
  ED_PROTECTION* = 4
  ED_DATE* = 5
  ED_COMMENT* = 6
  ED_OWNER* = 7
