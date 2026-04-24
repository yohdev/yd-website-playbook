---
phase: 02 — Research
client: Daly Orthodontics
owner: YohDev
last_updated: 2026-04-24
note: Synthesized from client-provided screenshot + nav inventory + industry pattern survey.
      Live-site crawl deferred — the Phase 01 intake summary already flagged the open
      technical questions (domain spelling, Patient Hub migration, analytics/CRM stack)
      as Friday-call items. This doc focuses on what we can see today.
---

# Research — Daly Orthodontics

## 1. Current-site inventory (observed)

### Above-the-fold layout
- **Utility bar (top):** solid mustard-yellow band carrying three competing groups of information — social icons left, office address center, phone right. Reads as a strip of announcements; creates visual noise above the header.
- **Primary header (dark green):** logo lockup left, horizontal nav center, "Schedule Now" pill top-right. Nav carries six top-level items — five real + one "More" overflow, which is a signal that the IA has outgrown the template.
- **Hero:** full-bleed stock photograph of a young woman laughing against a green studio backdrop. No hero copy, no above-the-fold CTA other than nav-level "Schedule Now" and the floating side tabs.
- **Floating persistent chrome:**
  - Right edge top: "Virtual Consultation" mustard tab
  - Right edge middle: "Book Appointment" mustard tab
  - Bottom right: LocalMed-style round booking widget
  - Bottom left: accessibility widget
  - Four floating elements competing for attention simultaneously. The "Schedule Now" header CTA, two mustard side tabs, and the bottom-right widget are effectively three different ways to say the same thing.

### Color system (as built)
- Header green: `#1C3A27` (approx.) — strong, legible.
- Utility-bar yellow / side-tab yellow: `#B9A628` (approx.) — mustard, leans olive. **This is the wrong gold.** It does not match the logo's richer `#C9A633` and reads cheap against the dark green.
- Hero-backdrop green: `#2F5541` (approx.) — different, muddier green than the header. Palette inconsistency.
- Logo (gold on black): rich, warm, high-contrast — the strongest single element on the page and the only piece that reads as "brand."

### Typography (as built)
- Nav, utility bar, body text: a geometric sans in the Poppins / Proxima Nova family. Reads functional, generic.
- Logo face is the only display typography doing expressive work. Nothing else on the page echoes it.
- Body reading size appears standard (~16px) but without much vertical rhythm — the utility strip, nav, and side tabs pack a lot of information into a small vertical space.

### Information architecture issues
1. **Nav is at capacity.** Six top-level items including a "More" overflow. "Welcome" is not a user-shaped label (the home tab should just be the logo). "Patient Hub" is CMS-shaped, not user-shaped.
2. **Three competing CTA paths.** Header "Schedule Now" + two floating tabs + bottom-right widget = cognitive tax. A first-time visitor has to decide which door to use before they've been told why.
3. **No content above the fold.** The hero image is emotionally warm but says nothing specific — a new visitor cannot confirm in five seconds that this is an orthodontist in Burlington. 05-Target-Audience calls this out explicitly as a bounce trigger.
4. **Utility bar overloaded.** Social + address + phone all fighting in one horizontal band.

### Content patterns (inferred from nav)
- Welcome (home)
- About (dropdown)
- Treatments (dropdown) — expect Braces, Clear Aligners, Adult, Teen/Child
- New Patients (dropdown) — expect First Visit, Forms, Insurance, Financing
- Patient Hub — logged-in area, ProSites-proprietary, **migration-unknown**
- More (overflow) — likely Blog, Before/After, Gallery, Contact variants

### Blog content risk (from discovery, not from crawl)
Per `04-Current-Website.md`: approximately one blog post per week since 2025. Discovery call flagged content covering oral surgery, general dentistry, and at least one post that "basically told people not to go to an orthodontist." A one-for-one migration would carry this over. **Phase 02 crawl (not executed yet) must catalogue every post and mark for migrate / redirect / noindex / delete.**

---

## 2. Competitor & reference survey (by pattern bucket)

Three working buckets tied to the three direction choices in the Phase 01 intake summary. These are pattern references, not "copy this site" references.

### Bucket A — Restrained modern medicine
*Premium dermatology / optometry / private-practice sites that look like brands, not directories.*

Patterns to borrow:
- Serif-forward headline hierarchy, generous leading
- Hero that is a *statement*, not a stock photo — headline + sub + single primary CTA
- A single, persistent CTA path rather than three
- Doctor photography that reads editorial, not corporate-portrait
- Service pages structured as "problem → treatment → what to expect → cost" rather than as CMS page-lists

