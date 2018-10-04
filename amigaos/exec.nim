#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

## AmigaOS 3 API: Exec library

include exec/alerts
include exec/errors
include exec/nodes
include exec/lists
include exec/libraries
include exec/resident
include exec/interrupts
include exec/memory
include exec/ports
include exec/tasks
include exec/devices
include exec/io
include exec/semaphores
include exec/avl
include exec/execbase

const exec_h = "<proto/exec.h>"

proc supervisor*(userFunction: proc(): uint32 {.noconv.}) {.header: exec_h, importc: "Supervisor".}

proc c_makeLibrary(funcInit: pointer, structInit: pointer, libInit: proc(): uint32 {.noconv.}, dataSize: uint32, segList: uint32): ptr Library {.header: exec_h, importc: "MakeLibrary".}
proc makeLibrary*(funcInit: openarray[pointer], structInit: openarray[pointer], libInit: proc(): uint32 {.noconv.}, dataSize: uint32, segList: uint32): ptr Library {.inline.} =
    result = c_makeLibrary(funcInit[0], structInit[0], libInit, dataSize, segList)

proc c_makeFunctions(target: pointer, functionArray: pointer, funcDispBase: pointer) {.header: exec_h, importc: "MakeFunctions".}
proc makeFunctions*(target: pointer, functionArray: openarray[pointer], funcDispBase: pointer) {.inline.} =
    c_makeFunctions(target, functionArray[0], funcDispBase)

proc findResident*(name: cstring): ptr Resident {.header: exec_h, importc: "FindResident".}
proc initResident*(resident: ptr Resident, segList: uint32): pointer {.header: exec_h, importc: "InitResident".}

proc alert*(alertNum: uint32) {.header: exec_h, importc: "Alert".}

proc debug*(flags: uint32) {.header: exec_h, importc: "Debug".}

proc disable*() {.header: exec_h, importc: "Disable".}
proc enable*() {.header: exec_h, importc: "Enable".}
proc forbid*() {.header: exec_h, importc: "Forbid".}
proc permit*() {.header: exec_h, importc: "Permit".}

proc getCC*(): uint32 {.header: exec_h, importc: "GetCC".}
proc setSR*(newSR: uint32, mask: uint32): uint32 {.header: exec_h, importc: "SetSR".}

proc superState*(): pointer {.header: exec_h, importc: "SuperState".}
proc userState*(sysStack: pointer) {.header: exec_h, importc: "UserState".}

proc setIntVector*(intNumber: int32, interrupt: ptr Interrupt): ptr Interrupt {.header: exec_h, importc: "SetIntVector".}
proc addIntServer*(intNumber: int32, interrupt: ptr Interrupt) {.header: exec_h, importc: "AddIntServer".}
proc remIntServer*(intNumber: int32, interrupt: ptr Interrupt) {.header: exec_h, importc: "RemIntServer".}
proc cause*(interrupt: ptr Interrupt) {.header: exec_h, importc: "Cause".}
proc obtainQuickVector*(interruptCode: pointer): uint32 {.header: exec_h, importc: "ObtainQuickVector".}

proc allocate*(freeList: ptr MemHeader, byteSize: uint32): pointer {.header: exec_h, importc: "Allocate".}
proc deallocate*(freeList: ptr MemHeader, memoryBlock: pointer, byteSize: uint32) {.header: exec_h, importc: "Deallocate".}
proc allocMem*(byteSize: uint32, requirements: uint32): pointer {.header: exec_h, importc: "AllocMem".}
proc allocAbs*(byteSize: uint32, location: pointer): pointer {.header: exec_h, importc: "AllocAbs".}
proc freeMem*(memoryBlock: pointer, byteSize: uint32) {.header: exec_h, importc: "FreeMem".}
proc availMem*(requirements: uint32): uint32 {.header: exec_h, importc: "AvailMem".}
proc allocEntry*(entry: ptr MemList): ptr MemList {.header: exec_h, importc: "AllocEntry".}
proc freeEntry*(entry: ptr MemList) {.header: exec_h, importc: "FreeEntry".}
proc typeOfMem*(address: pointer): uint32 {.header: exec_h, importc: "TypeOfMem".}
proc addMemList*(size: uint32, attributes: uint32, pri: int32, base: pointer, name: cstring) {.header: exec_h, importc: "AddMemList".}

