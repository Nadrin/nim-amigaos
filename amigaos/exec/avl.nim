#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  AVLNode* {.bycopy.} = object
    reserved: array[4, uint32]

  AVLKey = pointer
