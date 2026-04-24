# Daly Orthodontics — Website Refresh Package

**Client:** Daly Orthodontics (Burlington, NC)
**Prepared by:** YohDev · Andrew Hewitt · andrew@yohdev.com
**Version:** 1.0 · 2026-04-24
**Intended for:** Friday follow-up call with Victor Daniel Daly + Dr. Daly

---

## What's in this package

Three HTML files (openable in any browser, no build step), a WordPress `theme.json`, and all supporting documentation.

### Client-facing deliverables

| File | What it is | Open it when… |
|---|---|---|
| [Homepage.html](Homepage.html) | High-fidelity homepage mock for Milestone 2 | You want to see where the brand expression lands. |
| [Style Guide.html](Style%20Guide.html) | Component library, tokens, do/don't rules | You want to see the system behind the mock. |
| [Playbook.html](Playbook.html) | Client-facing process document | You want to walk Victor and Dr. Daly through how the project runs. |
| [theme.json](theme.json) | WordPress block-theme configuration | A developer is setting up the WP theme. |

### Internal / reference

| Path | What it is |
|---|---|
| `output/01-intake-summary.md` | Phase 01 deliverable — Friday-call prep |
| `output/02-research.md` | Phase 02 deliverable — current-site inventory + competitor survey |
| `output/03-system-tokens.md` | Phase 03 deliverable — full token reference |
| `brief/` | Archived sales handoff — the original 8 docs Victor's team prepared |
| `assets/` | Drop-zone for logos, fonts, and photography (README inside explains what goes where) |
| `theme/theme.json` | Duplicate of theme.json, placed where the WP block theme expects it |

---

## How to view the HTML files

### Option 1 — Just open them
Double-click any `.html` file. They render in any modern browser. No server needed.

### Option 2 — Serve locally (recommended for client review)
From the `final-package/` directory:

```bash
# Python 3 (comes pre-installed on macOS)
python3 -m http.server 8080
# Then visit http://localhost:8080/ in your browser

# …or, if you have Node:
npx serve .
```

Serving locally gives you clean URLs and avoids the `file://` scheme that some browsers restrict.

### Option 3 — Deploy as a preview
See the parent repo's `DEPLOYMENT.md` for GitHub Pages and Surge.sh preview deployment instructions. The `.nojekyll` file in this folder is already in place for GitHub Pages.

---

## Reading order for the Friday call

If you're walking Victor and Dr. Daly through the package on a screen share:

1. **Playbook.html** first — the client-facing narrative. Sets the context: why we're here, what you're buying, how it runs.
2. **Homepage.html** second — the "here's what the brand could look like" reveal. Let them react before you explain anything.
3. **Style Guide.html** third — only if they want to go deeper. This is the "and here's how it holds up across the whole site" proof.

Skip `output/*` and `brief/*` on the call unless they ask. Those are reference material.

---

## Key decisions reflected in this package

Pulled forward from `output/01-intake-summary.md` so a reviewer doesn't have to dig:

- **Logo and base palette are locked.** Deep green (`#1C3A27`) + warm gold (`#C9A633`). Current-site mustard-yellow (`#B9A628`) is explicitly retired.
- **Typography is reinvented.** Fraunces (display serif) + Inter (body sans), both self-hosted Google Fonts. Chosen to echo the logo's art-deco serif without copying it.
- **IA is flatter.** Current six-item nav plus "More" overflow → five-item nav, no overflow. "Welcome" and "Patient Hub" retired as labels.
- **One CTA path.** Current site's four competing scheduling paths (header button, two side tabs, bottom-right widget) → one persistent cream-pill CTA.
- **Imagery direction.** Stock hero image retired. Hero is typographic-first; photography lives below the fold, labeled as placeholder slots until real practice photography is available.

---

## Open questions for the Friday call

The intake summary has the full list. Top priorities:

1. **Dr. Daly's first name** and preferred title for site copy.
2. **Domain spelling:** `dailyorthodontics.com` (current) vs. `dalyorthodontics.com` — this changes the M1 migration plan materially.
3. **Patient Hub** — does it port to WordPress, or can it be retired for M1?
4. **Photography** — willing to do a half-day shoot for M2, or go typographic-first?
5. **Reference reaction** — which of the three direction buckets in the intake summary do they eliminate first?

---

## What this package is NOT

- **Not a deployed site.** These are static HTML mocks. Real WordPress build happens in M1 (migration) and M2 (redesign).
- **Not multi-page.** Per the playbook scope: homepage + style guide only. Inner pages use the style guide components but are not mocked.
- **Not copyedited by the client.** All copy in `Homepage.html` is YohDev's working hypothesis. Every word is reviewable in Phase 04 of the real project.
- **Not pixel-for-pixel.** Hex values are approximated from the screenshot you shared. A Phase 03 token pass against the actual logo SVG will refine them.

---

## Next action (after Friday)

1. Close the five open questions above.
2. Greenlight on M1 (and optionally M2).
3. YohDev kicks off Phase 02 Research the following Monday.
4. June 2026 Pearl Sites billing cycle stays comfortably clear.

---

## Contact

**Andrew Hewitt** · YohDev · [andrew@yohdev.com](mailto:andrew@yohdev.com)

For day-to-day project questions after kickoff, email is primary. For blocking issues, direct text or call.
