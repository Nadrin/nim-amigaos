#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  DMAF_SETCLR* = 0x00008000
  DMAF_AUDIO* = 0x0000000F
  DMAF_AUD0* = 0x00000001
  DMAF_AUD1* = 0x00000002
  DMAF_AUD2* = 0x00000004
  DMAF_AUD3* = 0x00000008
  DMAF_DISK* = 0x00000010
  DMAF_SPRITE* = 0x00000020
  DMAF_BLITTER* = 0x00000040
  DMAF_COPPER* = 0x00000080
  DMAF_RASTER* = 0x00000100
  DMAF_MASTER* = 0x00000200
  DMAF_BLITHOG* = 0x00000400
  DMAF_ALL* = 0x000001FF
  DMAF_BLTDONE* = 0x00004000
  DMAF_BLTNZERO* = 0x00002000

const
  DMAB_SETCLR* = 15
  DMAB_AUD0* = 0
  DMAB_AUD1* = 1
  DMAB_AUD2* = 2
  DMAB_AUD3* = 3
  DMAB_DISK* = 4
  DMAB_SPRITE* = 5
  DMAB_BLITTER* = 6
  DMAB_COPPER* = 7
  DMAB_RASTER* = 8
  DMAB_MASTER* = 9
  DMAB_BLITHOG* = 10
  DMAB_BLTDONE* = 14
  DMAB_BLTNZERO* = 13
