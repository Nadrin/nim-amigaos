#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  ADKB_SETCLR* = 15
  ADKB_PRECOMP1* = 14
  ADKB_PRECOMP0* = 13
  ADKB_MFMPREC* = 12
  ADKB_UARTBRK* = 11
  ADKB_WORDSYNC* = 10
  ADKB_MSBSYNC* = 9
  ADKB_FAST* = 8
  ADKB_USE3PN* = 7
  ADKB_USE2P3* = 6
  ADKB_USE1P2* = 5
  ADKB_USE0P1* = 4
  ADKB_USE3VN* = 3
  ADKB_USE2V3* = 2
  ADKB_USE1V2* = 1
  ADKB_USE0V1* = 0
  ADKF_SETCLR* = (1 shl 15)
  ADKF_PRECOMP1* = (1 shl 14)
  ADKF_PRECOMP0* = (1 shl 13)
  ADKF_MFMPREC* = (1 shl 12)
  ADKF_UARTBRK* = (1 shl 11)
  ADKF_WORDSYNC* = (1 shl 10)
  ADKF_MSBSYNC* = (1 shl 9)
  ADKF_FAST* = (1 shl 8)
  ADKF_USE3PN* = (1 shl 7)
  ADKF_USE2P3* = (1 shl 6)
  ADKF_USE1P2* = (1 shl 5)
  ADKF_USE0P1* = (1 shl 4)
  ADKF_USE3VN* = (1 shl 3)
  ADKF_USE2V3* = (1 shl 2)
  ADKF_USE1V2* = (1 shl 1)
  ADKF_USE0V1* = (1 shl 0)
  ADKF_PRE000NS* = 0
  ADKF_PRE140NS* = (ADKF_PRECOMP0)
  ADKF_PRE280NS* = (ADKF_PRECOMP1)
  ADKF_PRE560NS* = (ADKF_PRECOMP0 or ADKF_PRECOMP1)