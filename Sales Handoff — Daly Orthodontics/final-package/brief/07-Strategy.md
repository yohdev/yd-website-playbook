# Strategy — Daly Orthodontics Website Refresh

---
file: 07-Strategy
project: Daly Orthodontics — Website Refresh
client: Victor Daniel Daly
owner: sales
created: 2026-04-24
last_updated: 2026-04-24
source: Discovery call transcript (2026-04-21), structured brief
---

## The bet

Most orthodontic practice sites in regional markets get rebuilt as vanity projects — new visuals, new copy, generic "straighter smiles" messaging — while the underlying infrastructure keeps the practice hostage to a vendor and the SEO content actively repels the right patients. Daly Orthodontics doesn't have a brand problem right now. It has an ownership problem and a signal problem. The bet is that the highest-leverage move in this market isn't a prettier homepage — it's a clean, self-owned platform that sends Google an unambiguous orthodontics-only signal and gives a busy practice owner the ability to run his own site without calling anyone for permission.

---

## The approach

**Primary goal of the site (Milestone 1):**
Establish a fully client-owned WordPress presence that preserves existing SEO equity, eliminates vendor dependency, and converts local orthodontic traffic into appointment inquiries — without the noise of irrelevant dental content diluting the practice's search signals or wasting ad spend.

**The one action:**
Book a consultation / contact the practice (primary CTA across all pages).

**How we earn that action:**
The site needs to do one thing clearly and fast: confirm to a Burlington-area parent or adult searcher that this is an orthodontics-only practice that handles exactly what they're looking for, then make it trivially easy to get in touch. Right now the site is undermining that moment with blog content that signals general dentistry and oral surgery to both Google and the visitor. Milestone 1 cleans that signal by migrating on a one-for-one basis with a selective content audit on the blog, and polishing the mobile experience so the contact path isn't buried in a crowded nav. The trust is earned not through new design but through clarity, speed, and relevance.

---

## What's locked

- Existing URL structure and page hierarchy must be preserved one-for-one to protect backlink equity and prevent Google reindexing the site as new
- All existing high-value SEO pages identified in the pre-migration scan must migrate intact, with no URL changes
- WordPress with native block builder only — no third-party page builder plugins (Elementor, Divi, etc.) per YohDev standard and client longevity requirements
- Existing site content (text, images including proprietary practice photos) migrates as-is in Milestone 1 — no copy rewrites or brand redesign in this phase
- Bi-weekly check-in meetings with screen-share reviews throughout the engagement

## What's open

- Blog content is open for evaluation: approximately one post per week from 2025 onward should be audited; posts that actively undermine orthodontic positioning (including the post discouraging orthodontist visits) should be flagged for suppression or noindex rather than migrated
- Mobile navigation layout is open for cleanup and restructuring — this is one of the few UX improvements explicitly in Milestone 1 scope
- Hosting architecture is open: client can choose YohDev-managed hosting or a client-selected host with YohDev support; recommendation should favour easy client exit if needed
- Future Milestone 2 brand and design direction is fully open — Victor and his wife are actively reviewing portfolio examples before the Friday follow-up call

---

## Guardrails

- Hard deadline: site must be live and ProSites subscription cancellable before the June 2026 billing cycle — this is non-negotiable and governs every sequencing decision in Milestone 1
- Full UX redesign is out of scope for Milestone 1 — any design changes are limited to mobile nav polish; do not expand scope under time pressure
- No SEO content strategy, blog writing, or Google Ads management is contracted in this phase — surface these as clear Milestone 2 and ongoing retainer opportunities, but do not fold them into the current quote
- Migration must be treated as a content preservation exercise, not a content improvement exercise — Google must read the migrated site as the same site, not a relaunch
- Client technical comfort is low-to-moderate; the CMS handoff must include enough onboarding that Victor can make basic updates independently without calling YohDev

---

## Risks

- **ProSites content export friction:** ProSites does not provide clean migration paths — manual page-by-page extraction is likely, which compresses the already tight timeline. Scope should account for this explicitly and set expectations early.
- **Blog content volume:** Roughly 50–70 posts may exist from the past year. Auditing and deciding the disposition of each post (migrate, noindex, redirect, discard) takes time. A clear decision framework agreed with the client upfront will prevent this from becoming a bottleneck.
- **SEO regression during cutover:** Even a careful one-for-one migration carries some temporary ranking volatility risk. The pre-migration SEO scan and a post-launch monitoring window should be positioned as standard practice, not as a disclaimer.
- **Double-billing anxiety:** Victor has explicitly expressed concern about paying both ProSites and YohDev at the same time during transition. The project timeline and payment structure should be presented in a way that makes the overlap period feel controlled and bounded.
- **Scope creep into Milestone 2:** Victor and his wife reviewing example sites before Friday creates a real risk that the follow-up conversation blurs the line between lift-and-shift and redesign. Andrew should go into that call with a clear written scope boundary and a separate Milestone 2 quote ready to present rather than field redesign decisions live.
- **Decision-maker split:** Victor handles the business side, but his wife (the practicing orthodontist) is a co-decision-maker and will be reviewing examples. Any strategic or creative recommendation that Victor agrees to in isolation may need to be re-confirmed with her before it's locked.
- **Anti-audience SEO debt:** The existing ProSites blog content may have built rankings and backlinks for dental and oral surgery keywords. Migrating those posts without flagging them could perpetuate the wrong-traffic problem even after leaving ProSites. The pre-migration audit must surface this clearly.

---

## What "done" looks like

Milestone 1 is done when the site is live on WordPress before the June 2026 billing date, Victor has cancelled his ProSites subscription, and Google sees no meaningful change in site identity or rankings. Practically: Victor owns his domain, his content, and his hosting; he can log into WordPress and update a page or add a post without calling anyone; the mobile navigation is clean enough that a parent searching on their phone can find the contact page in one tap; and the site is no longer sending Google signals that Daly Orthodontics treats dental or oral surgery patients.

---

## Open strategic questions for Phase 01

- [ ] What is the exact ProSites contract cancellation notice period and cutoff date — does "before June billing" mean cancelled by May 31 or earlier?
- [ ] Which pages does Victor consider highest priority to protect from any ranking disruption (homepage, services pages, specific treatment pages)?
- [ ] What is the disposition policy for the problematic blog posts — noindex and leave, redirect to a relevant page, or delete with 410? Client needs to make this call with SEO implications explained.
- [ ] Does the client own the domain outright, or is it registered through ProSites? (If the latter, domain transfer must be factored into the timeline.)
- [ ] What hosting preference does Victor lean toward: YohDev-managed or self-managed? This affects infrastructure setup time.
- [ ] Are the proprietary practice photos accessible as original files, or must they be scraped from the current site?
- [ ] What is the wife's name and role in approvals — should she be added as a named stakeholder and copied on communications?
- [ ] Is there an existing Google Search Console and Google Analytics setup under ProSites ownership, or does that need to be created and verified fresh on migration?
- [ ] What is Victor's definition of "basic content updates" — adding a page, editing body text, swapping a photo, posting a blog? This scopes the WordPress onboarding and training component.
- [ ] Is there appetite to add an orthodontics-specific blog content strategy as an optional add-on to Milestone 1, or is that firmly a Milestone 2 conversation?