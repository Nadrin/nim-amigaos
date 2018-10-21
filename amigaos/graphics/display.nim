#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  MODE_640* = 0x00008000
  PLNCNTMSK* = 0x00000007

const
  PLNCNTSHFT* = 12
  PF2PRI* = 0x00000040
  COLORON* = 0x00000200
  DBLPF* = 0x00000400
  HOLDNMODIFY* = 0x00000800
  INTERLACE* = 4

const
  PFA_FINE_SCROLL* = 0x0000000F
  PFB_FINE_SCROLL_SHIFT* = 4
  PF_FINE_SCROLL_MASK* = 0x0000000F

const
  DIW_HORIZ_POS* = 0x0000007F
  DIW_VRTCL_POS* = 0x000001FF
  DIW_VRTCL_POS_SHIFT* = 7

const
  DFTCH_MASK* = 0x000000FF

const
  VPOSRLOF* = 0x00008000
