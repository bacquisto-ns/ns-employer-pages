# Git Configuration Fix - Manual Commands

## Step 1: Check Current Configuration
```powershell
git config --list
git remote -v
```

## Step 2: Remove digitalboostplus References

### Update Remote URL (if it contains digitalboostplus)
```powershell
git remote set-url origin https://github.com/bacquisto-ns/ns-employer-pages.git
```

### Check and remove from user.name if present
```powershell
git config --global --unset user.name
git config user.name "Your Name"  # Replace with your actual name
```

### Check and remove from user.email if present
```powershell
git config --global --unset user.email
git config user.email "your.email@example.com"  # Replace with your actual email
```

## Step 3: Clear Windows Credential Cache

### List stored credentials
```powershell
cmdkey /list
```

### Remove Git credentials (replace TARGET with the actual target from list)
```powershell
cmdkey /delete:git:https://github.com
cmdkey /delete:git:https://digitalboostplus@github.com
```

## Step 4: Set Correct Git User (if not already set)
```powershell
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Step 5: Configure Remote Repository
```powershell
# Remove old remote if exists
git remote remove origin

# Add correct remote
git remote add origin https://github.com/bacquisto-ns/ns-employer-pages.git

# Verify
git remote -v
```

## Step 6: Commit and Push

```powershell
# Navigate to the directory
cd "C:\claudecode\nueforms\Employer Portal Pages"

# Initialize if needed (only if not already a git repo)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: Employer Portal Pages"

# Set branch to main (if needed)
git branch -M main

# Push to remote
git push -u origin main
```

## If Authentication Fails

### Option 1: Use Personal Access Token (PAT)
1. Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate a new token with `repo` scope
3. When prompted for password, use the PAT instead

### Option 2: Configure Git Credential Manager
```powershell
git config --global credential.helper manager-core
```

### Option 3: Use SSH instead of HTTPS
```powershell
# Generate SSH key if you don't have one
ssh-keygen -t ed25519 -C "your.email@example.com"

# Add to GitHub (copy public key from ~/.ssh/id_ed25519.pub)
# Then change remote to SSH
git remote set-url origin git@github.com:bacquisto-ns/ns-employer-pages.git
```

