#!/bin/bash
# Full theme validation battery (steps 1-2 of verification/commands.md).
# Usage: verify-theme.sh [path]  (default: current directory)
set -euo pipefail
TARGET="${1:-.}"
echo "== JSON validity =="
python3 -c "
import json, glob, os, re
os.chdir('$TARGET')
files = glob.glob('templates/*.json') + glob.glob('locales/*.json') + glob.glob('config/*.json')
assert files, 'no JSON files found'
for f in sorted(files):
    raw = open(f).read()
    clean = re.sub(r'/\*.*?\*/', '', raw, flags=re.S)  # Shopify auto-generated header
    try:
        json.loads(clean)
    except Exception as e:
        print(f'FAIL {f} -> {e}'); raise SystemExit(1)
print(f'JSON OK ({len(files)} files)')
"
echo "== shopify theme check =="
shopify theme check --path "$TARGET"
