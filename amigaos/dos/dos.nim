#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const DOSNAME* = "dos.library"

const
  DOSTRUE*  = -1
  DOSFALSE* = 0

type 
  bpointer* = distinct clong
  bstring* = distinct clong

proc pointer_cast*(x: bpointer): pointer {.inline.} =
  result = cast[pointer](cast[clong](x) shl 2)

proc bpointer_cast*(x: pointer): bpointer {.inline.} =
  result = cast[bpointer](cast[clong](x) shr 2)

type
  AccessMode* = enum
    MODE_READWRITE = 1004,
    MODE_OLDFILE = 1005,
    MODE_NEWFILE = 1006

  SeekOffset* = enum
    OFFSET_BEGINNING = -1,
    OFFSET_CURRENT = 0,
    OFFSET_END = 1

  ChangeType* = enum
    CHANGE_LOCK = 0,
    CHANGE_FH = 1

  LinkType* = enum
    LINK_HARD = 0,
    LINK_SOFT = 1
  
const
  SHARED_LOCK* = -2
  ACCESS_READ* = SHARED_LOCK
  EXCLUSIVE_LOCK* = -1
  ACCESS_WRITE* = EXCLUSIVE_LOCK

type
  DateStamp* {.bycopy.} = object
    days*: int32
    minute*: int32
    tick*: int32

const
  TICKS_PER_SECOND* = 50

type
  FileInfoBlock* {.bycopy.} = object
    diskKey*: int32
    dirEntryType*: int32
    fileName*: array[108, char]
    protection*: int32
    entryType*: int32
    size*: int32
    numBlocks*: int32
    date*: DateStamp
    comment*: array[80, char]
    ownerUID*: uint16
    ownerGID*: uint16
    reserved: array[32, char]

const
  FIBB_OTR_READ* = 15
  FIBB_OTR_WRITE* = 14
  FIBB_OTR_EXECUTE* = 13
  FIBB_OTR_DELETE* = 12
  FIBB_GRP_READ* = 11
  FIBB_GRP_WRITE* = 10
  FIBB_GRP_EXECUTE* = 9
  FIBB_GRP_DELETE* = 8
  FIBB_SCRIPT* = 6
  FIBB_PURE* = 5
  FIBB_ARCHIVE* = 4
  FIBB_READ* = 3
  FIBB_WRITE* = 2
  FIBB_EXECUTE* = 1
  FIBB_DELETE* = 0
  FIBF_OTR_READ* = (1 shl FIBB_OTR_READ)
  FIBF_OTR_WRITE* = (1 shl FIBB_OTR_WRITE)
  FIBF_OTR_EXECUTE* = (1 shl FIBB_OTR_EXECUTE)
  FIBF_OTR_DELETE* = (1 shl FIBB_OTR_DELETE)
  FIBF_GRP_READ* = (1 shl FIBB_GRP_READ)
  FIBF_GRP_WRITE* = (1 shl FIBB_GRP_WRITE)
  FIBF_GRP_EXECUTE* = (1 shl FIBB_GRP_EXECUTE)
  FIBF_GRP_DELETE* = (1 shl FIBB_GRP_DELETE)
  FIBF_SCRIPT* = (1 shl FIBB_SCRIPT)
  FIBF_PURE* = (1 shl FIBB_PURE)
  FIBF_ARCHIVE* = (1 shl FIBB_ARCHIVE)
  FIBF_READ* = (1 shl FIBB_READ)
  FIBF_WRITE* = (1 shl FIBB_WRITE)
  FIBF_EXECUTE* = (1 shl FIBB_EXECUTE)
  FIBF_DELETE* = (1 shl FIBB_DELETE)

type
  InfoData* {.pure.} = object
    numSoftErrors*: int32
    unitNumber*: int32
    diskState*: int32
    numBlocks*: int32
    numBlocksUsed*: int32
    bytesPerBlock*: int32
    diskType*: int32
    volumeNode*: bpointer
    inUse*: int32

const
  ID_WRITE_PROTECTED* = 80
  ID_VALIDATING* = 81
  ID_VALIDATED* = 82

const
  ID_NO_DISK_PRESENT* = (-1)
  ID_UNREADABLE_DISK* = (0x42414400) ## 'BAD\0'
  ID_DOS_DISK* = (0x444F5300) ## 'DOS\0'
  ID_FFS_DISK* = (0x444F5301) ## 'DOS\1'
  ID_INTER_DOS_DISK* = (0x444F5302) ## 'DOS\2'
  ID_INTER_FFS_DISK* = (0x444F5303) ## 'DOS\3'
  ID_FASTDIR_DOS_DISK* = (0x444F5304) ## 'DOS\4'
  ID_FASTDIR_FFS_DISK* = (0x444F5305) ## 'DOS\5'
  ID_NOT_REALLY_DOS* = (0x4E444F53) ## 'NDOS'
  ID_KICKSTART_DISK* = (0x4B49434B) ## 'KICK'
  ID_MSDOS_DISK* = (0x4D534400) ## 'MSD\0'