proc allocVec*(byteSize: uint32, requirements: uint32): pointer {.header: exec_h, importc: "AllocVec".}
proc freeVec*(memoryBlock: pointer) {.header: exec_h, importc: "FreeVec".}

proc createPool*(requirements: uint32, puddleSize: uint32, threshSize: uint32): pointer {.header: exec_h, importc: "CreatePool".}
proc deletePool*(poolHeader: pointer) {.header: exec_h, importc: "DeletePool".}
proc allocPooled*(poolHeader: pointer, memSize: uint32): pointer {.header: exec_h, importc: "AllocPooled".}
proc freePooled*(poolHeader: pointer, memory: pointer, memSize: uint32) {.header: exec_h, importc: "FreePooled".}

proc copyMem*(source: pointer, dest: pointer, size: uint32) {.header: exec_h, importc: "CopyMem".}
proc copyMemQuick*(source: pointer, dest: pointer, size: uint32) {.header: exec_h, importc: "CopyMemQuick".}
proc cacheClearU*() {.header: exec_h, importc: "CacheClearU".}
proc cacheClearE*(address: pointer, length: uint32, caches: uint32) {.header: exec_h, importc: "CacheClearE".}
proc cacheControl*(cacheBits: uint32, cacheMask: uint32): uint32 {.header: exec_h, importc: "CacheControl".}

proc insert*(list: ptr List, node: ptr Node, pred: ptr Node) {.header: exec_h, importc: "Insert".}
proc addHead*(list: ptr List, node: ptr Node) {.header: exec_h, importc: "AddHead".}
proc addTail*(list: ptr List, node: ptr Node) {.header: exec_h, importc: "AddTail".}
proc remove*(node: ptr Node) {.header: exec_h, importc: "Remove".}
proc remHead*(list: ptr List): ptr Node {.header: exec_h, importc: "RemHead".}
proc remTail*(list: ptr List): ptr Node {.header: exec_h, importc: "RemTail".}
proc enqueue*(list: ptr List, node: ptr Node) {.header: exec_h, importc: "Enqueue".}
proc findName*(list: ptr List, name: cstring): ptr Node {.header: exec_h, importc: "FindName".}
proc newMinList*(minlist: ptr MinList) {.header: exec_h, importc: "NewMinList".}

proc addTask*(task: ptr Task, initPC: pointer, finalPC: pointer): pointer {.header: exec_h, importc: "AddTask".}
proc remTask*(task: ptr Task) {.header: exec_h, importc: "RemTask".}
proc findTask*(name: cstring): ptr Task {.header: exec_h, importc: "FindTask".}
proc setTaskPri*(task: ptr Task, priority: int32): int8 {.header: exec_h, importc: "SetTaskPri".}

proc setSignal*(newSignals: uint32, signalSet: uint32): uint32 {.header: exec_h, importc: "SetSignal".}
proc setExcept*(newSignals: uint32, signalSet: uint32): uint32 {.header: exec_h, importc: "SetExcept".}
proc wait*(signalSet: uint32): uint32 {.header: exec_h, importc: "Wait".}
proc signal*(task: ptr Task, signalSet: uint32) {.header: exec_h, importc: "Signal".}
proc allocSignal*(signalNum: int8): int8 {.header: exec_h, importc: "AllocSignal".}
proc freeSignal*(signalNum: int8) {.header: exec_h, importc: "FreeSignal".}

proc allocTrap*(trapNum: int32): int32 {.header: exec_h, importc: "AllocTrap".}
proc freeTrap*(trapNum: int32) {.header: exec_h, importc: "FreeTrap".}

