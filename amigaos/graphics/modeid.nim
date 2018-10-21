#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  INVALID_ID* = not 0

const
  MONITOR_ID_MASK* = 0xFFFF1000
  DEFAULT_MONITOR_ID* = 0x00000000
  NTSC_MONITOR_ID* = 0x00011000
  PAL_MONITOR_ID* = 0x00021000
  VGA_MONITOR_ID* = 0x00031000
  A2024_MONITOR_ID* = 0x00041000
  PROTO_MONITOR_ID* = 0x00051000
  EURO72_MONITOR_ID* = 0x00061000
  EURO36_MONITOR_ID* = 0x00071000
  SUPER72_MONITOR_ID* = 0x00081000
  DBLNTSC_MONITOR_ID* = 0x00091000
  DBLPAL_MONITOR_ID* = 0x000A1000

const
  LORES_KEY* = 0x00000000
  HIRES_KEY* = 0x00008000
  SUPER_KEY* = 0x00008020
  HAM_KEY* = 0x00000800
  LORESLACE_KEY* = 0x00000004
  HIRESLACE_KEY* = 0x00008004
  SUPERLACE_KEY* = 0x00008024
  HAMLACE_KEY* = 0x00000804
  LORESDPF_KEY* = 0x00000400
  HIRESDPF_KEY* = 0x00008400
  SUPERDPF_KEY* = 0x00008420
  LORESLACEDPF_KEY* = 0x00000404
  HIRESLACEDPF_KEY* = 0x00008404
  SUPERLACEDPF_KEY* = 0x00008424
  LORESDPF2_KEY* = 0x00000440
  HIRESDPF2_KEY* = 0x00008440
  SUPERDPF2_KEY* = 0x00008460
  LORESLACEDPF2_KEY* = 0x00000444
  HIRESLACEDPF2_KEY* = 0x00008444
  SUPERLACEDPF2_KEY* = 0x00008464
  EXTRAHALFBRITE_KEY* = 0x00000080
  EXTRAHALFBRITELACE_KEY* = 0x00000084
  HIRESHAM_KEY* = 0x00008800
  SUPERHAM_KEY* = 0x00008820
  HIRESEHB_KEY* = 0x00008080
  SUPEREHB_KEY* = 0x000080A0
  HIRESHAMLACE_KEY* = 0x00008804
  SUPERHAMLACE_KEY* = 0x00008824
  HIRESEHBLACE_KEY* = 0x00008084
  SUPEREHBLACE_KEY* = 0x000080A4
  LORESSDBL_KEY* = 0x00000008
  LORESHAMSDBL_KEY* = 0x00000808
  LORESEHBSDBL_KEY* = 0x00000088
  HIRESHAMSDBL_KEY* = 0x00008808
  VGAEXTRALORES_KEY* = 0x00031004
  VGALORES_KEY* = 0x00039004
  VGAPRODUCT_KEY* = 0x00039024
  VGAHAM_KEY* = 0x00031804
  VGAEXTRALORESLACE_KEY* = 0x00031005
  VGALORESLACE_KEY* = 0x00039005
  VGAPRODUCTLACE_KEY* = 0x00039025
  VGAHAMLACE_KEY* = 0x00031805
  VGAEXTRALORESDPF_KEY* = 0x00031404
  VGALORESDPF_KEY* = 0x00039404
  VGAPRODUCTDPF_KEY* = 0x00039424
  VGAEXTRALORESLACEDPF_KEY* = 0x00031405
  VGALORESLACEDPF_KEY* = 0x00039405
  VGAPRODUCTLACEDPF_KEY* = 0x00039425
  VGAEXTRALORESDPF2_KEY* = 0x00031444
  VGALORESDPF2_KEY* = 0x00039444
  VGAPRODUCTDPF2_KEY* = 0x00039464
  VGAEXTRALORESLACEDPF2_KEY* = 0x00031445
  VGALORESLACEDPF2_KEY* = 0x00039445
  VGAPRODUCTLACEDPF2_KEY* = 0x00039465
  VGAEXTRAHALFBRITE_KEY* = 0x00031084
  VGAEXTRAHALFBRITELACE_KEY* = 0x00031085
  VGAPRODUCTHAM_KEY* = 0x00039824
  VGALORESHAM_KEY* = 0x00039804
  VGAEXTRALORESHAM_KEY* = VGAHAM_KEY
  VGAPRODUCTHAMLACE_KEY* = 0x00039825
  VGALORESHAMLACE_KEY* = 0x00039805
  VGAEXTRALORESHAMLACE_KEY* = VGAHAMLACE_KEY
  VGAEXTRALORESEHB_KEY* = VGAEXTRAHALFBRITE_KEY
  VGAEXTRALORESEHBLACE_KEY* = VGAEXTRAHALFBRITELACE_KEY
  VGALORESEHB_KEY* = 0x00039084
  VGALORESEHBLACE_KEY* = 0x00039085
  VGAEHB_KEY* = 0x000390A4
  VGAEHBLACE_KEY* = 0x000390A5
  VGAEXTRALORESDBL_KEY* = 0x00031000
  VGALORESDBL_KEY* = 0x00039000
  VGAPRODUCTDBL_KEY* = 0x00039020
  VGAEXTRALORESHAMDBL_KEY* = 0x00031800
  VGALORESHAMDBL_KEY* = 0x00039800
  VGAPRODUCTHAMDBL_KEY* = 0x00039820
  VGAEXTRALORESEHBDBL_KEY* = 0x00031080
  VGALORESEHBDBL_KEY* = 0x00039080
  VGAPRODUCTEHBDBL_KEY* = 0x000390A0
  A2024TENHERTZ_KEY* = 0x00041000
  A2024FIFTEENHERTZ_KEY* = 0x00049000
  EURO72EXTRALORES_KEY* = 0x00061004
  EURO72LORES_KEY* = 0x00069004
  EURO72PRODUCT_KEY* = 0x00069024
  EURO72HAM_KEY* = 0x00061804
  EURO72EXTRALORESLACE_KEY* = 0x00061005
  EURO72LORESLACE_KEY* = 0x00069005
  EURO72PRODUCTLACE_KEY* = 0x00069025
  EURO72HAMLACE_KEY* = 0x00061805
  EURO72EXTRALORESDPF_KEY* = 0x00061404
  EURO72LORESDPF_KEY* = 0x00069404
  EURO72PRODUCTDPF_KEY* = 0x00069424
  EURO72EXTRALORESLACEDPF_KEY* = 0x00061405
  EURO72LORESLACEDPF_KEY* = 0x00069405
  EURO72PRODUCTLACEDPF_KEY* = 0x00069425
  EURO72EXTRALORESDPF2_KEY* = 0x00061444
  EURO72LORESDPF2_KEY* = 0x00069444
  EURO72PRODUCTDPF2_KEY* = 0x00069464
  EURO72EXTRALORESLACEDPF2_KEY* = 0x00061445
  EURO72LORESLACEDPF2_KEY* = 0x00069445
  EURO72PRODUCTLACEDPF2_KEY* = 0x00069465
  EURO72EXTRAHALFBRITE_KEY* = 0x00061084
  EURO72EXTRAHALFBRITELACE_KEY* = 0x00061085
  EURO72PRODUCTHAM_KEY* = 0x00069824
  EURO72PRODUCTHAMLACE_KEY* = 0x00069825
  EURO72LORESHAM_KEY* = 0x00069804
  EURO72LORESHAMLACE_KEY* = 0x00069805
  EURO72EXTRALORESHAM_KEY* = EURO72HAM_KEY
  EURO72EXTRALORESHAMLACE_KEY* = EURO72HAMLACE_KEY
  EURO72EXTRALORESEHB_KEY* = EURO72EXTRAHALFBRITE_KEY
  EURO72EXTRALORESEHBLACE_KEY* = EURO72EXTRAHALFBRITELACE_KEY
  EURO72LORESEHB_KEY* = 0x00069084
  EURO72LORESEHBLACE_KEY* = 0x00069085
  EURO72EHB_KEY* = 0x000690A4
  EURO72EHBLACE_KEY* = 0x000690A5
  EURO72EXTRALORESDBL_KEY* = 0x00061000
  EURO72LORESDBL_KEY* = 0x00069000
  EURO72PRODUCTDBL_KEY* = 0x00069020
  EURO72EXTRALORESHAMDBL_KEY* = 0x00061800
  EURO72LORESHAMDBL_KEY* = 0x00069800
  EURO72PRODUCTHAMDBL_KEY* = 0x00069820
  EURO72EXTRALORESEHBDBL_KEY* = 0x00061080
  EURO72LORESEHBDBL_KEY* = 0x00069080
  EURO72PRODUCTEHBDBL_KEY* = 0x000690A0
  SUPER72LORESDBL_KEY* = 0x00081008
  SUPER72HIRESDBL_KEY* = 0x00089008
  SUPER72SUPERDBL_KEY* = 0x00089028
  SUPER72LORESHAMDBL_KEY* = 0x00081808
  SUPER72HIRESHAMDBL_KEY* = 0x00089808
  SUPER72SUPERHAMDBL_KEY* = 0x00089828
  SUPER72LORESEHBDBL_KEY* = 0x00081088
  SUPER72HIRESEHBDBL_KEY* = 0x00089088
  SUPER72SUPEREHBDBL_KEY* = 0x000890A8
  DBLNTSCLORES_KEY* = 0x00091000
  DBLNTSCLORESFF_KEY* = 0x00091004
  DBLNTSCLORESHAM_KEY* = 0x00091800
  DBLNTSCLORESHAMFF_KEY* = 0x00091804
  DBLNTSCLORESEHB_KEY* = 0x00091080
  DBLNTSCLORESEHBFF_KEY* = 0x00091084
  DBLNTSCLORESLACE_KEY* = 0x00091005
  DBLNTSCLORESHAMLACE_KEY* = 0x00091805
  DBLNTSCLORESEHBLACE_KEY* = 0x00091085
  DBLNTSCLORESDPF_KEY* = 0x00091400
  DBLNTSCLORESDPFFF_KEY* = 0x00091404
  DBLNTSCLORESDPFLACE_KEY* = 0x00091405
  DBLNTSCLORESDPF2_KEY* = 0x00091440
  DBLNTSCLORESDPF2FF_KEY* = 0x00091444
  DBLNTSCLORESDPF2LACE_KEY* = 0x00091445
  DBLNTSCHIRES_KEY* = 0x00099000
  DBLNTSCHIRESFF_KEY* = 0x00099004
  DBLNTSCHIRESHAM_KEY* = 0x00099800
  DBLNTSCHIRESHAMFF_KEY* = 0x00099804
  DBLNTSCHIRESLACE_KEY* = 0x00099005
  DBLNTSCHIRESHAMLACE_KEY* = 0x00099805
  DBLNTSCHIRESEHB_KEY* = 0x00099080
  DBLNTSCHIRESEHBFF_KEY* = 0x00099084
  DBLNTSCHIRESEHBLACE_KEY* = 0x00099085
  DBLNTSCHIRESDPF_KEY* = 0x00099400
  DBLNTSCHIRESDPFFF_KEY* = 0x00099404
  DBLNTSCHIRESDPFLACE_KEY* = 0x00099405
  DBLNTSCHIRESDPF2_KEY* = 0x00099440
  DBLNTSCHIRESDPF2FF_KEY* = 0x00099444
  DBLNTSCHIRESDPF2LACE_KEY* = 0x00099445
  DBLNTSCEXTRALORES_KEY* = 0x00091200
  DBLNTSCEXTRALORESHAM_KEY* = 0x00091A00
  DBLNTSCEXTRALORESEHB_KEY* = 0x00091280
  DBLNTSCEXTRALORESDPF_KEY* = 0x00091600
  DBLNTSCEXTRALORESDPF2_KEY* = 0x00091640
  DBLNTSCEXTRALORESFF_KEY* = 0x00091204
  DBLNTSCEXTRALORESHAMFF_KEY* = 0x00091A04
  DBLNTSCEXTRALORESEHBFF_KEY* = 0x00091284
  DBLNTSCEXTRALORESDPFFF_KEY* = 0x00091604
  DBLNTSCEXTRALORESDPF2FF_KEY* = 0x00091644
  DBLNTSCEXTRALORESLACE_KEY* = 0x00091205
  DBLNTSCEXTRALORESHAMLACE_KEY* = 0x00091A05
  DBLNTSCEXTRALORESEHBLACE_KEY* = 0x00091285
  DBLNTSCEXTRALORESDPFLACE_KEY* = 0x00091605
  DBLNTSCEXTRALORESDPF2LACE_KEY* = 0x00091645
  DBLPALLORES_KEY* = 0x000A1000
  DBLPALLORESFF_KEY* = 0x000A1004
  DBLPALLORESHAM_KEY* = 0x000A1800
  DBLPALLORESHAMFF_KEY* = 0x000A1804
  DBLPALLORESEHB_KEY* = 0x000A1080
  DBLPALLORESEHBFF_KEY* = 0x000A1084
  DBLPALLORESLACE_KEY* = 0x000A1005
  DBLPALLORESHAMLACE_KEY* = 0x000A1805
  DBLPALLORESEHBLACE_KEY* = 0x000A1085
  DBLPALLORESDPF_KEY* = 0x000A1400
  DBLPALLORESDPFFF_KEY* = 0x000A1404
  DBLPALLORESDPFLACE_KEY* = 0x000A1405
  DBLPALLORESDPF2_KEY* = 0x000A1440
  DBLPALLORESDPF2FF_KEY* = 0x000A1444
  DBLPALLORESDPF2LACE_KEY* = 0x000A1445
  DBLPALHIRES_KEY* = 0x000A9000
  DBLPALHIRESFF_KEY* = 0x000A9004
  DBLPALHIRESHAM_KEY* = 0x000A9800
  DBLPALHIRESHAMFF_KEY* = 0x000A9804
  DBLPALHIRESLACE_KEY* = 0x000A9005
  DBLPALHIRESHAMLACE_KEY* = 0x000A9805
  DBLPALHIRESEHB_KEY* = 0x000A9080
  DBLPALHIRESEHBFF_KEY* = 0x000A9084
  DBLPALHIRESEHBLACE_KEY* = 0x000A9085
  DBLPALHIRESDPF_KEY* = 0x000A9400
  DBLPALHIRESDPFFF_KEY* = 0x000A9404
  DBLPALHIRESDPFLACE_KEY* = 0x000A9405
  DBLPALHIRESDPF2_KEY* = 0x000A9440
  DBLPALHIRESDPF2FF_KEY* = 0x000A9444
  DBLPALHIRESDPF2LACE_KEY* = 0x000A9445
  DBLPALEXTRALORES_KEY* = 0x000A1200
  DBLPALEXTRALORESHAM_KEY* = 0x000A1A00
  DBLPALEXTRALORESEHB_KEY* = 0x000A1280
  DBLPALEXTRALORESDPF_KEY* = 0x000A1600
  DBLPALEXTRALORESDPF2_KEY* = 0x000A1640
  DBLPALEXTRALORESFF_KEY* = 0x000A1204
  DBLPALEXTRALORESHAMFF_KEY* = 0x000A1A04
  DBLPALEXTRALORESEHBFF_KEY* = 0x000A1284
  DBLPALEXTRALORESDPFFF_KEY* = 0x000A1604
  DBLPALEXTRALORESDPF2FF_KEY* = 0x000A1644
  DBLPALEXTRALORESLACE_KEY* = 0x000A1205
  DBLPALEXTRALORESHAMLACE_KEY* = 0x000A1A05
  DBLPALEXTRALORESEHBLACE_KEY* = 0x000A1285
  DBLPALEXTRALORESDPFLACE_KEY* = 0x000A1605
  DBLPALEXTRALORESDPF2LACE_KEY* = 0x000A1645

const
  SPECIAL_FLAGS* = DIPF_IS_DUALPF or DIPF_IS_PF2PRI or DIPF_IS_HAM or DIPF_IS_EXTRAHALFBRITE

const
  BIDTAG_DIPFMustHave* = 0x80000001
  BIDTAG_DIPFMustNotHave* = 0x80000002
  BIDTAG_ViewPort* = 0x80000003
  BIDTAG_NominalWidth* = 0x80000004
  BIDTAG_NominalHeight* = 0x80000005
  BIDTAG_DesiredWidth* = 0x80000006
  BIDTAG_DesiredHeight* = 0x80000007
  BIDTAG_Depth* = 0x80000008
  BIDTAG_MonitorID* = 0x80000009
  BIDTAG_SourceID* = 0x8000000A
  BIDTAG_RedBits* = 0x8000000B
  BIDTAG_BlueBits* = 0x8000000C
  BIDTAG_GreenBits* = 0x8000000D
  BIDTAG_GfxPrivate* = 0x8000000E
