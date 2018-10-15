#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  Process* {.bycopy.} = object
    task*: Task
    msgPort*: MsgPort
    pad: int16
    segList*: bpointer
    stackSize*: int32
    globVec*: pointer
    taskNum*: int32
    stackBase*: bpointer
    result2*: int32
    currentDir*: bpointer
    cis*: bpointer
    cos*: bpointer
    consoleTask*: pointer
    fileSystemTask*: pointer
    cli*: bpointer
    returnAddr*: pointer
    pktWait*: pointer
    windowPtr*: pointer
    homeDir*: bpointer
    flags*: int32
    exitCode*: proc () {.noconv.}
    exitData*: int32
    arguments*: ptr cstring
    localVars*: MinList
    shellPrivate*: uint32
    ces*: bpointer

const
  PRB_FREESEGLIST* = 0
  PRF_FREESEGLIST* = 1
  PRB_FREECURRDIR* = 1
  PRF_FREECURRDIR* = 2
  PRB_FREECLI* = 2
  PRF_FREECLI* = 4
  PRB_CLOSEINPUT* = 3
  PRF_CLOSEINPUT* = 8
  PRB_CLOSEOUTPUT* = 4
  PRF_CLOSEOUTPUT* = 16
  PRB_FREEARGS* = 5
  PRF_FREEARGS* = 32

type
  FileHandle* {.bycopy.} = object
    link*: ptr Message
    port*: ptr MsgPort
    `type`*: ptr MsgPort
    buf*: int32
    pos*: int32
    `end`*: int32
    funcs*: int32
    func2*: int32
    func3*: int32
    args*: int32
    arg2*: int32

type
  DosPacket* {.bycopy.} = object
    link*: ptr Message
    port*: ptr MsgPort
    `type`*: int32
    res1*: int32
    res2*: int32
    arg1*: int32
    arg2*: int32
    arg3*: int32
    arg4*: int32
    arg5*: int32
    arg6*: int32
    arg7*: int32

type
  StandardPacket* {.bycopy.} = object
    msg*: Message
    pkt*: DosPacket

const
  ACTION_NIL* = 0
  ACTION_STARTUP* = 0
  ACTION_GET_BLOCK* = 2
  ACTION_SET_MAP* = 4
  ACTION_DIE* = 5
  ACTION_EVENT* = 6
  ACTION_CURRENT_VOLUME* = 7
  ACTION_LOCATE_OBJECT* = 8
  ACTION_RENAME_DISK* = 9
  ACTION_WRITE* = int('W')
  ACTION_READ* = int('R')
  ACTION_FREE_LOCK* = 15
  ACTION_DELETE_OBJECT* = 16
  ACTION_RENAME_OBJECT* = 17
  ACTION_MORE_CACHE* = 18
  ACTION_COPY_DIR* = 19
  ACTION_WAIT_CHAR* = 20
  ACTION_SET_PROTECT* = 21
  ACTION_CREATE_DIR* = 22
  ACTION_EXAMINE_OBJECT* = 23
  ACTION_EXAMINE_NEXT* = 24
  ACTION_DISK_INFO* = 25
  ACTION_INFO* = 26
  ACTION_FLUSH* = 27
  ACTION_SET_COMMENT* = 28
  ACTION_PARENT* = 29
  ACTION_TIMER* = 30
  ACTION_INHIBIT* = 31
  ACTION_DISK_TYPE* = 32
  ACTION_DISK_CHANGE* = 33
  ACTION_SET_DATE* = 34
  ACTION_SCREEN_MODE* = 994
  ACTION_READ_RETURN* = 1001
  ACTION_WRITE_RETURN* = 1002
  ACTION_SEEK* = 1008
  ACTION_FINDUPDATE* = 1004
  ACTION_FINDINPUT* = 1005
  ACTION_FINDOUTPUT* = 1006
  ACTION_END* = 1007
  ACTION_SET_FILE_SIZE* = 1022
  ACTION_WRITE_PROTECT* = 1023
  ACTION_SAME_LOCK* = 40
  ACTION_CHANGE_SIGNAL* = 995
  ACTION_FORMAT* = 1020
  ACTION_MAKE_LINK* = 1021
  ACTION_READ_LINK* = 1024
  ACTION_FH_FROM_LOCK* = 1026
  ACTION_IS_FILESYSTEM* = 1027
  ACTION_CHANGE_MODE* = 1028
  ACTION_COPY_DIR_FH* = 1030
  ACTION_PARENT_FH* = 1031
  ACTION_EXAMINE_ALL* = 1033
  ACTION_EXAMINE_FH* = 1034
  ACTION_LOCK_RECORD* = 2008
  ACTION_FREE_RECORD* = 2009
  ACTION_ADD_NOTIFY* = 4097
  ACTION_REMOVE_NOTIFY* = 4098
  ACTION_EXAMINE_ALL_END* = 1035
  ACTION_SET_OWNER* = 1036
  ACTION_SERIALIZE_DISK* = 4200

type
  ErrorString* {.bycopy.} = object
    nums*: ptr int32
    strings*: ptr cstring

  DosLibrary* {.bycopy.} = object
    lib*: Library
    root*: ptr RootNode
    gv*: pointer
    a2*: int32
    a5*: int32
    a6*: int32
    errors*: ptr ErrorString
    timeReq*: ptr TimeRequest
    utilityBase*: ptr Library
    intuitionBase*: ptr Library

  RootNode* {.bycopy.} = object
    taskArray*: bpointer
    consoleSegment*: bpointer
    time*: DateStamp
    restartSeg*: int32
    info*: bpointer
    fileHandlerSegment*: bpointer
    cliList*: MinList
    bootProc*: ptr MsgPort
    shellSegment*: bpointer
    flags*: int32

