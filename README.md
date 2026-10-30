# occt-wasm — the OCCT WebAssembly build Takumion ships

[Open CASCADE Technology](https://github.com/Open-Cascade-SAS/OCCT) 8.0.1,
compiled to WebAssembly, exactly as the Takumion editor loads it. Every commit
here is published by Takumion's release workflow from the build it ships; the
commit message names the configuration hash it was linked from. Each Takumion
release is a tag, `takumion-v<version>` (e.g. `takumion-v0.1.0`), on the
commit holding the `occt.wasm` that release ships.

| File | What it is |
|---|---|
| `occt.wasm` | the binary: OCCT plus the bindings `occt.yml` lists |
| `occt.js` | the Emscripten loader for it |
| `occt.d.ts` | TypeScript declarations of the generated bindings |
| `occt.yml` | the configuration it was linked from: every bound OCCT class and the compiler/linker flags |
| `build.sh` | the exact build command, with the libcascade image pinned by digest |
| `occt.provenance.json` | the image's record of the source versions and flags that went in |
| `occt.build-manifest.json` | the linker's report: source files, bound symbols, validation |
| `occt.config` | the hash of the configuration this build came from; Takumion's release reuses the build while it matches |
| `NOTICE.md` | the licence notice: OCCT and libcascade, LGPL-2.1 with the Open CASCADE exception |

## How it is built

`build.sh` runs [libcascade](https://github.com/taucad/opencascade.js) 3.0.2
(`ghcr.io/taucad/opencascade.js`, pinned by digest), which carries OCCT 8.0.1
and its bindings precompiled, and links the symbols `occt.yml` lists:

```bash
bash build.sh
```

libcascade patches OCCT's source before compiling it; those patches are
public at https://github.com/taucad/opencascade.js/tree/v3.0.2/src/patches.
`occt.wasm` is a separate file loaded at run time: you may rebuild it from
these sources with your own changes and use it in its place.

## Licence

OCCT is Copyright (c) 1999-2026 OPEN CASCADE S.A.S., licensed under the GNU
Lesser General Public License 2.1 with the Open CASCADE exception — see
`NOTICE.md`.
