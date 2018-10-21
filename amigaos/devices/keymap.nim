#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  KeyMap* {.bycopy.} = object
    loKeyMapTypes*: ptr uint8
    loKeyMap*: ptr uint32
    loCapsable*: ptr uint8
    loRepeatable*: ptr uint8
    hiKeyMapTypes*: ptr uint8
    hiKeyMap*: ptr uint32
    hiCapsable*: ptr uint8
    hiRepeatable*: ptr uint8

  KeyMapNode* {.bycopy.} = object
    node*: Node
    keyMap*: KeyMap

  KeyMapResource* {.bycopy.} = object
    node*: Node
    list*: List

const
  KC_NOQUAL* = 0
  KC_VANILLA* = 7
  KCB_SHIFT* = 0
  KCF_SHIFT* = 0x00000001
  KCB_ALT* = 1
  KCF_ALT* = 0x00000002
  KCB_CONTROL* = 2
  KCF_CONTROL* = 0x00000004
  KCB_DOWNUP* = 3
  KCF_DOWNUP* = 0x00000008
  KCB_DEAD* = 5
  KCF_DEAD* = 0x00000020
  KCB_STRING* = 6
  KCF_STRING* = 0x00000040
  KCB_NOP* = 7
  KCF_NOP* = 0x00000080

const
  DPB_MOD* = 0
  DPF_MOD* = 0x00000001
  DPB_DEAD* = 3
  DPF_DEAD* = 0x00000008
  DP_2DINDEXMASK* = 0x0000000F
  DP_2DFACSHIFT* = 4
