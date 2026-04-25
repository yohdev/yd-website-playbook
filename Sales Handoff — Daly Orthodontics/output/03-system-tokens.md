---
phase: 03 — System (Design Tokens)
client: Daly Orthodontics
owner: YohDev
last_updated: 2026-04-24
note: These tokens drive Homepage.html, Style Guide.html, and theme.json. If any token changes,
      update all three together.
---

# Design Tokens — Daly Orthodontics

## Color palette

### Brand
| Token | Hex | Role |
|---|---|---|
| `--daly-green` | `#1C3A27` | Primary brand color — header, footer, dark sections |
| `--daly-green-deep` | `#122619` | Hover/active states, shadow mixes, darker panels |
| `--daly-green-soft` | `#2A4F37` | Large illustration/hero backgrounds if used |
| `--daly-gold` | `#C9A633` | Accent — logo gold, rule accents, link underlines, small CTA ornament |
| `--daly-gold-deep` | `#A8871F` | Hover state for gold elements |
| `--daly-gold-soft` | `#E4CB73` | Subtle highlights only (used in the logo mark gradient) — never for UI fills |

### Neutrals
| Token | Hex | Role |
|---|---|---|
| `--obsidian` | `#0B0B0B` | Body text on light, darkest surface |
| `--ink` | `#1A1A1A` | Default body text |
| `--ink-2` | `#3A3A3A` | Secondary text |
| `--ink-3` | `#6B6B6B` | Tertiary text, captions, metadata |
| `--line` | `#E4DECB` | Hairline rules against cream |
| `--line-2` | `#D4CEB9` | Heavier dividers |
| `--cream` | `#F2EADB` | Primary light surface (hero CTAs, cards on green) |
| `--cream-soft` | `#F7F1E4` | Secondary light surface |
| `--paper` | `#FFFFFF` | Content body background |

### Functional
| Token | Hex | Role |
|---|---|---|
| `--success` | `#2F6B3E` | Form validation, status pills |
| `--warning` | `#B8860B` | Light warnings |
| `--danger` | `#A23B2B` | Error states |

### Overlays
| Token | Value | Role |
|---|---|---|
| `--scrim-on-green` | `rgba(11,11,11,0.35)` | Photo overlays on green sections |
| `--scrim-on-cream` | `rgba(11,11,11,0.04)` | Subtle card lifts |

## Typography

### Families
- **Display:** *Fraunces* — variable, high-contrast serif. Weights used: 400, 500, 600, 700. Optical size axis used at 48+ for display, 14 for small caps.
- **Body:** *Inter* — variable sans. Weights used: 400, 500, 600, 700.
- **Both self-hosted via Google Fonts** — portability and zero ongoing cost, per 03-Logo-and-Colors.md.

### Type scale
| Token | Size (desktop) | Size (mobile) | Line-height | Weight | Family |
|---|---|---|---|---|---|
| `--t-display` | 72px | 44px | 1.04 | 500 | Fraunces |
| `--t-h1` | 56px | 36px | 1.08 | 500 | Fraunces |
| `--t-h2` | 40px | 28px | 1.15 | 500 | Fraunces |
| `--t-h3` | 28px | 22px | 1.25 | 600 | Fraunces |
| `--t-h4` | 22px | 19px | 1.3 | 600 | Fraunces |
| `--t-body-lg` | 20px | 18px | 1.55 | 400 | Inter |
| `--t-body` | 17px | 16px | 1.6 | 400 | Inter |
| `--t-small` | 15px | 14px | 1.55 | 400 | Inter |
| `--t-caption` | 13px | 13px | 1.5 | 500 | Inter |
| `--t-eyebrow` | 12px | 12px | 1.4 | 500, letter-spacing 0.14em, uppercase | Inter |

### Rendering rules
- Body size never drops below 16px (per README: "readable type, body ≥ 16px").
- Use Fraunces at weight ≤ 500 for display. Heavier weights lose the elegance the logo asks for.
- Body text on cream gets `--ink` (`#1A1A1A`) not pure black — easier on the eye at long reading.

## Spacing scale

Eight-step scale based on a 4px root.

| Token | Value | Use |
|---|---|---|
| `--s-0` | 4px | Icon-to-label |
| `--s-1` | 8px | Tight groupings |
| `--s-2` | 12px | Small element padding |
| `--s-3` | 16px | Standard input padding, card inner |
| `--s-4` | 24px | Section inner gaps |
| `--s-5` | 32px | Card-to-card |
| `--s-6` | 48px | Component spacing |
| `--s-7` | 64px | Section edges on mobile |
| `--s-8` | 96px | Section edges on desktop |
| `--s-9` | 128px | Major section breaks |

## Radii

| Token | Value | Use |
|---|---|---|
| `--r-0` | 0 | Rules, section dividers |
| `--r-1` | 4px | Inputs, small badges |
| `--r-2` | 8px | Cards |
| `--r-3` | 12px | Large cards, feature panels |
| `--r-pill` | 999px | CTA pills |

## Shadow / elevation

| Token | Value | Use |
|---|---|---|
| `--shadow-0` | `none` | Flat |
| `--shadow-1` | `0 1px 2px rgba(11,11,11,0.04), 0 2px 8px rgba(11,11,11,0.04)` | Cards at rest |
| `--shadow-2` | `0 4px 12px rgba(11,11,11,0.08), 0 8px 24px rgba(11,11,11,0.06)` | Cards on hover, CTA lift |
| `--shadow-focus` | `0 0 0 3px rgba(201,166,51,0.35)` | Focus ring (gold, WCAG-safe) |

## Layout

- **Content max width:** 1200px
- **Reading max width (body prose):** 680px
- **Grid gutter (desktop):** 32px
- **Grid gutter (mobile):** 16px
- **Container padding (desktop):** 48px left/right
- **Container padding (mobile):** 20px left/right

## Motion

Restrained. This is a medical practice, not a tech startup.

- **Micro transitions** (hover, focus): 160ms, `cubic-bezier(0.2, 0.8, 0.2, 1)`
- **Section reveals (if used at all):** 400ms fade + 12px up
- No parallax. No large decorative motion. Reduced motion media query respected.

## Breakpoints

- **Mobile:** < 640px
- **Tablet:** 640–1024px
- **Desktop:** > 1024px
- **Wide:** > 1440px (content stays pinned at max-width)

## Accessibility

- **Contrast:** all body text ≥ 7:1 against its background (AAA where possible).
  - `--ink` on `--paper` → 15:1 ✓
  - `--cream` on `--daly-green` → 9.8:1 ✓
  - `--daly-gold` on `--daly-green` → 4.6:1 (use only for headings ≥ 24px or icons, not body)
  - `--daly-gold` on `--paper` → 2.9:1 ✗ (ornamental only, never for text)
- **Focus:** visible focus ring on all interactive elements via `--shadow-focus`.
- **Motion:** `prefers-reduced-motion` respected — no transitions on essential UI when reduced.
- **Target size:** minimum 44×44px for tappable elements.

## Token map to WordPress theme.json

See `theme.json` for full mapping. Key aliases:

| Daly token | theme.json slug | WP CSS var |
|---|---|---|
| `--daly-green` | `brand-green` | `--wp--preset--color--brand-green` |
| `--daly-gold` | `brand-gold` | `--wp--preset--color--brand-gold` |
| `--cream` | `cream` | `--wp--preset--color--cream` |
| `--ink` | `ink` | `--wp--preset--color--ink` |
| `--t-h1` | `heading-1` | `--wp--preset--font-size--heading-1` |
| `--t-body` | `body` | `--wp--preset--font-size--body` |
