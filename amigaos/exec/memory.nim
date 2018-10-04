#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  MemChunk* {.pure.} = object
    next*: ptr MemChunk
    bytes*: uint32

  MemHeader* {.pure.} = object
    node*: Node
    attributes*: uint16
    first*: ptr MemChunk
    lower*: pointer
    upper*: pointer
    free*: uint32

  MemEntry* {.pure.} = object
    un*: MemEntryUn
    length*: uint32
  MemEntryUn* {.pure union.} = object
    reqs*: uint32
    `addr`*: pointer

  MemList* {.pure.} = object
    node*: Node
    numEntries*: uint16
    ME*: array[1, MemEntry]

  MemHandlerData* {.pure.} = object
    requestSize*: uint32
    requestFlags*: uint32
    flags*: uint32

const
  MEMF_ANY* = 0
  MEMF_PUBLIC* = (1 shl 0)
  MEMF_CHIP* = (1 shl 1)
  MEMF_FAST* = (1 shl 2)
  MEMF_LOCAL* = (1 shl 8)
  MEMF_24BITDMA* = (1 shl 9)
  MEMF_KICK* = (1 shl 10)
  MEMF_CLEAR* = (1 shl 16)
  MEMF_LARGEST* = (1 shl 17)
  MEMF_REVERSE* = (1 shl 18)
  MEMF_TOTAL* = (1 shl 19)
  MEMF_NO_EXPUNGE* = (1 shl 31)

const
  MEM_BLOCKSIZE* = 8
  MEM_BLOCKMASK* = MEM_BLOCKSIZE-1

const
  MEMHF_RECYCLE* = (1 shl 0)

const
  MEM_DID_NOTHING* = 0
  MEM_ALL_DONE* = -1
  MEM_TRY_AGAIN* = 1
