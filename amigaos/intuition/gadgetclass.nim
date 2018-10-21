#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  GA_Dummy* = (TAG_USER + 0x00030000)
  GA_Left* = (GA_Dummy + 1)
  GA_RelRight* = (GA_Dummy + 2)
  GA_Top* = (GA_Dummy + 3)
  GA_RelBottom* = (GA_Dummy + 4)
  GA_Width* = (GA_Dummy + 5)
  GA_RelWidth* = (GA_Dummy + 6)
  GA_Height* = (GA_Dummy + 7)
  GA_RelHeight* = (GA_Dummy + 8)
  GA_Text* = (GA_Dummy + 9)
  GA_Image* = (GA_Dummy + 10)
  GA_Border* = (GA_Dummy + 11)
  GA_SelectRender* = (GA_Dummy + 12)
  GA_Highlight* = (GA_Dummy + 13)
  GA_Disabled* = (GA_Dummy + 14)
  GA_GZZGadget* = (GA_Dummy + 15)
  GA_ID* = (GA_Dummy + 16)
  GA_UserData* = (GA_Dummy + 17)
  GA_SpecialInfo* = (GA_Dummy + 18)
  GA_Selected* = (GA_Dummy + 19)
  GA_EndGadget* = (GA_Dummy + 20)
  GA_Immediate* = (GA_Dummy + 21)
  GA_RelVerify* = (GA_Dummy + 22)
  GA_FollowMouse* = (GA_Dummy + 23)
  GA_RightBorder* = (GA_Dummy + 24)
  GA_LeftBorder* = (GA_Dummy + 25)
  GA_TopBorder* = (GA_Dummy + 26)
  GA_BottomBorder* = (GA_Dummy + 27)
  GA_ToggleSelect* = (GA_Dummy + 28)
  GA_SysGadget* = (GA_Dummy + 29)
  GA_SysGType* = (GA_Dummy + 30)
  GA_Previous* = (GA_Dummy + 31)
  GA_Next* = (GA_Dummy + 32)
  GA_DrawInfo* = (GA_Dummy + 33)
  GA_IntuiText* = (GA_Dummy + 34)
  GA_LabelImage* = (GA_Dummy + 35)
  GA_TabCycle* = (GA_Dummy + 36)
  GA_GadgetHelp* = (GA_Dummy + 37)
  GA_Bounds* = (GA_Dummy + 38)
  GA_RelSpecial* = (GA_Dummy + 39)
  GA_TextAttr* = (GA_Dummy + 40)
  GA_ReadOnly* = (GA_Dummy + 41)
  GA_Underscore* = (GA_Dummy + 42)
  GA_ActivateKey* = (GA_Dummy + 43)
  GA_BackFill* = (GA_Dummy + 44)
  GA_GadgetHelpText* = (GA_Dummy + 45)
  GA_UserInput* = (GA_Dummy + 46)

const
  PGA_Dummy* = (TAG_USER + 0x00031000)
  PGA_Freedom* = (PGA_Dummy + 0x00000001)
  PGA_Borderless* = (PGA_Dummy + 0x00000002)
  PGA_HorizPot* = (PGA_Dummy + 0x00000003)
  PGA_HorizBody* = (PGA_Dummy + 0x00000004)
  PGA_VertPot* = (PGA_Dummy + 0x00000005)
  PGA_VertBody* = (PGA_Dummy + 0x00000006)
  PGA_Total* = (PGA_Dummy + 0x00000007)
  PGA_Visible* = (PGA_Dummy + 0x00000008)
  PGA_Top* = (PGA_Dummy + 0x00000009)
  PGA_NewLook* = (PGA_Dummy + 0x0000000A)

const
  STRINGA_Dummy* = (TAG_USER + 0x00032000)
  STRINGA_MaxChars* = (STRINGA_Dummy + 0x00000001)
  STRINGA_Buffer* = (STRINGA_Dummy + 0x00000002)
  STRINGA_UndoBuffer* = (STRINGA_Dummy + 0x00000003)
  STRINGA_WorkBuffer* = (STRINGA_Dummy + 0x00000004)
  STRINGA_BufferPos* = (STRINGA_Dummy + 0x00000005)
  STRINGA_DispPos* = (STRINGA_Dummy + 0x00000006)
  STRINGA_AltKeyMap* = (STRINGA_Dummy + 0x00000007)
  STRINGA_Font* = (STRINGA_Dummy + 0x00000008)
  STRINGA_Pens* = (STRINGA_Dummy + 0x00000009)
  STRINGA_ActivePens* = (STRINGA_Dummy + 0x0000000A)
  STRINGA_EditHook* = (STRINGA_Dummy + 0x0000000B)
  STRINGA_EditModes* = (STRINGA_Dummy + 0x0000000C)
  STRINGA_ReplaceMode* = (STRINGA_Dummy + 0x0000000D)
  STRINGA_FixedFieldMode* = (STRINGA_Dummy + 0x0000000E)
  STRINGA_NoFilterMode* = (STRINGA_Dummy + 0x0000000F)
  STRINGA_Justification* = (STRINGA_Dummy + 0x00000010)
  STRINGA_LongVal* = (STRINGA_Dummy + 0x00000011)
  STRINGA_TextVal* = (STRINGA_Dummy + 0x00000012)
  STRINGA_ExitHelp* = (STRINGA_Dummy + 0x00000013)

