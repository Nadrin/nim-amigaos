#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  Menu* {.bycopy.} = object
    nextMenu*: ptr Menu
    leftEdge*: int16
    topEdge*: int16
    width*: int16
    height*: int16
    flags*: uint16
    menuName*: cstring
    firstItem*: ptr MenuItem
    jazzX: int16
    jazzY: int16
    beatX: int16
    beatY: int16
  
  MenuItem* {.bycopy.} = object
    nextItem*: ptr MenuItem
    leftEdge*: int16
    topEdge*: int16
    width*: int16
    height*: int16
    flags*: uint16
    mutualExclude*: int32
    itemFill*: pointer
    selectFill*: pointer
    command*: int8
    subItem*: ptr MenuItem
    nextSelect*: uint16

const
  MENUENABLED* = 0x00000001
  MIDRAWN* = 0x00000100

const
  CHECKIT* = 0x00000001
  ITEMTEXT* = 0x00000002
  COMMSEQ* = 0x00000004
  MENUTOGGLE* = 0x00000008
  ITEMENABLED* = 0x00000010

const
  HIGHFLAGS* = 0x000000C0
  HIGHIMAGE* = 0x00000000
  HIGHCOMP* = 0x00000040
  HIGHBOX* = 0x00000080
  HIGHNONE* = 0x000000C0

const
  CHECKED* = 0x00000100

const
  ISDRAWN* = 0x00001000
  HIGHITEM* = 0x00002000
  MENUTOGGLED* = 0x00004000

