#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

## Amiga OS 3 API: DOS library

import exec
import utility
import devices

include dos/dos
include dos/dosextens
include dos/dosasl
include dos/datetime
include dos/doshunks
include dos/dostags
include dos/dosvar
include dos/exall
include dos/filehandler
include dos/notify
include dos/rdargs
include dos/record
include dos/stdio

const DefaultBufSize = 256
const dos_h = "<proto/dos.h>"

# TODO: Temp!
type OSErrorCode* = distinct int
func raiseOSError(err: OSErrorCode) {.raises: [OSError].} =
  raise newException(OSError, "Unimplemented")

proc c_open(name: cstring, accessMode: int): bpointer {.header: dos_h, importc: "Open".}
proc open*(name: cstring, accessMode: AccessMode): bpointer {.inline.} =
  result = c_open(name, ord(accessMode))

proc close*(file: bpointer): bool {.header: dos_h, importc: "Close".}
proc read*(file: bpointer, buffer: pointer, length: Natural): int {.header: dos_h, importc: "Read".}
proc write*(file: bpointer, buffer: pointer, length: Natural): int {.header: dos_h, importc: "Write".}

proc input*(): bpointer {.header: dos_h, importc: "Input".}
proc output*(): bpointer {.header: dos_h, importc: "Output".}

proc c_seek(file: bpointer, position: int, mode: int): int {.header: dos_h, importc: "Seek".}
proc seek*(file: bpointer, position: int, mode: SeekOffset): int {.inline.} =
  result = c_seek(file, position, int(ord(mode)))

proc deleteFile*(name: cstring): bool {.header: dos_h, importc: "DeleteFile".}
proc rename*(oldName: cstring, newName: cstring): bool {.header: dos_h, importc: "Rename".}

proc lock*(name: cstring, `type`: int): bpointer {.header: dos_h, importc: "Lock".}
proc unLock*(lock: bpointer) {.header: dos_h, importc: "UnLock".}
proc dupLock*(lock: bpointer): bpointer {.header: dos_h, importc: "DupLock".}
proc dupLockFromFH*(fh: bpointer): bpointer {.header: dos_h, importc: "DupLockFromFH".}
proc openFromLock*(lock: bpointer): bpointer {.header: dos_h, importc: "OpenFromLock".}
proc sameLock*(lock1: bpointer, lock2: bpointer): int {.header: dos_h, importc: "SameLock".}

proc examine*(lock: bpointer, fileInfoBlock: ptr FileInfoBlock): bool {.header: dos_h, importc: "Examine".}
proc exNext*(lock: bpointer, fileInfoBlock: ptr FileInfoBlock): bool {.header: dos_h, importc: "ExNext".}
proc exAll*(lock: bpointer, buffer: ptr ExAllData, size: int, `type`: int, control: ptr ExAllControl): bool {.header: dos_h, importc: "ExAll".}
proc exAllEnd*(lock: bpointer, buffer: ptr ExAllData, size: int, `type`: int, control: ptr ExAllControl) {.header: dos_h, importc: "ExAllEnd".}

proc info*(lock: bpointer, parameterBlock: ptr InfoData): bool {.header: dos_h, importc: "Info".}

proc createDir*(name: cstring): bpointer {.header: dos_h, importc: "CreateDir".}
proc currentDir*(lock: bpointer): bpointer {.header: dos_h, importc: "CurrentDir".}
proc parentDir*(lock: bpointer): bpointer {.header: dos_h, importc: "ParentDir".}

proc ioErr*(): OSErrorCode {.header: dos_h, importc: "IoErr".}
proc setIoErr*(result: OSErrorCode): OSErrorCode {.header: dos_h, importc: "SetIoErr".}

proc createProc*(name: cstring, pri: int, segList: bpointer, stackSize: Natural): ptr MsgPort {.header: dos_h, importc: "CreateProc".}

proc loadSeg*(name: cstring): bpointer {.header: dos_h, importc: "LoadSeg".}
proc unLoadSeg*(seglist: bpointer) {.header: dos_h, importc: "UnLoadSeg".}

proc deviceProc*(name: cstring): ptr MsgPort {.header: dos_h, importc: "DeviceProc".}

