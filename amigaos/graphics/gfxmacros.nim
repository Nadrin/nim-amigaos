#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

#const
#  ON_DISPLAY* = custom.dmacon = BITSET or DMAF_RASTER
#  OFF_DISPLAY* = custom.dmacon = BITCLR or DMAF_RASTER
#  ON_SPRITE* = custom.dmacon = BITSET or DMAF_SPRITE
#  OFF_SPRITE* = custom.dmacon = BITCLR or DMAF_SPRITE
#  ON_VBLANK* = custom.intena = BITSET or INTF_VERTB
#  OFF_VBLANK* = custom.intena = BITCLR or INTF_VERTB

template setDrPt*(w, p: untyped): void =
  w.linePtrn = p
  w.flags = w.flags or FRST_DOT
  w.linpatcnt = 15

template setAfPt*(w, p, n: untyped): void =
  w.areaPtrn = p
  w.areaPtSz = n

template setOPen*(w, c: untyped): void =
  w.aolPen = c
  w.flags = w.flags or AREAOUTLINE

template setWrMsk*(w, m: untyped): void =
  w.mask = m

template getOPen*(rp: untyped): untyped =
  getOutlinePen(rp)

template BNDRYOFF*(w: untyped): void =
  w.flags = w.flags and not AREAOUTLINE

template CINIT*(c, n: untyped): untyped =
  uCopperListInit(c, n)

template CMOVE*(c, a, b: untyped): void =
  cmove(c, addr a, b)
  cbump(c)

template CWAIT*(c, a, b: untyped): void =
  cwait(c, a, b)
  cbump(c)

template CEND*(c: untyped): void =
  CWAIT(c, 10000, 255)

template drawCircle*(rp, cx, cy, r: untyped): untyped =
  drawEllipse(rp, cx, cy, r, r)

template areaCircle*(rp, cx, cy, r: untyped): untyped =
  areaEllipse(rp, cx, cy, r, r)
