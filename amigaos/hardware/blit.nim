#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  HSIZEBITS* = 6
  VSIZEBITS* = 16 - HSIZEBITS
  HSIZEMASK* = 0x0000003F
  VSIZEMASK* = 0x000003FF

when not defined(NO_BIG_BLITS):
  const
    MINBYTESPERROW* = 128
    MAXBYTESPERROW* = 4096
else:
  const
    MAXBYTESPERROW* = 128

const
  ABC* = 0x00000080
  ABNC* = 0x00000040
  ANBC* = 0x00000020
  ANBNC* = 0x00000010
  NABC* = 0x00000008
  NABNC* = 0x00000004
  NANBC* = 0x00000002
  NANBNC* = 0x00000001

const
  A_OR_B* = ABC or ANBC or NABC or ABNC or ANBNC or NABNC
  A_OR_C* = ABC or NABC or ABNC or ANBC or NANBC or ANBNC
  A_XOR_C* = NABC or ABNC or NANBC or ANBNC
  A_TO_D* = ABC or ANBC or ABNC or ANBNC
  BC0B_DEST* = 8
  BC0B_SRCC* = 9
  BC0B_SRCB* = 10
  BC0B_SRCA* = 11
  BC0F_DEST* = 0x00000100
  BC0F_SRCC* = 0x00000200
  BC0F_SRCB* = 0x00000400
  BC0F_SRCA* = 0x00000800
  BC1F_DESC* = 2
  DEST* = 0x00000100
  SRCC* = 0x00000200
  SRCB* = 0x00000400
  SRCA* = 0x00000800
  ASHIFTSHIFT* = 12
  BSHIFTSHIFT* = 12

const
  LINEMODE* = 0x00000001
  FILL_OR* = 0x00000008
  FILL_XOR* = 0x00000010
  FILL_CARRYIN* = 0x00000004
  ONEDOT* = 0x00000002
  OVFLAG* = 0x00000020
  SIGNFLAG* = 0x00000040
  BLITREVERSE* = 0x00000002
  SUD* = 0x00000010
  SUL* = 0x00000008
  AUL* = 0x00000004
  OCTANT8* = 24
  OCTANT7* = 4
  OCTANT6* = 12
  OCTANT5* = 28
  OCTANT4* = 20
  OCTANT3* = 8
  OCTANT2* = 0
  OCTANT1* = 16

type
  bltnode* {.bycopy.} = object
    n*: ptr bltnode
    function*: proc (): int
    stat*: char
    blitsize*: int16
    beamsync*: int16
    cleanup*: proc (): int

const
  CLEANUP* = 0x00000040
  CLEANME* = CLEANUP