Why it fits Daly: the gold-on-black logo is already asking to live in a restrained, editorial, confidence-forward world. This is the cheapest bucket to get to while honoring the mark.

### Bucket B — Boutique hospitality
*Small luxury hotel or wellness retreat sites — photography-led, warm, serif display type.*

Patterns to borrow:
- Full-bleed warm photography with deep color overlays
- Minimal nav, maximal whitespace
- "Booking" treated as a graceful ritual rather than a transactional checkout

Why it fits Daly: the logo's deco-serif register and warm gold could land beautifully in this world. Risk: if the photography isn't custom, this bucket collapses into the same stock-image problem as the current site.

### Bucket C — Contemporary DTC health
*Warby / Hims / One Medical — clean sans layouts, approachable voice, heavy whitespace.*

Patterns to borrow:
- Straightforward language over marketing-speak
- Inline pricing transparency
- Photography with real patients, not models

Why it NOT fully fit Daly: the logo's classicism fights this register. The logo is a grandparent at a D2C kids' party. Elements of the voice can be borrowed; the visual language cannot.

### Recommendation
**Bucket A as spine, with Bucket B warmth and one Bucket C voice note.** This is what the Homepage and Style Guide below will execute.

---

## 3. Visual / copy inventory — what to keep vs. replace

### Keep
- Primary logo lockup (gold on black / gold on deep green).
- Deep green + warm gold as the brand anchor.
- The address, phone, and location specificity — the Burlington, NC geography is a trust signal the site should lean into, not hide in a utility bar.
- Any proprietary practice photography (to be collected from Victor; not visible in the screenshot).

### Replace
- The mustard-yellow utility bar and floating tabs (wrong gold; fighting the logo).
- Stock hero photography (generic; not signaling Burlington or this practice specifically).
- Generic nav labels ("Welcome," "Patient Hub," "More").
- Body typography (no character; let Fraunces + Inter carry it).
- Three-way CTA path (consolidate to a single, persistent "Schedule a consult" path).

### Retire
- "More" nav item (collapse into the five others).
- Any floating widget that is not the primary scheduling path.
- Any blog content flagged in discovery as misaligned with the orthodontics-only positioning.

---

## 4. Copy direction derived from research

### Above-the-fold stack for M2 homepage
- **Eyebrow (small caps):** "Burlington, North Carolina · Orthodontic specialists"
- **H1 (Fraunces, display):** "Braces and aligners — and nothing else."
- **Sub-head (Inter, 18–20px):** "Daly Orthodontics is a specialty practice serving Burlington and the surrounding area. We don't do general dentistry. We do one thing — and we do it well."
- **Primary CTA:** "Schedule a consultation" (cream pill on green)
- **Secondary CTA:** "See our treatments" (text link, gold)

Rationale: within five seconds a new visitor confirms (1) this is an orthodontist, (2) they're in Burlington, (3) this practice is different from a general dental office. That's the 05-Target-Audience evaluation criteria #1–4 in one stack.

### Messaging spine (three pillars across the page)
Directly carried from `02-Brand-Identity.md` and repeated as section themes:
1. **Orthodontics Only** — the "what we do" section frames the practice against general dentistry, not alongside it.
2. **Local to Burlington, NC** — an "our practice" section anchored in location, not in generic "about us" language.
3. **Easy to Start** — the scheduling path is the one repeated affordance across the page, not a one-time CTA.

---

## 5. Technical findings to confirm at Friday call

Restated from the intake summary for convenience — these are research questions the team cannot answer without Victor/Dr. Daly:

- Domain spelling: dailyorthodontics.com vs. dalyorthodontics.com. Affects M1 migration plan (this is a 301 redirect strategy question, not a nice-to-have).
- Patient Hub: what is it, does it port to WordPress, and is dropping it acceptable for M1?
- Analytics stack: GA4? GTM? Third-party?
- CRM / practice-management integration: Dolphin, LocalMed, Weave, something else?
- Domain registrar: is the domain held by ProSites or by the client?
- Existing proprietary photography: what's owned, what's stock-licensed through ProSites?

---

## 6. Deliverables flowing from this research

- `output/03-system-tokens.md` — design tokens to execute Bucket A + B blend.
- `output/Homepage.html` — high-fidelity homepage embodying the above-the-fold stack and messaging spine.
- `output/Style Guide.html` — component library locking the pattern.
- `output/theme.json` — WordPress-ready token map.
- `output/Playbook.html` — client-branded process document.
- `final-package/` — assembled deliverable with deployment README.
