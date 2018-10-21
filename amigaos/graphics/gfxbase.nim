#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const GRAPHICSNAME* = "graphics.library"

type
  GfxBase* {.bycopy.} = object
    libNode*: Library
    actiView*: ptr View
    copinit*: ptr copinit
    cia*: ptr int32
    blitter*: ptr int32
    LOFlist*: ptr uint16
    SHFlist*: ptr uint16
    blthd*: ptr bltnode
    blttl*: ptr bltnode
    bsblthd*: ptr bltnode
    bsblttl*: ptr bltnode
    vbsrv*: Interrupt
    timsrv*: Interrupt
    bltsrv*: Interrupt
    textFonts*: List
    defaultFont*: ptr TextFont
    modes*: uint16
    vblank*: int8
    debug*: int8
    beamSync*: int16
    system_bplcon0*: int16
    spriteReserved: uint8
    bytereserved: uint8
    flags*: uint16
    blitLock*: int16
    blitNest*: int16
    blitWaitQ*: List
    blitOwner*: ptr Task
    TOF_WaitQ*: List
    displayFlags*: uint16
    simpleSprites*: ptr ptr SimpleSprite
    maxDisplayRow*: uint16
    maxDisplayColumn*: uint16
    normalDisplayRows*: uint16
    normalDisplayColumns*: uint16
    normalDPMX*: uint16
    normalDPMY*: uint16
    lastChanceMemory*: ptr SignalSemaphore
    LCMptr*: ptr uint16
    microsPerLine*: uint16
    minDisplayColumn*: uint16
    chipRevBits0*: uint8
    memType*: uint8
    crb_reserved: array[4, uint8]
    monitor_id*: uint16
    hedley*: array[8, uint32]
    hedley_sprites*: array[8, uint32]
    hedley_sprites1*: array[8, uint32]
    hedley_count*: int16
    hedley_flags*: uint16
    hedley_tmp*: int16
    hash_table*: ptr int32
    current_tot_rows*: uint16
    current_tot_cclks*: uint16
    hedley_hint*: uint8
    hedley_hint2*: uint8
    nreserved: array[4, uint32]
    a2024_sync_raster*: ptr int32
    control_delta_pal*: uint16
    control_delta_ntsc*: uint16
    current_monitor*: ptr MonitorSpec
    monitorList*: List
    default_monitor*: ptr MonitorSpec
    monitorListSemaphore*: ptr SignalSemaphore
    displayInfoDataBase*: pointer
    topLine*: uint16
    actiViewCprSemaphore*: ptr SignalSemaphore
    utilBase*: pointer
    execBase*: pointer
    bwshifts*: ptr uint8
    strtFetchMasks*: ptr uint16
    stopFetchMasks*: ptr uint16
    overrun*: ptr uint16
    realStops*: ptr int16
    spriteWidth*: uint16
    spriteFMode*: uint16
    softSprites*: int8
    arraywidth*: int8
    defaultSpriteWidth*: uint16
    sprMoveDisable*: int8
    wantChips*: uint8
    boardMemType*: uint8
    bugs*: uint8
    layersBase*: pointer
    colorMask*: uint32
    iVector*: pointer
    iData*: pointer
    specialCounter*: uint32
    dbList*: pointer
    monitorFlags*: uint16
    scanDoubledSprites*: uint8
    BP3Bits*: uint8
    monitorVBlank*: AnalogSignalInterval
    natural_monitor*: ptr MonitorSpec
    progData*: pointer
    extSprites*: uint8
    pad3: uint8
    gfxFlags*: uint16
    vbCounter*: uint32
    hashTableSemaphore*: ptr SignalSemaphore
    hwEmul*: array[9, ptr uint32]

const
  NTSC* = 1
  GENLOC* = 2
  PAL* = 4
  TODA_SAFE* = 8
  REALLY_PAL* = 16
  LPEN_SWAP_FRAMES* = 32

const
  BLITMSG_FAULT* = 4

const
  GFXB_BIG_BLITS* = 0
  GFXB_HR_AGNUS* = 0
  GFXB_HR_DENISE* = 1
  GFXB_AA_ALICE* = 2
  GFXB_AA_LISA* = 3
  GFXB_AA_MLISA* = 4
  GFXF_BIG_BLITS* = 1
  GFXF_HR_AGNUS* = 1
  GFXF_HR_DENISE* = 2
  GFXF_AA_ALICE* = 4
  GFXF_AA_LISA* = 8
  GFXF_AA_MLISA* = 16

const
  SETCHIPREV_A* = GFXF_HR_AGNUS
  SETCHIPREV_ECS* = (GFXF_HR_AGNUS or GFXF_HR_DENISE)
  SETCHIPREV_AA* = (GFXF_AA_ALICE or GFXF_AA_LISA or SETCHIPREV_ECS)
  SETCHIPREV_BEST* = 0xFFFFFFFF

const
  BUS_16* = 0
  NML_CAS* = 0
  BUS_32* = 1
  DBL_CAS* = 2
  BANDWIDTH_1X* = (BUS_16 or NML_CAS)
  BANDWIDTH_2XNML* = BUS_32
  BANDWIDTH_2XDBL* = DBL_CAS
  BANDWIDTH_4X* = (BUS_32 or DBL_CAS)
