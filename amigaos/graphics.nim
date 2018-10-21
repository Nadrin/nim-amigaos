#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

## Amiga OS 3 API: Graphics library

import exec
import hardware
import utility

include graphics/gfx
include graphics/gfxnodes
include graphics/gfxmacros
include graphics/text
include graphics/gels
include graphics/clip
include graphics/regions
include graphics/rastport
include graphics/coerce
include graphics/collide
include graphics/copper
include graphics/monitor
include graphics/display
include graphics/displayinfo
include graphics/graphint
include graphics/layers
include graphics/modeid
include graphics/rpattr
include graphics/scale
include graphics/sprite
include graphics/videocontrol
include graphics/view

const graphics_h = "<proto/graphics.h>"

proc bltBitMap*(srcBitMap: ptr BitMap, xSrc: int, ySrc: int, destBitMap: ptr BitMap, xDest: int, yDest: int, xSize: int, ySize: int, minterm: uint, mask: uint, tempA: planeptr): int {.header: graphics_h, importc: "BltBitMap".}
proc bltTemplate*(source: planeptr, xSrc: int, srcMod: int, destRP: ptr RastPort, xDest: int, yDest: int, xSize: int, ySize: int) {.header: graphics_h, importc: "BltTemplate".}

proc clearEOL*(rp: ptr RastPort) {.header: graphics_h, importc: "ClearEOL".}
proc clearScreen*(rp: ptr RastPort) {.header: graphics_h, importc: "ClearScreen".}

proc textLength*(rp: ptr RastPort, string: cstring, count: int): int {.header: graphics_h, importc: "TextLength".}
proc textLength*(rp: ptr RastPort, string: cstring): int {.inline.} =
  result = textLength(rp, string, len(string))

proc text*(rp: ptr RastPort, string: cstring, count: int) {.header: graphics_h, importc: "Text".}
proc text*(rp: ptr RastPort, string: cstring) {.inline.} =
  text(rp, string, len(string))

proc setFont*(rp: ptr RastPort, textFont: ptr TextFont) {.header: graphics_h, importc: "SetFont".}
proc openFont*(textAttr: ptr TextAttr): ptr TextFont {.header: graphics_h, importc: "OpenFont".}
proc closeFont*(textFont: ptr TextFont) {.header: graphics_h, importc: "CloseFont".}

proc askSoftStyle*(rp: ptr RastPort): uint {.header: graphics_h, importc: "AskSoftStyle".}
proc setSoftStyle*(rp: ptr RastPort, style: uint, enable: uint): uint {.header: graphics_h, importc: "SetSoftStyle".}

proc addBob*(bob: ptr Bob, rp: ptr RastPort) {.header: graphics_h, importc: "AddBob".}
proc addVSprite*(vSprite: ptr VSprite, rp: ptr RastPort) {.header: graphics_h, importc: "AddVSprite".}
proc addAnimOb*(anOb: ptr AnimOb, anKey: ptr ptr AnimOb, rp: ptr RastPort) {.header: graphics_h, importc: "AddAnimOb".}

proc doCollision*(rp: ptr RastPort) {.header: graphics_h, importc: "DoCollision".}
proc setCollision*(num: uint, routine: proc (gelA: ptr VSprite, gelB: ptr VSprite), gelsInfo: ptr GelsInfo) {.header: graphics_h, importc: "SetCollision".}

proc drawGList*(rp: ptr RastPort, vp: ptr ViewPort) {.header: graphics_h, importc: "DrawGList".}
proc sortGList*(rp: ptr RastPort) {.header: graphics_h, importc: "SortGList".}

