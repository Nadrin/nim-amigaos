#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  ACPU_BusErr* = 0x80000002
  ACPU_AddressErr* = 0x80000003
  ACPU_InstErr* = 0x80000004
  ACPU_DivZero* = 0x80000005
  ACPU_CHK* = 0x80000006
  ACPU_TRAPV* = 0x80000007
  ACPU_PrivErr* = 0x80000008
  ACPU_Trace* = 0x80000009
  ACPU_LineA* = 0x8000000A
  ACPU_LineF* = 0x8000000B
  ACPU_Format* = 0x8000000E
  ACPU_Spurious* = 0x80000018
  ACPU_AutoVec1* = 0x80000019
  ACPU_AutoVec2* = 0x8000001A
  ACPU_AutoVec3* = 0x8000001B
  ACPU_AutoVec4* = 0x8000001C
  ACPU_AutoVec5* = 0x8000001D
  ACPU_AutoVec6* = 0x8000001E
  ACPU_AutoVec7* = 0x8000001F

const
  AT_DeadEnd* = 0x80000000
  AT_Recovery* = 0x00000000

const
  AG_NoMemory* = 0x00010000
  AG_MakeLib* = 0x00020000
  AG_OpenLib* = 0x00030000
  AG_OpenDev* = 0x00040000
  AG_OpenRes* = 0x00050000
  AG_IOError* = 0x00060000
  AG_NoSignal* = 0x00070000
  AG_BadParm* = 0x00080000
  AG_CloseLib* = 0x00090000
  AG_CloseDev* = 0x000A0000
  AG_ProcCreate* = 0x000B0000

const
  AO_ExecLib* = 0x00008001
  AO_GraphicsLib* = 0x00008002
  AO_LayersLib* = 0x00008003
  AO_Intuition* = 0x00008004
  AO_MathLib* = 0x00008005
  AO_DOSLib* = 0x00008007
  AO_RAMLib* = 0x00008008
  AO_IconLib* = 0x00008009
  AO_ExpansionLib* = 0x0000800A
  AO_DiskfontLib* = 0x0000800B
  AO_UtilityLib* = 0x0000800C
  AO_KeyMapLib* = 0x0000800D
  AO_AudioDev* = 0x00008010
  AO_ConsoleDev* = 0x00008011
  AO_GamePortDev* = 0x00008012
  AO_KeyboardDev* = 0x00008013
  AO_TrackDiskDev* = 0x00008014
  AO_TimerDev* = 0x00008015
  AO_CIARsrc* = 0x00008020
  AO_DiskRsrc* = 0x00008021
  AO_MiscRsrc* = 0x00008022
  AO_BootStrap* = 0x00008030
  AO_Workbench* = 0x00008031
  AO_DiskCopy* = 0x00008032
  AO_GadTools* = 0x00008033
  AO_Unknown* = 0x00008035

const
  AN_ExecLib* = 0x01000000
  AN_ExcptVect* = 0x01000001
  AN_BaseChkSum* = 0x01000002
  AN_LibChkSum* = 0x01000003
  AN_MemCorrupt* = 0x81000005
  AN_IntrMem* = 0x81000006
  AN_InitAPtr* = 0x01000007
  AN_SemCorrupt* = 0x01000008
  AN_FreeTwice* = 0x01000009
  AN_BogusExcpt* = 0x8100000A
  AN_IOUsedTwice* = 0x0100000B
  AN_MemoryInsane* = 0x0100000C
  AN_IOAfterClose* = 0x0100000D
  AN_StackProbe* = 0x0100000E
  AN_BadFreeAddr* = 0x0100000F
  AN_BadSemaphore* = 0x01000010