type
  IBox* {.bycopy.} = object
    left*: int16
    top*: int16
    width*: int16
    height*: int16

  IntuiText* {.bycopy.} = object
    frontPen*: uint8
    backPen*: uint8
    drawMode*: uint8
    leftEdge*: int16
    topEdge*: int16
    iTextFont*: ptr TextAttr
    iText*: ptr uint8
    nextText*: ptr IntuiText

  Border* {.bycopy.} = object
    leftEdge*: int16
    topEdge*: int16
    frontPen*: uint8
    backPen*: uint8
    drawMode*: uint8
    count*: int8
    xy*: ptr int16
    nextBorder*: ptr Border

  Image* {.bycopy.} = object
    leftEdge*: int16
    topEdge*: int16
    width*: int16
    height*: int16
    depth*: int16
    imageData*: ptr uint16
    planePick*: uint8
    planeOnOff*: uint8
    nextImage*: ptr Image

  Requester* {.bycopy.} = object
    olderRequest*: ptr Requester
    leftEdge*: int16
    topEdge*: int16
    width*: int16
    height*: int16
    relLeft*: int16
    relTop*: int16
    reqGadget*: ptr Gadget
    reqBorder*: ptr Border
    reqText*: ptr IntuiText
    flags*: uint16
    backFill*: uint8
    reqLayer*: ptr Layer
    reqPad1: array[32, uint8]
    imageBMap*: ptr BitMap
    rWindow*: ptr Window
    reqImage*: ptr Image
    reqPad2: array[32, uint8]

  Gadget* {.bycopy.} = object
    nextGadget*: ptr Gadget
    leftEdge*: int16
    topEdge*: int16
    width*: int16
    height*: int16
    flags*: uint16
    activation*: uint16
    gadgetType*: uint16
    gadgetRender*: pointer
    selectRender*: pointer
    gadgetText*: ptr IntuiText
    mutualExclude*: int32
    specialInfo*: pointer
    gadgetID*: uint16
    userData*: pointer

  ExtGadget* {.bycopy.} = object
    nextGadget*: ptr ExtGadget
    leftEdge*: int16
    topEdge*: int16
    width*: int16
    height*: int16
    flags*: uint16
    activation*: uint16
    gadgetType*: uint16
    gadgetRender*: pointer
    selectRender*: pointer
    gadgetText*: ptr IntuiText
    mutualExclude*: int32
    specialInfo*: pointer
    gadgetID*: uint16
    userData*: pointer
    moreFlags*: uint32
    boundsLeftEdge*: int16
    boundsTopEdge*: int16
    boundsWidth*: int16
    boundsHeight*: int16
  
  Window* {.bycopy.} = object
    nextWindow*: ptr Window
    leftEdge*: int16
    topEdge*: int16
    width*: int16
    height*: int16
    mouseY*: int16
    mouseX*: int16
    minWidth*: int16
    minHeight*: int16
    maxWidth*: uint16
    maxHeight*: uint16
    flags*: uint32
    menuStrip*: ptr Menu
    title*: cstring
    firstRequest*: ptr Requester
    dmRequest*: ptr Requester
    reqCount*: int16
    wScreen*: ptr Screen
    rport*: ptr RastPort
    borderLeft*: int8
    borderTop*: int8
    borderRight*: int8
    borderBottom*: int8
    borderRPort*: ptr RastPort
    firstGadget*: ptr Gadget
    parent*: ptr Window
    descendant*: ptr Window
    `pointer`*: ptr uint16
    ptrHeight*: int8
    ptrWidth*: int8
    xOffset*: int8
    yOffset*: int8
    idcmpFlags*: uint32
    userPort*: ptr MsgPort
    windowPort*: ptr MsgPort
    messageKey*: ptr IntuiMessage
    detailPen*: uint8
    blockPen*: uint8
    checkMark*: ptr Image
    screenTitle*: cstring
    gzzMouseX*: int16
    gzzMouseY*: int16
    gzzWidth*: int16
    gzzHeight*: int16
    extData*: pointer
    userData*: pointer
    wLayer*: ptr Layer
    iFont*: ptr TextFont
    moreFlags*: uint32
  
  Screen* {.bycopy.} = object
    nextScreen*: ptr Screen
    firstWindow*: ptr Window
    leftEdge*: int16
    topEdge*: int16
    width*: int16
    height*: int16
    mouseY*: int16
    mouseX*: int16
    flags*: uint16
    title*: cstring
    defaultTitle*: cstring
    barHeight*: int8
    barVBorder*: int8
    barHBorder*: int8
    menuVBorder*: int8
    menuHBorder*: int8
    wBorTop*: int8
    wBorLeft*: int8
    wBorRight*: int8
    wBorBottom*: int8
    font*: ptr TextAttr
    viewPort*: ViewPort
    rastPort*: RastPort
    bitMap*: BitMap
    layerInfo*: Layer_Info
    firstGadget*: ptr Gadget
    detailPen*: uint8
    blockPen*: uint8
    saveColor0: uint16
    barLayer*: ptr Layer
    extData*: pointer
    userData*: pointer
  
  IntuiMessage* {.bycopy.} = object
    execMessage*: Message
    class*: uint32
    code*: uint16
    qualifier*: uint16
    iAddress*: pointer
    mouseX*: int16
    mouseY*: int16
    seconds*: uint32
    micros*: uint32
    idcmpWindow*: ptr Window
    specialLink*: ptr IntuiMessage

  ExtIntuiMessage* {.bycopy.} = object
    intuiMessage*: IntuiMessage
    tabletData*: ptr TabletData
  
  TabletData* {.bycopy.} = object
    xFraction*: uint16
    yFraction*: uint16
    tabletX*: uint32
    tabletY*: uint32
    rangeX*: uint32
    rangeY*: uint32
    tagList*: ptr TagItem

  TabletHookData* {.bycopy.} = object
    screen*: ptr Screen
    width*: uint32
    height*: uint32
    screenChanged*: int32

const
  POINTREL* = 0x00000001
  PREDRAWN* = 0x00000002
  NOISYREQ* = 0x00000004
  SIMPLEREQ* = 0x00000010
  USEREQIMAGE* = 0x00000020
  NOREQBACKFILL* = 0x00000040
  REQOFFWINDOW* = 0x00001000
  REQACTIVE* = 0x00002000
  SYSREQUEST* = 0x00004000
  DEFERREFRESH* = 0x00008000

