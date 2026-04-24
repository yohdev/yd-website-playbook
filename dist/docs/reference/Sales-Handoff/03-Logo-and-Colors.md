---
file: Logo & Colors — Asset Manifest
source: Files uploaded or provided by client during handoff
owner: sales
last_updated: {{YYYY-MM-DD}}
---

# Logo & Colors — {{Client Name}}

> This file is a manifest. Every asset listed here must also exist at the path
> shown, inside `Sales Handoff — {{Client}}/assets/`.

---

## Logo files

| Variant | File path | Format | Notes |
|---|---|---|---|
| Primary (full color) | `assets/logo/primary.svg` | SVG | {{preferred — scales clean}} |
| Primary (PNG fallback) | `assets/logo/primary.png` | PNG, transparent | {{min 2000px wide}} |
| Reversed (for dark bg) | `assets/logo/reversed.svg` | SVG | {{or `null` if none}} |
| Monochrome | `assets/logo/mono.svg` | SVG | {{or `null` if none}} |
| Mark / icon only | `assets/logo/mark.svg` | SVG | {{or `null` — ask in Phase 01}} |
| Favicon source | `assets/logo/favicon-src.svg` | SVG, square | {{or derived}} |

**Minimum clear space:** {{e.g. "height of the 'O' around all sides"}}
**Minimum size:** {{e.g. "120px wide on screen, 0.75in in print"}}
**Do not:** {{list any known brand-guide violations — stretch, recolor, etc.}}

---

## Colors

Fill from brand guide if one exists. Otherwise eyedropper from existing site/logo
and confirm in Phase 01.

### Primary palette

| Role | Name | Hex | RGB | Where it's used |
|---|---|---|---|---|
| Brand 1 | {{name}} | `#{{000000}}` | {{0, 0, 0}} | {{primary buttons, links}} |
| Brand 2 | {{name}} | `#{{000000}}` | {{0, 0, 0}} | {{accents, highlights}} |
| Neutral dark | {{name}} | `#{{000000}}` | {{0, 0, 0}} | {{body text}} |
| Neutral light | {{name}} | `#{{FFFFFF}}` | {{255, 255, 255}} | {{backgrounds}} |

### Secondary / state

| Role | Hex | Notes |
|---|---|---|
| Success | `#{{000000}}` | {{or "derive from primary"}} |
| Warning | `#{{000000}}` | {{or "derive from primary"}} |
| Error | `#{{000000}}` | {{or "derive from primary"}} |

---

## Typography (if known)

| Role | Family | Weights | Source |
|---|---|---|---|
| Headline | {{e.g. Poppins}} | {{400, 600, 700}} | {{Google Fonts / foundry / licensed}} |
| Body | {{e.g. Inter}} | {{400, 500}} | {{Google Fonts}} |
| Mono / UI | {{e.g. JetBrains Mono}} | {{400, 500}} | {{Google Fonts}} |

> If the client doesn't have a type system, leave this blank — Phase 02 (Research)
> will propose one.

---

## Brand guide

- **Exists:** {{yes / no / partial}}
- **File:** `assets/brand/{{brand-guide.pdf}}` or {{link}}
- **Last updated:** {{YYYY-MM-DD or "unknown"}}

---

## Reference photography / imagery

Anything client-owned we can use on the redesign.

- `assets/imagery/{{filename.jpg}}` — {{caption}}
- `assets/imagery/{{filename.jpg}}` — {{caption}}
- {{or "none — ask in Phase 01 whether to source stock, commission, or go illustrative"}}
