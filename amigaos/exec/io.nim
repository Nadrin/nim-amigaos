#
#         AmigaOS 3 API bindings for Nim
#        (c) Copyright 2018 Michał Siejak
#

type
    IORequest* {.pure.} = object
        message*: Message
        device*: Device
        unit*: Unit
        command*: uint16
        flags*: uint8
        error*: int8

    IOStdReq* {.pure.} = object
        message*: Message
        device*: Device
        unit*: Unit
        command*: uint16
        flags*: uint8
        error*: int8
        actual*: uint32
        length*: uint32
        data*: pointer
        offset*: uint32

    IOCommand* = enum
        CMD_INVALID = 0,
        CMD_RESET,
        CMD_READ,
        CMD_WRITE,
        CMD_UPDATE,
        CMD_CLEAR,
        CMD_STOP,
        CMD_START,
        CMD_FLUSH,
        CMD_NONSTD

const
    DEV_BEGINIO* = -30
    DEV_ABORTIO* = -36

const
    IOB_QUICK* = 0
    IOF_QUICK* = 1 shl 0

