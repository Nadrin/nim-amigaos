#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  AreaInfo* {.bycopy.} = object
    vctrTbl*: ptr int16
    vctrPtr*: ptr int16
    flagTbl*: ptr int8
    flagPtr*: ptr int8
    count*: int16
    maxCount*: int16
    firstX*: int16
    firstY*: int16

  TmpRas* {.bycopy.} = object
    rasPtr*: ptr int8
    size*: int32

  GelsInfo* {.bycopy.} = object
    sprRsrvd*: int8
    flags*: uint8
    gelHead*: ptr VSprite
    gelTail*: ptr VSprite
    nextLine*: ptr int16
    lastColor*: ptr ptr int16
    collHandler*: ptr collTable
    leftmost*: int16
    rightmost*: int16
    topmost*: int16
    bottommost*: int16
    firstBlissObj*: pointer
    lastBlissObj*: pointer
  
  Layer* {.bycopy.} = object
    front*: ptr Layer
    back*: ptr Layer
    clipRect*: ptr ClipRect
    rp*: ptr RastPort
    bounds*: Rectangle
    reserved: array[4, uint8]
    priority*: uint16
    flags*: uint16
    superBitMap*: ptr BitMap
    superClipRect*: ptr ClipRect
    window*: pointer
    scrollX*: int16
    scrollY*: int16
    cr*: ptr ClipRect
    cr2*: ptr ClipRect
    crnew*: ptr ClipRect
    superSaveClipRects*: ptr ClipRect
    cliprects: ptr ClipRect
    layerInfo*: ptr Layer_Info
    lock*: SignalSemaphore
    backFill*: ptr Hook
    reserved1: uint32
    clipRegion*: ptr Region
    saveClipRects*: ptr Region
    width*: int16
    height*: int16
    reserved2: array[18, uint8]
    damageList*: ptr Region
  
  Layer_Info* {.bycopy.} = object
    top_layer*: ptr Layer
    check_lp*: ptr Layer
    obs*: ptr ClipRect
    freeClipRects*: ptr ClipRect
    privateReserve1: int32
    privateReserve2: int32
    lock*: SignalSemaphore
    head*: MinList
    privateReserve3: int16
    privateReserve4: pointer
    flags*: uint16
    fatten_count*: int8
    lockLayersCount*: int8
    privateReserve5*: int16
    blankHook*: pointer
    layerInfo_extra*: pointer

  RastPort* {.bycopy.} = object
    layer*: ptr Layer
    bitMap*: ptr BitMap
    areaPtrn*: ptr uint16
    tmpRas*: ptr TmpRas
    areaInfo*: ptr AreaInfo
    gelsInfo*: ptr GelsInfo
    mask*: uint8
    fgPen*: int8
    bgPen*: int8
    aolPen*: int8
    drawMode*: int8
    areaPtSz*: int8
    linpatcnt*: int8
    dummy: int8
    flags*: uint16
    linePtrn*: uint16
    cp_x*: int16
    cp_y*: int16
    minterms*: array[8, uint8]
    penWidth*: int16
    penHeight*: int16
    font*: ptr TextFont
    algoStyle*: uint8
    txFlags*: uint8
    txHeight*: uint16
    txWidth*: uint16
    txBaseline*: uint16
    txSpacing*: int16
    RP_User*: ptr pointer
    longreserved: array[2, uint32]
    wordreserved: array[7, uint16]
    reserved: array[8, uint8]
  
  ClipRect* {.bycopy.} = object
    next*: ptr ClipRect
    prev*: ptr ClipRect
    lobs*: ptr Layer
    bitMap*: ptr BitMap
    bounds*: Rectangle
    p1: pointer
    p2: pointer
    reserved: int32
    flags*: int32

const
  JAM1* = 0
  JAM2* = 1
  COMPLEMENT* = 2
  INVERSVID* = 4

const
  FRST_DOT* = 0x00000001
  ONE_DOT* = 0x00000002
  DBUFFER* = 0x00000004

const
  AREAOUTLINE* = 0x00000008
  NOCROSSFILL* = 0x00000020