proc initGels*(head: ptr VSprite, tail: ptr VSprite, gelsInfo: ptr GelsInfo) {.header: graphics_h, importc: "InitGels".}
proc initMasks*(vSprite: ptr VSprite) {.header: graphics_h, importc: "InitMasks".}
proc initGMasks*(anOb: ptr AnimOb) {.header: graphics_h, importc: "InitGMasks".}
proc initRastPort*(rp: ptr RastPort) {.header: graphics_h, importc: "InitRastPort".}
proc initVPort*(vp: ptr ViewPort) {.header: graphics_h, importc: "InitVPort".}
proc initArea*(areaInfo: ptr AreaInfo, vectorBuffer: pointer, maxVectors: int) {.header: graphics_h, importc: "InitArea".}
proc initView*(view: ptr View) {.header: graphics_h, importc: "InitView".}
proc initBitMap*(bitMap: ptr BitMap, depth: int, width: int, height: int) {.header: graphics_h, importc: "InitBitMap".}
proc initTmpRas*(tmpRas: ptr TmpRas, buffer: planeptr, size: uint): ptr TmpRas {.header: graphics_h, importc: "InitTmpRas".}

proc remIBob*(bob: ptr Bob, rp: ptr RastPort, vp: ptr ViewPort) {.header: graphics_h, importc: "RemIBob".}
proc remVSprite*(vSprite: ptr VSprite) {.header: graphics_h, importc: "RemVSprite".}

proc animate*(anKey: ptr ptr AnimOb, rp: ptr RastPort) {.header: graphics_h, importc: "Animate".}

proc drawEllipse*(rp: ptr RastPort, xCenter: int, yCenter: int, a: int, b: int) {.header: graphics_h, importc: "DrawEllipse".}
proc areaEllipse*(rp: ptr RastPort, xCenter: int, yCenter: int, a: int, b: int): int {.header: graphics_h, importc: "AreaEllipse".}

proc getRGB4*(colorMap: ptr ColorMap, entry: int): uint {.header: graphics_h, importc: "GetRGB4".}

proc c_getRGB32(cm: ptr ColorMap, firstcolor: uint32, ncolors: int, table: ptr uint32) {.header: graphics_h, importc: "GetRGB32".}
proc getRGB32*(cm: ptr ColorMap, firstcolor: uint32, table: openarray[uint32]) {.inline.} =
  c_getRGB32(cm, firstcolor, len(table) div 3, unsafeAddr table[0])

proc c_loadRGB4(vp: ptr ViewPort, colors: ptr uint16, count: int) {.header: graphics_h, importc: "LoadRGB4".}
proc loadRGB4*(vp: ptr ViewPort, colors: openarray[uint16]) {.inline.} =
  c_loadRGB4(vp, unsafeAddr colors[0], len(colors))

proc c_loadRGB32(vp: ptr ViewPort, table: ptr uint32) {.header: graphics_h, importc: "LoadRGB32".}
proc loadRGB32*(vp: ptr ViewPort, table: openarray[uint32]) {.inline.} =
  c_loadRGB32(vp, unsafeAddr table[0])

proc setRGB4*(vp: ptr ViewPort, index: int, red: uint, green: uint, blue: uint) {.header: graphics_h, importc: "SetRGB4".}
proc setRGB4CM*(colorMap: ptr ColorMap, index: int, red: uint, green: uint, blue: uint) {.header: graphics_h, importc: "SetRGB4CM".}

proc setRGB32*(vp: ptr ViewPort, n: uint, r: uint, g: uint, b: uint) {.header: graphics_h, importc: "SetRGB32".}
proc setRGB32CM*(cm: ptr ColorMap, n: uint, r: uint, g: uint, b: uint) {.header: graphics_h, importc: "SetRGB32CM".}

proc mrgCop*(view: ptr View): uint {.header: graphics_h, importc: "MrgCop".}

proc makeVPort*(view: ptr View, vp: ptr ViewPort): uint {.header: graphics_h, importc: "MakeVPort".}
proc scrollVPort*(vp: ptr ViewPort) {.header: graphics_h, importc: "ScrollVPort".}
proc loadView*(view: ptr View) {.header: graphics_h, importc: "LoadView".}

proc waitBlit*() {.header: graphics_h, importc: "WaitBlit".}
proc waitTOF*() {.header: graphics_h, importc: "WaitTOF".}
proc waitBOVP*(vp: ptr ViewPort) {.header: graphics_h, importc: "WaitBOVP".}

