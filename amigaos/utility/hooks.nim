#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  Hook* {.bycopy.} = object
    minNode*: MinNode
    entry*: proc(): uint {.noconv.}
    subEntry*: proc(): uint {.noconv.}
    data*: pointer