proc addPort*(port: ptr MsgPort) {.header: exec_h, importc: "AddPort".}
proc remPort*(port: ptr MsgPort) {.header: exec_h, importc: "RemPort".}
proc putMsg*(port: ptr MsgPort, message: ptr Message) {.header: exec_h, importc: "PutMsg".}
proc getMsg*(port: ptr MsgPort): ptr Message {.header: exec_h, importc: "GetMsg".}
proc replyMsg*(message: ptr Message) {.header: exec_h, importc: "ReplyMsg".}
proc waitPort*(port: ptr MsgPort): ptr Message {.header: exec_h, importc: "WaitPort".}
proc findPort*(name: cstring): ptr MsgPort {.header: exec_h, importc: "FindPort".}

proc addLibrary*(library: ptr Library) {.header: exec_h, importc: "AddLibrary".}
proc remLibrary*(library: ptr Library) {.header: exec_h, importc: "RemLibrary".}
proc oldOpenLibrary*(libName: cstring): ptr Library {.header: exec_h, importc: "OldOpenLibrary".}
proc openLibrary*(libName: cstring, version: uint32): ptr Library {.header: exec_h, importc: "OpenLibrary".}
proc closeLibrary*(library: ptr Library) {.header: exec_h, importc: "CloseLibrary".}
proc setFunction*(library: ptr Library, funcOffset: int32, newFunction: proc (): uint32 {.noconv.}): pointer {.header: exec_h, importc: "SetFunction".}
proc sumLibrary*(library: ptr Library) {.header: exec_h, importc: "SumLibrary".}

proc addDevice*(device: ptr Device) {.header: exec_h, importc: "AddDevice".}
proc remDevice*(device: ptr Device) {.header: exec_h, importc: "RemDevice".}
proc openDevice*(devName: cstring, unit: uint32, ioRequest: ptr IORequest, flags: uint32): int8 {.header: exec_h, importc: "OpenDevice".}
proc closeDevice*(ioRequest: ptr IORequest) {.header: exec_h, importc: "CloseDevice".}
proc doIO*(ioRequest: ptr IORequest): int8 {.header: exec_h, importc: "DoIO".}
proc sendIO*(ioRequest: ptr IORequest) {.header: exec_h, importc: "SendIO".}
proc checkIO*(ioRequest: ptr IORequest): ptr IORequest {.header: exec_h, importc: "CheckIO".}
proc waitIO*(ioRequest: ptr IORequest): int8 {.header: exec_h, importc: "WaitIO".}
proc abortIO*(ioRequest: ptr IORequest) {.header: exec_h, importc: "AbortIO".}

proc addResource*(resource: pointer) {.header: exec_h, importc: "AddResource".}
proc remResource*(resource: pointer) {.header: exec_h, importc: "RemResource".}
proc openResource*(resName: cstring): pointer {.header: exec_h, importc: "OpenResource".}

proc rawDoFmt*(formatString: cstring, dataStream: pointer, putChProc: proc () {.noconv.}, putChData: pointer): pointer {.header: exec_h, importc: "RawDoFmt".}

proc procure*(sigSem: ptr SignalSemaphore, bidMsg: ptr SemaphoreMessage): uint32 {.header: exec_h, importc: "Procure".}
proc vacate*(sigSem: ptr SignalSemaphore, bidMsg: ptr SemaphoreMessage) {.header: exec_h, importc: "Vacate".}

proc initSemaphore*(sigSem: ptr SignalSemaphore) {.header: exec_h, importc: "InitSemaphore".}
proc obtainSemaphore*(sigSem: ptr SignalSemaphore) {.header: exec_h, importc: "ObtainSemaphore".}
proc obtainSemaphoreShared*(sigSem: ptr SignalSemaphore) {.header: exec_h, importc: "ObtainSemaphoreShared".}
proc releaseSemaphore*(sigSem: ptr SignalSemaphore) {.header: exec_h, importc: "ReleaseSemaphore".}
proc attemptSemaphore*(sigSem: ptr SignalSemaphore): uint32 {.header: exec_h, importc: "AttemptSemaphore".}
proc attemptSemaphoreShared*(sigSem: ptr SignalSemaphore): uint32 {.header: exec_h, importc: "AttemptSemaphoreShared".}
proc obtainSemaphoreList*(sigSem: ptr List) {.header: exec_h, importc: "ObtainSemaphoreList".}
proc releaseSemaphoreList*(sigSem: ptr List) {.header: exec_h, importc: "ReleaseSemaphoreList".}