proc setComment*(name: cstring, comment: cstring): bool {.header: dos_h, importc: "SetComment".}
proc setProtection*(name: cstring, protect: int): bool {.header: dos_h, importc: "SetProtection".}

proc c_dateStamp(date: ptr DateStamp): ptr DateStamp {.header: dos_h, importc: "DateStamp".}
proc dateStamp*(): DateStamp {.inline.} =
  discard c_dateStamp(addr result)

proc delay*(timeout: Natural) {.header: dos_h, importc: "Delay".}

proc waitForChar*(file: bpointer, timeout: Natural): bool {.header: dos_h, importc: "WaitForChar".}

proc isInteractive*(file: bpointer): bool {.header: dos_h, importc: "IsInteractive".}

proc execute*(command: cstring, input: bpointer, output: bpointer): bool {.header: dos_h, importc: "Execute".}

proc c_allocDosObjectTagList(`type`: uint, tags: ptr TagItem): pointer {.header: dos_h, importc: "AllocDosObjectTagList".}
proc allocDosObject*[T](`type`: uint, tags: openarray[TagItem]): ptr T {.inline.} =
  result = cast[ptr T](c_allocDosObjectTagList(`type`, unsafeAddr tags[0]))
proc allocDosObjectTagList*[T](`type`: uint, tags: openarray[TagItem]): ptr T {.inline.} =
  result = cast[ptr T](c_allocDosObjectTagList(`type`, unsafeAddr tags[0]))

proc allocDosObjectTags*[T](`type`: uint, tags: Tag): ptr T {.header: dos_h, importc: "AllocDosObjectTags", varargs.}
proc freeDosObject*[T](`type`: uint, `ptr`: ptr T) {.header: dos_h, importc: "FreeDosObject".}

proc c_doPkt0(port: ptr MsgPort, action: int): int {.header: dos_h, importc: "DoPkt0".}
proc c_doPkt1(port: ptr MsgPort, action: int, arg1: int): int {.header: dos_h, importc: "DoPkt1".}
proc c_doPkt2(port: ptr MsgPort, action: int, arg1: int, arg2: int): int {.header: dos_h, importc: "DoPkt2".}
proc c_doPkt3(port: ptr MsgPort, action: int, arg1: int, arg2: int, arg3: int): int {.header: dos_h, importc: "DoPkt3".}
proc c_doPkt4(port: ptr MsgPort, action: int, arg1: int, arg2: int, arg3: int, arg4: int): int {.header: dos_h, importc: "DoPkt4".}
proc c_doPkt5(port: ptr MsgPort, action: int, arg1: int, arg2: int, arg3: int, arg4: int, arg5: int): int {.header: dos_h, importc: "DoPkt".}

proc doPkt*(port: ptr MsgPort, action: int, args: varargs[int]): int {.inline raises: [OSError].} =
  case args.len:
    of 0:
      result = c_doPkt0(port, action)
    of 1:
      result = c_doPkt1(port, action, args[0])
    of 2:
      result = c_doPkt2(port, action, args[0], args[1])
    of 3:
      result = c_doPkt3(port, action, args[0], args[1], args[2])
    of 4:
      result = c_doPkt4(port, action, args[0], args[1], args[2], args[3])
    of 5:
      result = c_doPkt5(port, action, args[0], args[1], args[2], args[3], args[4])
    else:
      raise newException(OSError, "Too many arguments passed to doPkt (maximum of 5 is supported)")

proc c_replyPkt(dp: ptr DosPacket, res1: int, res2: int) {.header: dos_h, importc: "ReplyPkt".}

proc replyPkt*(dp: ptr DosPacket, results: varargs[int]) {.inline raises: [OSError].} =
  case results.len:
    of 0:
      c_replyPkt(dp, 0, 0)
    of 1:
      c_replyPkt(dp, results[0], 0)
    of 2:
      c_replyPkt(dp, results[0], results[1])
    else:
      raise newException(OSError, "Too many results passed to replyPkt (maximum of 2 is supported)")

proc sendPkt*(dp: ptr DosPacket, port: ptr MsgPort, replyport: ptr MsgPort) {.header: dos_h, importc: "SendPkt".}
proc waitPkt*(): ptr DosPacket {.header: dos_h, importc: "WaitPkt".}
proc abortPkt*(port: ptr MsgPort, pkt: ptr DosPacket) {.header: dos_h, importc: "AbortPkt".}

