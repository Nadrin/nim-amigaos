#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  MonitorSpec* {.bycopy.} = object
    node*: ExtendedNode
    flags*: uint16
    ratioh*: int32
    ratiov*: int32
    total_rows*: uint16
    total_colorclocks*: uint16
    deniseMaxDisplayColumn*: uint16
    beamCon0*: uint16
    min_row*: uint16
    special*: ptr SpecialMonitor
    openCount*: uint16
    transform*: proc (): int
    translate*: proc (): int
    scale*: proc (): int
    xoffset*: uint16
    yoffset*: uint16
    legalView*: Rectangle
    maxoscan*: proc (): int32
    videoscan*: proc (): int32
    deniseMinDisplayColumn*: uint16
    displayCompatible*: uint32
    displayInfoDataBase*: List
    displayInfoDataBaseSemaphore*: SignalSemaphore
    mrgCop*: proc (): int
    loadView*: proc (): int
    killView*: proc (): int
  
  AnalogSignalInterval* {.bycopy.} = object
    start*: uint16
    stop*: uint16

  SpecialMonitor* {.bycopy.} = object
    node*: ExtendedNode
    flags*: uint16
    monitor*: proc (): int
    reserved1: proc (): int
    reserved2: proc (): int
    reserved3: proc (): int
    hblank*: AnalogSignalInterval
    vblank*: AnalogSignalInterval
    hsync*: AnalogSignalInterval
    vsync*: AnalogSignalInterval

const
  TO_MONITOR* = 0
  FROM_MONITOR* = 1
  STANDARD_XOFFSET* = 9
  STANDARD_YOFFSET* = 0
  MSB_REQUEST_NTSC* = 0
  MSB_REQUEST_PAL* = 1
  MSB_REQUEST_SPECIAL* = 2
  MSB_REQUEST_A2024* = 3
  MSB_DOUBLE_SPRITES* = 4
  MSF_REQUEST_NTSC* = (1 shl MSB_REQUEST_NTSC)
  MSF_REQUEST_PAL* = (1 shl MSB_REQUEST_PAL)
  MSF_REQUEST_SPECIAL* = (1 shl MSB_REQUEST_SPECIAL)
  MSF_REQUEST_A2024* = (1 shl MSB_REQUEST_A2024)
  MSF_DOUBLE_SPRITES* = (1 shl MSB_DOUBLE_SPRITES)

const
  REQUEST_NTSC* = (1 shl MSB_REQUEST_NTSC)
  REQUEST_PAL* = (1 shl MSB_REQUEST_PAL)
  REQUEST_SPECIAL* = (1 shl MSB_REQUEST_SPECIAL)
  REQUEST_A2024* = (1 shl MSB_REQUEST_A2024)
  DEFAULT_MONITOR_NAME* = "default.monitor"
  NTSC_MONITOR_NAME* = "ntsc.monitor"
  PAL_MONITOR_NAME* = "pal.monitor"
  STANDARD_MONITOR_MASK* = (REQUEST_NTSC or REQUEST_PAL)
  STANDARD_NTSC_ROWS* = 262
  STANDARD_PAL_ROWS* = 312
  STANDARD_COLORCLOCKS* = 226
  STANDARD_DENISE_MAX* = 455
  STANDARD_DENISE_MIN* = 93
  STANDARD_NTSC_BEAMCON* = 0x00000000
  STANDARD_PAL_BEAMCON* = DISPLAYPAL
  SPECIAL_BEAMCON* = (VARVBLANK or LOLDIS or VARVSYNC or VARHSYNC or VARBEAM or CSBLANK or VSYNCTRUE)
  MIN_NTSC_ROW* = 21
  MIN_PAL_ROW* = 29
  STANDARD_VIEW_X* = 0x00000081
  STANDARD_VIEW_Y* = 0x0000002C
  STANDARD_HbstringT* = 0x00000006
  STANDARD_HSSTRT* = 0x0000000B
  STANDARD_HSSTOP* = 0x0000001C
  STANDARD_HBSTOP* = 0x0000002C
  STANDARD_VbstringT* = 0x00000122
  STANDARD_VSSTRT* = 0x000002A6
  STANDARD_VSSTOP* = 0x000003AA
  STANDARD_VBSTOP* = 0x00001066

const
  VGA_COLORCLOCKS* = (STANDARD_COLORCLOCKS div 2)
  VGA_TOTAL_ROWS* = (STANDARD_NTSC_ROWS * 2)
  VGA_DENISE_MIN* = 59
  MIN_VGA_ROW* = 29
  VGA_HbstringT* = 0x00000008
  VGA_HSSTRT* = 0x0000000E
  VGA_HSSTOP* = 0x0000001C
  VGA_HBSTOP* = 0x0000001E
  VGA_VbstringT* = 0x00000000
  VGA_VSSTRT* = 0x00000153
  VGA_VSSTOP* = 0x00000235
  VGA_VBSTOP* = 0x00000CCD
  VGA_MONITOR_NAME* = "vga.monitor"

const
  VGA70_COLORCLOCKS* = (STANDARD_COLORCLOCKS div 2)
  VGA70_TOTAL_ROWS* = 449
  VGA70_DENISE_MIN* = 59
  MIN_VGA70_ROW* = 35
  VGA70_HbstringT* = 0x00000008
  VGA70_HSSTRT* = 0x0000000E
  VGA70_HSSTOP* = 0x0000001C
  VGA70_HBSTOP* = 0x0000001E
  VGA70_VbstringT* = 0x00000000
  VGA70_VSSTRT* = 0x000002A6
  VGA70_VSSTOP* = 0x00000388
  VGA70_VBSTOP* = 0x00000F73
  VGA70_BEAMCON* = (SPECIAL_BEAMCON xor VSYNCTRUE)
  VGA70_MONITOR_NAME* = "vga70.monitor"

const
  BROADCAST_HbstringT* = 0x00000001
  BROADCAST_HSSTRT* = 0x00000006
  BROADCAST_HSSTOP* = 0x00000017
  BROADCAST_HBSTOP* = 0x00000027
  BROADCAST_VbstringT* = 0x00000000
  BROADCAST_VSSTRT* = 0x000002A6
  BROADCAST_VSSTOP* = 0x0000054C
  BROADCAST_VBSTOP* = 0x00001C40
  BROADCAST_BEAMCON* = (LOLDIS or CSBLANK)

const
  RATIO_FIXEDPART* = 4
  RATIO_UNITY* = (1 shl RATIO_FIXEDPART)
