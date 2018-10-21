#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  Isrvstr* {.bycopy.} = object
    node*: Node
    iptr*: ptr Isrvstr
    code*: proc (): int
    ccode*: proc (arg: pointer): int
    carg*: pointer
