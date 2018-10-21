#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type planeptr* = ptr uint8

const
  BITSET* = 0x00008000
  BITCLR* = 0

type
  Rectangle* {.bycopy.} = object
    minX*: int16
    minY*: int16
    maxX*: int16
    maxY*: int16

  Rect32* {.bycopy.} = object
    minX*: int32
    minY*: int32
    maxX*: int32
    maxY*: int32

  Point* {.bycopy.} = object
    x*: int16
    y*: int16

  BitMap* {.bycopy.} = object
    bytesPerRow*: uint16
    rows*: uint16
    flags*: uint8
    depth*: uint8
    pad: uint16
    planes*: array[8, planeptr]

const
  BMB_CLEAR* = 0
  BMB_DISPLAYABLE* = 1
  BMB_INTERLEAVED* = 2
  BMB_STANDARD* = 3
  BMB_MINPLANES* = 4

const
  BMF_CLEAR* = (1 shl BMB_CLEAR)
  BMF_DISPLAYABLE* = (1 shl BMB_DISPLAYABLE)
  BMF_INTERLEAVED* = (1 shl BMB_INTERLEAVED)
  BMF_STANDARD* = (1 shl BMB_STANDARD)
  BMF_MINPLANES* = (1 shl BMB_MINPLANES)

const
  BMA_HEIGHT* = 0
  BMA_DEPTH* = 4
  BMA_WIDTH* = 8
  BMA_FLAGS* = 12
