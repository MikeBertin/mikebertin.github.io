#!/bin/zsh
# Renders brand/og-card.html twice with headless Chrome at 2x, then
# downsamples with sips for crisp text:
#   og.png              1200x630  social sites (og:image)
#   social-preview.png  1280x640  GitHub repo preview (upload by hand in repo settings)
# Usage (from the repo root): brand/make-cards.sh
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(dirname "$HERE")"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
TMP="$(mktemp -d)"

render() {
  local w=$1 h=$2 out=$3
  "$CHROME" --headless --disable-gpu --hide-scrollbars --force-device-scale-factor=2 \
    --window-size=$w,$h --screenshot="$TMP/$w.png" "file://$HERE/og-card.html" 2>/dev/null
  sips -z $h $w "$TMP/$w.png" --out "$out" >/dev/null
  echo "wrote $out"
}

render 1200 630 "$ROOT/og.png"
render 1280 640 "$HERE/social-preview.png"
