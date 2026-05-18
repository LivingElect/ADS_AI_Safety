# 将本目录推送到 GitHub 并触发 Pages 部署
# 需已配置 GitHub 凭据（HTTPS 令牌或 SSH），且本机可访问 github.com

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

if (-not (Test-Path ".git")) {
    git init
    git branch -M main
}

git add -A
$status = git status --porcelain
if ($status) {
    git commit -m "feat: publish html site and GitHub Pages workflow"
}

$remote = git remote get-url origin 2>$null
if (-not $remote) {
    git remote add origin https://github.com/LivingElect/ADS_AI_Safety.git
}

git push -u origin main
Write-Host ""
Write-Host "Push done. Enable Pages: repo Settings -> Pages -> Source -> GitHub Actions"
Write-Host "Site URL (after first workflow): https://livingelect.github.io/ADS_AI_Safety/"
