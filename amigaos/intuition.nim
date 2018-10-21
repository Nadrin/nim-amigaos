#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

## Amiga OS 3 API: Intuition library

{.passC: "-DINTUI_V36_NAMES_ONLY".}

import exec
import hardware
import devices
import graphics
import utility

include intuition/intuition
include intuition/intuitionbase
include intuition/inputevent
include intuition/screens
include intuition/cghooks
include intuition/sghooks
include intuition/classusr
include intuition/classes
include intuition/preferences
include intuition/gadgetclass
include intuition/icclass
include intuition/imageclass
include intuition/pointerclass

const intuition_h = "<proto/intuition.h>"

proc openIntuition*() {.header: intuition_h, importc: "OpenIntuition".}

proc intuition*(ievent: ptr InputEvent) {.header: intuition_h, importc: "Intuition".}

proc addGadget*(window: ptr Window, gadget: ptr Gadget, position: uint16): uint16 {.header: intuition_h, importc: "AddGadget".}
proc removeGadget*(window: ptr Window, gadget: ptr Gadget): uint16 {.header: intuition_h, importc: "RemoveGadget".}
proc activateGadget*(gadgets: ptr Gadget, window: ptr Window, requester: ptr Requester): bool {.header: intuition_h, importc: "ActivateGadget".}
proc refreshGadgets*(gadgets: ptr Gadget, window: ptr Window, requester: ptr Requester) {.header: intuition_h, importc: "RefreshGadgets".}

proc clearDMRequest*(window: ptr Window): bool {.header: intuition_h, importc: "ClearDMRequest".}
proc clearMenuStrip*(window: ptr Window) {.header: intuition_h, importc: "ClearMenuStrip".}
proc clearPointer*(window: ptr Window) {.header: intuition_h, importc: "ClearPointer".}

proc closeScreen*(screen: ptr Screen): bool {.header: intuition_h, importc: "CloseScreen".}
proc closeWindow*(window: ptr Window) {.header: intuition_h, importc: "CloseWindow".}
proc closeWorkBench*(): bool {.header: intuition_h, importc: "CloseWorkBench".}

proc currentTime*(seconds: ptr uint, micros: ptr uint) {.header: intuition_h, importc: "CurrentTime".}

proc displayAlert*(alertNumber: uint, string: ptr uint8, height: uint): bool {.header: intuition_h, importc: "DisplayAlert".}
proc displayBeep*(screen: ptr Screen) {.header: intuition_h, importc: "DisplayBeep".}
proc timedDisplayAlert*(alertNumber: uint, string: ptr uint8, height: uint, time: uint): bool {.header: intuition_h, importc: "TimedDisplayAlert".}

proc doubleClick*(sSeconds: uint, sMicros: uint, cSeconds: uint, cMicros: uint): bool {.header: intuition_h, importc: "DoubleClick".}

proc drawBorder*(rp: ptr RastPort, border: ptr Border, leftOffset: int, topOffset: int) {.header: intuition_h, importc: "DrawBorder".}
proc drawImage*(rp: ptr RastPort, image: ptr Image, leftOffset: int, topOffset: int) {.header: intuition_h, importc: "DrawImage".}

proc endRequest*(requester: ptr Requester, window: ptr Window) {.header: intuition_h, importc: "EndRequest".}

proc getDefPrefs*(preferences: ptr Preferences, size: int): ptr Preferences {.header: intuition_h, importc: "GetDefPrefs".}
proc getPrefs*(preferences: ptr Preferences, size: int): ptr Preferences {.header: intuition_h, importc: "GetPrefs".}

proc c_setPrefs(preferences: ptr Preferences, size: int, inform: bool): ptr Preferences {.header: intuition_h, importc: "SetPrefs".}
proc setPrefs*(preferences: ptr Preferences, size: int, inform: bool) {.inline.} =
  discard c_setPrefs(preferences, size, inform)

proc initRequester*(requester: ptr Requester) {.header: intuition_h, importc: "InitRequester".}

proc itemAddress*(menuStrip: ptr Menu, menuNumber: uint16): ptr MenuItem {.header: intuition_h, importc: "ItemAddress".}