proc setRast*(rp: ptr RastPort, pen: int) {.header: graphics_h, importc: "SetRast".}
proc move*(rp: ptr RastPort, x: int, y: int) {.header: graphics_h, importc: "Move".}
proc draw*(rp: ptr RastPort, x: int, y: int) {.header: graphics_h, importc: "Draw".}
proc areaMove*(rp: ptr RastPort, x: int, y: int): int {.header: graphics_h, importc: "AreaMove".}
proc areaDraw*(rp: ptr RastPort, x: int, y: int): int {.header: graphics_h, importc: "AreaDraw".}
proc areaEnd*(rp: ptr RastPort): int {.header: graphics_h, importc: "AreaEnd".}

proc c_polyDraw(rp: ptr RastPort, count: int, polyTable: ptr int16) {.header: graphics_h, importc: "PolyDraw".}
proc polyDraw*(rp: ptr RastPort, polyTable: openarray[int16]) {.inline.} =
  c_polyDraw(rp, len(polyTable) shr 1, unsafeAddr polyTable[0])

proc qBlit*(blit: ptr bltnode) {.header: graphics_h, importc: "QBlit".}
proc qBSBlit*(blit: ptr bltnode) {.header: graphics_h, importc: "QBSBlit".}
proc bltClear*(memBlock: planeptr, byteCount: uint, flags: uint) {.header: graphics_h, importc: "BltClear".}
proc bltPattern*(rp: ptr RastPort, mask: planeptr, xMin: int, yMin: int, xMax: int, yMax: int, maskBPR: uint) {.header: graphics_h, importc: "BltPattern".}

proc readPixel*(rp: ptr RastPort, x: int, y: int): uint {.header: graphics_h, importc: "ReadPixel".}

proc c_writePixel(rp: ptr RastPort, x: int, y: int): int {.header: graphics_h, importc: "WritePixel".}
proc writePixel*(rp: ptr RastPort, x: int, y: int): bool {.inline.} =
  result = (c_writePixel(rp, x, y) == 0)

proc rectFill*(rp: ptr RastPort, xMin: int, yMin: int, xMax: int, yMax: int) {.header: graphics_h, importc: "RectFill".}
proc flood*(rp: ptr RastPort, mode: uint, x: int, y: int): bool {.header: graphics_h, importc: "Flood".}

proc cbump*(copList: ptr UCopList) {.header: graphics_h, importc: "CBump".}
proc cmove*(copList: ptr UCopList, destination: pointer, data: int) {.header: graphics_h, importc: "CMove".}
proc cwait*(copList: ptr UCopList, v: int, h: int) {.header: graphics_h, importc: "CWait".}

proc vbeamPos*(): int {.header: graphics_h, importc: "VBeamPos".}

proc scrollRaster*(rp: ptr RastPort, dx: int, dy: int, xMin: int, yMin: int, xMax: int, yMax: int) {.header: graphics_h, importc: "ScrollRaster".}

proc getSprite*(sprite: ptr SimpleSprite, num: int): int {.header: graphics_h, importc: "GetSprite".}
proc freeSprite*(num: int) {.header: graphics_h, importc: "FreeSprite".}
proc changeSprite*(vp: ptr ViewPort, sprite: ptr SimpleSprite, newData: pointer) {.header: graphics_h, importc: "ChangeSprite".}
proc moveSprite*(vp: ptr ViewPort, sprite: ptr SimpleSprite, x: int, y: int) {.header: graphics_h, importc: "MoveSprite".}

proc lockLayerRom*(layer: ptr Layer) {.header: graphics_h, importc: "LockLayerRom".}
proc unlockLayerRom*(layer: ptr Layer) {.header: graphics_h, importc: "UnlockLayerRom".}
proc attemptLockLayerRom*(layer: ptr Layer): bool {.header: graphics_h, importc: "AttemptLockLayerRom".}

proc syncSBitMap*(layer: ptr Layer) {.header: graphics_h, importc: "SyncSBitMap".}
proc copySBitMap*(layer: ptr Layer) {.header: graphics_h, importc: "CopySBitMap".}

proc ownBlitter*() {.header: graphics_h, importc: "OwnBlitter".}
proc disownBlitter*() {.header: graphics_h, importc: "DisownBlitter".}

