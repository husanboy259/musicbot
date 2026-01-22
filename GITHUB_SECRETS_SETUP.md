# How to Configure GitHub Secrets for Auto-Deployment

The error "missing server host" means you need to add GitHub Secrets. Follow these steps:

## Step 1: Go to GitHub Repository Settings

1. Go to: **https://github.com/husanboy259/musicbot**
2. Click **Settings** (top menu)
3. Click **Secrets and variables** → **Actions** (left sidebar)
4. Click **New repository secret**

## Step 2: Add Required Secrets

Add these 3 secrets (click "New repository secret" for each):

### Secret 1: VPS_HOST
- **Name:** `VPS_HOST`
- **Value:** Your VPS IP address or domain
  - Example: `192.168.1.100` or `vps.example.com` or `your-server.com`

### Secret 2: VPS_USER  
- **Name:** `VPS_USER`
- **Value:** Your SSH username
  - Example: `root` or `ubuntu` or `your-username`

### Secret 3: VPS_SSH_KEY
- **Name:** `VPS_SSH_KEY`
- **Value:** Your private SSH key

**To get your SSH key:**
```bash
# On your VPS or local machine
cat ~/.ssh/id_rsa
```

Copy the ENTIRE output including:
```
-----BEGIN OPENSSH PRIVATE KEY-----
[your key content]
-----END OPENSSH PRIVATE KEY-----
```

### Secret 4: VPS_PORT (Optional)
- **Name:** `VPS_PORT`
- **Value:** `22` (or your custom SSH port)
- Only add this if you use a non-standard SSH port

## Step 3: Generate SSH Key (if you don't have one)

If you don't have an SSH key:

```bash
# On your VPS
ssh-keygen -t rsa -b 4096 -C "github-actions-musicbot" -f ~/.ssh/github_actions_key

# Add public key to authorized_keys
cat ~/.ssh/github_actions_key.pub >> ~/.ssh/authorized_keys

# Display private key (copy this for GitHub Secret)
cat ~/.ssh/github_actions_key
```

## Step 4: Test Deployment

After adding secrets, push a change to trigger deployment:

```bash
git add .
git commit -m "Test deployment"
git push
```

Then check the **Actions** tab on GitHub to see if it works!

---

## Don't Have a VPS?

If you don't have a VPS server and don't want auto-deployment, you can disable the workflow (see Option 2 below).