proc lockRecord*(fh: bpointer, offset: Natural, length: Natural, mode: uint, timeout: Natural): bool {.header: dos_h, importc: "LockRecord".}
proc unLockRecord*(fh: bpointer, offset: Natural, length: Natural): bool {.header: dos_h, importc: "UnLockRecord".}

proc c_lockRecords(recArray: ptr RecordLock, timeout: Natural): bool {.header: dos_h, importc: "LockRecords".}
proc lockRecords*(recArray: openarray[RecordLock], timeout: Natural): bool {.inline.} =
  result = c_lockRecords(unsafeAddr recArray[0], timeout)

proc c_unLockRecords(recArray: ptr RecordLock): bool {.header: dos_h, importc: "UnLockRecords".}
proc unLockRecords*(recArray: openarray[RecordLock]): bool {.inline.} =
  result = c_unLockRecords(unsafeAddr recArray[0])

proc selectInput*(fh: bpointer): bpointer {.header: dos_h, importc: "SelectInput".}
proc selectOutput*(fh: bpointer): bpointer {.header: dos_h, importc: "SelectOutput".}

proc fread*(fh: bpointer, buffer: pointer, size: Natural, count: Natural): Natural {.header: dos_h, importc: "FRead".}
proc fwrite*(fh: bpointer, buffer: pointer, size: Natural, count: Natural): Natural {.header: dos_h, importc: "FWrite".}

proc fgetc*(fh: bpointer): int {.header: dos_h, importc: "FGetC".}
proc ungetc*(fh: bpointer, ch: int): int {.header: dos_h, importc: "UnGetC".}

proc c_fputc(fh: bpointer, ch: int): int {.header: dos_h, importc: "FPutC".}
proc fputc*(fh: bpointer, ch: char): int {.inline.} =
  result = c_fputc(fh, int(ch))

proc c_fgets(fh: bpointer, str: cstring, maxlen: Natural): cstring {.header: dos_h, importc: "FGets".}
proc fgets*(fh: bpointer, maxlen: Natural = DefaultBufSize): string {.inline.} =
  result = newString(maxlen)
  discard c_fgets(fh, result, maxlen)
  setLen(result, len(cstring(result)))

proc c_fputs(fh: bpointer, str: cstring): int {.header: dos_h, importc: "FPuts".}
proc fputs*(fh: bpointer, str: cstring): bool {.inline.} =
  result = (c_fputs(fh, str) == 0)

# TODO: Expose in an idiomatic way.
#proc vfwritef*(fh: bpointer, format: cstring, argarray: ptr int) {.header: dos_h, importc: "VFWritef".}
#proc vfprintf*(fh: bpointer, format: cstring, argarray: pointer): int {.header: dos_h, importc: "VFPrintf".}
#proc vprintf*(format: cstring, argarray: pointer): int {.header: dos_h, importc: "VPrintf".}

proc fwritef*(fh: bpointer, format: cstring): int {.header: dos_h, importc: "FWritef", varargs.}
proc fprintf*(fh: bpointer, format: cstring): int {.header: dos_h, importc: "FPrintf", varargs.}
proc printf*(format: cstring): int {.header: dos_h, importc: "Printf", varargs.}

proc c_setvbuf(fh: bpointer, buff: cstring, `type`: int, size: int): int {.header: dos_h, importc: "SetVBuf".}
proc setvbuf*(fh: bpointer, buff: cstring, `type`: BufferingMode, size: int): bool {.inline.} =
  result = (c_setVBuf(fh, buff, ord(`type`), size) == 0)

proc c_flush(fh: bpointer): int {.header: dos_h, importc: "Flush".}
proc flush*(fh: bpointer) {.inline.} =
  discard c_flush(fh)

proc parentOfFH*(fh: bpointer): bpointer {.header: dos_h, importc: "ParentOfFH".}
proc examineFH*(fh: bpointer, fib: ptr FileInfoBlock): bool {.header: dos_h, importc: "ExamineFH".}

