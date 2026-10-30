#!/usr/bin/env bash
# Build occt.wasm from occt.yml with libcascade — the maintained opencascade.js
# fork (taucad/opencascade.js) — at a pinned release: OCCT 8.0.1, Emscripten 6.
#
# The image carries OCCT and every binding already compiled (its "warm cache"),
# so this only LINKS occt.yml's symbols: minutes, mostly one core for wasm-opt.
# It is pinned by DIGEST — a tag moves, and a different image builds a
# different binary. Bump it on purpose, then run the backend's real-OCCT tests
# (sdk/backend/occt) and the browser suite.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIST_DIR="$SCRIPT_DIR/dist"

# ghcr.io/taucad/opencascade.js:3.0.2-single-threaded
IMAGE="ghcr.io/taucad/opencascade.js@sha256:74e2918318e4e594f1a6a0edd16fa88b0a192e3a43157dd2d901c5de9340aa36"
# The link is capped so a build never takes the whole machine.
CPUS="${OCCT_WASM_CPUS:-8}"

mkdir -p "$DIST_DIR"
echo "Linking occt.yml with libcascade 3.0.2 (OCCT 8.0.1) on ${CPUS} CPUs..."
docker run --rm --cpus "$CPUS" -e OCJS_COMPILE_WORKERS="$CPUS" \
  -v "$SCRIPT_DIR:/src" -u "$(id -u):$(id -g)" \
  "$IMAGE" link occt.yml

for file in occt.js occt.wasm occt.d.ts occt.provenance.json occt.build-manifest.json; do
  if [ -f "$SCRIPT_DIR/$file" ]; then
    mv -f "$SCRIPT_DIR/$file" "$DIST_DIR/$file"
    chmod 644 "$DIST_DIR/$file"
  fi
done
echo "Output in $DIST_DIR:"
ls -lh "$DIST_DIR"/occt.*
