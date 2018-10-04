#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

## This module provides AmigaOS 3 API FFI, struct, and constant definitions.

when not defined(amiga):
    {.fatal: "AmigaOS API bindings cannot be used when compiling for non-Amiga platforms".}

import amigaos/exec
export exec