proc askFont*(rp: ptr RastPort, textAttr: ptr TextAttr) {.header: graphics_h, importc: "AskFont".}
proc addFont*(textFont: ptr TextFont) {.header: graphics_h, importc: "AddFont".}
proc remFont*(textFont: ptr TextFont) {.header: graphics_h, importc: "RemFont".}

proc allocRaster*(width: uint, height: uint): planeptr {.header: graphics_h, importc: "AllocRaster".}
proc freeRaster*(p: planeptr, width: uint, height: uint) {.header: graphics_h, importc: "FreeRaster".}

proc andRectRegion*(region: ptr Region, rectangle: ptr Rectangle) {.header: graphics_h, importc: "AndRectRegion".}
proc orRectRegion*(region: ptr Region, rectangle: ptr Rectangle): bool {.header: graphics_h, importc: "OrRectRegion".}
proc xorRectRegion*(region: ptr Region, rectangle: ptr Rectangle): bool {.header: graphics_h, importc: "XorRectRegion".}
proc newRegion*(): ptr Region {.header: graphics_h, importc: "NewRegion".}
proc clearRectRegion*(region: ptr Region, rectangle: ptr Rectangle): bool {.header: graphics_h, importc: "ClearRectRegion".}
proc clearRegion*(region: ptr Region) {.header: graphics_h, importc: "ClearRegion".}
proc disposeRegion*(region: ptr Region) {.header: graphics_h, importc: "DisposeRegion".}
proc orRegionRegion*(srcRegion: ptr Region, destRegion: ptr Region): bool {.header: graphics_h, importc: "OrRegionRegion".}
proc xorRegionRegion*(srcRegion: ptr Region, destRegion: ptr Region): bool {.header: graphics_h, importc: "XorRegionRegion".}
proc andRegionRegion*(srcRegion: ptr Region, destRegion: ptr Region): bool {.header: graphics_h, importc: "AndRegionRegion".}

proc freeVPortCopLists*(vp: ptr ViewPort) {.header: graphics_h, importc: "FreeVPortCopLists".}
proc freeCopList*(copList: ptr CopList) {.header: graphics_h, importc: "FreeCopList".}
proc freeCprList*(cprList: ptr cprlist) {.header: graphics_h, importc: "FreeCprList".}

proc clipBlit*(srcRP: ptr RastPort, xSrc: int, ySrc: int, destRP: ptr RastPort, xDest: int, yDest: int, xSize: int, ySize: int, minterm: uint) {.header: graphics_h, importc: "ClipBlit".}
proc bltBitMapRastPort*(srcBitMap: ptr BitMap, xSrc: int, ySrc: int, destRP: ptr RastPort, xDest: int, yDest: int, xSize: int, ySize: int, minterm: uint) {.header: graphics_h, importc: "BltBitMapRastPort".}
proc bltMaskBitMapRastPort*(srcBitMap: ptr BitMap, xSrc: int, ySrc: int, destRP: ptr RastPort, xDest: int, yDest: int, xSize: int, ySize: int, minterm: uint, bltMask: planeptr) {.header: graphics_h, importc: "BltMaskBitMapRastPort".}

proc getColorMap*(entries: int): ptr ColorMap {.header: graphics_h, importc: "GetColorMap".}
proc freeColorMap*(colorMap: ptr ColorMap) {.header: graphics_h, importc: "FreeColorMap".}

proc uCopperListInit*(uCopList: ptr UCopList, n: int): ptr CopList {.header: graphics_h, importc: "UCopperListInit".}

proc getGBuffers*(anOb: ptr AnimOb, rp: ptr RastPort, flag: int): bool {.header: graphics_h, importc: "GetGBuffers".}
proc freeGBuffers*(anOb: ptr AnimOb, rp: ptr RastPort, flag: int) {.header: graphics_h, importc: "FreeGBuffers".}

proc gfxNew*(gfxNodeType: uint): pointer {.header: graphics_h, importc: "GfxNew".}
proc gfxFree*(gfxNodePtr: pointer) {.header: graphics_h, importc: "GfxFree".}
proc gfxAssociate*(associateNode: pointer, gfxNodePtr: pointer) {.header: graphics_h, importc: "GfxAssociate".}
proc gfxLookUp*(associateNode: pointer): pointer {.header: graphics_h, importc: "GfxLookUp".}

