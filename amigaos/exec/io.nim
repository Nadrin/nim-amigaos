#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  IORequest* {.bycopy.} = object
    message*: Message
    device*: Device
    unit*: Unit
    command*: uint16
    flags*: uint8
    error*: int8

  IOStdReq* {.bycopy.} = object
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

const
  CMD_INVALID* = 0
  CMD_RESET* = 1
  CMD_READ* = 2
  CMD_WRITE* = 3
  CMD_UPDATE* = 4
  CMD_CLEAR* = 5
  CMD_STOP* = 6
  CMD_START* = 7
  CMD_FLUSH* = 8
  CMD_NONSTD* = 9

const
  DEV_BEGINIO* = -30
  DEV_ABORTIO* = -36

const
  IOB_QUICK* = 0
  IOF_QUICK* = (1 shl 0)

