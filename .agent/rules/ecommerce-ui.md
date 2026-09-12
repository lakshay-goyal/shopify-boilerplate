# E-commerce UI/UX hard constraints (zero leniency)

Source: 5-agent unbiased audit (2026-09-12). Baseline scored 0/16 —
skeleton demo, not a storefront. Every future section is judged against
this file. UI mismatch = merge-blocking major, no exceptions.

## 1. E-commerce authenticity (16-point gate)

Homepage MUST compose this sequence (merchant-reorderable, no frozen layout):
announcement strip → commerce header → hero → category nav →
merchandised product grid → trust strip → promo/deals band →
editorial/lifestyle break → reviews → FAQ → newsletter → fat footer.

Product card anatomy (all required): fixed-ratio image + hover swap/zoom +
badge + vendor/title + price + compare-at + star rating + quick-add.
PDP: gallery + thumbnails, variant picker, compare-at/unit-price,
stock/SKU, accordion (shipping/returns), reviews slot, cross-sell,
sticky mobile ATC. Cart drawer + free-shipping bar, collection
facets/sort, predictive search. Missing any = NEEDS-WORK.

## 2. Pixel-perfection tokens

- Spacing 8pt scale only: 4, 8, 16, 24, 32, 48, 64, 72. Schema ranges
  use step 8 (or 4 for half-step). No 5/10/50px one-offs.
- Type scale tokens only: 12/14/16/20/24/32/48; headings lh 1.2,
  body 1.5; display letter-spacing -0.02em only. No raw font-size.
- Colors: zero hex/rgb in `{% stylesheet %}`. All via
  `settings_schema.json` → `css-variables.liquid` roles:
  background, foreground, muted, border, accent, accent-foreground,
  sale, success, error, overlay. Contrast ≥4.5:1 body, ≥3:1 large/UI.
- Breakpoints 360/768/1024/1440. Grids use
  `minmax(min(240px,100%),1fr)`, never `minmax(500px,…)` — must not
  overflow 360px phones. Mobile columns via `select columns_mobile [1,2]`.
- Images: fixed `aspect-ratio` + `object-fit:cover` per surface
  (product 4:5, collection 1:1), `image_url` width/height/crop,
  `loading:lazy` below fold / `fetchpriority:high` hero, explicit
  width/height attrs (no CLS), `srcset` widths.
- States on every link/button/input/card: `:hover`, `:focus-visible`
  (2px offset outline), `:active` (scale .97–.98), `:disabled`
  (opacity .5 + not-allowed). Touch targets ≥44×44. Cart badge
  truncates at 99+, never clips.
- Motion: transitions ≤0.2–0.4s; ALL animation under
  `@media (prefers-reduced-motion: reduce){*{animation:none!important;
  transition:none!important}}`. Liquid NEVER inside
  `{% stylesheet %}` / `{% javascript %}` — dynamic values via
  CSS vars (`style="--x: {{ s.x }}"`) + classes.

## 3. Micro-interactions + background effects (mandatory inventory)

Ship-blocking on its surface if missing: hover lift
(translateY -4px + shadow), image zoom on hover, quick-add reveal
(hover on desktop, always visible on touch), marquee trust strip
(pause on hover), sticky mobile ATC via IntersectionObserver,
sale-badge pulse + cart-count pop, skeleton shimmer, FAQ accordion
via `grid-template-rows 0fr→1fr`, button loading/disabled states,
section background motifs (pastel bands + confetti/paw for playful;
editorial collage + burnt-orange promo band for craft), sticky
blur header + mobile drawer, cart toast + focus trap.
Forbidden: `!important` overrides, height-auto-only images,
raw-table cart without mobile collapse, `type="text"` quantity,
scroll-jacking / unguarded parallax, hover-only disclosure.

## 4. Content value rules

- Every user string `{{ 'key' | t }}` + `en.default.json` entry;
  editor strings in `.schema.json`. Sentence case. Interpolation
  (`t: min:, max:`), never concatenation. No lorem, no dev copy
  (`Hello, World!`, `Key Concepts`) on merchant surfaces.
- Every section: headline (outcome/emotion, ≤8 words) → subhead
  (concrete proof/scope) → CTA (verb + destination, never
  `Learn more` / `Click here`). No dead-ends: every `for` gets
  `{% else %}` + CTA. FAQ MUST answer shipping, COD,
  returns/exchanges, sizing, care, contact — each ending with a link.
- Stats/names/counts only from `context/DATA/` or merchant source.
  Unverifiable claims are labeled UNVERIFIED, never shipped as fact.

## 5. Niche-adaptive rule (no one-size-fits-all)

Design decisions MUST adapt to the store's niche/audience, which is
defined per-project by the RFC — never assumed. Every new section SPEC
declares its intended audience posture and exposes it as a `select`
setting or presets where it affects the look. Reviewer rejects schemas
that lock in one posture without a setting.

Illustrative examples only (NOT build targets — the owner shared two
screenshots purely as context so agents calibrate): a premium
high-consideration niche (e.g. furniture-style: restrained motion,
neutrals, airy spacing, craft proof) versus an emotional impulsive
niche (e.g. playful POD-style: dense motion, pastel bands, sticker
radii, volume proof + loud urgency). The decision matrix pattern lives
in `context/DECISIONS/001-niche-adaptive-design.md`; reference
teardowns in `context/RESEARCH/references/ecommerce-benchmarks.md`.
Single-property → setting + CSS var; multi-property look → `select` +
class. Never treat the examples as the product.