proc bitMapScale*(bitScaleArgs: ptr BitScaleArgs) {.header: graphics_h, importc: "BitMapScale".}
proc scalerDiv*(factor: uint, numerator: uint, denominator: uint): uint16 {.header: graphics_h, importc: "ScalerDiv".}

proc textExtent*(rp: ptr RastPort, string: cstring, count: int, textExtent: ptr TextExtent) {.header: graphics_h, importc: "TextExtent".}
proc textExtent*(rp: ptr RastPort, string: cstring, textExtent: ptr TextExtent) {.inline.} =
  textExtent(rp, string, len(string), textExtent)

proc textFit*(rp: ptr RastPort, string: cstring, strLen: int, textExtent: ptr TextExtent, constrainingExtent: ptr TextExtent, strDirection: int, constrainingBitWidth: uint, constrainingBitHeight: uint): uint {.header: graphics_h, importc: "TextFit".}
proc textFit*(rp: ptr RastPort, string: cstring, textExtent: ptr TextExtent, constrainingExtent: ptr TextExtent, strDirection: int, constrainingBitWidth: uint, constrainingBitHeight: uint): uint {.inline.} =
  result = textFit(rp, string, len(string), textExtent, constrainingExtent, strDirection, constrainingBitWidth, constrainingBitHeight)

proc videoControl*(colorMap: ptr ColorMap, tagarray: ptr TagItem): bool {.header: graphics_h, importc: "VideoControl".}
proc videoControlTags*(colorMap: ptr ColorMap, tagarray: Tag): bool {.header: graphics_h, importc: "VideoControlTags", varargs.}

proc openMonitor*(monitorName: cstring, displayID: uint): ptr MonitorSpec {.header: graphics_h, importc: "OpenMonitor".}

proc c_closeMonitor(monitorSpec: ptr MonitorSpec): bool {.header: graphics_h, importc: "CloseMonitor".}
proc closeMonitor*(monitorSpec: ptr MonitorSpec): bool {.inline.} =
  result = (c_closeMonitor(monitorSpec) == false)

proc findDisplayInfo*(displayID: uint): DisplayInfoHandle {.header: graphics_h, importc: "FindDisplayInfo".}
proc nextDisplayInfo*(displayID: uint): uint {.header: graphics_h, importc: "NextDisplayInfo".}
proc getDisplayInfoData*(handle: DisplayInfoHandle, buf: pointer, size: uint, tagID: uint, displayID: uint): uint {.header: graphics_h, importc: "GetDisplayInfoData".}

proc fontExtent*(font: ptr TextFont, fontExtent: ptr TextExtent) {.header: graphics_h, importc: "FontExtent".}
proc stripFont*(font: ptr TextFont) {.header: graphics_h, importc: "StripFont".}

proc c_extendFont(font: ptr TextFont, fontTags: ptr TagItem): bool {.header: graphics_h, importc: "ExtendFont".}
proc extendFont*(font: ptr TextFont, fontTags: openarray[TagItem]): bool {.inline.} =
  result = c_extendFont(font, unsafeAddr fontTags[0])

proc extendFontTags*(font: ptr TextFont, fontTags: Tag): bool {.header: graphics_h, importc: "ExtendFontTags", varargs.}

proc readPixelLine8*(rp: ptr RastPort, xstart: uint, ystart: uint, width: uint, array: ptr uint8, tempRP: ptr RastPort): int {.header: graphics_h, importc: "ReadPixelLine8".}
proc writePixelLine8*(rp: ptr RastPort, xstart: uint, ystart: uint, width: uint, array: ptr uint8, tempRP: ptr RastPort): int {.header: graphics_h, importc: "WritePixelLine8".}
proc readPixelArray8*(rp: ptr RastPort, xstart: uint, ystart: uint, xstop: uint, ystop: uint, array: ptr uint8, temprp: ptr RastPort): int {.header: graphics_h, importc: "ReadPixelArray8".}
proc writePixelArray8*(rp: ptr RastPort, xstart: uint, ystart: uint, xstop: uint, ystop: uint, array: ptr uint8, temprp: ptr RastPort): int {.header: graphics_h, importc: "WritePixelArray8".}

