# Git Configuration Fix Script
# This script helps fix authentication issues and remove digitalboostplus references

Write-Host "=== Git Configuration Fix ===" -ForegroundColor Cyan
Write-Host ""

# Check current git config
Write-Host "Current Git Configuration:" -ForegroundColor Yellow
git config --list --show-origin | Select-String -Pattern "user\.|remote\." | ForEach-Object { Write-Host $_ }

Write-Host ""
Write-Host "Checking for digitalboostplus references..." -ForegroundColor Yellow
$configCheck = git config --list | Select-String -Pattern "digitalboostplus" -CaseSensitive:$false
if ($configCheck) {
    Write-Host "Found digitalboostplus references:" -ForegroundColor Red
    $configCheck | ForEach-Object { Write-Host $_ }
} else {
    Write-Host "No digitalboostplus references found in git config." -ForegroundColor Green
}

Write-Host ""
Write-Host "=== Fixing Configuration ===" -ForegroundColor Cyan

# Remove digitalboostplus from remote URLs if present
Write-Host "Checking remote URLs..." -ForegroundColor Yellow
$remotes = git remote -v
if ($remotes) {
    $remotes | ForEach-Object {
        if ($_ -match "digitalboostplus") {
            Write-Host "Found digitalboostplus in remote: $_" -ForegroundColor Red
            $remoteName = ($_ -split '\s+')[0]
            $currentUrl = ($_ -split '\s+')[1]
            $newUrl = $currentUrl -replace "digitalboostplus", "bacquisto-ns"
            Write-Host "Updating remote URL to: $newUrl" -ForegroundColor Yellow
            git remote set-url $remoteName $newUrl
        }
    }
}

# Set correct user (you may need to adjust these)
Write-Host ""
Write-Host "Setting Git user configuration..." -ForegroundColor Yellow
Write-Host "Please enter your Git username (or press Enter to skip):" -ForegroundColor Cyan
$gitUser = Read-Host
if ($gitUser) {
    git config user.name $gitUser
    Write-Host "Set user.name to: $gitUser" -ForegroundColor Green
}

Write-Host "Please enter your Git email (or press Enter to skip):" -ForegroundColor Cyan
$gitEmail = Read-Host
if ($gitEmail) {
    git config user.email $gitEmail
    Write-Host "Set user.email to: $gitEmail" -ForegroundColor Green
}

# Clear credential cache (Windows)
Write-Host ""
Write-Host "Clearing Windows credential cache..." -ForegroundColor Yellow
cmdkey /list | Select-String -Pattern "git" | ForEach-Object {
    if ($_ -match "git:") {
        $target = ($_ -split ':')[1].Trim()
        Write-Host "Removing credential: $target" -ForegroundColor Yellow
        cmdkey /delete:$target
    }
}

# Set correct remote for the new repo
Write-Host ""
Write-Host "Setting up remote for ns-employer-pages..." -ForegroundColor Yellow
$currentRemote = git remote get-url origin 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "No origin remote found. Adding origin..." -ForegroundColor Yellow
    git remote add origin https://github.com/bacquisto-ns/ns-employer-pages.git
} else {
    Write-Host "Current origin: $currentRemote" -ForegroundColor Yellow
    if ($currentRemote -notmatch "bacquisto-ns/ns-employer-pages") {
        Write-Host "Updating origin to: https://github.com/bacquisto-ns/ns-employer-pages.git" -ForegroundColor Yellow
        git remote set-url origin https://github.com/bacquisto-ns/ns-employer-pages.git
    }
}

Write-Host ""
Write-Host "=== Final Configuration ===" -ForegroundColor Cyan
git config --list | Select-String -Pattern "user\.|remote\." | ForEach-Object { Write-Host $_ }

Write-Host ""
Write-Host "=== Next Steps ===" -ForegroundColor Cyan
Write-Host "1. Review the configuration above" -ForegroundColor White
Write-Host "2. Run: git add ." -ForegroundColor White
Write-Host "3. Run: git commit -m 'Initial commit: Employer Portal Pages'" -ForegroundColor White
Write-Host "4. Run: git push -u origin main" -ForegroundColor White
Write-Host ""
Write-Host "If you encounter authentication issues, you may need to:" -ForegroundColor Yellow
Write-Host "- Use a Personal Access Token (PAT) instead of password" -ForegroundColor White
Write-Host "- Configure Git Credential Manager: git config --global credential.helper manager-core" -ForegroundColor White