const
  GFLG_GADGHIGHBITS* = 0x00000003
  GFLG_GADGHCOMP* = 0x00000000
  GFLG_GADGHBOX* = 0x00000001
  GFLG_GADGHIMAGE* = 0x00000002
  GFLG_GADGHNONE* = 0x00000003
  GFLG_GADGIMAGE* = 0x00000004
  GFLG_RELBOTTOM* = 0x00000008
  GFLG_RELRIGHT* = 0x00000010
  GFLG_RELWIDTH* = 0x00000020
  GFLG_RELHEIGHT* = 0x00000040
  GFLG_RELSPECIAL* = 0x00004000
  GFLG_SELECTED* = 0x00000080
  GFLG_DISABLED* = 0x00000100
  GFLG_LABELMASK* = 0x00003000
  GFLG_LABELITEXT* = 0x00000000
  GFLG_LABELSTRING* = 0x00001000
  GFLG_LABELIMAGE* = 0x00002000
  GFLG_TABCYCLE* = 0x00000200
  GFLG_STRINGEXTEND* = 0x00000400
  GFLG_IMAGEDISABLE* = 0x00000800
  GFLG_EXTENDED* = 0x00008000

const
  GACT_RELVERIFY* = 0x00000001
  GACT_IMMEDIATE* = 0x00000002
  GACT_ENDGADGET* = 0x00000004
  GACT_FOLLOWMOUSE* = 0x00000008
  GACT_RIGHTBORDER* = 0x00000010
  GACT_LEFTBORDER* = 0x00000020
  GACT_TOPBORDER* = 0x00000040
  GACT_BOTTOMBORDER* = 0x00000080
  GACT_BORDERSNIFF* = 0x00008000
  GACT_TOGGLESELECT* = 0x00000100
  GACT_BOOLEXTEND* = 0x00002000
  GACT_STRINGLEFT* = 0x00000000
  GACT_STRINGCENTER* = 0x00000200
  GACT_STRINGRIGHT* = 0x00000400
  GACT_int32INT* = 0x00000800
  GACT_ALTKEYMAP* = 0x00001000
  GACT_STRINGEXTEND* = 0x00002000
  GACT_ACTIVEGADGET* = 0x00004000

const
  GTYP_GADGETTYPE* = 0x0000FC00
  GTYP_SCRGADGET* = 0x00004000
  GTYP_GZZGADGET* = 0x00002000
  GTYP_REQGADGET* = 0x00001000
  GTYP_SYSGADGET* = 0x00008000
  GTYP_SYSTYPEMASK* = 0x000000F0
  GTYP_SIZING* = 0x00000010
  GTYP_WDRAGGING* = 0x00000020
  GTYP_SDRAGGING* = 0x00000030
  GTYP_WDEPTH* = 0x00000040
  GTYP_SDEPTH* = 0x00000050
  GTYP_WZOOM* = 0x00000060
  GTYP_SUNUSED* = 0x00000070
  GTYP_CLOSE* = 0x00000080
  GTYP_WUPFRONT* = GTYP_WDEPTH
  GTYP_SUPFRONT* = GTYP_SDEPTH
  GTYP_WDOWNBACK* = GTYP_WZOOM
  GTYP_SDOWNBACK* = GTYP_SUNUSED
  GTYP_GTYPEMASK* = 0x00000007
  GTYP_BOOLGADGET* = 0x00000001
  GTYP_GADGET0002* = 0x00000002
  GTYP_PROPGADGET* = 0x00000003
  GTYP_STRGADGET* = 0x00000004
  GTYP_CUSTOMGADGET* = 0x00000005

const
  GMORE_BOUNDS* = 0x00000001
  GMORE_GADGETHELP* = 0x00000002
  GMORE_SCROLLRASTER* = 0x00000004

type
  BoolInfo* {.bycopy.} = object
    flags*: uint16
    mask*: ptr uint16
    reserved: uint32

