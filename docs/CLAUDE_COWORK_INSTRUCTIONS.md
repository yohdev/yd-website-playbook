# Claude Co-Work Instructions
## YohDev Website Refresh Repository

### Overview
This repository contains the **YohDev Website Refresh Skill** - an automated workflow that converts Sales Handoff packages into deployable client playbooks (strategy doc, homepage mock, and style guide) in hours rather than weeks.

### Repository Structure
```
.claude/skills/yohdev-website-refresh/
├── SKILL.md                    # Core skill definition and workflow
├── phases/                     # Individual workflow phases
│   ├── phase-01-intake.md      # Reads handoff files, asks 10 questions
│   ├── phase-02-research.md    # Crawls site, analyzes competitors
│   ├── phase-03-system.md      # Creates design system tokens
│   ├── phase-04-homepage.md    # Builds high-fidelity homepage
│   ├── phase-05-style-guide.md # Complete style guide + theme.json
│   └── phase-06-package.md     # Final deliverable assembly
├── prompts/                    # Reusable prompt templates
└── reference/                  # Example files and handoff templates
```

### How to Work with This Skill

#### 1. When User Uploads Sales Handoff
When the user uploads a sales handoff zip file, follow this process:

```bash
# Extract the uploaded zip file
unzip "Sales Handoff — [Client Name].zip"

# Verify all 8 required files are present
ls -la "Sales Handoff — [Client Name]"/*.md

# Check for any incomplete placeholders
grep -r "{{" "Sales Handoff — [Client Name]"

# If grep returns results, list gaps and ask user to complete or proceed
# If no results, the handoff is complete and ready for Phase 01
```

**Required Sales Handoff Files:**
1. `01-Discovery-Brief.md` - Written summary from discovery call
2. `02-Brand-Identity.md` - Voice, personality, positioning  
3. `03-Logo-and-Colors.md` - Asset manifest with file paths
4. `04-Current-Website.md` - Live URL + sitemap snapshot
5. `05-Target-Audience.md` - Who we're designing for
6. `06-Personas.md` - 1-3 specific persona cards
7. `07-Strategy.md` - Approach, bets, guardrails
8. `08-Client-Profile.md` - Communication style, priorities

**Validation Rules:**
- All 8 files must exist and contain content
- No `{{placeholder}}` text should remain (check with grep)
- Asset paths in `03-Logo-and-Colors.md` must point to actual files
- If any file is empty or contains only placeholders, send back to sales team

#### 2. Skill Activation Triggers
The skill automatically starts when:
- Files named `01-Discovery-Brief.md`, `02-Brand-Identity.md`, etc. are present
- User mentions "Sales Handoff", "Discovery Brief", or "client kickoff"
- User explicitly says "run the YohDev playbook" or "start Phase 01"

#### 3. Phase Execution Workflow

**Phase 01 - Intake**
```bash
# Read the intake phase instructions
cat .claude/skills/yohdev-website-refresh/phases/phase-01-intake.md

# Execute the intake process:
# 1. Read all 8 handoff markdown files
# 2. Summarize what's known vs. unknown
# 3. Ask the 10 canonical questions
# 4. Create output/01-intake-summary.md
# 5. BLOCK for user approval before continuing
```

**Phase 02 - Research**
```bash
# Execute research phase:
# 1. Crawl the client's current website
# 2. Capture competitor screenshots  
# 3. Create visual/copy inventory
# 4. Generate output/02-research.md with screenshots
# 5. BLOCK for user approval
```

**Phase 03 - System**
```bash
# Execute system design phase:
# 1. Propose design system tokens (palette, typography, spacing)
# 2. Create output/03-system-tokens.md
# 3. Draft initial Style Guide at 60% fidelity
# 4. BLOCK for token approval
```

**Phase 04 - Homepage**
```bash
# Execute homepage build phase:
# 1. Build high-fidelity Homepage.html
# 2. Use real copy from audience research and brand pillars
# 3. BLOCK for user approval
```

**Phase 05 - Style Guide**
```bash
# Execute style guide completion:
# 1. Complete Style Guide.html with all component patterns
# 2. Generate WordPress theme.json
# 3. BLOCK for user approval
```

**Phase 06 - Package**
```bash
# Execute final packaging:
# 1. Assemble final deliverable folder
# 2. Customize Playbook.html with client branding
# 3. Archive original handoff materials
# 4. Create deployment README
```

#### 4. The 10 Canonical Questions (Always Ask in Phase 01)

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

#### 5. Important Rules

