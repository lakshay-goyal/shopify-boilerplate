# Verification commands (discovered from this repo — never invent others)

Repo type: Shopify Liquid theme (no package.json, no test runner).
Shopify CLI: `4.8.0` confirmed. Theme-check: via `shopify theme check`
(`.theme-check.yml` extends `theme-check:recommended`).

## Commands (run from the active worktree/repo root)

```bash
# 1. JSON validity — templates, locales, config
# (strip Shopify's /* auto-generated */ header comment first)
python3 -c "import json,glob,re; [json.loads(re.sub(r'/\*.*?\*/','',open(f).read(),flags=re.S)) for f in glob.glob('templates/*.json')+glob.glob('locales/*.json')+glob.glob('config/*.json')]; print('JSON OK')"

# 2. Shopify theme validation (lint + Liquid + schema + locales + performance)
shopify theme check

# 3. Single-file focus while iterating (faster feedback)
shopify theme check --output text <path/to/file.liquid>

# 4. Manual preview for TDD walkthrough (human or agent with browser)
shopify theme dev
```

Or run the wrapper: `.agent/scripts/verify-theme.sh [path]` (steps 1–2).

## What NOT to assume

No `npm test`, no `eslint`, no `prettier --check` config exists in this
repo. If a client project adds them, record the exact commands here first,
then use them. Never claim an unconfigured tool ran.
