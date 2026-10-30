# Open CASCADE Technology — notice (web build)

This product uses Open CASCADE Technology (OCCT) 8.0.1, compiled to
WebAssembly (`occt.wasm`).

OCCT is Copyright (c) 1999-2026 OPEN CASCADE S.A.S. and is licensed under the
GNU Lesser General Public License version 2.1 with the Open CASCADE exception.
The licence texts are available at
https://github.com/Open-Cascade-SAS/OCCT/blob/V8.0.1/LICENSE_LGPL_21.txt and
https://github.com/Open-Cascade-SAS/OCCT/blob/V8.0.1/OCCT_LGPL_EXCEPTION.txt.

The OCCT in `occt.wasm` is built with libcascade 3.0.2 (LGPL-2.1,
https://github.com/taucad/opencascade.js/tree/v3.0.2), which modifies OCCT's
source before compiling it. The modifications are published as the scripts in
https://github.com/taucad/opencascade.js/tree/v3.0.2/src/patches, applied to
the OCCT source at https://github.com/Open-Cascade-SAS/OCCT/tree/V8.0.1.

`occt.wasm` is a separate file loaded at run time. You may rebuild it from
those sources with your own changes and use it in its place.
