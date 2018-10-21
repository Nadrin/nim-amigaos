#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  ExtendedNode* {.bycopy.} = object
    succ*: ptr Node
    pred*: ptr Node
    `type`*: uint8
    pri*: int8
    name*: cstring
    subsystem*: uint8
    subtype*: uint8
    library*: pointer
    init*: proc (): int

const
  SS_GRAPHICS* = 0x00000002
  VIEW_EXTRA_TYPE* = 1
  VIEWPORT_EXTRA_TYPE* = 2
  SPECIAL_MONITOR_TYPE* = 3
  MONITOR_SPEC_TYPE* = 4