const
  BOOLMASK* = 0x00000001

type
  PropInfo* {.bycopy.} = object
    flags*: uint16
    horizPot*: uint16
    vertPot*: uint16
    horizBody*: uint16
    vertBody*: uint16
    cWidth*: uint16
    cHeight*: uint16
    hPotRes*: uint16
    vPotRes*: uint16
    leftBorder*: uint16
    topBorder*: uint16

const
  AUTOKNOB* = 0x00000001
  FREEHORIZ* = 0x00000002
  FREEVERT* = 0x00000004
  PROPBORDERLESS* = 0x00000008
  KNOBHIT* = 0x00000100
  PROPNEWLOOK* = 0x00000010
  KNOBHMIN* = 6
  KNOBVMIN* = 4
  MAXBODY* = 0x0000FFFF
  MAXPOT* = 0x0000FFFF

type
  StringExtend* {.bycopy.} = object
    font*: ptr TextFont
    pens*: array[2, uint8]
    activePens*: array[2, uint8]
    initialModes*: uint32
    editHook*: ptr Hook
    workBuffer*: ptr uint8
    reserved: array[4, uint32]

  StringInfo* {.bycopy.} = object
    buffer*: cstring
    undoBuffer*: cstring
    bufferPos*: int16
    maxChars*: int16
    dispPos*: int16
    undoPos*: int16
    numChars*: int16
    dispCount*: int16
    cLeft*: int16
    cTop*: int16
    extension*: ptr StringExtend
    longInt*: int32
    altKeyMap*: ptr KeyMap

const
  IDCMP_SIZEVERIFY* = 0x00000001
  IDCMP_NEWSIZE* = 0x00000002
  IDCMP_REFRESHWINDOW* = 0x00000004
  IDCMP_MOUSEBUTTONS* = 0x00000008
  IDCMP_MOUSEMOVE* = 0x00000010
  IDCMP_GADGETDOWN* = 0x00000020
  IDCMP_GADGETUP* = 0x00000040
  IDCMP_REQSET* = 0x00000080
  IDCMP_MENUPICK* = 0x00000100
  IDCMP_CLOSEWINDOW* = 0x00000200
  IDCMP_RAWKEY* = 0x00000400
  IDCMP_REQVERIFY* = 0x00000800
  IDCMP_REQCLEAR* = 0x00001000
  IDCMP_MENUVERIFY* = 0x00002000
  IDCMP_NEWPREFS* = 0x00004000
  IDCMP_DISKINSERTED* = 0x00008000
  IDCMP_DISKREMOVED* = 0x00010000
  IDCMP_WBENCHMESSAGE* = 0x00020000
  IDCMP_ACTIVEWINDOW* = 0x00040000
  IDCMP_INACTIVEWINDOW* = 0x00080000
  IDCMP_DELTAMOVE* = 0x00100000
  IDCMP_VANILLAKEY* = 0x00200000
  IDCMP_INTUITICKS* = 0x00400000
  IDCMP_IDCMPUPDATE* = 0x00800000
  IDCMP_MENUHELP* = 0x01000000
  IDCMP_CHANGEWINDOW* = 0x02000000
  IDCMP_GADGETHELP* = 0x04000000
  IDCMP_LONELYMESSAGE* = 0x80000000

const
  CWCODE_MOVESIZE* = 0x00000000
  CWCODE_DEPTH* = 0x00000001

const
  MENUHOT* = 0x00000001
  MENUCANCEL* = 0x00000002
  MENUWAITING* = 0x00000003

const
  OKOK* = MENUHOT
  OKABORT* = 0x00000004
  OKCANCEL* = MENUCANCEL

const
  WBENCHOPEN* = 0x00000001
  WBENCHCLOSE* = 0x00000002

