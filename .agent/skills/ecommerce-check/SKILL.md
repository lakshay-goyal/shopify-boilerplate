# Skill: ecommerce-check (does this look like real commerce?)

## Purpose

Given the RFC, verify the planned application looks like a genuine
ecommerce experience (Amazon / Flipkart / Meesho / POD / dropshipping
grade) — not a generic AI-slop marketing site with a cart bolted on.

## When to use

On every RFC draft, and again when SPECs are complete (before execution).
Takes the RFC path as input.

## Inputs

- `rfc`: path to RFC (required).

## Procedure — score each dimension PRESENT / MISSING / WEAK

1. **Discovery**: home, PLP/collection with filters-sort-search,
   PDP with variants-gallery-price-inventory-ATC, search + predictive.
2. **Transaction**: cart drawer/page, checkout compatibility, discounts,
   shipping/tax messaging, order confirmation + policies.
3. **Trust**: reviews/ratings, badges, guarantees, contact + FAQ,
   legal pages (privacy, terms, refund, shipping, cancellation).
4. **Merchant operability**: theme-editor control of merchandising,
   menus, metafield-driven specs, promo slots without code.
5. **Slop signals** (any = flag): lorem ipsum, generic 3-card features,
   stock imagery as brand, no real catalog model, checkout as afterthought,
   identical sections on every page.

## Expected output

- Dimension table + verdict: COMMERCE-READY / NEEDS-WORK (blocking list).
- Concrete SPEC-level fixes ("add SPEC: collection filters + sort",
  "add SPEC: PDP inventory + quantity + pickup").

## Verification

- Every MISSING/WEAK item maps to an RFC gap or a new SPEC proposal —
  never a vague "improve design".

## Failure handling

RFC is genuinely non-commerce (brand site on Shopify) → say so explicitly,
downgrade verdict to SITE-APPROPRIATE with reasoning, still flag slop
signals. Never force commerce features onto a non-commerce brief silently.
