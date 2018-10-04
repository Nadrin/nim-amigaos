#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  SemaphoreRequest* {.bycopy.} = object
    link*: MinNode
    waiter*: ptr Task

  SignalSemaphore* {.bycopy.} = object
    link*: Node
    nestCount*: int16
    waitQueue*: MinList
    multipleLink*: SemaphoreRequest
    owner*: ptr Task
    queueCount*: int16

  SemaphoreMessage* {.bycopy.} = object
    message*: Message
    semaphore*: ptr SignalSemaphore

const
  SM_EXCLUSIVE* = 0
  SM_SHARED* = 1