const
  WFLG_SIZEGADGET* = 0x00000001
  WFLG_DRAGBAR* = 0x00000002
  WFLG_DEPTHGADGET* = 0x00000004
  WFLG_CLOSEGADGET* = 0x00000008
  WFLG_SIZEBRIGHT* = 0x00000010
  WFLG_SIZEBBOTTOM* = 0x00000020
  WFLG_REFRESHBITS* = 0x000000C0
  WFLG_SMART_REFRESH* = 0x00000000
  WFLG_SIMPLE_REFRESH* = 0x00000040
  WFLG_SUPER_BITMAP* = 0x00000080
  WFLG_OTHER_REFRESH* = 0x000000C0
  WFLG_BACKDROP* = 0x00000100
  WFLG_REPORTMOUSE* = 0x00000200
  WFLG_GIMMEZEROZERO* = 0x00000400
  WFLG_BORDERLESS* = 0x00000800
  WFLG_ACTIVATE* = 0x00001000
  WFLG_RMBTRAP* = 0x00010000
  WFLG_NOCAREREFRESH* = 0x00020000
  WFLG_NW_EXTENDED* = 0x00040000
  WFLG_NEWLOOKMENUS* = 0x00200000
  WFLG_WINDOWACTIVE* = 0x00002000
  WFLG_INREQUEST* = 0x00004000
  WFLG_MENUSTATE* = 0x00008000
  WFLG_WINDOWREFRESH* = 0x01000000
  WFLG_WBENCHWINDOW* = 0x02000000
  WFLG_WINDOWTICKED* = 0x04000000
  WFLG_VISITOR* = 0x08000000
  WFLG_ZOOMED* = 0x10000000
  WFLG_HASZOOM* = 0x20000000

const
  DEFAULTMOUSEQUEUE* = (5)

type
  NewWindow* {.bycopy.} = object
    leftEdge*: int16
    topEdge*: int16
    width*: int16
    height*: int16
    detailPen*: uint8
    blockPen*: uint8
    idcmpFlags*: uint32
    flags*: uint32
    firstGadget*: ptr Gadget
    checkMark*: ptr Image
    title*: cstring
    screen*: ptr Screen
    bitMap*: ptr BitMap
    minWidth*: int16
    minHeight*: int16
    maxWidth*: uint16
    maxHeight*: uint16
    `type`*: uint16

  ExtNewWindow* {.bycopy.} = object
    leftEdge*: int16
    topEdge*: int16
    width*: int16
    height*: int16
    detailPen*: uint8
    blockPen*: uint8
    idcmpFlags*: uint32
    flags*: uint32
    firstGadget*: ptr Gadget
    checkMark*: ptr Image
    title*: cstring
    screen*: ptr Screen
    bitMap*: ptr BitMap
    minWidth*: int16
    minHeight*: int16
    maxWidth*: uint16
    maxHeight*: uint16
    `type`*: uint16
    extension*: ptr TagItem