proc modifyIDCMP*(window: ptr Window, flags: uint): bool {.header: intuition_h, importc: "ModifyIDCMP".}
proc modifyProp*(gadget: ptr Gadget, window: ptr Window, requester: ptr Requester, flags: uint16, horizPot: uint16, vertPot: uint16, horizBody: uint16, vertBody: uint16) {.header: intuition_h, importc: "ModifyProp".}
proc newModifyProp*(gadget: ptr Gadget, window: ptr Window, requester: ptr Requester, flags: uint16, horizPot: uint16, vertPot: uint16, horizBody: uint16, vertBody: uint16, numGad: int) {.header: intuition_h, importc: "NewModifyProp".}

proc moveScreen*(screen: ptr Screen, dx: int, dy: int) {.header: intuition_h, importc: "MoveScreen".}
proc moveWindow*(window: ptr Window, dx: int, dy: int) {.header: intuition_h, importc: "MoveWindow".}

proc offGadget*(gadget: ptr Gadget, window: ptr Window, requester: ptr Requester) {.header: intuition_h, importc: "OffGadget".}
proc offMenu*(window: ptr Window, menuNumber: uint16) {.header: intuition_h, importc: "OffMenu".}
proc onGadget*(gadget: ptr Gadget, window: ptr Window, requester: ptr Requester) {.header: intuition_h, importc: "OnGadget".}
proc onMenu*(window: ptr Window, menuNumber: uint16) {.header: intuition_h, importc: "OnMenu".}

proc openScreen*(newScreen: ptr NewScreen): ptr Screen {.header: intuition_h, importc: "OpenScreen".}
proc openWindow*(newWindow: ptr NewWindow): ptr Window {.header: intuition_h, importc: "OpenWindow".}
proc openWorkbench*(): uint {.header: intuition_h, importc: "OpenWorkBench".}

proc printIText*(rp: ptr RastPort, iText: ptr IntuiText, left: int, top: int) {.header: intuition_h, importc: "PrintIText".}

proc reportMouse*(flag: bool, window: ptr Window) {.header: intuition_h, importc: "ReportMouse".}

proc request*(requester: ptr Requester, window: ptr Window): bool {.header: intuition_h, importc: "Request".}

proc screenToBack*(screen: ptr Screen) {.header: intuition_h, importc: "ScreenToBack".}
proc screenToFront*(screen: ptr Screen) {.header: intuition_h, importc: "ScreenToFront".}
proc windowToBack*(window: ptr Window) {.header: intuition_h, importc: "WindowToBack".}
proc windowToFront*(window: ptr Window) {.header: intuition_h, importc: "WindowToFront".}

proc wbenchToBack*(): bool {.header: intuition_h, importc: "WBenchToBack".}
proc wbenchToFront*(): bool {.header: intuition_h, importc: "WBenchToFront".}

proc windowLimits*(window: ptr Window, widthMin: int, heightMin: int, widthMax: int, heightMax: int): bool {.header: intuition_h, importc: "WindowLimits".}

proc setDMRequest*(window: ptr Window, requester: ptr Requester): bool {.header: intuition_h, importc: "SetDMRequest".}
proc setMenuStrip*(window: ptr Window, menu: ptr Menu): bool {.header: intuition_h, importc: "SetMenuStrip".}
proc setPointer*(window: ptr Window, pointer: ptr uint16, height: int, width: int, xOffset: int, yOffset: int) {.header: intuition_h, importc: "SetPointer".}
proc setWindowTitles*(window: ptr Window, windowTitle: cstring, screenTitle: cstring) {.header: intuition_h, importc: "SetWindowTitles".}

proc showTitle*(screen: ptr Screen, showIt: bool) {.header: intuition_h, importc: "ShowTitle".}

proc sizeWindow*(window: ptr Window, dx: int, dy: int) {.header: intuition_h, importc: "SizeWindow".}

proc viewAddress*(): ptr View {.header: intuition_h, importc: "ViewAddress".}
proc viewPortAddress*(window: ptr Window): ptr ViewPort {.header: intuition_h, importc: "ViewPortAddress".}

proc intuiTextLength*(iText: ptr IntuiText): int {.header: intuition_h, importc: "IntuiTextLength".}

proc autoRequest*(window: ptr Window, body: ptr IntuiText, posText: ptr IntuiText, negText: ptr IntuiText, pFlag: uint, nFlag: uint, width: uint, height: uint): bool {.header: intuition_h, importc: "AutoRequest".}
proc buildSysRequest*(window: ptr Window, body: ptr IntuiText, posText: ptr IntuiText, negText: ptr IntuiText, flags: uint, width: uint, height: uint): ptr Window {.header: intuition_h, importc: "BuildSysRequest".}
proc freeSysRequest*(window: ptr Window) {.header: intuition_h, importc: "FreeSysRequest".}

