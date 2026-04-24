# YohDev Website Refresh Skill

A Claude Code skill that transforms a Sales Handoff package into a deployable website playbook with strategy documentation, high-fidelity home page, and block-theme style guide.

## Quick Start

1. **Check if you have a Sales Handoff folder:**
   ```bash
   npm run skill
   ```

2. **Create a new client handoff:**
   ```bash
   npm run new-client "Client Name"
   ```

3. **Run the playbook:**
   ```bash
   npm run skill
   # Or explicitly: "run the YohDev playbook"
   ```

## Structure

```
.claude/skills/yohdev-website-refresh/
├── SKILL.md                    # Skill metadata and triggers
├── run-skill.js                # Main skill entry point
├── state.json                  # Default state template
├── phases/                     # Phase documentation
│   ├── phase-01-intake.md
│   ├── phase-02-research.md
│   ├── phase-03-system.md
│   ├── phase-04-homepage.md
│   ├── phase-05-style-guide.md
│   └── phase-06-package.md
├── scripts/                    # Helper scripts
│   ├── check-handoff.sh       # Validate handoff completeness
│   ├── new-client.sh          # Create new client folder
│   ├── screenshot-current-site.sh
│   └── state-manager.js       # Phase state tracking
└── reference/                  # Reference implementations
    ├── Homepage.html
    ├── Style-Guide.html
    ├── Playbook.html
    └── Sales-Handoff/         # Template handoff files
```

## Sales Discovery Process

### For Technical Sales Reps
Two system prompts are available to help gather and organize discovery information:

1. **Sales Discovery Prompt** (`.claude/skills/yohdev-website-refresh/prompts/sales-discovery-prompt.md`)
   - Comprehensive question flow for discovery calls
   - Covers all 8 required handoff documents
   - Includes the 10 canonical questions
   - Red flags to watch for

2. **Handoff Template Generator** (`.claude/skills/yohdev-website-refresh/prompts/handoff-template-generator.md`)
   - Use with Claude to transform call notes into handoff docs
   - Can process transcripts, recordings, or live notes
   - Generates all 8 required MD files
   - Marks gaps with `{{need: description}}` placeholders

## Commands

### Skill Management
- `npm run skill` - Run the YohDev Website Refresh skill
- `npm run check-handoff` - Check handoff folder for completeness
- `npm run new-client "Name"` - Create new client handoff folder

### Phase Execution
- `npm run phase:01` - Start Phase 01 (Intake)
- `npm run phase:02` - Start Phase 02 (Research)
- `npm run phase:03` - Start Phase 03 (System)
- `npm run phase:04` - Start Phase 04 (Home Page)
- `npm run phase:05` - Start Phase 05 (Style Guide)
- `npm run phase:06` - Start Phase 06 (Package)
- `npm run continue` - Continue with next phase

### State Management
- `npm run state:status` - Check current progress
- `npm run state:reset` - Reset skill state

## Required Sales Handoff Files

The skill requires these 8 files in the Sales Handoff folder:

1. `01-Discovery-Brief.md` - Project overview and goals
2. `02-Brand-Identity.md` - Brand voice and positioning
3. `03-Logo-and-Colors.md` - Visual assets and palette
4. `04-Current-Website.md` - Existing site analysis
5. `05-Target-Audience.md` - Market and demographics
6. `06-Personas.md` - User profiles and needs
7. `07-Strategy.md` - Business and content strategy
8. `08-Client-Profile.md` - Company information

## Process Overview

### Phase 01 - Intake
- Reads all handoff documents
- Asks the 10 canonical questions
- Documents decisions and assumptions
- **Output:** `output/01-intake-summary.md`

### Phase 02 - Research
- Crawls current website
- Captures competitor screenshots
- Creates visual/copy inventory
- **Output:** `output/02-research.md` + screenshots

### Phase 03 - System
- Defines design tokens (colors, type, spacing)
- Creates initial style guide
- **Output:** `output/03-system-tokens.md` + Style Guide (60%)

### Phase 04 - Home Page
- Builds high-fidelity homepage
- Uses real copy and messaging
- **Output:** `output/Homepage.html`

### Phase 05 - Style Guide
- Completes component documentation
- Generates WordPress theme.json
- **Output:** Complete `Style Guide.html` + `theme.json`

### Phase 06 - Package
- Assembles final deliverables
- Customizes playbook with client brand
- Archives original handoff
- **Output:** Complete package ready for deployment

## Final Deliverable Structure

```
{{client-slug}}-website-refresh/
├── Homepage.html               # High-fidelity home page
├── Style Guide.html           # Component library
├── Playbook.html              # Strategy documentation
├── assets/                    # Images, logos, fonts
├── theme/                     # WordPress theme files
├── brief/                     # Original handoff (archived)
├── output/                    # Phase artifacts
├── README.md                  # Deployment instructions
└── .nojekyll                 # GitHub Pages config
```

## Activation Triggers

The skill activates when:
- User mentions "Sales Handoff", "Discovery Brief", or "client kickoff"
- A `Sales Handoff/` folder exists in the workspace
- User says "run the YohDev playbook" or "start Phase 01"

## Design Principles

- **No AI slop** - No emoji icons, aggressive gradients, or generic illustrations
- **Real content** - No lorem ipsum or filler text
- **Placeholder > bad attempt** - Label missing assets clearly
- **Match client voice** - Use brand language from handoff
- **Readable type** - Body ≥16px, presentations ≥24px

## Not in Scope

- Multi-page websites (home page only)
- Copywriting beyond homepage
- Logo or brand design
- Deployment (package only)
- CMS integration (static HTML)

## Deployment

The project includes automated deployment to GitHub Pages and PR previews:

- **Production**: Automatically deploys to GitHub Pages when pushing to `main`
- **Previews**: Creates preview deployments for pull requests using Surge.sh
- **Local Testing**: Use `npm run build` and `npm run serve`

See [DEPLOYMENT.md](DEPLOYMENT.md) for complete setup and deployment instructions.

### Quick Deploy Commands

```bash
# Build locally
npm run build

# Test locally
npm run serve

# Deploy to production
git push origin main

# Create PR for preview
git checkout -b client-refresh
git push origin client-refresh
# Open PR on GitHub - preview link appears automatically
```