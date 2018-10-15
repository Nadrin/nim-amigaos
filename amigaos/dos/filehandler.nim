#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  DosEnvec* {.bycopy.} = object
    tableSize*: uint32
    sizeBlock*: uint32
    secOrg*: uint32
    surfaces*: uint32
    sectorPerBlock*: uint32
    blocksPerTrack*: uint32
    reserved: uint32
    preAlloc*: uint32
    interleave*: uint32
    lowCyl*: uint32
    highCyl*: uint32
    numBuffers*: uint32
    bufMemType*: uint32
    maxTransfer*: uint32
    mask*: uint32
    bootPri*: int32
    dosType*: uint32
    baud*: uint32
    control*: uint32
    bootBlocks*: uint32

const
  DE_TABLESIZE* = 0
  DE_SIZEBLOCK* = 1
  DE_SECORG* = 2
  DE_NUMHEADS* = 3
  DE_SECSPERBLK* = 4
  DE_BLKSPERTRACK* = 5
  DE_RESERVEDBLKS* = 6
  DE_PREFAC* = 7
  DE_INTERLEAVE* = 8
  DE_LOWCYL* = 9
  DE_UPPERCYL* = 10
  DE_NUMBUFFERS* = 11
  DE_MEMBUFTYPE* = 12
  DE_BUFMEMTYPE* = 12
  DE_MAXTRANSFER* = 13
  DE_MASK* = 14
  DE_BOOTPRI* = 15
  DE_DOSTYPE* = 16
  DE_BAUD* = 17
  DE_CONTROL* = 18
  DE_BOOTBLOCKS* = 19

type
  FileSysStartupMsg* {.bycopy.} = object
    unit*: uint32
    device*: bstring
    environ*: bpointer
    flags*: uint32

type
  DeviceNode* {.bycopy.} = object
    next*: bpointer
    `type`*: uint32
    task*: ptr MsgPort
    lock*: bpointer
    handler*: bstring
    stackSize*: uint32
    priority*: int32
    startup*: bpointer
    segList*: bpointer
    globalVec*: bpointer
    name*: bstring
