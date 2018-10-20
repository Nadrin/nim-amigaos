#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  INTB_SETCLR* = (15)
  INTB_INTEN* = (14)
  INTB_EXTER* = (13)
  INTB_DSKSYNC* = (12)
  INTB_RBF* = (11)
  INTB_AUD3* = (10)
  INTB_AUD2* = (9)
  INTB_AUD1* = (8)
  INTB_AUD0* = (7)
  INTB_BLIT* = (6)
  INTB_VERTB* = (5)
  INTB_COPER* = (4)
  INTB_PORTS* = (3)
  INTB_SOFTINT* = (2)
  INTB_DSKBLK* = (1)
  INTB_TBE* = (0)

const
  INTF_SETCLR* = (1 shl 15)
  INTF_INTEN* = (1 shl 14)
  INTF_EXTER* = (1 shl 13)
  INTF_DSKSYNC* = (1 shl 12)
  INTF_RBF* = (1 shl 11)
  INTF_AUD3* = (1 shl 10)
  INTF_AUD2* = (1 shl 9)
  INTF_AUD1* = (1 shl 8)
  INTF_AUD0* = (1 shl 7)
  INTF_BLIT* = (1 shl 6)
  INTF_VERTB* = (1 shl 5)
  INTF_COPER* = (1 shl 4)
  INTF_PORTS* = (1 shl 3)
  INTF_SOFTINT* = (1 shl 2)
  INTF_DSKBLK* = (1 shl 1)
  INTF_TBE* = (1 shl 0)
