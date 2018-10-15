#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  LocalVar* {.bycopy.} = object
    node*: Node
    flags*: uint16
    value*: cstring
    len*: uint32

const
  LV_VAR* = 0
  LV_ALIAS* = 1

const
  LVB_IGNORE* = 7

const
  LVF_IGNORE* = 0x00000080

const
  GVB_GLOBAL_ONLY* = 8
  GVB_LOCAL_ONLY* = 9
  GVB_BINARY_VAR* = 10
  GVB_DONT_NULL_TERM* = 11

const
  GVF_GLOBAL_ONLY* = 0x00000100
  GVF_LOCAL_ONLY* = 0x00000200
  GVF_BINARY_VAR* = 0x00000400
  GVF_DONT_NULL_TERM* = 0x00000800

const
  GVB_SAVE_VAR* = 12

const
  GVF_SAVE_VAR* = 0x00001000