proc findSemaphore*(name: cstring): ptr SignalSemaphore {.header: exec_h, importc: "FindSemaphore".}
proc addSemaphore*(sigSem: ptr SignalSemaphore) {.header: exec_h, importc: "AddSemaphore".}
proc remSemaphore*(sigSem: ptr SignalSemaphore) {.header: exec_h, importc: "RemSemaphore".}

proc sumKickData*(): uint32 {.header: exec_h, importc: "SumKickData".}

proc createIORequest*(port: ptr MsgPort, size: uint32): pointer {.header: exec_h, importc: "CreateIORequest".}
proc deleteIORequest*(iorequest: pointer) {.header: exec_h, importc: "DeleteIORequest".}
proc createMsgPort*(): ptr MsgPort {.header: exec_h, importc: "CreateMsgPort".}
proc deleteMsgPort*(port: ptr MsgPort) {.header: exec_h, importc: "DeleteMsgPort".}

proc coldReboot*() {.header: exec_h, importc: "ColdReboot", noReturn.}

proc stackSwap*(newStack: ptr StackSwapStruct) {.header: exec_h, importc: "StackSwap".}

proc cachePreDMA*(address: pointer, length: ptr uint32, flags: uint32): pointer {.header: exec_h, importc: "CachePreDMA".}
proc cachePostDMA*(address: pointer, length: ptr uint32, flags: uint32) {.header: exec_h, importc: "CachePostDMA".}

proc addMemHandler*(memhand: ptr Interrupt) {.header: exec_h, importc: "AddMemHandler".}
proc remMemHandler*(memhand: ptr Interrupt) {.header: exec_h, importc: "RemMemHandler".}

proc avlAddNode*(root: ptr ptr AVLNode, node: ptr AVLNode, `func`: pointer): ptr AVLNode {.header: exec_h, importc: "AVL_AddNode".}
proc avlRemNodeByAddress*(root: ptr ptr AVLNode, node: ptr AVLNode): ptr AVLNode {.header: exec_h, importc: "AVL_RemNodeByAddress".}
proc avlRemNodeByKey*(root: ptr ptr AVLNode, key: pointer, `func`: pointer): ptr AVLNode {.header: exec_h, importc: "AVL_RemNodeByKey".}
proc avlFindNode*(root: ptr AVLNode, key: pointer, `func`: pointer): ptr AVLNode {.header: exec_h, importc: "AVL_FindNode".}
proc avlFindPrevNodeByAddress*(node: ptr AVLNode): ptr AVLNode {.header: exec_h, importc: "AVL_FindPrevNodeByAddress".}
proc avlFindPrevNodeByKey*(root: ptr AVLNode, key: pointer, `func`: pointer): ptr AVLNode {.header: exec_h, importc: "AVL_FindPrevNodeByKey".}
proc avlFindNextNodeByAddress*(node: ptr AVLNode): ptr AVLNode {.header: exec_h, importc: "AVL_FindNextNodeByAddress".}
proc avlFindNextNodeByKey*(root: ptr AVLNode, key: pointer, `func`: pointer): ptr AVLNode {.header: exec_h, importc: "AVL_FindNextNodeByKey".}
proc avlFindFirstNode*(root: ptr AVLNode): ptr AVLNode {.header: exec_h, importc: "AVL_FindFirstNode".}
proc avlFindLastNode*(root: ptr AVLNode): ptr AVLNode {.header: exec_h, importc: "AVL_FindLastNode".}
