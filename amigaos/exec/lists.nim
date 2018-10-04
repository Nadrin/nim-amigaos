#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  List* {.pure.} = object
    head*: ptr Node
    tail*: ptr Node
    tailPred*: ptr Node
    `type`*: uint8
    pad: uint8

  MinList* {.pure.} = object
    head*: ptr MinNode
    tail*: ptr MinNode
    tailPred*: ptr MinNode

proc isListEmpty*(list: List): bool {.inline.} =
  result = (list.tailPred == list.head)