proc c_nameFromLock(lock: bpointer, buffer: cstring, len: int): int {.header: dos_h, importc: "NameFromLock".}
proc nameFromLock*(lock: bpointer, maxlen: Natural = DefaultBufSize): string {.inline raises: [OSError].} =
  result = newString(maxlen)
  if c_nameFromLock(lock, result, maxlen) != 0:
    setLen(result, len(cstring(result)))
  else:
    raiseOSError(ioErr())

proc c_nameFromFH(fh: bpointer, buffer: cstring, len: int): int {.header: dos_h, importc: "NameFromFH".}
proc nameFromFH*(fh: bpointer, maxlen: Natural = DefaultBufSize): string {.inline raises: [OSError].} =
  result = newString(maxlen)
  if c_nameFromFH(fh, result, maxlen) != 0:
    setLen(result, len(cstring(result)))
  else:
    raiseOSError(ioErr())

proc setFileDate*(name: cstring, date: ptr DateStamp): bool {.header: dos_h, importc: "SetFileDate".}
proc setMode*(fh: bpointer, mode: int): bool {.header: dos_h, importc: "SetMode".}

proc c_splitName(name: cstring, separator: char, buf: cstring, oldpos: int16, size: int): int16 {.header: dos_h, importc: "SplitName".}
proc splitName*(name: cstring, separator: char, oldpos: int, maxlen: Natural = DefaultBufSize): (string, int) {.inline.} =
  result[0] = newString(maxlen)
  result[1] = int(c_splitName(name, separator, result[0], int16(oldpos), maxlen))
  setLen(result[0], len(cstring(result[0])))

proc readLink*(port: ptr MsgPort, lock: bpointer, path: cstring, buffer: cstring, size: uint): bool {.header: dos_h, importc: "ReadLink".}

proc c_makeLink(name: cstring, dest: bpointer, `type`: int): int {.header: dos_h, importc: "MakeLink".}
proc makeLink*(name: cstring, dest: bpointer, `type`: LinkType): bool {.inline.} =
  result = (c_makeLink(name, dest, int(ord(`type`))) != 0)

proc c_changeMode(`type`: int, fh: bpointer, newmode: int): int {.header: dos_h, importc: "ChangeMode".}
proc changeMode*(`type`: ChangeType, fh: bpointer, newmode: int): bool {.inline.} =
  result = (c_changeMode(ord(`type`), fh, newmode) != 0)

proc c_setFileSize(fh: bpointer, pos: int, mode: int): int {.header: dos_h, importc: "SetFileSize".}
proc setFileSize*(fh: bpointer, pos: int, mode: SeekOffset): int {.inline.} =
  result = c_setFileSize(fh, pos, ord(mode))

proc c_fault(code: OSErrorCode, header: cstring, buffer: cstring, len: int): int {.header: dos_h, importc: "Fault".}
proc fault*(code: OSErrorCode, header: cstring, maxlen: Natural = DefaultBufSize): string {.inline.} =
  result = newString(maxlen)
  let len = c_fault(code, header, result, maxlen)
  setLen(result, len)

proc printFault*(code: int, header: cstring): bool {.header: dos_h, importc: "PrintFault".}
proc errorReport*(code: int, `type`: int, arg1: uint, device: ptr MsgPort): bool {.header: dos_h, importc: "ErrorReport".}

proc cli*(): ptr CommandLineInterface {.header: dos_h, importc: "Cli".}

proc c_createNewProcTagList(tags: ptr TagItem): ptr Process {.header: dos_h, importc: "CreateNewProcTagList".}
proc createNewProc*(tags: openarray[TagItem]): ptr Process {.inline.} =
  result = c_createNewProcTagList(unsafeAddr tags[0])
proc createNewProcTagList*(tags: openarray[TagItem]): ptr Process {.inline.} =
  result = c_createNewProcTagList(unsafeAddr tags[0])

proc createNewProcTags*(tags: Tag): ptr Process {.header: dos_h, importc: "CreateNewProcTags", varargs.}

proc c_runCommand(seg: bpointer, stack: int, paramptr: cstring, paramlen: int): int {.header: dos_h, importc: "RunCommand".}
proc runCommand*(seg: bpointer, stack: int, params: string): int {.inline.} =
  result = c_runCommand(seg, stack, params, int(params.len))