proc getVPModeID*(vp: ptr ViewPort): uint {.header: graphics_h, importc: "GetVPModeID".}
proc modeNotAvailable*(modeID: uint): uint {.header: graphics_h, importc: "ModeNotAvailable".}
proc coerceMode*(vp: ptr ViewPort, monitorid: uint, flags: uint): uint {.header: graphics_h, importc: "CoerceMode".}

proc c_bestModeIDA(tags: ptr TagItem): uint {.header: graphics_h, importc: "BestModeIDA".}
proc bestModeIDA*(tags: openarray[TagItem]): uint {.inline.} =
  result = c_bestModeIDA(unsafeAddr tags[0])

proc bestModeID*(tags: Tag): uint {.header: graphics_h, importc: "BestModeID", varargs.}

proc eraseRect*(rp: ptr RastPort, xMin: int, yMin: int, xMax: int, yMax: int) {.header: graphics_h, importc: "EraseRect".}

proc calcIVG*(v: ptr View, vp: ptr ViewPort): uint16 {.header: graphics_h, importc: "CalcIVG".}

proc attachPalExtra*(cm: ptr ColorMap, vp: ptr ViewPort): int {.header: graphics_h, importc: "AttachPalExtra".}

proc c_obtainBestPenA(cm: ptr ColorMap, r: uint, g: uint, b: uint, tags: ptr TagItem): int {.header: graphics_h, importc: "ObtainBestPenA".}
proc obtainBestPenA*(cm: ptr ColorMap, r: uint, g: uint, b: uint, tags: openarray[TagItem]): int {.inline.} =
  result = c_obtainBestPenA(cm, r, g, b, unsafeAddr tags[0])

proc obtainBestPen*(cm: ptr ColorMap, r: uint, g: uint, b: uint, tags: Tag): int {.header: graphics_h, importc: "ObtainBestPen", varargs.}

proc getAPen*(rp: ptr RastPort): int {.header: graphics_h, importc: "GetAPen".}
proc getBPen*(rp: ptr RastPort): int {.header: graphics_h, importc: "GetBPen".}
proc getDrMd*(rp: ptr RastPort): uint {.header: graphics_h, importc: "GetDrMd".}
proc getOutlinePen*(rp: ptr RastPort): int {.header: graphics_h, importc: "GetOutlinePen".}

proc setAPen*(rp: ptr RastPort, pen: int) {.header: graphics_h, importc: "SetAPen".}
proc setBPen*(rp: ptr RastPort, pen: int) {.header: graphics_h, importc: "SetBPen".}
proc setDrMd*(rp: ptr RastPort, drawMode: uint) {.header: graphics_h, importc: "SetDrMd".}
proc setOutlinePen*(rp: ptr RastPort, pen: int): uint {.header: graphics_h, importc: "SetOutlinePen".}
proc setABPenDrMd*(rp: ptr RastPort, apen: int, bpen: int, drawmode: uint) {.header: graphics_h, importc: "SetABPenDrMd".}

proc setChipRev*(want: uint): uint {.header: graphics_h, importc: "SetChipRev".}

proc allocBitMap*(sizex: uint, sizey: uint, depth: uint, flags: uint, friend_bitmap: ptr BitMap): ptr BitMap {.header: graphics_h, importc: "AllocBitMap".}
proc freeBitMap*(bm: ptr BitMap) {.header: graphics_h, importc: "FreeBitMap".}

proc c_allocSpriteDataA(bm: ptr BitMap, tags: ptr TagItem): ptr ExtSprite {.header: graphics_h, importc: "AllocSpriteDataA".}
proc allocSpriteDataA*(bm: ptr BitMap, tags: openarray[TagItem]): ptr ExtSprite {.inline.} =
  result = c_allocSpriteDataA(bm, unsafeAddr tags[0])

proc allocSpriteData*(bm: ptr BitMap, tags: Tag): ptr ExtSprite {.header: graphics_h, importc: "AllocSpriteData", varargs.}
proc freeSpriteData*(sp: ptr ExtSprite) {.header: graphics_h, importc: "FreeSpriteData".}

