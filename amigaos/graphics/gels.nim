#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  SUSERFLAGS* = 0x000000FF
  CVSPRITE* = 0x00000001 ## VSPRITE
  SAVEBACK* = 0x00000002
  OVERLAY* = 0x00000004
  MUSTDRAW* = 0x00000008
  BACKSAVED* = 0x00000100
  BOBUPDATE* = 0x00000200
  GELGONE* = 0x00000400
  VSOVERFLOW* = 0x00000800

const
  BUSERFLAGS* = 0x000000FF
  SAVEBOB* = 0x00000001
  BOBISCOMP* = 0x00000002
  BWAITING* = 0x00000100
  BDRAWN* = 0x00000200
  BOBSAWAY* = 0x00000400
  BOBNIX* = 0x00000800
  SAVEPRESERVE* = 0x00001000
  OUTSTEP* = 0x00002000

const
  ANFRACSIZE* = 6
  ANIMHALF* = 0x00000020
  RINGTRIGGER* = 0x00000001

type
  VSprite {.bycopy.} = object
    nextVSprite*: ptr VSprite
    prevVSprite*: ptr VSprite
    drawPath*: ptr VSprite
    clearPath*: ptr VSprite
    oldY*: int16
    oldX*: int16
    flags*: int16
    y*: int16
    x*: int16
    height*: int16
    width*: int16
    depth*: int16
    meMask*: int16
    hitMask*: int16
    imageData*: ptr int16
    borderLine*: ptr int16
    collMask*: ptr int16
    sprColors*: ptr int16
    vsBob*: ptr Bob
    planePick*: int8
    planeOnOff*: int8
    vUserExt*: int16

  Bob* {.bycopy.} = object
    flags*: int16
    saveBuffer*: ptr int16
    imageShadow*: ptr int16
    before*: ptr Bob
    after*: ptr Bob
    bobVSprite*: ptr VSprite
    bobComp*: ptr AnimComp
    dBuffer*: ptr DBufPacket
    dUserExt*: int16

  AnimComp* {.bycopy.} = object
    flags*: int16
    timer*: int16
    timeSet*: int16
    nextComp*: ptr AnimComp
    prevComp*: ptr AnimComp
    nextSeq*: ptr AnimComp
    prevSeq*: ptr AnimComp
    animCRoutine*: proc (animComp: ptr AnimComp): int16
    yTrans*: int16
    xTrans*: int16
    headOb*: ptr AnimOb
    animBob*: ptr Bob

  AnimOb* {.bycopy.} = object
    nextOb*: ptr AnimOb
    prevOb*: ptr AnimOb
    clock*: int32
    anOldY*: int16
    anOldX*: int16
    anY*: int16
    anX*: int16
    yVel*: int16
    xVel*: int16
    yAccel*: int16
    xAccel*: int16
    ringYTrans*: int16
    ringXTrans*: int16
    animORoutine*: proc (animOb: ptr AnimOb): int16
    headComp*: ptr AnimComp
    aUserExt*: int16

  DBufPacket* {.bycopy.} = object
    bufY*: int16
    bufX*: int16
    bufPath*: ptr VSprite
    bufBuffer*: ptr int16

template initAnimate*(animKey: untyped): void =
  animKey[] = nil

template remBob*(b: untyped): void =
  b.Flags = b.Flags or BOBSAWAY

const
  B2NORM* = 0
  B2SWAP* = 1
  B2BOBBER* = 2

type
  collTable* {.bycopy.} = object
    collPtrs*: array[16, proc (a: ptr VSprite; b: ptr VSprite): int]
