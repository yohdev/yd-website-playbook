# Deployment Guide

## How It Works

All deployments go through a single `gh-pages` branch. When you push to `main`, the reference site deploys to the root. When you push to a client branch (`client-*` or `daly`), the client preview deploys to `/branches/{name}/`. When a PR is closed, the preview is automatically deleted.

## Setup (One-Time)

### 1. GitHub Pages Source

Go to **Settings > Pages > Build and deployment > Source** and select:
- **Deploy from a branch**
- Branch: `gh-pages`
- Folder: `/ (root)`
- Click Save

### 2. Actions Permissions

Go to **Settings > Actions > General > Workflow permissions** and select:
- **Read and write permissions**

### 3. Branch Protection

Do **not** add branch protection to `gh-pages`. The workflow needs to push to it using the default `GITHUB_TOKEN`.

## Production Deployment (Main Branch)

Push to `main` and the workflow automatically:
1. Builds the reference site
2. Deploys to the root of `gh-pages`
3. Available at: `https://yohdev.github.io/yd-website-playbook/`

```bash
git checkout main
git add .
git commit -m "Update reference site"
git push origin main
```

## Client Preview Deployment

Push to a client branch and the workflow automatically:
1. Builds the client playbook
2. Deploys to `gh-pages/branches/{branch-name}/`
3. Available at: `https://yohdev.github.io/yd-website-playbook/branches/{branch-name}/`

```bash
git checkout -b client-acme
# ... generate playbook ...
git add .
git commit -m "Add Acme Corp playbook"
git push -u origin client-acme
```

## PR Workflow

When you open a PR from a client branch:
1. The workflow builds and deploys the preview
2. A bot comments on the PR with the live preview URL
3. Each new push updates the preview and the comment
4. When the PR is closed (merged or not), the preview is automatically deleted and a cleanup comment confirms it

## Branch Naming

The workflow recognizes these as client branches:
- `client-*` (preferred for new clients)
- `daly` (legacy, explicitly listed)

Any other branch (besides `main`) is ignored by the deployment workflow.

## Local Testing

Build and preview locally before pushing:

```bash
# Build the site
npm run build

# Serve locally at http://localhost:8000
npm run serve
```

## Cleanup

### Automatic

Closing a PR automatically removes its preview from `gh-pages`.

### Manual

If you need to clean up a preview without a PR:

```bash
git checkout gh-pages
rm -rf branches/{branch-name}
git add -A
git commit -m "Remove preview for {branch-name}"
git push origin gh-pages
```

## Troubleshooting

### Preview not deploying
- Check that Pages source is set to "Deploy from a branch: gh-pages"
- Check that Actions permissions are "Read and write"
- Check that `gh-pages` has no branch protection rules
- Check the Actions tab for workflow run errors

### Wrong content showing
- Clear browser cache
- Wait 1-2 minutes for GitHub Pages to propagate
- Check the Actions run log to confirm which files were deployed

### gh-pages branch doesn't exist
The workflow creates it automatically on the first run. If it fails, create it manually:

```bash
git checkout --orphan gh-pages
git rm -rf .
touch .nojekyll
git add .nojekyll
git commit -m "Initialize gh-pages"
git push origin gh-pages
```
