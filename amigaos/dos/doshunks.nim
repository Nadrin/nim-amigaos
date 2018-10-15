#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  HUNK_UNIT* = 999
  HUNK_NAME* = 1000
  HUNK_CODE* = 1001
  HUNK_DATA* = 1002
  HUNK_BSS* = 1003
  HUNK_RELOC32* = 1004
  HUNK_ABSRELOC32* = HUNK_RELOC32
  HUNK_RELOC16* = 1005
  HUNK_RELRELOC16* = HUNK_RELOC16
  HUNK_RELOC8* = 1006
  HUNK_RELRELOC8* = HUNK_RELOC8
  HUNK_EXT* = 1007
  HUNK_SYMBOL* = 1008
  HUNK_DEBUG* = 1009
  HUNK_END* = 1010
  HUNK_HEADER* = 1011
  HUNK_OVERLAY* = 1013
  HUNK_BREAK* = 1014
  HUNK_DREL32* = 1015
  HUNK_DREL16* = 1016
  HUNK_DREL8* = 1017
  HUNK_LIB* = 1018
  HUNK_INDEX* = 1019
  HUNK_RELOC32SHORT* = 1020
  HUNK_RELRELOC32* = 1021
  HUNK_ABSRELOC16* = 1022
  HUNKB_ADVISORY* = 29
  HUNKB_CHIP* = 30
  HUNKB_FAST* = 31
  HUNKF_ADVISORY* = (1 shl 29)
  HUNKF_CHIP* = (1 shl 30)
  HUNKF_FAST* = (1 shl 31)

const
  EXT_SYMB* = 0
  EXT_DEF* = 1
  EXT_ABS* = 2
  EXT_RES* = 3
  EXT_REF32* = 129
  EXT_ABSREF32* = EXT_REF32
  EXT_COMMON* = 130
  EXT_ABSCOMMON* = EXT_COMMON
  EXT_REF16* = 131
  EXT_RELREF16* = EXT_REF16
  EXT_REF8* = 132
  EXT_RELREF8* = EXT_REF8
  EXT_DEXT32* = 133
  EXT_DEXT16* = 134
  EXT_DEXT8* = 135
  EXT_RELREF32* = 136
  EXT_RELCOMMON* = 137
  EXT_ABSREF16* = 138
  EXT_ABSREF8* = 139