#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  DRI_VERSION* = 2

type
  DrawInfoResolution* {.bycopy.} = object
    x*: uint16
    y*: uint16
  DrawInfo* {.bycopy.} = object
    version*: uint16
    numPens*: uint16
    pens*: ptr uint16
    font*: ptr TextFont
    depth*: uint16
    resolution*: DrawInfoResolution
    flags*: uint32
    checkMark*: ptr Image
    amigaKey*: ptr Image
    reserved: array[5, uint32]

const
  DRIF_NEWLOOK* = 0x00000001

const
  DETAILPEN* = (0x00000000)
  BLOCKPEN* = (0x00000001)
  TEXTPEN* = (0x00000002)
  SHINEPEN* = (0x00000003)
  SHADOWPEN* = (0x00000004)
  FILLPEN* = (0x00000005)
  FILLTEXTPEN* = (0x00000006)
  BACKGROUNDPEN* = (0x00000007)
  HIGHLIGHTTEXTPEN* = (0x00000008)
  BARDETAILPEN* = (0x00000009)
  BARBLOCKPEN* = (0x0000000A)
  BARTRIMPEN* = (0x0000000B)
  NUMDRIPENS* = (0x0000000C)

const
  PEN_C3* = 0x0000FEFC
  PEN_C2* = 0x0000FEFD
  PEN_C1* = 0x0000FEFE
  PEN_C0* = 0x0000FEFF

# Screen type declaration moved to intuition.nim file.

const
  SCREENTYPE* = 0x0000000F

const
  WBENCHSCREEN* = 0x00000001
  PUBLICSCREEN* = 0x00000002
  CUSTOMSCREEN* = 0x0000000F
  SHOWTITLE* = 0x00000010
  BEEPING* = 0x00000020
  CUSTOMBITMAP* = 0x00000040
  SCREENBEHIND* = 0x00000080
  SCREENQUIET* = 0x00000100
  SCREENHIRES* = 0x00000200
  NS_EXTENDED* = 0x00001000
  AUTOSCROLL* = 0x00004000
  PENSHARED* = 0x00000400

const
  STDSCREENHEIGHT* = -1
  STDSCREENWIDTH* = -1

const
  SA_Dummy* = (TAG_USER + 32)
  SA_Left* = (SA_Dummy + 0x00000001)
  SA_Top* = (SA_Dummy + 0x00000002)
  SA_Width* = (SA_Dummy + 0x00000003)
  SA_Height* = (SA_Dummy + 0x00000004)
  SA_Depth* = (SA_Dummy + 0x00000005)
  SA_DetailPen* = (SA_Dummy + 0x00000006)
  SA_BlockPen* = (SA_Dummy + 0x00000007)
  SA_Title* = (SA_Dummy + 0x00000008)
  SA_Colors* = (SA_Dummy + 0x00000009)
  SA_ErrorCode* = (SA_Dummy + 0x0000000A)
  SA_Font* = (SA_Dummy + 0x0000000B)
  SA_SysFont* = (SA_Dummy + 0x0000000C)
  SA_Type* = (SA_Dummy + 0x0000000D)
  SA_BitMap* = (SA_Dummy + 0x0000000E)
  SA_PubName* = (SA_Dummy + 0x0000000F)
  SA_PubSig* = (SA_Dummy + 0x00000010)
  SA_PubTask* = (SA_Dummy + 0x00000011)
  SA_DisplayID* = (SA_Dummy + 0x00000012)
  SA_DClip* = (SA_Dummy + 0x00000013)
  SA_Overscan* = (SA_Dummy + 0x00000014)
  SA_Obsolete1* = (SA_Dummy + 0x00000015)
  SA_ShowTitle* = (SA_Dummy + 0x00000016)
  SA_Behind* = (SA_Dummy + 0x00000017)
  SA_Quiet* = (SA_Dummy + 0x00000018)
  SA_AutoScroll* = (SA_Dummy + 0x00000019)
  SA_Pens* = (SA_Dummy + 0x0000001A)
  SA_FullPalette* = (SA_Dummy + 0x0000001B)
  SA_ColorMapEntries* = (SA_Dummy + 0x0000001C)
  SA_Parent* = (SA_Dummy + 0x0000001D)
  SA_Draggable* = (SA_Dummy + 0x0000001E)
  SA_Exclusive* = (SA_Dummy + 0x0000001F)
  SA_SharePens* = (SA_Dummy + 0x00000020)
  SA_BackFill* = (SA_Dummy + 0x00000021)
  SA_Interleaved* = (SA_Dummy + 0x00000022)
  SA_Colors32* = (SA_Dummy + 0x00000023)
  SA_VideoControl* = (SA_Dummy + 0x00000024)
  SA_FrontChild* = (SA_Dummy + 0x00000025)
  SA_BackChild* = (SA_Dummy + 0x00000026)
  SA_LikeWorkbench* = (SA_Dummy + 0x00000027)
  SA_Reserved* = (SA_Dummy + 0x00000028)
  SA_MinimizeISG* = (SA_Dummy + 0x00000029)

const
  OSERR_NOMONITOR* = (1)
  OSERR_NOCHIPS* = (2)
  OSERR_NOMEM* = (3)
  OSERR_NOCHIPMEM* = (4)
  OSERR_PUBNOTUNIQUE* = (5)
  OSERR_UNKNOWNMODE* = (6)
  OSERR_TOODEEP* = (7)
  OSERR_ATTACHFAIL* = (8)
  OSERR_NOTAVAILABLE* = (9)

type
  NewScreen* {.bycopy.} = object
    leftEdge*: int16
    topEdge*: int16
    width*: int16
    height*: int16
    depth*: int16
    detailPen*: uint8
    blockPen*: uint8
    viewModes*: uint16
    `type`*: uint16
    font*: ptr TextAttr
    defaultTitle*: cstring
    gadgets*: ptr Gadget
    customBitMap*: ptr BitMap

  ExtNewScreen* {.bycopy.} = object
    leftEdge*: int16
    topEdge*: int16
    width*: int16
    height*: int16
    depth*: int16
    detailPen*: uint8
    blockPen*: uint8
    viewModes*: uint16
    `type`*: uint16
    font*: ptr TextAttr
    defaultTitle*: cstring
    gadgets*: ptr Gadget
    customBitMap*: ptr BitMap
    extension*: ptr TagItem

const
  OSCAN_TEXT* = (1)
  OSCAN_STANDARD* = (2)
  OSCAN_MAX* = (3)
  OSCAN_VIDEO* = (4)

type
  PubScreenNode* {.bycopy.} = object
    node*: Node
    screen*: ptr Screen
    flags*: uint16
    size*: int16
    visitorCount*: int16
    sigTask*: ptr Task
    sigBit*: uint8

const
  PSNF_PRIVATE* = (0x00000001)

const
  MAXPUBSCREENNAME* = (139)

const
  SHANGHAI* = 0x00000001
  POPPUBSCREEN* = 0x00000002

const
  SDEPTH_TOFRONT* = (0)
  SDEPTH_TOBACK* = (1)
  SDEPTH_INFAMILY* = (2)
  SDEPTH_CHILDONLY* = SDEPTH_INFAMILY

const
  SPOS_RELATIVE* = (0)
  SPOS_ABSOLUTE* = (1)
  SPOS_MAKEVISIBLE* = (2)
  SPOS_FORCEDRAG* = (4)

type
  ScreenBuffer* {.bycopy.} = object
    bitMap*: ptr BitMap
    dbufInfo*: ptr DBufInfo

const
  SB_SCREEN_BITMAP* = 1
  SB_COPY_BITMAP* = 2
