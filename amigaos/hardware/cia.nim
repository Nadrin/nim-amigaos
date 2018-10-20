#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  CIA* {.bycopy.} = object
    ciapra*: uint8
    pad0: array[0x000000FF, uint8]
    ciaprb*: uint8
    pad1: array[0x000000FF, uint8]
    ciaddra*: uint8
    pad2: array[0x000000FF, uint8]
    ciaddrb*: uint8
    pad3: array[0x000000FF, uint8]
    ciatalo*: uint8
    pad4: array[0x000000FF, uint8]
    ciatahi*: uint8
    pad5: array[0x000000FF, uint8]
    ciatblo*: uint8
    pad6: array[0x000000FF, uint8]
    ciatbhi*: uint8
    pad7: array[0x000000FF, uint8]
    ciatodlow*: uint8
    pad8: array[0x000000FF, uint8]
    ciatodmid*: uint8
    pad9: array[0x000000FF, uint8]
    ciatodhi*: uint8
    pad10: array[0x000000FF, uint8]
    unusedreg*: uint8
    pad11: array[0x000000FF, uint8]
    ciasdr*: uint8
    pad12: array[0x000000FF, uint8]
    ciaicr*: uint8
    pad13: array[0x000000FF, uint8]
    ciacra*: uint8
    pad14: array[0x000000FF, uint8]
    ciacrb*: uint8

const
  CIAICRB_TA* = 0
  CIAICRB_TB* = 1
  CIAICRB_ALRM* = 2
  CIAICRB_SP* = 3
  CIAICRB_FLG* = 4
  CIAICRB_IR* = 7
  CIAICRB_SETCLR* = 7

const
  CIACRAB_START* = 0
  CIACRAB_PBON* = 1
  CIACRAB_OUTMODE* = 2
  CIACRAB_RUNMODE* = 3
  CIACRAB_LOAD* = 4
  CIACRAB_INMODE* = 5
  CIACRAB_SPMODE* = 6
  CIACRAB_TODIN* = 7

const
  CIACRBB_START* = 0
  CIACRBB_PBON* = 1
  CIACRBB_OUTMODE* = 2
  CIACRBB_RUNMODE* = 3
  CIACRBB_LOAD* = 4
  CIACRBB_INMODE0* = 5
  CIACRBB_INMODE1* = 6
  CIACRBB_ALARM* = 7

const
  CIAICRF_TA* = (1 shl CIAICRB_TA)
  CIAICRF_TB* = (1 shl CIAICRB_TB)
  CIAICRF_ALRM* = (1 shl CIAICRB_ALRM)
  CIAICRF_SP* = (1 shl CIAICRB_SP)
  CIAICRF_FLG* = (1 shl CIAICRB_FLG)
  CIAICRF_IR* = (1 shl CIAICRB_IR)
  CIAICRF_SETCLR* = (1 shl CIAICRB_SETCLR)

const
  CIACRAF_START* = (1 shl CIACRAB_START)
  CIACRAF_PBON* = (1 shl CIACRAB_PBON)
  CIACRAF_OUTMODE* = (1 shl CIACRAB_OUTMODE)
  CIACRAF_RUNMODE* = (1 shl CIACRAB_RUNMODE)
  CIACRAF_LOAD* = (1 shl CIACRAB_LOAD)
  CIACRAF_INMODE* = (1 shl CIACRAB_INMODE)
  CIACRAF_SPMODE* = (1 shl CIACRAB_SPMODE)
  CIACRAF_TODIN* = (1 shl CIACRAB_TODIN)

const
  CIACRBF_START* = (1 shl CIACRBB_START)
  CIACRBF_PBON* = (1 shl CIACRBB_PBON)
  CIACRBF_OUTMODE* = (1 shl CIACRBB_OUTMODE)
  CIACRBF_RUNMODE* = (1 shl CIACRBB_RUNMODE)
  CIACRBF_LOAD* = (1 shl CIACRBB_LOAD)
  CIACRBF_INMODE0* = (1 shl CIACRBB_INMODE0)
  CIACRBF_INMODE1* = (1 shl CIACRBB_INMODE1)
  CIACRBF_ALARM* = (1 shl CIACRBB_ALARM)

const
  CIACRBF_IN_PHI2* = 0
  CIACRBF_IN_CNT* = (CIACRBF_INMODE0)
  CIACRBF_IN_TA* = (CIACRBF_INMODE1)
  CIACRBF_IN_CNT_TA* = (CIACRBF_INMODE0 or CIACRBF_INMODE1)

const
  CIAB_GAMEPORT1* = (7)
  CIAB_GAMEPORT0* = (6)
  CIAB_DSKRDY* = (5)
  CIAB_DSKTRACK0* = (4)
  CIAB_DSKPROT* = (3)
  CIAB_DSKCHANGE* = (2)
  CIAB_LED* = (1)
  CIAB_OVERLAY* = (0)

const
  CIAB_COMDTR* = (7)
  CIAB_COMRTS* = (6)
  CIAB_COMCD* = (5)
  CIAB_COMCTS* = (4)
  CIAB_COMDSR* = (3)
  CIAB_PRTRSEL* = (2)
  CIAB_PRTRPOUT* = (1)
  CIAB_PRTRBUSY* = (0)

const
  CIAB_DSKMOTOR* = (7)
  CIAB_DSKSEL3* = (6)
  CIAB_DSKSEL2* = (5)
  CIAB_DSKSEL1* = (4)
  CIAB_DSKSEL0* = (3)
  CIAB_DSKSIDE* = (2)
  CIAB_DSKDIREC* = (1)
  CIAB_DSKSTEP* = (0)

const
  CIAF_GAMEPORT1* = (1 shl 7)
  CIAF_GAMEPORT0* = (1 shl 6)
  CIAF_DSKRDY* = (1 shl 5)
  CIAF_DSKTRACK0* = (1 shl 4)
  CIAF_DSKPROT* = (1 shl 3)
  CIAF_DSKCHANGE* = (1 shl 2)
  CIAF_LED* = (1 shl 1)
  CIAF_OVERLAY* = (1 shl 0)

const
  CIAF_COMDTR* = (1 shl 7)
  CIAF_COMRTS* = (1 shl 6)
  CIAF_COMCD* = (1 shl 5)
  CIAF_COMCTS* = (1 shl 4)
  CIAF_COMDSR* = (1 shl 3)
  CIAF_PRTRSEL* = (1 shl 2)
  CIAF_PRTRPOUT* = (1 shl 1)
  CIAF_PRTRBUSY* = (1 shl 0)

const
  CIAF_DSKMOTOR* = (1 shl 7)
  CIAF_DSKSEL3* = (1 shl 6)
  CIAF_DSKSEL2* = (1 shl 5)
  CIAF_DSKSEL1* = (1 shl 4)
  CIAF_DSKSEL0* = (1 shl 3)
  CIAF_DSKSIDE* = (1 shl 2)
  CIAF_DSKDIREC* = (1 shl 1)
  CIAF_DSKSTEP* = (1 shl 0)
