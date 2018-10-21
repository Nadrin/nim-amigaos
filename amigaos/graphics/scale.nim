#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  BitScaleArgs* {.bycopy.} = object
    srcX*: uint16
    srcY*: uint16
    srcWidth*: uint16
    srcHeight*: uint16
    xSrcFactor*: uint16
    ySrcFactor*: uint16
    destX*: uint16
    destY*: uint16
    destWidth*: uint16
    destHeight*: uint16
    xDestFactor*: uint16
    yDestFactor*: uint16
    srcBitMap*: ptr BitMap
    destBitMap*: ptr BitMap
    flags: uint32
    XDDA: uint16
    YDDA: uint16
    reserved1: int32
    reserved2: int32