const
  SG_DEFAULTMAXCHARS* = (128)

const
  LAYOUTA_Dummy* = (TAG_USER + 0x00038000)
  LAYOUTA_LayoutObj* = (LAYOUTA_Dummy + 0x00000001)
  LAYOUTA_Spacing* = (LAYOUTA_Dummy + 0x00000002)
  LAYOUTA_Orientation* = (LAYOUTA_Dummy + 0x00000003)
  LAYOUTA_ChildMaxWidth* = (LAYOUTA_Dummy + 0x00000004)
  LAYOUTA_ChildMaxHeight* = (LAYOUTA_Dummy + 0x00000005)

const
  LORIENT_NONE* = 0
  LORIENT_HORIZ* = 1
  LORIENT_VERT* = 2

const
  GM_Dummy* = (-1)
  GM_HITTEST* = (0)
  GM_RENDER* = (1)
  GM_GOACTIVE* = (2)
  GM_HANDLEINPUT* = (3)
  GM_GOINACTIVE* = (4)
  GM_HELPTEST* = (5)
  GM_LAYOUT* = (6)
  GM_DOMAIN* = (7)
  GM_KEYTEST* = (8)
  GM_KEYGOACTIVE* = (9)
  GM_KEYGOINACTIVE* = (10)

type
  gpHitTestMouse* {.bycopy.} = object
    x*: int16
    y*: int16
  gpHitTest* {.bycopy.} = object
    methodID*: uint32
    ginfo*: ptr GadgetInfo
    mouse*: gpHitTestMouse

const
  GMR_GADGETHIT* = (0x00000004)
  GMR_NOHELPHIT* = (0x00000000)
  GMR_HELPHIT* = (0xFFFFFFFF)
  GMR_HELPCODE* = (0x00010000)

type
  gpRender* {.bycopy.} = object
    methodID*: uint32
    ginfo*: ptr GadgetInfo
    rport*: ptr RastPort
    redraw*: int32

const
  GREDRAW_UPDATE* = (2)
  GREDRAW_REDRAW* = (1)
  GREDRAW_TOGGLE* = (0)

type
  gpInputMouse* {.bycopy.} = object
    x*: int16
    y*: int16
  gpInput* {.bycopy.} = object
    methodID*: uint32
    ginfo*: ptr GadgetInfo
    ievent*: ptr InputEvent
    termination*: ptr int32
    mouse*: gpInputMouse
    tabletData*: ptr TabletData

const
  GMR_MEACTIVE* = (0)
  GMR_NOREUSE* = (1 shl 1)
  GMR_REUSE* = (1 shl 2)
  GMR_VERIFY* = (1 shl 3)
  GMR_NEXTACTIVE* = (1 shl 4)
  GMR_PREVACTIVE* = (1 shl 5)

type
  gpGoInactive* {.bycopy.} = object
    methodID*: uint32
    ginfo*: ptr GadgetInfo
    abort*: uint32

type
  gpLayout* {.bycopy.} = object
    methodID*: uint32
    ginfo*: ptr GadgetInfo
    initial*: uint32

type
  gpDomain* {.bycopy.} = object
    methodID*: uint32
    ginfo*: ptr GadgetInfo
    rport*: ptr RastPort
    which*: int32
    domain*: IBox
    attrs*: ptr TagItem

const
  GDOMAIN_MINIMUM* = (0)
  GDOMAIN_NOMINAL* = (1)
  GDOMAIN_MAXIMUM* = (2)

type
  gpKeyTest* {.bycopy.} = object
    methodID*: uint32
    ginfo*: ptr GadgetInfo
    imsg*: ptr IntuiMessage
    vanillaKey*: uint32

type
  gpKeyInput* {.bycopy.} = object
    methodID*: uint32
    ginfo*: ptr GadgetInfo
    ievent*: ptr InputEvent
    termination*: ptr int32

const
  GMR_KEYACTIVE* = (1 shl 4)
  GMR_KEYVERIFY* = (1 shl 5)

type
  gpKeyGoInactive* {.bycopy.} = object
    methodID*: uint32
    ginfo*: ptr GadgetInfo
    abort*: uint32