proc beginRefresh*(window: ptr Window) {.header: intuition_h, importc: "BeginRefresh".}
proc endRefresh*(window: ptr Window, complete: bool) {.header: intuition_h, importc: "EndRefresh".}

proc c_makeScreen(screen: ptr Screen): int {.header: intuition_h, importc: "MakeScreen".}
proc makeScreen*(screen: ptr Screen): bool {.inline.} =
  result = (c_makeScreen(screen) == 0)

proc c_remakeDisplay(): int {.header: intuition_h, importc: "RemakeDisplay".}
proc remakeDisplay*(): bool {.inline.} =
  result = (c_remakeDisplay() == 0)

proc c_rethinkDisplay(): int {.header: intuition_h, importc: "RethinkDisplay".}
proc rethinkDisplay*(): bool {.inline.} =
  result = (c_rethinkDisplay() == 0)

proc allocRemember*(rememberKey: ptr ptr Remember, size: uint, flags: uint): pointer {.header: intuition_h, importc: "AllocRemember".}
proc freeRemember*(rememberKey: ptr ptr Remember, reallyForget: bool) {.header: intuition_h, importc: "FreeRemember".}

proc lockIBase*(lockNumber: uint): uint {.header: intuition_h, importc: "LockIBase".}
proc unlockIBase*(ibLock: uint) {.header: intuition_h, importc: "UnlockIBase".}

proc getScreenData*(buffer: pointer, size: uint, `type`: uint, screen: ptr Screen): bool {.header: intuition_h, importc: "GetScreenData".}

proc addGList*(window: ptr Window, gadget: ptr Gadget, position: uint, numGad: int, requester: ptr Requester): uint {.header: intuition_h, importc: "AddGList".}
proc removeGList*(remPtr: ptr Window, gadget: ptr Gadget, numGad: int): uint {.header: intuition_h, importc: "RemoveGList".}
proc refreshGList*(gadgets: ptr Gadget, window: ptr Window, requester: ptr Requester, numGad: int) {.header: intuition_h, importc: "RefreshGList".}

proc activateWindow*(window: ptr Window) {.header: intuition_h, importc: "ActivateWindow".}
proc refreshWindowFrame*(window: ptr Window) {.header: intuition_h, importc: "RefreshWindowFrame".}

proc queryOverscan*(displayID: uint, rect: ptr Rectangle, oScanType: int): bool {.header: intuition_h, importc: "QueryOverscan".}

proc moveWindowInFrontOf*(window: ptr Window, behindWindow: ptr Window) {.header: intuition_h, importc: "MoveWindowInFrontOf".}
proc changeWindowBox*(window: ptr Window, left: uint, top: uint, width: uint, height: uint) {.header: intuition_h, importc: "ChangeWindowBox".}
proc zipWindow*(window: ptr Window) {.header: intuition_h, importc: "ZipWindow".}

proc setEditHook*(hook: ptr Hook): ptr Hook {.header: intuition_h, importc: "SetEditHook".}

proc setMouseQueue*(window: ptr Window, queueLength: uint16): int {.header: intuition_h, importc: "SetMouseQueue".}

proc lockPubScreen*(name: cstring): ptr Screen {.header: intuition_h, importc: "LockPubScreen".}
proc unlockPubScreen*(name: cstring, screen: ptr Screen) {.header: intuition_h, importc: "UnlockPubScreen".}
proc lockPubScreenList*(): ptr List {.header: intuition_h, importc: "LockPubScreenList".}
proc unlockPubScreenList*() {.header: intuition_h, importc: "UnlockPubScreenList".}
proc setDefaultPubScreen*(name: cstring) {.header: intuition_h, importc: "SetDefaultPubScreen".}
proc setPubScreenModes*(modes: uint): uint {.header: intuition_h, importc: "SetPubScreenModes".}
proc pubScreenStatus*(screen: ptr Screen, statusFlags: uint): uint {.header: intuition_h, importc: "PubScreenStatus".}

proc c_nextPubScreen(screen: ptr Screen, namebuf: cstring): cstring {.header: intuition_h, importc: "NextPubScreen".}
proc nextPubScreen*(screen: ptr Screen): string {.inline.} =
  result = newString(MAXPUBSCREENNAME+1)
  discard c_nextPubScreen(screen, result)
  setLen(result, len(cstring(result)))

