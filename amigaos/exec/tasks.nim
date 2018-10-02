#
#         AmigaOS 3 API bindings for Nim
#        (c) Copyright 2018 Michał Siejak
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

    TaskState* = enum
        TS_INVALID = 0,
        TS_ADDED,
        TS_RUN,
        TS_READY,
        TS_WAIT,
        TS_EXCEPT,
        TS_REMOVED

const
    SIGB_ABORT*  = 0
    SIGB_CHILD*  = 1
    SIGB_BLIT*   = 4
    SIGB_SINGLE* = 4
    SIGB_INTUITION* = 5
    SIGB_NET*    = 7
    SIGB_DOS*    = 8

const
    SIGF_ABORT*  = 1 shl 0
    SIGF_CHILD*  = 1 shl 1
    SIGF_BLIT*   = 1 shl 4
    SIGF_SINGLE* = 1 shl 4
    SIGF_INTUITION* = 1 shl 5
    SIGF_NET*    = 1 shl 7
    SIGF_DOS*    = 1 shl 8
