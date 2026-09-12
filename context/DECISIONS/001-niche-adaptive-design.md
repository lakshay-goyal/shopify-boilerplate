# ADR 001 — Niche-adaptive design principle

Date: 2026-09-12. Status: accepted. From 5-agent unbiased audit.

> The niche examples below (premium restrained vs playful emotional)
> are ILLUSTRATIVE ONLY — shared by the owner as context so agents can
> calibrate. They are NOT the product and NOT build targets. The actual
> niche is defined per-project by the RFC.

## Context
One theme system must be able to serve different store niches. The
niche/audience decides motion density, color posture, spacing density,
and proof style — not agent taste. Until an RFC names the niche, build
generic adaptive capability, not niche-specific sections.

## Decision
One adaptive section + presets preferred over niche-locked variants
(except genuine structural divergence → separate blocks sharing
snippets). Every SPEC declares its intended audience posture and
exposes it as a `select` setting or presets where it affects the look.
Single CSS property → setting + CSS var; multi-property look →
`select` + class.

## Matrix pattern (apply to whatever niche the RFC names)

| Lever | Restrained posture (e.g. premium) | Expressive posture (e.g. playful) | Control |
|---|---|---|---|
| Motion | none/subtle fade | dense: motifs, marquee, playful loops | `select motion_level` → class + `range intensity` → var |
| Radius | small, architectural | large soft cards, pills/badges | `range card_radius` → var + `select shape` → class |
| Color | neutrals + one restrained accent | saturated bands + bold CTA | per-section `color band_background` → var + `select palette` → class |
| Density | airy padding, larger gaps, fewer cols | dense padding, tight gaps, more cols | `range padding_y/gap` → vars + `select columns_mobile` |
| Proof | specs, close-ups, story, expert support | review volume, stats band, trust row, UGC | `select proof_style` + checkboxes |
| Urgency | muted text only | countdown, stock bar, loud badges | `select urgency` + toggles |
| Photo | lifestyle/material, wide ratios | person+product, square, framed overlays | `select image_shape/ratio` → class |

Global niche/mode select in `settings_schema.json`; per-section
posture select + `range padding_y/gap` + `color band_background` +
`select motion`, with presets per posture. Never hardcode a niche.
