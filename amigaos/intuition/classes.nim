#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

type
  IClass* {.bycopy.} = object
    dispatcher*: Hook
    reserved: uint32
    super*: ptr IClass
    id*: ClassID
    instOffset*: uint16
    instSize*: uint16
    UserData*: uint32
    subclassCount*: uint32
    objectCount*: uint32
    flags*: uint32

  IObject* {.bycopy.} = object
    node*: MinNode
    class*: ptr IClass
  
  ClassLibrary* {.bycopy.} = object
    lib*: Library
    pad: uint16
    class*: ptr IClass

const
  CLF_INLIST* = 0x00000001

template INST_DATA*(cl, o: untyped): untyped =
  (cast[pointer](((cast[ptr uint8](o)) + cl.instOffset)))

template SIZEOF_INSTANCE*(cl: untyped): untyped =
  ((cl).instOffset + cl.instSize + sizeof(IObject))

template OBJ*(o: untyped): untyped =
  (cast[ptr IObject]((o)))

template BASEOBJECT*(obj: untyped): untyped =
  (cast[ptr Object]((OBJ(obj) + 1)))

## OBJECT
template TOBJECT*(o: untyped): untyped =
  (OBJ(o) - 1)

template OCLASS*(o: untyped): untyped =
  ((OBJECT(o)).class)
