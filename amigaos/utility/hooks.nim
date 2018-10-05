#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  Hook* {.bycopy.} = object
    minNode*: MinNode
    entry*: func(): uint32 {.noconv.}
    subEntry*: func(): uint32 {.noconv.}
    data*: pointer
