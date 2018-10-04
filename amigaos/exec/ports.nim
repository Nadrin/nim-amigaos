#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  MsgPort* {.bycopy.} = object
    node*: Node
    flags*: uint8
    sigBit*: uint8
    sigTask*: pointer
    msgList*: List

  Message* {.bycopy.} = object
    node*: Node
    replyPort*: MsgPort
    length*: uint16

const
  PA_SIGNAL*  = 0
  PA_SOFTINT* = 1
  PA_IGNORE*  = 2
  PF_ACTION*  = 3 # Mask

proc isMsgPortEmpty*(msgPort: MsgPort): bool {.inline.} =
  result = (msgPort.msgList.tailPred == msgPort.msgList.head)
