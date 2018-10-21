#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  ICM_Dummy* = (0x00000401)
  ICM_SETLOOP* = (0x00000402)
  ICM_CLEARLOOP* = (0x00000403)
  ICM_CHECKLOOP* = (0x00000404)

const
  ICA_Dummy* = (TAG_USER + 0x00040000)
  ICA_TARGET* = (ICA_Dummy + 1)
  ICA_MAP* = (ICA_Dummy + 2)

const
  ICSPECIAL_CODE* = (ICA_Dummy + 3)

const
  ICTARGET_IDCMP* = (not 0)
