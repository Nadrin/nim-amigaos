#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  AnchorPath* {.bycopy.} = object
    base*: ptr AChain
    last*: ptr AChain
    breakBits*: int32
    foundBreak*: int32
    flags*: int8
    reserved: int8
    strlen*: int16
    info*: FileInfoBlock
    buf*: array[1, uint8]
  
  AChain* {.bycopy.} = object
    child*: ptr AChain
    parent*: ptr AChain
    lock*: bpointer
    info*: FileInfoBlock
    flags*: int8
    `string`*: array[1, uint8]

const
  APB_DOWILD* = 0
  APF_DOWILD* = 1
  APB_ITSWILD* = 1
  APF_ITSWILD* = 2

const
  APB_DODIR* = 2
  APF_DODIR* = 4

const
  APB_DIDDIR* = 3
  APF_DIDDIR* = 8
  APB_NOMEMERR* = 4
  APF_NOMEMERR* = 16
  APB_DODOT* = 5
  APF_DODOT* = 32
  APB_DirChanged* = 6
  APF_DirChanged* = 64
  APB_FollowHLinks* = 7
  APF_FollowHLinks* = 128

const
  DDB_PatternBit* = 0
  DDF_PatternBit* = 1
  DDB_ExaminedBit* = 1
  DDF_ExaminedBit* = 2
  DDB_Completed* = 2
  DDF_Completed* = 4
  DDB_AllBit* = 3
  DDF_AllBit* = 8
  DDB_Single* = 4
  DDF_Single* = 16

const
  P_ANY* = 0x00000080
  P_SINGLE* = 0x00000081
  P_ORSTART* = 0x00000082
  P_ORNEXT* = 0x00000083
  P_OREND* = 0x00000084
  P_NOT* = 0x00000085
  P_NOTEND* = 0x00000086
  P_NOTCLASS* = 0x00000087
  P_CLASS* = 0x00000088
  P_REPBEG* = 0x00000089
  P_REPEND* = 0x0000008A
  P_STOP* = 0x0000008B

const
  COMPLEX_BIT* = 1
  EXAMINE_BIT* = 2

const
  ERROR_BUFFER_OVERFLOW* = 303
  ERROR_BREAK* = 304
  ERROR_NOT_EXECUTABLE* = 305