const
  AN_GraphicsLib* = 0x02000000
  AN_GfxNoMem* = 0x82010000
  AN_GfxNoMemMspc* = 0x82010001
  AN_LongFrame* = 0x82010006
  AN_ShortFrame* = 0x82010007
  AN_TextTmpRas* = 0x02010009
  AN_BltBitMap* = 0x8201000A
  AN_RegionMemory* = 0x8201000B
  AN_MakeVPort* = 0x82010030
  AN_GfxNewError* = 0x0200000C
  AN_GfxFreeError* = 0x0200000D
  AN_GfxNoLCM* = 0x82011234
  AN_ObsoleteFont* = 0x02000401

const
  AN_LayersLib* = 0x03000000
  AN_LayersNoMem* = 0x83010000

const
  AN_Intuition* = 0x04000000
  AN_GadgetType* = 0x84000001
  AN_BadGadget* = 0x04000001
  AN_CreatePort* = 0x84010002
  AN_ItemAlloc* = 0x04010003
  AN_SubAlloc* = 0x04010004
  AN_PlaneAlloc* = 0x84010005
  AN_ItemBoxTop* = 0x84000006
  AN_OpenScreen* = 0x84010007
  AN_OpenScrnRast* = 0x84010008
  AN_SysScrnType* = 0x84000009
  AN_AddSWGadget* = 0x8401000A
  AN_OpenWindow* = 0x8401000B
  AN_BadState* = 0x8400000C
  AN_BadMessage* = 0x8400000D
  AN_WeirdEcho* = 0x8400000E
  AN_NoConsole* = 0x8400000F
  AN_NoISem* = 0x04000010
  AN_ISemOrder* = 0x04000011

const
  AN_MathLib* = 0x05000000

const
  AN_DOSLib* = 0x07000000
  AN_StartMem* = 0x07010001
  AN_EndTask* = 0x07000002
  AN_QPktFail* = 0x07000003
  AN_AsyncPkt* = 0x07000004
  AN_FreeVec* = 0x07000005
  AN_DiskBlkSeq* = 0x07000006
  AN_BitMap* = 0x07000007
  AN_KeyFree* = 0x07000008
  AN_BadChkSum* = 0x07000009
  AN_DiskError* = 0x0700000A
  AN_KeyRange* = 0x0700000B
  AN_BadOverlay* = 0x0700000C
  AN_BadInitFunc* = 0x0700000D
  AN_FileReclosed* = 0x0700000E

const
  AN_RAMLib* = 0x08000000
  AN_BadSegList* = 0x08000001

const
  AN_IconLib* = 0x09000000

const
  AN_ExpansionLib* = 0x0A000000
  AN_BadExpansionFree* = 0x0A000001

const
  AN_DiskfontLib* = 0x0B000000

const
  AN_AudioDev* = 0x10000000

const
  AN_ConsoleDev* = 0x11000000
  AN_NoWindow* = 0x11000001

const
  AN_GamePortDev* = 0x12000000

const
  AN_KeyboardDev* = 0x13000000

const
  AN_TrackDiskDev* = 0x14000000
  AN_TDCalibSeek* = 0x14000001
  AN_TDDelay* = 0x14000002

const
  AN_TimerDev* = 0x15000000
  AN_TMBadReq* = 0x15000001
  AN_TMBadSupply* = 0x15000002

const
  AN_CIARsrc* = 0x20000000

const
  AN_DiskRsrc* = 0x21000000
  AN_DRHasDisk* = 0x21000001
  AN_DRIntNoAct* = 0x21000002

const
  AN_MiscRsrc* = 0x22000000

const
  AN_BootStrap* = 0x30000000
  AN_BootError* = 0x30000001

const
  AN_Workbench* = 0x31000000
  AN_NoFonts* = 0xB1000001
  AN_WBBadStartupMsg1* = 0x31000001
  AN_WBBadStartupMsg2* = 0x31000002
  AN_WBBadIOMsg* = 0x31000003
  AN_WBReLayoutToolMenu* = 0xB1010009

const
  AN_DiskCopy* = 0x32000000

const
  AN_GadTools* = 0x33000000

const
  AN_UtilityLib* = 0x34000000

const
  AN_Unknown* = 0x35000000