const
  ERROR_NO_FREE_STORE* = 103
  ERROR_TASK_TABLE_FULL* = 105
  ERROR_BAD_TEMPLATE* = 114
  ERROR_BAD_NUMBER* = 115
  ERROR_REQUIRED_ARG_MISSING* = 116
  ERROR_KEY_NEEDS_ARG* = 117
  ERROR_TOO_MANY_ARGS* = 118
  ERROR_UNMATCHED_QUOTES* = 119
  ERROR_LINE_TOO_LONG* = 120
  ERROR_FILE_NOT_OBJECT* = 121
  ERROR_INVALID_RESIDENT_LIBRARY* = 122
  ERROR_NO_DEFAULT_DIR* = 201
  ERROR_OBJECT_IN_USE* = 202
  ERROR_OBJECT_EXISTS* = 203
  ERROR_DIR_NOT_FOUND* = 204
  ERROR_OBJECT_NOT_FOUND* = 205
  ERROR_BAD_STREAM_NAME* = 206
  ERROR_OBJECT_TOO_LARGE* = 207
  ERROR_ACTION_NOT_KNOWN* = 209
  ERROR_INVALID_COMPONENT_NAME* = 210
  ERROR_INVALID_LOCK* = 211
  ERROR_OBJECT_WRONG_TYPE* = 212
  ERROR_DISK_NOT_VALIDATED* = 213
  ERROR_DISK_WRITE_PROTECTED* = 214
  ERROR_RENAME_ACROSS_DEVICES* = 215
  ERROR_DIRECTORY_NOT_EMPTY* = 216
  ERROR_TOO_MANY_LEVELS* = 217
  ERROR_DEVICE_NOT_MOUNTED* = 218
  ERROR_SEEK_ERROR* = 219
  ERROR_COMMENT_TOO_BIG* = 220
  ERROR_DISK_FULL* = 221
  ERROR_DELETE_PROTECTED* = 222
  ERROR_WRITE_PROTECTED* = 223
  ERROR_READ_PROTECTED* = 224
  ERROR_NOT_A_DOS_DISK* = 225
  ERROR_NO_DISK* = 226
  ERROR_NO_MORE_ENTRIES* = 232
  ERROR_IS_SOFT_LINK* = 233
  ERROR_OBJECT_LINKED* = 234
  ERROR_BAD_HUNK* = 235
  ERROR_NOT_IMPLEMENTED* = 236
  ERROR_RECORD_NOT_LOCKED* = 240
  ERROR_LOCK_COLLISION* = 241
  ERROR_LOCK_TIMEOUT* = 242
  ERROR_UNLOCK_ERROR* = 243

const
  RETURN_OK* = 0
  RETURN_WARN* = 5
  RETURN_ERROR* = 10
  RETURN_FAIL* = 20
  
const
  SIGBREAKB_CTRL_C* = 12
  SIGBREAKB_CTRL_D* = 13
  SIGBREAKB_CTRL_E* = 14
  SIGBREAKB_CTRL_F* = 15
  
const
  SIGBREAKF_CTRL_C* = (1 shl SIGBREAKB_CTRL_C)
  SIGBREAKF_CTRL_D* = (1 shl SIGBREAKB_CTRL_D)
  SIGBREAKF_CTRL_E* = (1 shl SIGBREAKB_CTRL_E)
  SIGBREAKF_CTRL_F* = (1 shl SIGBREAKB_CTRL_F)
  
const
  LOCK_DIFFERENT* = -1
  LOCK_SAME* = 0
  LOCK_SAME_VOLUME* = 1
  LOCK_SAME_HANDLER* = LOCK_SAME_VOLUME
  
const
  ITEM_EQUAL* = -2
  ITEM_ERROR* = -1
  ITEM_NOTHING* = 0
  ITEM_UNQUOTED* = 1
  ITEM_QUOTED* = 2
  
const
  DOS_FILEHANDLE* = 0
  DOS_EXALLCONTROL* = 1
  DOS_FIB* = 2
  DOS_STDPKT* = 3
  DOS_CLI* = 4
  DOS_RDARGS* = 5