proc getConsoleTask*(): ptr MsgPort {.header: dos_h, importc: "GetConsoleTask".}
proc setConsoleTask*(task: ptr MsgPort): ptr MsgPort {.header: dos_h, importc: "SetConsoleTask".}
proc getFileSysTask*(): ptr MsgPort {.header: dos_h, importc: "GetFileSysTask".}
proc setFileSysTask*(task: ptr MsgPort): ptr MsgPort {.header: dos_h, importc: "SetFileSysTask".}

proc getArgStr*(): cstring {.header: dos_h, importc: "GetArgStr".}
proc setArgStr*(string: cstring): cstring {.header: dos_h, importc: "SetArgStr".}

proc findCliProc*(num: uint): ptr Process {.header: dos_h, importc: "FindCliProc".}
proc maxCli*(): uint {.header: dos_h, importc: "MaxCli".}

proc c_getCurrentDirName(buf: cstring, len: int): bool {.header: dos_h, importc: "GetCurrentDirName".}
proc getCurrentDirName*(maxlen: Natural = DefaultBufSize): string {.inline raises: [OSError].} =
  result = newString(maxlen)
  if c_getCurrentDirName(result, maxlen):
    setLen(result, len(cstring(result)))
  else:
    raiseOSError(ioErr())

proc setCurrentDirName*(name: cstring): bool {.header: dos_h, importc: "SetCurrentDirName".}

proc c_getProgramName(buf: cstring, len: int): bool {.header: dos_h, importc: "GetProgramName".}
proc getProgramName*(maxlen: Natural = DefaultBufSize): string {.inline raises: [OSError].} =
  result = newString(maxlen)
  if c_getProgramName(result, maxlen):
    setLen(result, len(cstring(result)))
  else:
    raiseOSError(ioErr())

proc setProgramName*(name: cstring): bool {.header: dos_h, importc: "SetProgramName".}

proc c_getPrompt(buf: cstring, len: int): bool {.header: dos_h, importc: "GetPrompt".}
proc getPrompt*(maxlen: Natural = DefaultBufSize): string {.inline raises: [OSError].} =
  result = newString(maxlen)
  if c_getPrompt(result, maxlen):
    setLen(result, len(cstring(result)))
  else:
    raiseOSError(ioErr())

proc setPrompt*(name: cstring): bool {.header: dos_h, importc: "SetPrompt".}

proc getProgramDir*(): bpointer {.header: dos_h, importc: "GetProgramDir".}
proc setProgramDir*(lock: bpointer): bpointer {.header: dos_h, importc: "SetProgramDir".}

proc c_systemTagList(command: cstring, tags: ptr TagItem): int {.header: dos_h, importc: "SystemTagList".}
proc system*(command: cstring, tags: openarray[TagItem]): int {.inline.} =
  result = c_systemTagList(command, unsafeAddr tags[0])
proc systemTagList*(command: cstring, tags: openarray[TagItem]): int {.inline.} =
  result = c_systemTagList(command, unsafeAddr tags[0])

proc systemTags*(command: cstring, tags: Tag): int {.header: dos_h, importc: "SystemTags", varargs.}

proc assignLock*(name: cstring, lock: bpointer): bool {.header: dos_h, importc: "AssignLock".}
proc assignLate*(name: cstring, path: cstring): bool {.header: dos_h, importc: "AssignLate".}
proc assignPath*(name: cstring, path: cstring): bool {.header: dos_h, importc: "AssignPath".}
proc assignAdd*(name: cstring, lock: bpointer): bool {.header: dos_h, importc: "AssignAdd".}
proc remAssignList*(name: cstring, lock: bpointer): bool {.header: dos_h, importc: "RemAssignList".}

proc getDeviceProc*(name: cstring, dp: ptr DevProc): ptr DevProc {.header: dos_h, importc: "GetDeviceProc".}
proc freeDeviceProc*(dp: ptr DevProc) {.header: dos_h, importc: "FreeDeviceProc".}

proc lockDosList*(flags: uint): ptr DosList {.header: dos_h, importc: "LockDosList".}
proc unLockDosList*(flags: uint) {.header: dos_h, importc: "UnLockDosList".}
proc attemptLockDosList*(flags: uint): ptr DosList {.header: dos_h, importc: "AttemptLockDosList".}

