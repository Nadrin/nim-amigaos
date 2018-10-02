#
#         AmigaOS 3 API bindings for Nim
#        (c) Copyright 2018 Michał Siejak
#

type
    Node* {.pure.} = object
        succ*, pred*: ptr Node
        `type`*: uint8
        pri*: int8
        name*: cstring

    MinNode* {.pure.} = object
        succ*, pred*: ptr MinNode

    NodeType* = enum
        NT_UNKNOWN = 0,
        NT_TASK,
        NT_INTERRUPT,
        NT_DEVICE,
        NT_MSGPORT,
        NT_MESSAGE,
        NT_FREEMSG,
        NT_REPLYMSG,
        NT_RESOURCE,
        NT_LIBRARY,
        NT_MEMORY,
        NT_SOFTINT,
        NT_FONT,
        NT_PROCESS,
        NT_SEMAPHORE,
        NT_SIGNALSEM,
        NT_BOOTNODE,
        NT_KICKMEM,
        NT_GRAPHICS,
        NT_DEATHMESSAGE,
        NT_USER = 254,
        NT_EXTENDED = 255
