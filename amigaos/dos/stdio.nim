#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  BufferingMode* = enum
    BUF_LINE = 0,
    BUF_FULL = 1,
    BUF_NONE = 2