proc obtainGIRPort*(ginfo: ptr GadgetInfo): ptr RastPort {.header: intuition_h, importc: "ObtainGIRPort".}
proc releaseGIRPort*(rp: ptr RastPort) {.header: intuition_h, importc: "ReleaseGIRPort".}

proc c_gadgetMouse(gadget: ptr Gadget, ginfo: ptr GadgetInfo, mousePoint: ptr Point) {.header: intuition_h, importc: "GadgetMouse".}
proc gadgetMouse*(gadget: ptr Gadget, ginfo: ptr GadgetInfo): Point {.inline.} =
  c_gadgetMouse(gadget, ginfo, addr result)

proc c_getDefaultPubScreen(nameBuffer: cstring) {.header: intuition_h, importc: "GetDefaultPubScreen".}
proc getDefaultPubScreen*(): string {.inline.} =
  result = newString(MAXPUBSCREENNAME)
  c_getDefaultPubScreen(result)
  setLen(result, len(cstring(result)))

proc easyRequestArgs*(window: ptr Window, easyStruct: ptr EasyStruct, idcmpPtr: ptr uint, args: pointer): int {.header: intuition_h, importc: "EasyRequestArgs".}
proc easyRequest*(window: ptr Window, easyStruct: ptr EasyStruct, idcmpPtr: ptr uint): int {.header: intuition_h, importc: "EasyRequest", varargs.}

proc buildEasyRequestArgs*(window: ptr Window, easyStruct: ptr EasyStruct, idcmp: uint, args: pointer): ptr Window {.header: intuition_h, importc: "BuildEasyRequestArgs".}
proc buildEasyRequest*(window: ptr Window, easyStruct: ptr EasyStruct, idcmp: uint): ptr Window {.header: intuition_h, importc: "BuildEasyRequest", varargs.}

proc sysReqHandler*(window: ptr Window, idcmpPtr: ptr uint, waitInput: bool): int {.header: intuition_h, importc: "SysReqHandler".}

proc c_openWindowTagList(newWindow: ptr NewWindow, tagList: ptr TagItem): ptr Window {.header: intuition_h, importc: "OpenWindowTagList".}
proc openWindowTagList*(newWindow: ptr NewWindow, tagList: openarray[TagItem]): ptr Window {.inline.} =
  result = c_openWindowTagList(newWindow, unsafeAddr tagList[0])

proc openWindowTags*(newWindow: ptr NewWindow, tagList: uint): ptr Window {.header: intuition_h, importc: "OpenWindowTags", varargs.}

proc c_openScreenTagList(newScreen: ptr NewScreen, tagList: ptr TagItem): ptr Screen {.header: intuition_h, importc: "OpenScreenTagList".}
proc openScreenTagList*(newScreen: ptr NewScreen, tagList: openarray[TagItem]): ptr Screen {.inline.} =
  result = c_openScreenTagList(newScreen, unsafeAddr tagList[0])

proc openScreenTags*(newScreen: ptr NewScreen, tagList: Tag): ptr Screen {.header: intuition_h, importc: "OpenScreenTags", varargs.}

proc drawImageState*(rp: ptr RastPort, image: ptr Image, leftOffset: int, topOffset: int, state: uint, drawInfo: ptr DrawInfo) {.header: intuition_h, importc: "DrawImageState".}
proc pointInImage*(point: Point, image: ptr Image): bool {.header: intuition_h, importc: "PointInImage".}
proc eraseImage*(rp: ptr RastPort, image: ptr Image, leftOffset: int, topOffset: int) {.header: intuition_h, importc: "EraseImage".}

proc c_newObjectA(classPtr: ptr IClass, classID: cstring, tagList: ptr TagItem): pointer {.header: intuition_h, importc: "NewObjectA".}
proc newObjectA*(classPtr: ptr IClass, classID: cstring, tagList: openarray[TagItem]): pointer {.inline.} =
  result = c_newObjectA(classPtr, classID, unsafeAddr tagList[0])

proc newObject*(classPtr: ptr IClass, classID: cstring, tagList: Tag): pointer {.header: intuition_h, importc: "NewObject", varargs.}

proc disposeObject*(`object`: pointer) {.header: intuition_h, importc: "DisposeObject".}

