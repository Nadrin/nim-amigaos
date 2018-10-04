#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  ExecBase* {.pure.} = object
    libNode*: Library
    softVer*: uint16
    lowMemChkSum*: int16
    chkBase*: uint32
    coldCapture*: pointer
    coolCapture*: pointer
    warmCapture*: pointer
    sysStkUpper*: pointer
    sysStkLower*: pointer
    maxLocMem*: uint32
    debugEntry*: pointer
    debugData*: pointer
    alertData*: pointer
    maxExtMem*: pointer
    chkSum*: uint16
    intVects*: array[16, IntVector]
    thisTask*: ptr Task
    idleCount*: uint32
    dispCount*: uint32
    quantum*: uint16
    elapsed*: uint16
    sysFlags*: uint16
    iDNestCnt*: int8
    tDNestCnt*: int8
    attnFlags*: uint16
    attnResched*: uint16
    resModules*: pointer
    taskTrapCode*: pointer
    taskExceptCode*: pointer
    taskExitCode*: pointer
    taskSigAlloc*: uint32
    taskTrapAlloc*: uint16
    memList*: List
    resourceList*: List
    deviceList*: List
    intrList*: List
    libList*: List
    portList*: List
    taskReady*: List
    taskWait*: List
    softInts*: array[5, SoftIntList]
    lastAlert*: array[4, int32]
    vblankFrequency*: uint8
    powerSupplyFrequency*: uint8
    semaphoreList*: List
    kickMemPtr*: pointer
    kickTagPtr*: pointer
    kickCheckSum*: pointer
    exPad0: uint16
    exLaunchPoint*: uint32
    exRamLibPrivate*: pointer
    exEClockFrequency*: uint32
    exCacheControl*: uint32
    exTaskID*: uint32
    exReserved1: array[5, uint32]
    exMMULock*: pointer
    exReserved2: array[3, uint32]
    exMemHandlers*: MinList
    exMemHandler*: pointer

const
  AFB_68010* = 0
  AFB_68020* = 1
  AFB_68030* = 2
  AFB_68040* = 3
  AFB_68881* = 4
  AFB_68882* = 5
  AFB_FPU40* = 6
  AFB_68060* = 7

const
  AFB_PRIVATE* = 15
  AFF_68010* = (1 shl 0)
  AFF_68020* = (1 shl 1)
  AFF_68030* = (1 shl 2)
  AFF_68040* = (1 shl 3)
  AFF_68881* = (1 shl 4)
  AFF_68882* = (1 shl 5)
  AFF_FPU40* = (1 shl 6)
  AFF_68060* = (1 shl 7)
  AFF_PRIVATE* = (1 shl 15)

const
  CACRF_EnableI* = (1 shl 0)
  CACRF_FreezeI* = (1 shl 1)
  CACRF_ClearI* = (1 shl 3)
  CACRF_IBE* = (1 shl 4)
  CACRF_EnableD* = (1 shl 8)
  CACRF_FreezeD* = (1 shl 9)
  CACRF_ClearD* = (1 shl 11)
  CACRF_DBE* = (1 shl 12)
  CACRF_WriteAllocate* = (1 shl 13)
  CACRF_EnableE* = (1 shl 30)

const
  CACRF_CopyBack* = (1 shl 31)
  DMA_Continue* = (1 shl 1)
  DMA_NoModify* = (1 shl 2)
  DMA_ReadFromRAM* = (1 shl 3)
