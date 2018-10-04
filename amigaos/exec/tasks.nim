#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  Task* {.pure.} = object
    node*: Node
    flags*: uint8
    state*: uint8
    idNestCnt*: int8
    tdNestCnt*: int8
    sigAlloc*: uint32
    sigWait*: uint32
    sigRecvd*: uint32
    sigExcept*: uint32
    trapAlloc*: uint16
    trapAble*: uint16
    exceptData*: pointer
    exceptCode*: pointer
    trapData*: pointer
    trapCode*: pointer
    spReg*: pointer
    spLower*: pointer
    spUpper*: pointer
    switch*: proc() {.noconv.}
    launch*: proc() {.noconv.}
    memEntry*: List
    userData*: pointer

  StackSwapStruct* {.pure.} = object
    lower*: pointer
    upper*: pointer
    `pointer`*: pointer

const
  TB_PROCTIME* = 0
  TB_ETASK* = 3
  TB_STACKCHK* = 4
  TB_EXCEPT* = 5
  TB_SWITCH* = 6
  TB_LAUNCH* = 7

const
  TF_PROCTIME* = (1 shl 0)
  TF_ETASK* = (1 shl 3)
  TF_STACKCHK* = (1 shl 4)
  TF_EXCEPT* = (1 shl 5)
  TF_SWITCH* = (1 shl 6)
  TF_LAUNCH* = (1 shl 7)

const
  TS_INVALID* = 0
  TS_ADDED* = 1
  TS_RUN* = 2
  TS_READY* = 3
  TS_WAIT* = 4
  TS_EXCEPT* = 5
  TS_REMOVED* = 6

const
  SIGB_ABORT* = 0
  SIGB_CHILD* = 1
  SIGB_BLIT* = 4
  SIGB_SINGLE* = 4
  SIGB_INTUITION* = 5
  SIGB_NET* = 7
  SIGB_DOS* = 8

const
  SIGF_ABORT* = (1 shl 0)
  SIGF_CHILD* = (1 shl 1)
  SIGF_BLIT* = (1 shl 4)
  SIGF_SINGLE* = (1 shl 4)
  SIGF_INTUITION* = (1 shl 5)
  SIGF_NET* = (1 shl 7)
  SIGF_DOS* = (1 shl 8)