**Visual/Voice Guidelines:**
- No AI clichés (emoji icons, aggressive gradients, generic SVG illustrations)
- Dark mode only when matching client brand
- No filler content - use labeled placeholders instead
- Match the client's actual writing voice
- Typography at real reading sizes (≥16px body text)

**Failure Mode Handling:**
- Incomplete handoff: List gaps, ask to proceed or return to sales
- Missing assets: Flag issues, use placeholders, mark as deployment blockers
- Conflicting guidance: Surface explicitly in Phase 01
- Multiple variants requested: Push back - execute one direction well

**Scope Limitations:**
- Home page + style guide only (no multi-page sites)
- No copywriting beyond homepage
- No logo/brand design
- No actual deployment (produces deployable package only)
- No live CMS integration (static HTML + theme.json)

#### 6. Working with Reference Files

The skill includes reference implementations:
```bash
# Copy reference files to working directory when needed
cp .claude/skills/yohdev-website-refresh/reference/Homepage.html ./output/
cp .claude/skills/yohdev-website-refresh/reference/Style-Guide.html ./output/
cp .claude/skills/yohdev-website-refresh/reference/Playbook.html ./output/
```

#### 7. Working with the Phases

Each phase file in `/phases/` contains:
- Specific prompts for that workflow step
- Expected deliverables
- Approval criteria
- Handoff requirements to next phase

Always execute phases sequentially and wait for user approval at each block point.

#### 8. Output Structure

All deliverables go into an `output/` directory:
```
output/
├── 01-intake-summary.md        # Phase 01 deliverable
├── 02-research.md              # Phase 02 deliverable  
├── 03-system-tokens.md         # Phase 03 deliverable
├── Homepage.html               # Phase 04 deliverable
├── Style Guide.html            # Phase 05 deliverable
├── theme.json                  # WordPress theme file
├── Playbook.html              # Client-branded process doc
├── screenshots/               # Research imagery
└── final-package/             # Complete deliverable folder
    ├── README.md              # Deployment instructions
    └── brief/                 # Archived handoff materials
```

### Deployment Workflow

**IMPORTANT:** Each client gets their own branch for deployment to GitHub Pages.

**1. Start new client project:**
```bash
# Create client branch from main
git checkout main
git pull origin main
git checkout -b client-[company-name]
git push -u origin client-[company-name]
```

**2. Process sales handoff:**
```bash
# Extract and validate handoff files
unzip "Sales Handoff — [Client Name].zip"
grep -r "{{" "Sales Handoff — [Client Name]"  # Should return zero results
```

**3. Run YohDev workflow:**
```bash
# Trigger skill activation
echo "run the YohDev playbook"
```

**4. Commit deliverables:**
```bash
# Add all files including output/ (not ignored on client branches)
git add .
git commit -m "Add [Client Name] website refresh deliverables"
git push origin client-[company-name]
```

**5. Configure GitHub Pages:**
- Go to Settings → Pages
- Select branch: `client-[company-name]`
- Folder: `/ (root)`
- Client deliverables deploy to your GitHub Pages URL

See `CLIENT_BRANCH_DEPLOYMENT.md` for complete deployment workflow.

### Key Commands for Co-Work

**Phase management:**
```bash
# Read phase instructions before execution
cat .claude/skills/yohdev-website-refresh/phases/phase-0[1-6]-*.md

# Always get explicit user approval before proceeding to next phase
echo "Phase [X] complete. Proceed to Phase [X+1]? (y/n)"
```

### Error Recovery and Troubleshooting

**If handoff is incomplete:**
1. Run `grep -r "{{" .` to identify missing placeholders
2. List specific gaps to user
3. Ask whether to proceed with gaps or return to sales team
4. Document assumptions made if proceeding

**If assets are missing:**
1. Note missing files in phase output
2. Use labeled placeholders: `[LOGO PLACEMENT - SVG REQUIRED]`
3. Add to deployment blockers list
4. Flag for client to provide before launch

**If client requirements conflict:**
1. Surface conflicts explicitly in Phase 01 summary
2. Force prioritization decisions
3. Document chosen direction and rationale
4. Get explicit sign-off before proceeding

### Integration Notes

- This skill leverages Claude's file reading, web crawling, and HTML generation capabilities
- It expects to work with real client assets and content
- The workflow is designed with review gates to maintain quality control
- Final output is deployment-ready but requires human oversight for client delivery
- Each phase builds on the previous phase's approved output
- The skill is optimized for single-page website refreshes with style guide delivery