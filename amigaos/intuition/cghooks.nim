#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  GadgetInfoPens* {.bycopy.} = object
    detailPen*: uint8
    blockPen*: uint8
  GadgetInfo* {.bycopy.} = object
    screen*: ptr Screen
    window*: ptr Window
    requester*: ptr Requester
    rastPort*: ptr RastPort
    layer*: ptr Layer
    domain*: IBox
    pens*: GadgetInfoPens
    drInfo*: ptr DrawInfo
    reserved: array[6, uint32]

type
  PGX* {.bycopy.} = object
    container*: IBox
    newKnob*: IBox

template CUSTOM_HOOK*(gadget: untyped): untyped =
  (cast[ptr Hook]((gadget).MutualExclude))