const
  WA_Dummy* = (TAG_USER + 99)
  WA_Left* = (WA_Dummy + 0x00000001)
  WA_Top* = (WA_Dummy + 0x00000002)
  WA_Width* = (WA_Dummy + 0x00000003)
  WA_Height* = (WA_Dummy + 0x00000004)
  WA_DetailPen* = (WA_Dummy + 0x00000005)
  WA_BlockPen* = (WA_Dummy + 0x00000006)
  WA_IDCMP* = (WA_Dummy + 0x00000007)
  WA_Flags* = (WA_Dummy + 0x00000008)
  WA_Gadgets* = (WA_Dummy + 0x00000009)
  WA_Checkmark* = (WA_Dummy + 0x0000000A)
  WA_Title* = (WA_Dummy + 0x0000000B)
  WA_ScreenTitle* = (WA_Dummy + 0x0000000C)
  WA_CustomScreen* = (WA_Dummy + 0x0000000D)
  WA_SuperBitMap* = (WA_Dummy + 0x0000000E)
  WA_MinWidth* = (WA_Dummy + 0x0000000F)
  WA_MinHeight* = (WA_Dummy + 0x00000010)
  WA_MaxWidth* = (WA_Dummy + 0x00000011)
  WA_MaxHeight* = (WA_Dummy + 0x00000012)
  WA_InnerWidth* = (WA_Dummy + 0x00000013)
  WA_InnerHeight* = (WA_Dummy + 0x00000014)
  WA_PubScreenName* = (WA_Dummy + 0x00000015)
  WA_PubScreen* = (WA_Dummy + 0x00000016)
  WA_PubScreenFallBack* = (WA_Dummy + 0x00000017)
  WA_WindowName* = (WA_Dummy + 0x00000018)
  WA_Colors* = (WA_Dummy + 0x00000019)
  WA_Zoom* = (WA_Dummy + 0x0000001A)
  WA_MouseQueue* = (WA_Dummy + 0x0000001B)
  WA_BackFill* = (WA_Dummy + 0x0000001C)
  WA_RptQueue* = (WA_Dummy + 0x0000001D)
  WA_SizeGadget* = (WA_Dummy + 0x0000001E)
  WA_DragBar* = (WA_Dummy + 0x0000001F)
  WA_DepthGadget* = (WA_Dummy + 0x00000020)
  WA_CloseGadget* = (WA_Dummy + 0x00000021)
  WA_Backdrop* = (WA_Dummy + 0x00000022)
  WA_ReportMouse* = (WA_Dummy + 0x00000023)
  WA_NoCareRefresh* = (WA_Dummy + 0x00000024)
  WA_Borderless* = (WA_Dummy + 0x00000025)
  WA_Activate* = (WA_Dummy + 0x00000026)
  WA_RMBTrap* = (WA_Dummy + 0x00000027)
  WA_WBenchWindow* = (WA_Dummy + 0x00000028)
  WA_SimpleRefresh* = (WA_Dummy + 0x00000029)
  WA_SmartRefresh* = (WA_Dummy + 0x0000002A)
  WA_SizeBRight* = (WA_Dummy + 0x0000002B)
  WA_SizeBBottom* = (WA_Dummy + 0x0000002C)
  WA_AutoAdjust* = (WA_Dummy + 0x0000002D)
  WA_GimmeZeroZero* = (WA_Dummy + 0x0000002E)
  WA_MenuHelp* = (WA_Dummy + 0x0000002F)
  WA_NewLookMenus* = (WA_Dummy + 0x00000030)
  WA_AmigaKey* = (WA_Dummy + 0x00000031)
  WA_NotifyDepth* = (WA_Dummy + 0x00000032)
  WA_Pointer* = (WA_Dummy + 0x00000034)
  WA_BusyPointer* = (WA_Dummy + 0x00000035)
  WA_PointerDelay* = (WA_Dummy + 0x00000036)
  WA_TabletMessages* = (WA_Dummy + 0x00000037)
  WA_HelpGroup* = (WA_Dummy + 0x00000038)
  WA_HelpGroupWindow* = (WA_Dummy + 0x00000039)

const
  HC_GADGETHELP* = (1)

type
  Remember* {.bycopy.} = object
    nextRemember*: ptr Remember
    rememberSize*: uint32
    memory*: pointer

type
  ColorSpec* {.bycopy.} = object
    colorIndex*: int16
    red*: uint16
    green*: uint16
    blue*: uint16

type
  EasyStruct* {.bycopy.} = object
    structSize*: uint32
    flags*: uint32
    title*: cstring
    textFormat*: cstring
    gadgetFormat*: cstring

template MENUNUM*(n: untyped): untyped =
  (n and 0x0000001F)
template ITEMNUM*(n: untyped): untyped =
  ((n shr 5) and 0x0000003F)
template SUBNUM*(n: untyped): untyped =
  ((n shr 11) and 0x0000001F)
template SHIFTMENU*(n: untyped): untyped =
  (n and 0x0000001F)
template SHIFTITEM*(n: untyped): untyped =
  ((n and 0x0000003F) shl 5)
