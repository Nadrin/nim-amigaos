#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  DateTime* {.bycopy.} = object
    stamp*: DateStamp
    format*: uint8
    flags*: uint8
    strDay*: cstring
    strDate*: cstring
    strTime*: cstring

const
  LEN_DATSTRING* = 16

const
  DTB_SUBST* = 0
  DTB_FUTURE* = 1

const
  DTF_SUBST* = 1
  DTF_FUTURE* = 2

const
  FORMAT_DOS* = 0
  FORMAT_INT* = 1
  FORMAT_USA* = 2
  FORMAT_CDN* = 3
  FORMAT_MAX* = FORMAT_CDN
  FORMAT_DEF* = 4
