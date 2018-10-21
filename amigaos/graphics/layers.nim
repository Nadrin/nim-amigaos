#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  LAYERSIMPLE* = 1
  LAYERSMART* = 2
  LAYERSUPER* = 4
  LAYERUPDATING* = 0x00000010
  LAYERBACKDROP* = 0x00000040
  LAYERREFRESH* = 0x00000080
  LAYERIREFRESH* = 0x00000200
  LAYERIREFRESH2* = 0x00000400
  LAYER_CLIPRECTS_LOST* = 0x00000100

const
  NEWLAYERINFO_CALLED* = 1

# Layer_Info declaration moved to rastport.nim file.

template LAYERS_BACKFILL*(): ptr Hook = cast[ptr Hook](0)
template LAYERS_NOBACKFILL*(): ptr Hook = cast[ptr Hook](1)
