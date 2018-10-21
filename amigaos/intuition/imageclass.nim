#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  CUSTOMIMAGEDEPTH* = (-1)

template GADGET_BOX*(g: untyped): untyped =
  (cast[ptr IBox](addr((cast[ptr Gadget](g)).leftEdge)))

template IM_BOX*(im: untyped): untyped =
  (cast[ptr IBox](addr((cast[ptr Image](im)).leftEdge)))

template IM_FGPEN*(im: untyped): untyped =
  (im.planePick)

template IM_BGPEN*(im: untyped): untyped =
  (im.planeOnOff)

const
  IA_Dummy* = (TAG_USER + 0x00020000)
  IA_Left* = (IA_Dummy + 0x00000001)
  IA_Top* = (IA_Dummy + 0x00000002)
  IA_Width* = (IA_Dummy + 0x00000003)
  IA_Height* = (IA_Dummy + 0x00000004)
  IA_FGPen* = (IA_Dummy + 0x00000005)
  IA_BGPen* = (IA_Dummy + 0x00000006)
  IA_Data* = (IA_Dummy + 0x00000007)
  IA_LineWidth* = (IA_Dummy + 0x00000008)
  IA_ShadowPen* = (IA_Dummy + 0x00000009)
  IA_HighlightPen* = (IA_Dummy + 0x0000000A)
  IA_Pens* = (IA_Dummy + 0x0000000E)
  IA_Resolution* = (IA_Dummy + 0x0000000F)
  IA_APattern* = (IA_Dummy + 0x00000010)
  IA_APatSize* = (IA_Dummy + 0x00000011)
  IA_Mode* = (IA_Dummy + 0x00000012)
  IA_Font* = (IA_Dummy + 0x00000013)
  IA_Outline* = (IA_Dummy + 0x00000014)
  IA_Recessed* = (IA_Dummy + 0x00000015)
  IA_DoubleEmboss* = (IA_Dummy + 0x00000016)
  IA_EdgesOnly* = (IA_Dummy + 0x00000017)
  IA_SupportsDisable* = (IA_Dummy + 0x0000001A)
  IA_FrameType* = (IA_Dummy + 0x0000001B)
  IA_Underscore* = (IA_Dummy + 0x0000001C)
  IA_Scalable* = (IA_Dummy + 0x0000001D)
  IA_ActivateKey* = (IA_Dummy + 0x0000001E)
  IA_Screen* = (IA_Dummy + 0x0000001F)
  IA_Precision* = (IA_Dummy + 0x00000020)

const
  SYSIA_Size* = (IA_Dummy + 0x0000000B)
  SYSIA_Depth* = (IA_Dummy + 0x0000000C)
  SYSIA_Which* = (IA_Dummy + 0x0000000D)
  SYSIA_DrawInfo* = (IA_Dummy + 0x00000018)
  SYSIA_Pens* = IA_Pens
  SYSIA_ReferenceFont* = (IA_Dummy + 0x00000019)

const
  SYSISIZE_MEDRES* = (0)
  SYSISIZE_LOWRES* = (1)
  SYSISIZE_HIRES* = (2)

const
  DEPTHIMAGE* = (0x00000000)
  ZOOMIMAGE* = (0x00000001)
  SIZEIMAGE* = (0x00000002)
  CLOSEIMAGE* = (0x00000003)
  SDEPTHIMAGE* = (0x00000005)
  LEFTIMAGE* = (0x0000000A)
  UPIMAGE* = (0x0000000B)
  RIGHTIMAGE* = (0x0000000C)
  DOWNIMAGE* = (0x0000000D)
  CHECKIMAGE* = (0x0000000E)
  MXIMAGE* = (0x0000000F)
  MENUCHECK* = (0x00000010)
  AMIGAKEY* = (0x00000011)

const
  FRAME_DEFAULT* = 0
  FRAME_BUTTON* = 1
  FRAME_RIDGE* = 2
  FRAME_ICONDROPBOX* = 3

const
  IM_DRAW* = 0x00000202
  IM_HITTEST* = 0x00000203
  IM_ERASE* = 0x00000204
  IM_MOVE* = 0x00000205
  IM_DRAWFRAME* = 0x00000206
  IM_FRAMEBOX* = 0x00000207
  IM_HITFRAME* = 0x00000208
  IM_ERASEFRAME* = 0x00000209
  IM_DOMAINFRAME* = 0x0000020A

const
  IDS_NORMAL* = (0)
  IDS_SELECTED* = (1)
  IDS_DISABLED* = (2)
  IDS_BUSY* = (3)
  IDS_INDETERMINATE* = (4)
  IDS_INACTIVENORMAL* = (5)
  IDS_INACTIVESELECTED* = (6)
  IDS_INACTIVEDISABLED* = (7)
  IDS_SELECTEDDISABLED* = (8)
  IDS_INDETERMINANT* = IDS_INDETERMINATE

type
  impFrameBox* {.bycopy.} = object
    methodID*: uint32
    contentsBox*: ptr IBox
    frameBox*: ptr IBox
    drInfo*: ptr DrawInfo
    frameFlags*: uint32

const
  FRAMEF_SPECIFY* = (1 shl 0)

type
  impDrawOffset* {.bycopy.} = object
    x*: int16
    y*: int16
  impDrawDimensions* {.bycopy.} = object
    width*: int16
    height*: int16
  impDraw* {.bycopy.} = object
    methodID*: uint32
    rport*: ptr RastPort
    offset*: impDrawOffset
    state*: uint32
    drInfo*: ptr DrawInfo
    dimensions*: impDrawDimensions

type
  impEraseOffset* {.bycopy.} = object
    x*: int16
    y*: int16
  impEraseDimensions* {.bycopy.} = object
    width*: int16
    height*: int16
  impErase* {.bycopy.} = object
    methodID*: uint32
    rport*: ptr RastPort
    offset*: impEraseOffset
    dimensions*: impEraseDimensions

type
  impHitTestPoint* {.bycopy.} = object
    x*: int16
    y*: int16
  impHitTestDimensions* {.bycopy.} = object
    width*: int16
    height*: int16
  impHitTest* {.bycopy.} = object
    methodID*: uint32
    point*: impHitTestPoint
    dimensions*: impHitTestDimensions

type
  impDomainFrame* {.bycopy.} = object
    methodID*: uint32
    drInfo*: ptr DrawInfo
    rport*: ptr RastPort
    which*: int32
    domain*: IBox
    attrs*: ptr TagItem

const
  IDOMAIN_MINIMUM* = (0)
  IDOMAIN_NOMINAL* = (1)
  IDOMAIN_MAXIMUM* = (2)
