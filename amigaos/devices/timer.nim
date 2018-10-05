#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const TIMERNAME* = "timer.device"

type
  TimeVal* {.bycopy.} = object
    secs*: uint32
    micro*: uint32

  EClockVal* {.bycopy.} = object
    hi*: uint32
    lo*: uint32

  TimeRequest* {.bycopy.} = object
    node*: IORequest
    time*: TimeVal

const
  UNIT_MICROHZ* = 0
  UNIT_VBLANK* = 1
  UNIT_ECLOCK* = 2
  UNIT_WAITUNTIL* = 3
  UNIT_WAITECLOCK* = 4

const
  TR_ADDREQUEST* = CMD_NONSTD
  TR_GETSYSTIME* = CMD_NONSTD+1
  TR_SETSYSTIME* = CMD_NONSTD+2
