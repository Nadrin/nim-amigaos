
#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  Tag* = uint
  TagItem* {.pure.} = object
    tag*: Tag
    data*: uint

const
  TAG_DONE* = Tag(0)
  TAG_END* = Tag(0)
  TAG_IGNORE* = Tag(1)
  TAG_MORE* = Tag(2)
  TAG_SKIP* = Tag(3)
  TAG_USER* = Tag(0x80000000)

const
  TAGFILTER_AND* = 0
  TAGFILTER_NOT* = 1

const
  MAP_REMOVE_NOT_FOUND* = 0
  MAP_KEEP_NOT_FOUND* = 1
