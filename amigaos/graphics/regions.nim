#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  RegionRectangle* {.bycopy.} = object
    next*: ptr RegionRectangle
    prev*: ptr RegionRectangle
    bounds*: Rectangle

  Region* {.bycopy.} = object
    bounds*: Rectangle
    regionRectangle*: ptr RegionRectangle
