#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  AudChannel* {.bycopy.} = object
    ac_ptr*: ptr uint16
    ac_len*: uint16
    ac_per*: uint16
    ac_vol*: uint16
    ac_dat*: uint16
    ac_pad*: array[2, uint16]

  SpriteDef* {.bycopy.} = object
    pos*: uint16
    ctl*: uint16
    dataa*: uint16
    datab*: uint16

  Custom* {.bycopy.} = object
    bltddat*: uint16
    dmaconr*: uint16
    vposr*: uint16
    vhposr*: uint16
    dskdatr*: uint16
    joy0dat*: uint16
    joy1dat*: uint16
    clxdat*: uint16
    adkconr*: uint16
    pot0dat*: uint16
    pot1dat*: uint16
    potinp*: uint16
    serdatr*: uint16
    dskbytr*: uint16
    intenar*: uint16
    intreqr*: uint16
    dskpt*: pointer
    dsklen*: uint16
    dskdat*: uint16
    refptr*: uint16
    vposw*: uint16
    vhposw*: uint16
    copcon*: uint16
    serdat*: uint16
    serper*: uint16
    potgo*: uint16
    joytest*: uint16
    strequ*: uint16
    strvbl*: uint16
    strhor*: uint16
    strlong*: uint16
    bltcon0*: uint16
    bltcon1*: uint16
    bltafwm*: uint16
    bltalwm*: uint16
    bltcpt*: pointer
    bltbpt*: pointer
    bltapt*: pointer
    bltdpt*: pointer
    bltsize*: uint16
    pad2d*: uint8
    bltcon0l*: uint8
    bltsizv*: uint16
    bltsizh*: uint16
    bltcmod*: uint16
    bltbmod*: uint16
    bltamod*: uint16
    bltdmod*: uint16
    pad34*: array[4, uint16]
    bltcdat*: uint16
    bltbdat*: uint16
    bltadat*: uint16
    pad3b*: array[3, uint16]
    deniseid*: uint16
    dsksync*: uint16
    cop1lc*: uint32
    cop2lc*: uint32
    copjmp1*: uint16
    copjmp2*: uint16
    copins*: uint16
    diwstrt*: uint16
    diwstop*: uint16
    ddfstrt*: uint16
    ddfstop*: uint16
    dmacon*: uint16
    clxcon*: uint16
    intena*: uint16
    intreq*: uint16
    adkcon*: uint16
    aud*: array[4, AudChannel]
    bplpt*: array[8, pointer]
    bplcon0*: uint16
    bplcon1*: uint16
    bplcon2*: uint16
    bplcon3*: uint16
    bpl1mod*: uint16
    bpl2mod*: uint16
    bplcon4*: uint16
    clxcon2*: uint16
    bpldat*: array[8, uint16]
    sprpt*: array[8, pointer]
    spr*: array[8, SpriteDef]
    color*: array[32, uint16]
    htotal*: uint16
    hsstop*: uint16
    hbstrt*: uint16
    hbstop*: uint16
    vtotal*: uint16
    vsstop*: uint16
    vbstrt*: uint16
    vbstop*: uint16
    sprhstrt*: uint16
    sprhstop*: uint16
    bplhstrt*: uint16
    bplhstop*: uint16
    hhposw*: uint16
    hhposr*: uint16
    beamcon0*: uint16
    hsstrt*: uint16
    vsstrt*: uint16
    hcenter*: uint16
    diwhigh*: uint16
    padf3*: array[11, uint16]
    fmode*: uint16

const
  VARVBLANK* = 0x00001000
  LOLDIS* = 0x00000800
  CSCBLANKEN* = 0x00000400
  VARVSYNC* = 0x00000200
  VARHSYNC* = 0x00000100
  VARBEAM* = 0x00000080
  DISPLAYDUAL* = 0x00000040
  DISPLAYPAL* = 0x00000020
  VARCSYNC* = 0x00000010
  CSBLANK* = 0x00000008
  CSYNCTRUE* = 0x00000004
  VSYNCTRUE* = 0x00000002
  HSYNCTRUE* = 0x00000001

const
  USE_BPLCON3* = 1

const
  BPLCON2_ZDCTEN* = (1 shl 10)
  BPLCON2_ZDBPEN* = (1 shl 11)
  BPLCON2_ZDBPSEL0* = (1 shl 12)
  BPLCON2_ZDBPSEL1* = (1 shl 13)
  BPLCON2_ZDBPSEL2* = (1 shl 14)

const
  BPLCON3_EXTBLNKEN* = (1 shl 0)
  BPLCON3_EXTBLKZD* = (1 shl 1)
  BPLCON3_ZDCLKEN* = (1 shl 2)
  BPLCON3_BRDNTRAN* = (1 shl 4)
  BPLCON3_BRDNBLNK* = (1 shl 5)
