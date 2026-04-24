# Sales → Design Handoff

Boilerplate package the sales team fills out before a project enters the design queue.
Everything lives in a single folder so it can be zipped, attached to the HubSpot deal,
dropped into Google Drive, or loaded directly into Claude Desktop as Phase 01 Intake
context.

**Rule:** if any of the eight files is empty, the project is not ready. Send it back.

---

## Folder contents

| # | File | Purpose | Primary source |
|---|---|---|---|
| 01 | `01-Discovery-Brief.md` | Written summary of the discovery call | Otter transcript + HubSpot deal record |
| 02 | `02-Brand-Identity.md` | Voice, personality, positioning | Otter notes + intake form once Claude Desktop fires up |
| 03 | `03-Logo-and-Colors.md` | Asset manifest with file paths | Files the client uploaded / we captured |
| 04 | `04-Current-Website.md` | Live URL + sitemap snapshot | Domain + `/sitemap.xml` crawl |
| 05 | `05-Target-Audience.md` | Who we are designing for | Otter discovery notes |
| 06 | `06-Personas.md` | 1–3 specific persona cards | Otter discovery notes |
| 07 | `07-Strategy.md` | Approach, bets, guardrails | Otter discovery notes |
| 08 | `08-Client-Profile.md` | Communication style, priorities | Otter discovery notes |

---

## How these files get their context

```
┌─────────────────────┐      ┌─────────────────────┐
│ Discovery Call      │      │ HubSpot             │
│ (recorded in Otter) │      │ (deal + contact)    │
└──────────┬──────────┘      └──────────┬──────────┘
           │                            │
           │  transcript + summary      │  company, contacts,
           │                            │  deal value, timeline
           ▼                            ▼
     ┌──────────────────────────────────────┐
     │     Sales rep fills these 8 MDs      │
     │     (this folder is the template)    │
     └──────────────────┬───────────────────┘
                        │
                        ▼
         ┌────────────────────────────┐
         │  Claude Desktop — Phase 01 │
         │  Intake fires, reads the   │
         │  whole folder as context   │
         └────────────────────────────┘
```

Each file's top frontmatter block names its source. Sales fills in what they have;
the design lead fills any gaps during Phase 01 Intake questions.

---

## How to use

1. **Copy this folder** and rename it to the client — e.g. `Sales Handoff — Acme Co/`.
2. **Fill every `{{placeholder}}`.** Placeholders are wrapped in double curly braces so
   they're greppable. `grep -r "{{" .` before handoff — zero results means ready.
3. **Drop brand assets** (logo files, brand guide PDFs, reference photography) into
   `assets/` inside the copied folder. Update paths in `03-Logo-and-Colors.md`.
4. **Zip the folder** and attach to the HubSpot deal record. Move the deal stage to
   "Ready for Design".
5. **Design lead** pulls the zip, unzips into the project workspace, opens Claude
   Desktop, and runs the Phase 01 Intake prompt — which reads this whole folder.

---

## Conventions

- **Markdown only.** No Word docs, no Google Docs links as primary source. Links are
  fine as references inside the MD.
- **Frontmatter first.** Every file opens with a YAML block naming the source and
  last-updated date. Keeps provenance clear when files get edited later.
- **Don't invent content.** If you don't know an answer, write `{{unknown — ask in
  Phase 01}}`. That's a signal, not a failure. Blank sections hide; explicit unknowns
  get asked.
- **One client per folder.** Never mix two clients' handoff material.

---

## Next step

Once this package is complete and the deal is moved to "Ready for Design", the
[AI-Assisted Website Refresh Playbook](../Playbook.html) takes over.
