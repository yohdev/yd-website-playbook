# Deployment Guide

## GitHub Pages Setup

### Initial Setup (One Time)

1. **Enable GitHub Pages in your repository:**
   - Go to Settings → Pages
   - Under "Build and deployment", select "GitHub Actions" as the source
   - No other configuration needed - the workflow handles everything

2. **Set up Surge.sh for PR previews (Optional):**
   - Sign up at [surge.sh](https://surge.sh)
   - Get your token: `surge token`
   - Add as repository secret:
     - Go to Settings → Secrets and variables → Actions
     - Add new secret: `SURGE_TOKEN`
     - Paste your surge token

### Deployment Flow

## Production Deployment (Main Branch)

When you push to `main`:
1. GitHub Actions automatically builds the site
2. Deploys to GitHub Pages
3. Available at: `https://[username].github.io/[repo-name]/`

```bash
# Deploy to production
git add .
git commit -m "Deploy client deliverables"
git push origin main
```

## Preview Deployment (Pull Requests)

When you open a PR:
1. GitHub Actions builds a preview
2. Deploys to Surge.sh (if configured)
3. Comments on PR with preview link
4. Updates on each new commit

```bash
# Create a feature branch
git checkout -b client-name-refresh

# Make changes and push
git add .
git commit -m "Add client deliverables"
git push origin client-name-refresh

# Open PR on GitHub - preview link appears in comments
```

## Local Testing

Test the build locally before deploying:

```bash
# Build the site
npm run build

# Serve locally at http://localhost:8000
npm run serve

# Manual preview deployment (optional)
npm run deploy:preview
```

## Build Logic

The build system is smart about what to deploy:

1. **With Client Deliverables** (in `output/` folder):
   - Deploys Homepage.html as index
   - Includes Style Guide and Playbook
   - Copies all assets and theme files

2. **Without Client Deliverables** (reference only):
   - Deploys reference implementation
   - Uses home-page.html as index
   - Includes reference style guide and playbook

3. **Empty State**:
   - Shows instructions to run the skill

## File Structure

### Source Files
```
├── output/                  # Client deliverables (if generated)
│   ├── Homepage.html
│   ├── Style Guide.html
│   └── Playbook.html
├── home-page.html          # Reference implementation
├── style-guide.html
└── play-book.html
```

### After Build
```
dist/
├── index.html              # Homepage (client or reference)
├── style-guide.html
├── playbook.html
├── assets/                 # Images, fonts, etc.
├── docs/                   # Documentation
└── .nojekyll              # Disable Jekyll processing
```

## Workflow Configuration

The GitHub Actions workflow (`.github/workflows/deploy.yml`) handles:

- **Main branch**: Deploy to GitHub Pages
- **Pull requests**: Deploy preview to Surge.sh
- **Smart building**: Detects client vs reference content
- **PR comments**: Automatic preview links

## Troubleshooting

### GitHub Pages not working
- Check Settings → Pages → Source is "GitHub Actions"
- Verify workflow has `pages: write` permission
- Check Actions tab for build errors

### Surge preview not working
- Verify `SURGE_TOKEN` secret is set
- Check Actions logs for Surge errors
- Ensure surge.sh account is active

### Build failing
- Run `npm run build` locally to test
- Check for missing files in output/
- Verify HTML files are valid

### Wrong content deployed
- Clear browser cache
- Check which branch is deployed
- Verify output/ folder contents

## Custom Domain (Optional)

To use a custom domain with GitHub Pages:

1. Add domain in Settings → Pages → Custom domain
2. Create `CNAME` file in root with your domain:
   ```
   client.yohdev.com
   ```
3. Configure DNS:
   - A records: `185.199.108-111.153`
   - CNAME: `[username].github.io`

## Security Notes

- Never commit sensitive client data
- Use environment variables for API keys
- Keep `SURGE_TOKEN` in GitHub Secrets
- Review PR previews before sharing

## Monitoring

Track deployments:
- **GitHub Pages**: Check Settings → Pages for status
- **Actions**: Monitor workflow runs in Actions tab
- **Preview links**: Find in PR comments
- **Build artifacts**: Download from Actions runs