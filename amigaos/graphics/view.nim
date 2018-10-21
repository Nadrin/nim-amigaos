#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  View* {.bycopy.} = object
    viewPort*: ptr ViewPort
    LOFCprList*: ptr cprlist
    SHFCprList*: ptr cprlist
    dyOffset*: int16
    dxOffset*: int16
    modes*: uint16

  ViewExtra* {.bycopy.} = object
    n*: ExtendedNode
    view*: ptr View
    monitor*: ptr MonitorSpec
    topLine*: uint16
  
  ViewPort* {.bycopy.} = object
    next*: ptr ViewPort
    colorMap*: ptr ColorMap
    dspIns*: ptr CopList
    sprIns*: ptr CopList
    clrIns*: ptr CopList
    uCopIns*: ptr UCopList
    dWidth*: int16
    dHeight*: int16
    dxOffset*: int16
    dyOffset*: int16
    modes*: uint16
    spritePriorities*: uint8
    extendedModes*: uint8
    rasInfo*: ptr RasInfo

  ViewPortExtra* {.bycopy.} = object
    n*: ExtendedNode
    viewPort*: ptr ViewPort
    displayClip*: Rectangle
    vecTable: pointer
    driverData*: array[2, pointer]
    flags*: uint16
    origin*: array[2, Point]
    cop1ptr: uint32
    cop2ptr: uint32
  
  RasInfo* {.bycopy.} = object
    next*: ptr RasInfo
    bitMap*: ptr BitMap
    rxOffset*: int16
    ryOffset*: int16

  ColorMap* {.bycopy.} = object
    flags*: uint8
    `type`*: uint8
    count*: uint16
    colorTable*: pointer
    cm_vpe*: ptr ViewPortExtra
    lowColorBits*: pointer
    transparencyPlane*: uint8
    spriteResolution*: uint8
    spriteResDefault*: uint8
    uuxFlags*: uint8
    cm_vp*: ptr ViewPort
    normalDisplayInfo*: pointer
    coerceDisplayInfo*: pointer
    cm_batch_items*: ptr TagItem
    vpModeID*: uint32
    palExtra*: ptr PaletteExtra
    spriteBase_Even*: uint16
    spriteBase_Odd*: uint16
    bp_0_base*: uint16
    bp_1_base*: uint16
  
  PaletteExtra* {.bycopy.} = object
    semaphore*: SignalSemaphore
    firstFree: uint16
    nFree*: uint16
    firstShared: uint16
    nShared: uint16
    refCnt: ptr uint8
    allocList: ptr uint8
    viewPort*: ptr ViewPort
    sharableColors*: uint16
  
  DBufInfo* {.bycopy.} = object
    link1*: pointer
    count1*: uint32
    safeMessage*: Message
    userData1*: pointer
    link2*: pointer
    count2*: uint32
    dispMessage*: Message
    userData2*: pointer
    matchLong*: uint32
    copPtr1*: pointer
    copPtr2*: pointer
    copPtr3*: pointer
    beamPos1*: uint16
    beamPos2*: uint16
  
  CopInsU1* {.bycopy.} = object {.union.}
    vWaitPos*: int16
    destAddr*: int16
  CopInsU2* {.bycopy.} = object {.union.}
    hWaitPos*: int16
    destData*: int16
  CopInsU3* {.bycopy.} = object {.union.}
    nxtlist*: ptr CopList
    u4*: CopInsU4
  CopInsU4* {.bycopy.} = object
    u1*: CopInsU1
    u2*: CopInsU2
  CopIns* {.bycopy.} = object
    OpCode*: int16
    u3*: CopInsU3
  
  UCopList* {.bycopy.} = object
    next*: ptr UCopList
    firstCopList*: ptr CopList
    copList*: ptr CopList
  
  CopList* {.bycopy.} = object
    next*: ptr CopList
    copList: ptr CopList
    viewPort: ptr ViewPort
    copIns*: ptr CopIns
    copPtr*: ptr CopIns
    copLStart*: ptr uint16
    copSStart*: ptr uint16
    count*: int16
    maxCount*: int16
    dyOffset*: int16
    slRepeat*: uint16
    flags*: uint16

