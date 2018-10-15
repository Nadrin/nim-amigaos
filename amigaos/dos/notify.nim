#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  NotifyRequestMessage* {.bycopy.} = object
    port*: ptr MsgPort

  NotifyRequestSignal* {.bycopy.} = object
    task*: ptr Task
    signalNum*: uint8
    pad: array[3, char]

  NotifyRequestUnion* {.bycopy.} = object {.union.}
    msg*: NotifyRequestMessage
    signal*: NotifyRequestSignal

  NotifyRequest* {.bycopy.} = object
    name*: cstring
    fullName*: cstring
    userData*: uint32
    flags*: uint32
    stuff*: NotifyRequestUnion
    reserved: array[4, uint32]
    msgCount*: uint32
    handler*: ptr MsgPort
  
  NotifyMessage* {.bycopy.} = object
    execMessage*: Message
    class*: uint32
    code*: uint16
    nreq*: ptr NotifyRequest
    doNotTouch: uint32
    doNotTouch2: uint32

const
  NOTIFY_CLASS* = 0x40000000
  NOTIFY_CODE* = 0x00001234

const
  NRF_SEND_MESSAGE* = 1
  NRF_SEND_SIGNAL* = 2
  NRF_WAIT_REPLY* = 8
  NRF_NOTIFY_INITIAL* = 16
  NRF_MAGIC* = 0x80000000

const
  NRB_SEND_MESSAGE* = 0
  NRB_SEND_SIGNAL* = 1
  NRB_WAIT_REPLY* = 3
  NRB_NOTIFY_INITIAL* = 4
  NRB_MAGIC* = 31

const
  NR_HANDLER_FLAGS* = 0xFFFF0000