proc remDosEntry*(dlist: ptr DosList): bool {.header: dos_h, importc: "RemDosEntry".}
proc addDosEntry*(dlist: ptr DosList): bool {.header: dos_h, importc: "AddDosEntry".}
proc findDosEntry*(dlist: ptr DosList, name: cstring, flags: uint): ptr DosList {.header: dos_h, importc: "FindDosEntry".}
proc nextDosEntry*(dlist: ptr DosList, flags: uint): ptr DosList {.header: dos_h, importc: "NextDosEntry".}
proc makeDosEntry*(name: cstring, `type`: int): ptr DosList {.header: dos_h, importc: "MakeDosEntry".}
proc freeDosEntry*(dlist: ptr DosList) {.header: dos_h, importc: "FreeDosEntry".}

proc isFileSystem*(name: cstring): bool {.header: dos_h, importc: "IsFileSystem".}
proc format*(filesystem: cstring, volumename: cstring, dostype: uint): bool {.header: dos_h, importc: "Format".}
proc relabel*(drive: cstring, newname: cstring): bool {.header: dos_h, importc: "Relabel".}

proc c_inhibit(name: cstring, onoff: int): bool {.header: dos_h, importc: "Inhibit".}
proc inhibit*(name: cstring, onoff: bool): bool {.inline.} =
  let flag = if onoff: DOSTRUE
             else: DOSFALSE
  result = c_inhibit(name, flag)

proc addBuffers*(name: cstring, number: int): bool {.header: dos_h, importc: "AddBuffers".}

proc compareDates*(date1: ptr DateStamp, date2: ptr DateStamp): int {.header: dos_h, importc: "CompareDates".}
proc dateToStr*(datetime: ptr DateTime): bool {.header: dos_h, importc: "DateToStr".}
proc strToDate*(datetime: ptr DateTime): bool {.header: dos_h, importc: "StrToDate".}

# TODO: Expose in an idiomatic way.
#proc internalLoadSeg*(fh: bpointer, table: bpointer, funcarray: ptr int, stack: ptr int): bpointer {.header: dos_h, importc: "InternalLoadSeg".}
#proc internalUnLoadSeg*(seglist: bpointer, freefunc: proc ()): bool {.header: dos_h, importc: "InternalUnLoadSeg".}

proc c_newLoadSegTagList(file: cstring, tags: ptr TagItem): bpointer {.header: dos_h, importc: "NewLoadSegTagList".}
proc newLoadSeg*(file: cstring, tags: openarray[TagItem]): bpointer {.inline.} =
  result = c_newLoadSegTagList(file, unsafeAddr tags[0])
proc newLoadSegTagList*(file: cstring, tags: openarray[TagItem]): bpointer {.inline.} =
  result = c_newLoadSegTagList(file, unsafeAddr tags[0])

proc newLoadSegTags*(file: cstring, tags: Tag): bpointer {.header: dos_h, importc: "NewLoadSegTags", varargs.}

proc addSegment*(name: cstring, seg: bpointer, usecount: int): bool {.header: dos_h, importc: "AddSegment".}
proc findSegment*(name: cstring, seg: ptr Segment, system: bool): ptr Segment {.header: dos_h, importc: "FindSegment".}
proc remSegment*(seg: ptr Segment): int {.header: dos_h, importc: "RemSegment".}

proc checkSignal*(mask: uint): uint {.header: dos_h, importc: "CheckSignal".}

proc c_readArgs(arg_template: cstring, array: ptr pointer, args: ptr RDArgs): ptr RDArgs {.header: dos_h, importc: "ReadArgs".}
proc readArgs*(arg_template: cstring, array: openarray[pointer], args: ptr RDArgs): ptr RDArgs {.inline.} =
  result = c_readArgs(arg_template, unsafeAddr array[0], args)

proc findArg*(keyword: cstring, arg_template: cstring): int {.header: dos_h, importc: "FindArg".}
proc freeArgs*(args: ptr RDArgs) {.header: dos_h, importc: "FreeArgs".}

proc c_readItem*(name: cstring, maxchars: int, cSource: ptr CSource): int {.header: dos_h, importc: "ReadItem".}
proc readItem*(cSource: ptr CSource, maxlen: Natural = DefaultBufSize): string {.inline.} =
  result = newString(maxlen)
  discard c_readItem(result, maxlen, cSource)
  setLen(result, len(cstring(result)))

