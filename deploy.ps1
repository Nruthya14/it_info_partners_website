# deploy.ps1 — Deploy Flutter web to GitHub Pages

# 1️⃣ Build Flutter web with correct base href
Write-Host "Building Flutter web..."
flutter build web --base-href=/it_info_partners_website/

# 2️⃣ Remove old docs folder
if (Test-Path "docs") {
    Write-Host "Removing old docs folder..."
    Remove-Item -Recurse -Force docs
}

# 3️⃣ Create new docs folder and copy build
Write-Host "Copying build/web to docs..."
mkdir docs
Copy-Item -Recurse build\web\* docs\

# 4️⃣ Commit and push to GitHub
Write-Host "Committing and pushing to GitHub..."
git add docs
git commit -m "Update Flutter web site"
git push origin main

Write-Host "Deployment complete! 🎉"
