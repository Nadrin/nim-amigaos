#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  FILENAME_SIZE* = 30
  DEVNAME_SIZE* = 16
  POINTERSIZE* = (1 + 16 + 1) * 2

const
  TOPAZ_EIGHTY* = 8
  TOPAZ_SIXTY* = 9

type
  Preferences* {.bycopy.} = object
    fontHeight*: int8
    printerPort*: uint8
    baudRate*: uint16
    keyRptSpeed*: TimeVal
    keyRptDelay*: TimeVal
    doubleClick*: TimeVal
    pointerMatrix*: array[POINTERSIZE, uint16]
    xOffset*: int8
    yOffset*: int8
    color17*: uint16
    color18*: uint16
    color19*: uint16
    pointerTicks*: uint16
    color0*: uint16
    color1*: uint16
    color2*: uint16
    color3*: uint16
    viewXOffset*: int8
    viewYOffset*: int
    viewInitX*: int16
    viewInitY*: int16
    enableCLI*: int16
    printerType*: uint16
    printerFilename*: array[FILENAME_SIZE, char]
    printPitch*: uint16
    printQuality*: uint16
    printSpacing*: uint16
    printLeftMargin*: uint16
    printRightMargin*: uint16
    printImage*: uint16
    printAspect*: uint16
    printShade*: uint16
    printThreshold*: int16
    paperSize*: uint16
    paperLength*: uint16
    paperType*: uint16
    serRWBits*: uint8
    serStopBuf*: uint8
    serParShk*: uint8
    laceWB*: uint8
    pad: array[12, uint8]
    prtDevName*: array[DEVNAME_SIZE, char]
    defaultPrtUnit*: uint8
    defaultSerUnit*: uint8
    rowSizeChange*: int8
    columnSizeChange*: int8
    printFlags*: uint16
    printMaxWidth*: uint16
    printMaxHeight*: uint16
    printDensity*: uint8
    printXOffset*: uint8
    wbWidth*: uint16
    wbHeight*: uint16
    wbDepth*: uint8
    ext_size: uint8

const
  LACEWB* = (1 shl 0)
  LW_RESERVED* = 1

const
  SCREEN_DRAG* = (1 shl 14)
  MOUSE_ACCEL* = (1 shl 15)

const
  PARALLEL_PRINTER* = 0x00000000
  SERIAL_PRINTER* = 0x00000001

const
  BAUD_110* = 0x00000000
  BAUD_300* = 0x00000001
  BAUD_1200* = 0x00000002
  BAUD_2400* = 0x00000003
  BAUD_4800* = 0x00000004
  BAUD_9600* = 0x00000005
  BAUD_19200* = 0x00000006
  BAUD_MIDI* = 0x00000007

const
  FANFOLD* = 0x00000000
  SINGLE* = 0x00000080

const
  PICA* = 0x00000000
  ELITE* = 0x00000400
  FINE* = 0x00000800

const
  DRAFT* = 0x00000000
  LETTER* = 0x00000100

const
  SIX_LPI* = 0x00000000
  EIGHT_LPI* = 0x00000200

const
  IMAGE_POSITIVE* = 0x00000000
  IMAGE_NEGATIVE* = 0x00000001

const
  ASPECT_HORIZ* = 0x00000000
  ASPECT_VERT* = 0x00000001

const
  SHADE_BW* = 0x00000000
  SHADE_GREYSCALE* = 0x00000001
  SHADE_COLOR* = 0x00000002

const
  US_LETTER* = 0x00000000
  US_LEGAL* = 0x00000010
  N_TRACTOR* = 0x00000020
  W_TRACTOR* = 0x00000030
  CUSTOM* = 0x00000040

const
  EURO_A0* = 0x00000050
  EURO_A1* = 0x00000060
  EURO_A2* = 0x00000070
  EURO_A3* = 0x00000080
  EURO_A4* = 0x00000090
  EURO_A5* = 0x000000A0
  EURO_A6* = 0x000000B0
  EURO_A7* = 0x000000C0
  EURO_A8* = 0x000000D0

const
  CUSTOM_NAME* = 0x00000000
  ALPHA_P_101* = 0x00000001
  BROTHER_15XL* = 0x00000002
  CBM_MPS1000* = 0x00000003
  DIAB_630* = 0x00000004
  DIAB_ADV_D25* = 0x00000005
  DIAB_C_150* = 0x00000006
  EPSON* = 0x00000007
  EPSON_JX_80* = 0x00000008
  OKIMATE_20* = 0x00000009
  QUME_LP_20* = 0x0000000A
  HP_LASERJET* = 0x0000000B
  HP_LASERJET_PLUS* = 0x0000000C

const
  SBUF_512* = 0x00000000
  SBUF_1024* = 0x00000001
  SBUF_2048* = 0x00000002
  SBUF_4096* = 0x00000003
  SBUF_8000* = 0x00000004
  SBUF_16000* = 0x00000005

const
  SREAD_BITS* = 0x000000F0
  SWRITE_BITS* = 0x0000000F
  SSTOP_BITS* = 0x000000F0
  SBUFSIZE_BITS* = 0x0000000F
  SPARITY_BITS* = 0x000000F0
  SHSHAKE_BITS* = 0x0000000F

const
  SPARITY_NONE* = 0
  SPARITY_EVEN* = 1
  SPARITY_ODD* = 2
  SPARITY_MARK* = 3
  SPARITY_SPACE* = 4

const
  SHSHAKE_XON* = 0
  SHSHAKE_RTS* = 1
  SHSHAKE_NONE* = 2

const
  CORRECT_RED* = 0x00000001
  CORRECT_GREEN* = 0x00000002
  CORRECT_BLUE* = 0x00000004
  CENTER_IMAGE* = 0x00000008
  IGNORE_DIMENSIONS* = 0x00000000
  BOUNDED_DIMENSIONS* = 0x00000010
  ABSOLUTE_DIMENSIONS* = 0x00000020
  PIXEL_DIMENSIONS* = 0x00000040
  MULTIPLY_DIMENSIONS* = 0x00000080
  INTEGER_SCALING* = 0x00000100
  ORDERED_DITHERING* = 0x00000000
  HALFTONE_DITHERING* = 0x00000200
  FLOYD_DITHERING* = 0x00000400
  ANTI_ALIAS* = 0x00000800
  GREY_SCALE2* = 0x00001000

const
  CORRECT_RGB_MASK* = (CORRECT_RED or CORRECT_GREEN or CORRECT_BLUE)
  DIMENSIONS_MASK* = (BOUNDED_DIMENSIONS or ABSOLUTE_DIMENSIONS or PIXEL_DIMENSIONS or MULTIPLY_DIMENSIONS)
  DITHERING_MASK* = (HALFTONE_DITHERING or FLOYD_DITHERING)
