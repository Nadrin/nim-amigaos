#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  COPPER_MOVE* = 0
  COPPER_WAIT* = 1
  CPRNXTBUF* = 2
  CPR_NT_LOF* = 0x00008000
  CPR_NT_SHT* = 0x00004000
  CPR_NT_SYS* = 0x00002000

# CopIns, UCopList, CopList type declarations moved to view.nim file.

type
  cprlist* {.bycopy.} = object
    next*: ptr cprlist
    start*: ptr uint16
    maxCount*: int16

  copinit* {.bycopy.} = object
    vsync_hblank*: array[2, uint16]
    diagstrt*: array[12, uint16]
    fm0*: array[2, uint16]
    diwstart*: array[10, uint16]
    bplcon2*: array[2, uint16]
    sprfix*: array[2 * 8, uint16]
    sprstrtup*: array[(2 * 8 * 2), uint16]
    wait14*: array[2, uint16]
    norm_hblank*: array[2, uint16]
    jump*: array[2, uint16]
    wait_forever*: array[6, uint16]
    sprstop*: array[8, uint16]