const
  RNB_WILDSTAR* = 24
  RNF_WILDSTAR* = (1 shl 24)
  RNB_PRIVATE1* = 1
  RNF_PRIVATE1* = 2

type
  CliProcList* {.bycopy.} = object
    node*: MinNode
    first*: int32
    `array`*: ptr ptr MsgPort

  DosInfo* {.bycopy.} = object
    mcName*: bpointer
    devInfo*: bpointer
    devices*: bpointer
    handlers*: bpointer
    netHand*: pointer
    devLock*: SignalSemaphore
    entryLock*: SignalSemaphore
    deleteLock*: SignalSemaphore

type
  Segment* {.bycopy.} = object
    next*: bpointer
    uc*: int32
    seg*: bpointer
    name*: array[4, char]

const
  CMD_SYSTEM* = -1
  CMD_INTERNAL* = -2
  CMD_DISABLED* = -999

type
  CommandLineInterface* {.bycopy.} = object
    result2*: int32
    setName*: bstring
    commandDir*: bpointer
    returnCode*: int32
    commandName*: bstring
    failLevel*: int32
    prompt*: bstring
    standardInput*: bpointer
    currentInput*: bpointer
    commandFile*: bstring
    interactive*: int32
    background*: int32
    currentOutput*: bpointer
    defaultStack*: int32
    standardOutput*: bpointer
    module*: bpointer

type
  DeviceList* {.bycopy.} = object
    next*: bpointer
    `type`*: int32
    task*: ptr MsgPort
    lock*: bpointer
    volumeDate*: DateStamp
    lockList*: bpointer
    diskType*: int32
    unused: int32
    name*: bstring

  DevInfo* {.bycopy.} = object
    next*: bpointer
    `type`*: int32
    task*: pointer
    lock*: bpointer
    handler*: bstring
    stackSize*: int32
    priority*: int32
    startup*: int32
    segList*: bpointer
    globVec*: bpointer
    name*: bstring

type
  DosHandler* {.bycopy.} = object
    handler*: bstring
    stackSize*: int32
    priority*: int32
    startup*: uint32
    segList*: bpointer
    globVec*: bpointer

  DosVolume* {.bycopy.} = object
    volumeDate*: DateStamp
    lockList*: bpointer
    diskType*: int32

  DosAssign* {.bycopy.} = object
    assignName*: ptr char
    list*: ptr AssignList

  DosListUnion* {.bycopy.} = object {.union.}
    handler*: DosHandler
    volume*: DosVolume
    assign*: DosAssign

  DosList* {.bycopy.} = object
    Next*: bpointer
    Type*: int32
    Task*: ptr MsgPort
    Lock*: bpointer
    misc*: DosListUnion
    Name*: bstring

  AssignList* {.bycopy.} = object
    next*: ptr AssignList
    lock*: bpointer

const
  DLT_DEVICE* = 0
  DLT_DIRECTORY* = 1
  DLT_VOLUME* = 2
  DLT_LATE* = 3
  DLT_NONBINDING* = 4
  DLT_PRIVATE* = -1

type
  DevProc* {.bycopy.} = object
    port*: ptr MsgPort
    lock*: bpointer
    flags*: uint32
    devNode*: ptr DosList

const
  DVPB_UNLOCK* = 0
  DVPB_ASSIGN* = 1

const
  DVPF_UNLOCK* = (1 shl DVPB_UNLOCK)
  DVPF_ASSIGN* = (1 shl DVPB_ASSIGN)

const
  LDB_DEVICES* = 2
  LDB_VOLUMES* = 3
  LDB_ASSIGNS* = 4
  LDB_ENTRY* = 5
  LDB_DELETE* = 6

const
  LDF_DEVICES* = (1 shl LDB_DEVICES)
  LDF_VOLUMES* = (1 shl LDB_VOLUMES)
  LDF_ASSIGNS* = (1 shl LDB_ASSIGNS)
  LDF_ENTRY* = (1 shl LDB_ENTRY)
  LDF_DELETE* = (1 shl LDB_DELETE)

const
  LDB_READ* = 0
  LDB_WRITE* = 1

const
  LDF_READ* = (1 shl LDB_READ)
  LDF_WRITE* = (1 shl LDB_WRITE)
  LDF_ALL* = (LDF_DEVICES or LDF_VOLUMES or LDF_ASSIGNS)

type
  FileLock* {.bycopy.} = object
    link*: bpointer
    key*: int32
    access*: int32
    task*: ptr MsgPort
    volume*: bpointer

const
  REPORT_STREAM* = 0
  REPORT_TASK* = 1
  REPORT_LOCK* = 2
  REPORT_VOLUME* = 3
  REPORT_INSERT* = 4

const
  ABORT_DISK_ERROR* = 296
  ABORT_BUSY* = 288

const
  RUN_EXECUTE* = -1
  RUN_SYSTEM* = -2
  RUN_SYSTEM_ASYNCH* = -3

const
  ST_ROOT* = 1
  ST_USERDIR* = 2
  ST_SOFTLINK* = 3
  ST_LINKDIR* = 4
  ST_FILE* = -3
  ST_LINKFILE* = -4
  ST_PIPEFILE* = -5