template SHIFTSUB*(n: untyped): untyped =
  ((n and 0x0000001F) shl 11)
template FULLMENUNUM*(menu, item, sub: untyped): untyped =
  (SHIFTSUB(sub) or SHIFTITEM(item) or SHIFTMENU(menu))
template SRBNUM*(n: untyped): untyped =
  (0x00000008 - (n shr 4))
template SWBNUM*(n: untyped): untyped =
  (0x00000008 - (n and 0x0000000F))
template SSBNUM*(n: untyped): untyped =
  (0x00000001 + (n shr 4))
template SPARNUM*(n: untyped): untyped =
  (n shr 4)
template SHAKNUM*(n: untyped): untyped =
  (n and 0x0000000F)

const
  NOMENU* = 0x0000001F
  NOITEM* = 0x0000003F
  NOSUB* = 0x0000001F
  MENUNULL* = 0x0000FFFF

const
  CHECKWIDTH* = 19
  COMMWIDTH* = 27
  LOWCHECKWIDTH* = 13
  LOWCOMMWIDTH* = 16

const
  ALERT_TYPE* = 0x80000000
  RECOVERY_ALERT* = 0x00000000
  DEADEND_ALERT* = 0x80000000

const
  AUTOFRONTPEN* = 0
  AUTOBACKPEN* = 1
  AUTODRAWMODE* = JAM2
  AUTOLEFTEDGE* = 6
  AUTOTOPEDGE* = 3
  AUTOITEXTFONT* = nil
  AUTONEXTTEXT* = nil

const
  SELECTUP* = (IECODE_LBUTTON or IECODE_UP_PREFIX)
  SELECTDOWN* = (IECODE_LBUTTON)
  MENUUP* = (IECODE_RBUTTON or IECODE_UP_PREFIX)
  MENUDOWN* = (IECODE_RBUTTON)
  MIDDLEUP* = (IECODE_MBUTTON or IECODE_UP_PREFIX)
  MIDDLEDOWN* = (IECODE_MBUTTON)
  ALTLEFT* = (IEQUALIFIER_LALT)
  ALTRIGHT* = (IEQUALIFIER_RALT)
  AMIGALEFT* = (IEQUALIFIER_LCOMMAND)
  AMIGARIGHT* = (IEQUALIFIER_RCOMMAND)
  AMIGAKEYS* = (AMIGALEFT or AMIGARIGHT)
  CURSORUP* = 0x0000004C
  CURSORLEFT* = 0x0000004F
  CURSORRIGHT* = 0x0000004E
  CURSORDOWN* = 0x0000004D
  KEYCODE_Q* = 0x00000010
  KEYCODE_Z* = 0x00000031
  KEYCODE_X* = 0x00000032
  KEYCODE_V* = 0x00000034
  KEYCODE_B* = 0x00000035
  KEYCODE_N* = 0x00000036
  KEYCODE_M* = 0x00000037
  KEYCODE_LESS* = 0x00000038
  KEYCODE_GREATER* = 0x00000039

const
  TABLETA_Dummy* = (TAG_USER + 0x0003A000)
  TABLETA_TabletZ* = (TABLETA_Dummy + 0x00000001)
  TABLETA_RangeZ* = (TABLETA_Dummy + 0x00000002)
  TABLETA_AngleX* = (TABLETA_Dummy + 0x00000003)
  TABLETA_AngleY* = (TABLETA_Dummy + 0x00000004)
  TABLETA_AngleZ* = (TABLETA_Dummy + 0x00000005)
  TABLETA_Pressure* = (TABLETA_Dummy + 0x00000006)
  TABLETA_ButtonBits* = (TABLETA_Dummy + 0x00000007)
  TABLETA_InProximity* = (TABLETA_Dummy + 0x00000008)
  TABLETA_ResolutionX* = (TABLETA_Dummy + 0x00000009)
  TABLETA_ResolutionY* = (TABLETA_Dummy + 0x0000000A)
