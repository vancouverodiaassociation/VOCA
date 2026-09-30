#!/usr/bin/env bash
# Build the VOCA site, validate translations, and screenshot key pages.
# Usage: bash .kiro/skills/voca-website/scripts/verify.sh [base_url]
# Screenshots require the dev server (bundle exec jekyll serve) to be running.
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel)"
BASE_URL="${1:-http://127.0.0.1:4000/voca}"
OUT="/tmp/voca-verify"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

cd "$ROOT"

echo "== Build"
bundle exec jekyll build 2>&1 | grep -iE "error|warning|done" || true

echo "== Translations"
for f in assets/js/i18n/*.json; do
  python3 -c "import json,sys; json.load(open(sys.argv[1]))" "$f" && echo "ok  $f"
done

echo "== Screenshots"
if ! curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/" | grep -q 200; then
  echo "skip: $BASE_URL is not reachable (start: bundle exec jekyll serve)"
  exit 0
fi
if [ ! -x "$CHROME" ]; then
  echo "skip: Google Chrome not found at $CHROME"
  exit 0
fi

mkdir -p "$OUT"
for page in "" "events" "gallery/" "about"; do
  name="${page%/}"; name="${name:-home}"
  for size in "desktop:1280,4000" "mobile:500,4000"; do
    label="${size%%:*}"; dims="${size#*:}"
    "$CHROME" --headless=new --disable-gpu --hide-scrollbars \
      --window-size="$dims" --virtual-time-budget=5000 \
      --screenshot="$OUT/${name}-${label}.png" \
      "$BASE_URL/$page?v=$RANDOM" >/dev/null 2>&1
    echo "saved $OUT/${name}-${label}.png"
  done
done
