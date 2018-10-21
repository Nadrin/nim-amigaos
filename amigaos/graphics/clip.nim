#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

# Layer, ClipRect type declarations moved to rastport.nim file.

const
  CR_NEEDS_NO_CONCEALED_RASTERS* = 1
  CR_NEEDS_NO_LAYERBLIT_DAMAGE* = 2

const
  ISLESSX* = 1
  ISLESSY* = 2
  ISGRTRX* = 4
  ISGRTRY* = 8
