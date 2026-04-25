# Client Branch Deployment Workflow

## Overview
Each client project gets its own branch for deployment. This allows isolated delivery and individual GitHub Pages URLs per client while keeping the main branch clean.

## Branch Naming Convention
```
client-[company-name-slug]
```

Examples:
- `client-acme-corp`
- `client-blue-ocean-consulting` 
- `client-tech-startup-inc`

## Deployment Workflow

### 1. Start New Client Project
```bash
# Create and switch to client branch from main
git checkout main
git pull origin main
git checkout -b client-[company-name]

# Push new branch to set up tracking
git push -u origin client-[company-name]
```

### 2. Process Sales Handoff
```bash
# Extract client handoff files (these will be committed on client branch)
unzip "Sales Handoff — [Client Name].zip"

# Validate handoff completeness
grep -r "{{" "Sales Handoff — [Client Name]"

# If validation passes, run the YohDev skill
echo "run the YohDev playbook"
```

### 3. Execute YohDev Workflow
Follow the 6-phase process from `CLAUDE_COWORK_INSTRUCTIONS.md`:
- Phase 01: Intake
- Phase 02: Research  
- Phase 03: System
- Phase 04: Homepage
- Phase 05: Style Guide
- Phase 06: Package

### 4. Commit Deliverables
```bash
# Add all client files and generated output
git add .
git commit -m "Add [Client Name] website refresh deliverables

- Sales handoff package
- Homepage.html with design system
- Style Guide.html with components
- WordPress theme.json
- Deployment package ready"

# Push to client branch
git push origin client-[company-name]
```

### 5. Configure GitHub Pages
1. Go to repository Settings → Pages
2. Select source: "Deploy from a branch"
3. Choose branch: `client-[company-name]`
4. Folder: `/ (root)`
5. Save

**Result:** Client deliverables deploy to `https://[username].github.io/[repo]/`

### 6. Deliver to Client
```bash
# Create delivery summary
echo "# [Client Name] Website Refresh - DELIVERED

## Live URLs
- Homepage: https://[username].github.io/[repo]/output/Homepage.html
- Style Guide: https://[username].github.io/[repo]/output/Style-Guide.html  
- Playbook: https://[username].github.io/[repo]/output/Playbook.html

## Files Delivered
- Complete homepage HTML with inline CSS
- Comprehensive style guide with all components
- WordPress theme.json for CMS integration
- Deployment instructions and assets

## Next Steps
[Add client-specific next steps]
"
```

## Branch Management

### Multiple Clients
Each client gets isolated delivery:
```bash
# Client A
git checkout client-acme-corp
# Work on Acme deliverables

# Client B  
git checkout client-blue-ocean
# Work on Blue Ocean deliverables

# Back to main for new development
git checkout main
```

### Updates and Revisions
```bash
# Switch to client branch for updates
git checkout client-[company-name]

# Make revisions to output files
# Re-run specific phases as needed

# Commit updates
git add .
git commit -m "Update [specific changes] for [Client Name]"
git push origin client-[company-name]

# Pages automatically redeploys
```

### Cleanup After Project Complete
```bash
# Archive completed client branch (optional)
git tag archive/client-[company-name] client-[company-name]
git push origin archive/client-[company-name]

# Delete remote branch if desired
git push origin --delete client-[company-name]

# Keep local branch for reference
git branch -d client-[company-name]
```

## File Structure on Client Branch
```
client-[company-name]/
├── Sales Handoff — [Client Name]/     # Original handoff package
│   ├── 01-Discovery-Brief.md
│   ├── 02-Brand-Identity.md  
│   ├── ... (all 8 handoff files)
│   └── assets/                       # Client brand assets
├── output/                           # Generated deliverables  
│   ├── Homepage.html                 # Primary deliverable
│   ├── Style-Guide.html              # Design system docs
│   ├── Playbook.html                 # Process documentation
│   ├── theme.json                    # WordPress integration
│   ├── screenshots/                  # Research assets
│   └── final-package/               # Complete delivery folder
├── docs/                            # Skill documentation
└── .claude/                         # Skill implementation
```

## Key Benefits
- **Isolated delivery** - Each client has dedicated deployment
- **Clean main branch** - No client files pollute core repository
- **Individual URLs** - Each client gets their own Pages URL
- **Version control** - Full history of client project iterations
- **Easy handoff** - Complete package ready for client developer
- **Scalable** - Handle multiple concurrent client projects

## Troubleshooting

**If Pages deployment fails:**
1. Check branch exists: `git branch -r | grep client-[name]`
2. Verify output files exist: `ls -la output/`
3. Check Pages settings point to correct branch
4. Wait 5-10 minutes for Pages to build

**If client needs updates:**
1. Switch to client branch: `git checkout client-[name]`
2. Make changes to output files
3. Commit and push: `git add . && git commit -m "Update [changes]" && git push`
4. Pages auto-redeploys within minutes

**If output files missing:**
1. Ensure `output/` is not in `.gitignore` on client branch
2. Re-run YohDev workflow phases to regenerate
3. Check file permissions and paths
4. Commit all files in `output/` directory