proc c_getExtSpriteA(ss: ptr ExtSprite, tags: ptr TagItem): int {.header: graphics_h, importc: "GetExtSpriteA".}
proc getExtSpriteA*(ss: ptr ExtSprite, tags: openarray[TagItem]): int {.inline.} =
  result = c_getExtSpriteA(ss, unsafeAddr tags[0])

proc getExtSprite*(ss: ptr ExtSprite, tags: Tag): int {.header: graphics_h, importc: "GetExtSprite", varargs.}

proc c_changeExtSpriteA(vp: ptr ViewPort, oldsprite: ptr ExtSprite, newsprite: ptr ExtSprite, tags: ptr TagItem): bool {.header: graphics_h, importc: "ChangeExtSpriteA".}
proc changeExtSpriteA*(vp: ptr ViewPort, oldsprite: ptr ExtSprite, newsprite: ptr ExtSprite, tags: openarray[TagItem]): bool {.inline.} =
  result = c_changeExtSpriteA(vp, oldsprite, newsprite, unsafeAddr tags[0])

proc changeExtSprite*(vp: ptr ViewPort, oldsprite: ptr ExtSprite, newsprite: ptr ExtSprite, tags: Tag): bool {.header: graphics_h, importc: "ChangeExtSprite", varargs.}

proc obtainPen*(cm: ptr ColorMap, n: int, r: uint, g: uint, b: uint, f: int): int {.header: graphics_h, importc: "ObtainPen".}
proc releasePen*(cm: ptr ColorMap, n: int) {.header: graphics_h, importc: "ReleasePen".}

proc changeVPBitMap*(vp: ptr ViewPort, bm: ptr BitMap, db: ptr DBufInfo) {.header: graphics_h, importc: "ChangeVPBitMap".}
proc getBitMapAttr*(bm: ptr BitMap, attrnum: uint): uint {.header: graphics_h, importc: "GetBitMapAttr".}

proc allocDBufInfo*(vp: ptr ViewPort): ptr DBufInfo {.header: graphics_h, importc: "AllocDBufInfo".}
proc freeDBufInfo*(dbi: ptr DBufInfo) {.header: graphics_h, importc: "FreeDBufInfo".}

proc setWriteMask*(rp: ptr RastPort, msk: uint): bool {.header: graphics_h, importc: "SetWriteMask".}
proc setMaxPen*(rp: ptr RastPort, maxpen: int) {.header: graphics_h, importc: "SetMaxPen".}

proc scrollRasterBF*(rp: ptr RastPort, dx: int, dy: int, xMin: int, yMin: int, xMax: int, yMax: int) {.header: graphics_h, importc: "ScrollRasterBF".}

proc findColor*(cm: ptr ColorMap, r: uint, g: uint, b: uint, maxcolor: int): int {.header: graphics_h, importc: "FindColor".}

proc getRPAttrs*(rp: ptr RastPort, tags: Tag) {.header: graphics_h, importc: "GetRPAttrs", varargs.}
proc setRPAttrs*(rp: ptr RastPort, tags: Tag) {.header: graphics_h, importc: "SetRPAttrs", varargs.}

proc c_getRPAttrsA(rp: ptr RastPort, tags: ptr TagItem) {.header: graphics_h, importc: "GetRPAttrsA".}
proc getRPAttrsA*(rp: ptr RastPort, tags: openarray[TagItem]) {.inline.} =
  c_getRPAttrsA(rp, unsafeAddr tags[0])

proc c_setRPAttrsA(rp: ptr RastPort, tags: ptr TagItem) {.header: graphics_h, importc: "SetRPAttrsA".}
proc setRPAttrsA*(rp: ptr RastPort, tags: openarray[TagItem]) {.inline.} =
  c_setRPAttrsA(rp, unsafeAddr tags[0])

proc writeChunkyPixels*(rp: ptr RastPort, xstart: uint, ystart: uint, xstop: uint, ystop: uint, array: ptr uint8, bytesperrow: int) {.header: graphics_h, importc: "WriteChunkyPixels".}