proc c_setAttrsA(`object`: pointer, tagList: ptr TagItem): uint {.header: intuition_h, importc: "SetAttrsA".}
proc setAttrsA*(`object`: pointer, tagList: openarray[TagItem]): uint {.inline.} =
  result = c_setAttrsA(`object`, unsafeAddr tagList[0])

proc setAttrs*(`object`: pointer, tagList: Tag): uint {.header: intuition_h, importc: "SetAttrs", varargs.}
proc getAttr*(attrID: uint, `object`: pointer, storagePtr: ptr uint): bool {.header: intuition_h, importc: "GetAttr".}

proc c_setGadgetAttrsA(gadget: ptr Gadget, window: ptr Window, requester: ptr Requester, tagList: ptr TagItem): uint {.header: intuition_h, importc: "SetGadgetAttrsA".}
proc setGadgetAttrsA*(gadget: ptr Gadget, window: ptr Window, requester: ptr Requester, tagList: openarray[TagItem]): uint {.inline.} =
  result = c_setGadgetAttrsA(gadget, window, requester, unsafeAddr tagList[0])

proc setGadgetAttrs*(gadget: ptr Gadget, window: ptr Window, requester: ptr Requester, tagList: Tag): uint {.header: intuition_h, importc: "SetGadgetAttrs", varargs.}

proc nextObject*(objectPtrPtr: pointer): pointer {.header: intuition_h, importc: "NextObject".}
proc makeClass*(classID: cstring, superClassID: cstring, superClassPtr: ptr IClass, instanceSize: uint, flags: uint): ptr IClass {.header: intuition_h, importc: "MakeClass".}
proc addClass*(classPtr: ptr IClass) {.header: intuition_h, importc: "AddClass".}
proc removeClass*(classPtr: ptr IClass) {.header: intuition_h, importc: "RemoveClass".}
proc freeClass*(classPtr: ptr IClass): bool {.header: intuition_h, importc: "FreeClass".}

proc getScreenDrawInfo*(screen: ptr Screen): ptr DrawInfo {.header: intuition_h, importc: "GetScreenDrawInfo".}
proc freeScreenDrawInfo*(screen: ptr Screen, drawInfo: ptr DrawInfo) {.header: intuition_h, importc: "FreeScreenDrawInfo".}

proc resetMenuStrip*(window: ptr Window, menu: ptr Menu): bool {.header: intuition_h, importc: "ResetMenuStrip".}

proc allocScreenBuffer*(sc: ptr Screen, bm: ptr BitMap, flags: uint): ptr ScreenBuffer {.header: intuition_h, importc: "AllocScreenBuffer".}
proc freeScreenBuffer*(sc: ptr Screen, sb: ptr ScreenBuffer) {.header: intuition_h, importc: "FreeScreenBuffer".}
proc changeScreenBuffer*(sc: ptr Screen, sb: ptr ScreenBuffer): bool {.header: intuition_h, importc: "ChangeScreenBuffer".}

proc screenDepth*(screen: ptr Screen, flags: uint, reserved: pointer = nil) {.header: intuition_h, importc: "ScreenDepth".}
proc screenPosition*(screen: ptr Screen, flags: uint, x1: int, y1: int, x2: int, y2: int) {.header: intuition_h, importc: "ScreenPosition".}

proc scrollWindowRaster*(win: ptr Window, dx: int, dy: int, xMin: int, yMin: int, xMax: int, yMax: int) {.header: intuition_h, importc: "ScrollWindowRaster".}

proc lendMenus*(fromwindow: ptr Window, towindow: ptr Window) {.header: intuition_h, importc: "LendMenus".}

proc doGadgetMethodA*(gad: ptr Gadget, win: ptr Window, req: ptr Requester, message: Msg): uint {.header: intuition_h, importc: "DoGadgetMethodA".}
proc doGadgetMethod*(gad: ptr Gadget, win: ptr Window, req: ptr Requester, message: uint): uint {.header: intuition_h, importc: "DoGadgetMethod", varargs.}

proc c_setWindowPointerA(win: ptr Window, tagList: ptr TagItem) {.header: intuition_h, importc: "SetWindowPointerA".}
proc setWindowPointerA*(win: ptr Window, tagList: openarray[TagItem]) {.inline.} =
  c_setWindowPointerA(win, unsafeAddr tagList[0])

proc setWindowPointer*(win: ptr Window, taglist: Tag) {.header: intuition_h, importc: "SetWindowPointer", varargs.}

proc helpControl*(win: ptr Window, flags: uint) {.header: intuition_h, importc: "HelpControl".}