proc strToLong*(string: cstring, value: ptr int): int {.header: dos_h, importc: "StrToLong".}

proc matchFirst*(pat: cstring, anchor: ptr AnchorPath): int {.header: dos_h, importc: "MatchFirst".}
proc matchNext*(anchor: ptr AnchorPath): int {.header: dos_h, importc: "MatchNext".}
proc matchEnd*(anchor: ptr AnchorPath) {.header: dos_h, importc: "MatchEnd".}

proc c_parsePattern(pat: cstring, buf: cstring, buflen: int): int {.header: dos_h, importc: "ParsePattern".}
proc parsePattern*(pat: cstring, iswild: var bool): string {.inline raises: [OSError].} =
  result = newString(2*len(pat) + 2)
  let ret = c_parsePattern(pat, result, len(result))
  if ret == -1:
    raiseOSError(ioErr())
  else:
    setLen(result, len(cstring(result)))
    iswild = bool(ret)
  
proc matchPattern*(pat: cstring, str: cstring): bool {.header: dos_h, importc: "MatchPattern".}

proc c_parsePatternNoCase(pat: cstring, buf: cstring, buflen: int): int {.header: dos_h, importc: "ParsePatternNoCase".}
proc parsePatternNoCase*(pat: cstring, iswild: var bool): string {.inline raises: [OSError].} =
  result = newString(2*len(pat) + 2)
  let ret = c_parsePatternNoCase(pat, result, len(result))
  if ret == -1:
    raiseOSError(ioErr())
  else:
    setLen(result, len(cstring(result)))
    iswild = bool(ret)

proc matchPatternNoCase*(pat: cstring, str: cstring): bool {.header: dos_h, importc: "MatchPatternNoCase".}

proc filePart*(path: cstring): cstring {.header: dos_h, importc: "FilePart".}
proc pathPart*(path: cstring): cstring {.header: dos_h, importc: "PathPart".}

proc c_addPart(dirname: cstring, filename: cstring, size: uint): bool {.header: dos_h, importc: "AddPart".}
proc addPart*(dirname: var string, filename: cstring, maxlen: Natural = DefaultBufSize): bool {.inline.} =
  setLen(dirname, maxlen)
  result = c_addPart(dirname, filename, maxlen)
  setLen(dirname, len(cstring(dirname)))

proc startNotify*(notify: ptr NotifyRequest): bool {.header: dos_h, importc: "StartNotify".}
proc endNotify*(notify: ptr NotifyRequest) {.header: dos_h, importc: "EndNotify".}

proc c_setVar(name: cstring, buffer: cstring, size: int, flags: int): bool {.header: dos_h, importc: "SetVar".}
proc setVar*(name: cstring, value: cstring, flags: int): bool {.inline.} =
  result = c_setVar(name, value, -1, flags)

proc c_getVar(name: cstring, buffer: cstring, size: int, flags: int): int {.header: dos_h, importc: "GetVar".}
proc getVar*(name: cstring, flags: int, maxlen: Natural = DefaultBufSize): string {.inline.} =
  result = newString(maxlen)
  let len = c_getVar(name, result, maxlen, flags)
  if len != -1:
    setLen(result, len)
  else:
    setLen(result, 0)

proc deleteVar*(name: cstring, flags: uint): bool {.header: dos_h, importc: "DeleteVar".}
proc findVar*(name: cstring, `type`: uint): ptr LocalVar {.header: dos_h, importc: "FindVar".}

proc cliInitNewcli*(dp: ptr DosPacket): uint {.header: dos_h, importc: "CliInitNewcli".}
proc cliInitRun*(dp: ptr DosPacket): uint {.header: dos_h, importc: "CliInitRun".}

proc writeChars*(buf: cstring, buflen: uint): int {.header: dos_h, importc: "WriteChars".}

proc c_putStr(str: cstring): int {.header: dos_h, importc: "PutStr".}
proc putStr*(str: cstring): bool {.inline.} =
  result = (c_putStr(str) == 0)

proc sameDevice*(lock1: bpointer, lock2: bpointer): bool {.header: dos_h, importc: "SameDevice".}

proc setOwner*(name: cstring, owner_info: uint): bool {.header: dos_h, importc: "SetOwner".}
