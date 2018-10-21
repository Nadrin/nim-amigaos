#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  Object* = uint32
  ClassID* = ptr uint8

type
  Msg* {.bycopy.} = object
    methodID*: uint32

const
  ROOTCLASS* = "rootclass"
  IMAGECLASS* = "imageclass"
  FRAMEICLASS* = "frameiclass"
  SYSICLASS* = "sysiclass"
  FILLRECTCLASS* = "fillrectclass"
  GADGETCLASS* = "gadgetclass"
  PROPGCLASS* = "propgclass"
  STRGCLASS* = "strgclass"
  BUTTONGCLASS* = "buttongclass"
  FRBUTTONCLASS* = "frbuttonclass"
  GROUPGCLASS* = "groupgclass"
  ICCLASS* = "icclass"
  MODELCLASS* = "modelclass"
  ITEXTICLASS* = "itexticlass"
  POINTERCLASS* = "pointerclass"

const
  OM_Dummy* = (0x00000100)
  OM_NEW* = (0x00000101)
  OM_DISPOSE* = (0x00000102)
  OM_SET* = (0x00000103)
  OM_GET* = (0x00000104)
  OM_ADDTAIL* = (0x00000105)
  OM_REMOVE* = (0x00000106)
  OM_NOTIFY* = (0x00000107)
  OM_UPDATE* = (0x00000108)
  OM_ADDMEMBER* = (0x00000109)
  OM_REMMEMBER* = (0x0000010A)

type
  opSet* {.bycopy.} = object
    methodID*: uint32
    attrList*: ptr TagItem
    ginfo*: ptr GadgetInfo

  opUpdate* {.bycopy.} = object
    methodID*: uint32
    attrList*: ptr TagItem
    ginfo*: ptr GadgetInfo
    flags*: uint32

  opGet* {.bycopy.} = object
    methodID*: uint32
    attrID*: uint32
    storage*: pointer

  opAddTail* {.bycopy.} = object
    methodID*: uint32
    list*: ptr List
  
  opMember* {.bycopy.} = object
    methodID*: uint32
    `object`*: ptr Object

type
  opAddMember* = opMember

const
  OPUF_INTERIM* = (1 shl 0)
