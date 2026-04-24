# YohDev Website Refresh Skill

## Identity
- **Name:** `yohdev-website-refresh`
- **Display name:** YohDev Website Refresh
- **Description:** Turn a completed Sales Handoff package into a deployable client playbook — strategy doc, high-fidelity home page mock, and a block-theme style guide — in hours, not weeks.
- **Version:** 0.1.0

## Activation Triggers
This skill activates when:
- User mentions "Sales Handoff", "Discovery Brief", or "client kickoff"
- A folder matching `Sales Handoff/` or `Sales Handoff — *` exists in workspace
- User pastes files named `01-Discovery-Brief.md`, `02-Brand-Identity.md`, etc.
- User explicitly says "run the YohDev playbook" or "start Phase 01"

## Process Overview

### Phase 01 — Intake
- Reads all 8 handoff MDs
- Summarizes known vs. unknown
- Asks the 10 canonical questions
- Writes `output/01-intake-summary.md`
- Blocks on user approval

### Phase 02 — Research
- Crawls current website
- Fetches competitor screenshots
- Creates visual/copy inventory
- Writes `output/02-research.md` + screenshots
- Blocks on user approval

### Phase 03 — System
- Proposes design system tokens
- Creates palette, type scale, spacing
- Writes `output/03-system-tokens.md`
- Drafts initial Style Guide at 60% fidelity
- Blocks on token approval

### Phase 04 — Home Page
- Builds high-fidelity Homepage.html
- Uses real copy from audience + pillars
- Writes `output/Homepage.html`
- Blocks on user approval

### Phase 05 — Style Guide
- Completes Style Guide.html
- Documents all component patterns
- Generates theme.json for WordPress
- Writes `output/Style Guide.html` + `output/theme.json`
- Blocks on user approval

### Phase 06 — Package
- Assembles deployable folder
- Customizes Playbook.html with client brand
- Archives original handoff in `/brief/`
- Writes README with deploy instructions
- Ships final package

## The 10 Canonical Questions
1. What's the single most important thing the home page must communicate?
2. Who is the primary person this page must convert? (One persona, not three.)
3. What's the one action you want them to take?
4. What tone must this absolutely hit — and what tone must it absolutely avoid?
5. Are there sites you want us to look at as positive references? Negative references?
6. What's locked (logo, colors, copy, platform) and what's open?
7. What's your timeline, and what's driving it?
8. Who has sign-off authority, and who else is in the room at reviews?
9. How will you know this worked? (One measurable outcome.)
10. What would make you cancel this project mid-flight?

## Visual/Voice Rules
- No AI slop tropes (emoji-as-icons, aggressive gradients, SVG illustrations)
- Dark mode only when matching client brand
- No filler content
- Placeholder > bad attempt
- Match client's writing voice
- Type scale at real reading sizes (≥16px body)

## Failure Modes
- **Handoff incomplete:** List gaps, ask to proceed or bounce to sales
- **Logo raster-only:** Flag, request SVG, mark as deploy blocker
- **No photography:** Use labeled placeholders, add to stubs list
- **Current site is good:** Note in Phase 02, refine don't teardown
- **Conflicting guidance:** Surface explicitly in Phase 01
- **Multiple variants requested:** Push back, one direction executed well

## Not in Scope
- Multi-page sites (home page + style guide only)
- Copywriting beyond home page
- Logo/brand design
- Deployment (produces deployable package only)
- Live CMS integration (static HTML + theme.json)