


const
  ON_DISPLAY* = custom.dmacon = BITSET or DMAF_RASTER
  OFF_DISPLAY* = custom.dmacon = BITCLR or DMAF_RASTER
  ON_SPRITE* = custom.dmacon = BITSET or DMAF_SPRITE
  OFF_SPRITE* = custom.dmacon = BITCLR or DMAF_SPRITE
  ON_VBLANK* = custom.intena = BITSET or INTF_VERTB
  OFF_VBLANK* = custom.intena = BITCLR or INTF_VERTB

template SetDrPt*(w, p: untyped): void =
  while true:
    (w).LinePtrn = (p)
    (w).Flags = (w).Flags or FRST_DOT
    (w).linpatcnt = 15
    if not 0:
      break

template SetAfPt*(w, p, n: untyped): void =
  while true:
    (w).AreaPtrn = p
    (w).AreaPtSz = n
    if not 0:
      break

template SetOPen*(w, c: untyped): void =
  while true:
    (w).AOlPen = c
    (w).Flags = (w).Flags or AREAOUTLINE
    if not 0:
      break

template SetWrMsk*(w, m: untyped): void =
  while true:
    (w).Mask = m
    if not 0:
      break


template SafeSetOutlinePen*(w, c: untyped): void =
  while true:
    if GfxBase.LibNode.lib_Version < 39:
      SetOPen(w, c)
    else:
      SetOutlinePen(w, c)
    if not 0:
      break

template SafeSetWriteMask*(w, m: untyped): void =
  while true:
    if GfxBase.LibNode.lib_Version < 39:
      SetWrMsk(w, m)
    else:
      SetWriteMask(w, m)
    if not 0:
      break


template GetOPen*(rp: untyped): untyped =
  GetOutlinePen(rp)

template BNDRYOFF*(w: untyped): void =
  while true:
    (w).Flags = (w).Flags and not AREAOUTLINE
    if not 0:
      break

template CINIT*(c, n: untyped): untyped =
  UCopperListInit(c, n)

template CMOVE*(c, a, b: untyped): void =
  while true:
    CMove(c, addr(a), b)
    CBump(c)
    if not 0:
      break

template CWAIT*(c, a, b: untyped): void =
  while true:
    CWait(c, a, b)
    CBump(c)
    if not 0:
      break

template CEND*(c: untyped): void =
  while true:
    CWAIT(c, 10000, 255)
    if not 0:
      break

template DrawCircle*(rp, cx, cy, r: untyped): untyped =
  DrawEllipse(rp, cx, cy, r, r)

template AreaCircle*(rp, cx, cy, r: untyped): untyped =
  AreaEllipse(rp, cx, cy, r, r)
