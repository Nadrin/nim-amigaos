#
#         AmigaOS 3 API bindings for Nim
#        (c) Copyright 2018 Michał Siejak
#

type
    SemaphoreRequest* {.pure.} = object
        link*: MinNode
        waiter*: ptr Task

    SignalSemaphore* {.pure.} = object
        link*: Node
        nestCount*: int16
        waitQueue*: MinList
        multipleLink*: SemaphoreRequest
        owner*: ptr Task
        queueCount*: int16

    SemaphoreMessage* {.pure.} = object
        message*: Message
        semaphore*: ptr SignalSemaphore

    SemaphoreMessageType* = enum
        SM_EXCLUSIVE = 0,
        SM_SHARED    = 1
