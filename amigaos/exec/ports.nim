#
#         AmigaOS 3 API bindings for Nim
#        (c) Copyright 2018 Michał Siejak
#

type
    MsgPort* {.pure.} = object
        node*: Node
        flags*: uint8
        sigBit*: uint8
        sigTask*: pointer
        msgList*: List

    Message* {.pure.} = object
        node*: Node
        replyPort*: MsgPort
        length*: uint16

    MsgAction* = enum
        PA_SIGNAL  = 0,
        PA_SOFTINT = 1,
        PA_IGNORE  = 2,
        PF_ACTION  = 3, # Mask

proc isMsgPortEmpty*(msgPort: MsgPort): bool {.inline.} =
    result = (msgPort.msgList.tailPred == msgPort.msgList.head)