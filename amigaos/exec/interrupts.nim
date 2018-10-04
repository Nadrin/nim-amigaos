#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  Interrupt* {.pure.} = object
    node*: Node
    data*: pointer
    code*: proc() {.noconv.}

  IntVector* {.pure.} = object
    data*: pointer
    code*: proc() {.noconv.}
    node*: Node

  SoftIntList* {.pure.} = object
    list*: List
    pad: uint16

const
  SIH_PRIMASK* = 0xF0

const
  INTB_NMI* = 15
  INTF_NMI* = 1 shl 15