const
  VPXB_FREE_ME* = 0
  VPXF_FREE_ME* = (1 shl VPXB_FREE_ME)
  VPXB_LAST* = 1
  VPXF_LAST* = (1 shl VPXB_LAST)
  VPXB_STRADDLES_256* = 4
  VPXF_STRADDLES_256* = (1 shl VPXB_STRADDLES_256)
  VPXB_STRADDLES_512* = 5
  VPXF_STRADDLES_512* = (1 shl VPXB_STRADDLES_512)
  EXTEND_VSTRUCT* = 0x00001000
  VPF_A2024* = 0x00000040
  VPF_TENHZ* = 0x00000020
  VPB_A2024* = 6
  VPB_TENHZ* = 4

const
  GENLOCK_VIDEO* = 0x00000002
  LACE* = 0x00000004
  DOUBLESCAN* = 0x00000008
  SUPERHIRES* = 0x00000020
  PFBA* = 0x00000040
  EXTRA_HALFBRITE* = 0x00000080
  GENLOCK_AUDIO* = 0x00000100
  DUALPF* = 0x00000400
  HAM* = 0x00000800
  EXTENDED_MODE* = 0x00001000
  VP_HIDE* = 0x00002000
  SPRITES* = 0x00004000
  HIRES* = 0x00008000

const
  COLORMAP_TYPE_V1_2* = 0x00000000
  COLORMAP_TYPE_V1_4* = 0x00000001
  COLORMAP_TYPE_V36* = COLORMAP_TYPE_V1_4
  COLORMAP_TYPE_V39* = 0x00000002


const
  COLORMAP_TRANSPARENCY* = 0x00000001
  COLORPLANE_TRANSPARENCY* = 0x00000002
  BORDER_BLANKING* = 0x00000004
  BORDER_NOTRANSPARENCY* = 0x00000008
  VIDEOCONTROL_BATCH* = 0x00000010
  USER_COPPER_CLIP* = 0x00000020
  BORDERSPRITES* = 0x00000040

const
  SPRITERESN_ECS* = 0
  SPRITERESN_140NS* = 1
  SPRITERESN_70NS* = 2
  SPRITERESN_35NS* = 3
  SPRITERESN_DEFAULT* = -1

const
  CMF_CMTRANS* = 0
  CMF_CPTRANS* = 1
  CMF_BRDRBLNK* = 2
  CMF_BRDNTRAN* = 3
  CMF_BRDRSPRT* = 6

const
  CMAB_FULLPALETTE* = 0
  CMAF_FULLPALETTE* = (1 shl CMAB_FULLPALETTE)
  CMAB_NO_INTERMED_UPDATE* = 1
  CMAF_NO_INTERMED_UPDATE* = (1 shl CMAB_NO_INTERMED_UPDATE)
  CMAB_NO_COLOR_LOAD* = 2
  CMAF_NO_COLOR_LOAD* = (1 shl CMAB_NO_COLOR_LOAD)
  CMAB_DUALPF_DISABLE* = 3
  CMAF_DUALPF_DISABLE* = (1 shl CMAB_DUALPF_DISABLE)

const
  PENB_EXCLUSIVE* = 0
  PENB_NO_SETCOLOR* = 1
  PENF_EXCLUSIVE* = (1 shl PENB_EXCLUSIVE)
  PENF_NO_SETCOLOR* = (1 shl PENB_NO_SETCOLOR)

const
  PEN_EXCLUSIVE* = PENF_EXCLUSIVE
  PEN_NO_SETCOLOR* = PENF_NO_SETCOLOR

const
  PRECISION_EXACT* = -1
  PRECISION_IMAGE* = 0
  PRECISION_ICON* = 16
  PRECISION_GUI* = 32

const
  OBP_Precision* = 0x84000000
  OBP_FailIfBad* = 0x84000001

const
  MVP_OK* = 0
  MVP_NO_MEM* = 1
  MVP_NO_VPE* = 2
  MVP_NO_DSPINS* = 3
  MVP_NO_DISPLAY* = 4
  MVP_OFF_BOTTOM* = 5

const
  MCOP_OK* = 0
  MCOP_NO_MEM* = 1
  MCOP_NOP* = 2
