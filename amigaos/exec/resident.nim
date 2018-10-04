#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  Resident* {.bycopy.} = object
    matchWord*: uint16
    matchTag*: ptr Resident
    endSkip*: pointer
    flags*: uint8
    version*: uint8
    `type`*: uint8
    pri*: int8
    name*: cstring
    idString*: cstring
    init*: pointer

const
  RTC_MATCHWORD* = 0x4AFC

const
  RTF_AUTOINIT* = (1 shl 7)
  RTF_AFTERDOS* = (1 shl 2)
  RTF_SINGLETASK* = (1 shl 1)
  RTF_COLDSTART* = (1 shl 0)

const
  RTW_NEVER* = 0
  RTW_COLDSTART* = 1
