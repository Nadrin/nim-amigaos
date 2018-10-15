#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  RecordLock* {.bycopy.} = object
    fh*: bpointer
    offset*: uint32
    length*: uint32
    mode*: uint32

const
  REC_EXCLUSIVE* = 0
  REC_EXCLUSIVE_IMMED* = 1
  REC_SHARED* = 2
  REC_SHARED_IMMED* = 3
