# How to Disable GitHub Actions Auto-Deployment

If you don't have a VPS or don't want automatic deployment, you can disable GitHub Actions:

## Method 1: Disable via GitHub UI (Easiest)

1. Go to: **https://github.com/husanboy259/musicbot**
2. Click **Actions** tab
3. Click **Deploy MusicBot to VPS** workflow
4. Click **...** (three dots menu) → **Disable workflow**

## Method 2: Delete the Workflow File

Delete the workflow file from your repository:

```bash
cd rvbot
rm .github/workflows/deploy.yml
git add .
git commit -m "Remove auto-deployment workflow"
git push
```

## Method 3: Comment Out the Trigger

Edit `.github/workflows/deploy.yml` and comment out the `on:` section:

```yaml
# on:
#   push:
#     branches:
#       - main
```

Then commit and push.

---

**Note:** The bot will still work locally. This only disables automatic deployment to a VPS server.
