# ==============================================================================
# Script de Subida Automatica a GitHub (Página de Descarga + APK)
# ==============================================================================
Param(
    [string]$RepoUrl = "https://github.com/themiguedev/biocampus-download.git"
)

$downloadDir = "C:\Users\migue\Documents\APP Tesis\download-page"
Set-Location $downloadDir

Write-Host "=====================================================" -ForegroundColor Green
Write-Host "  Subiendo Pagina de Descarga y APK a GitHub...     " -ForegroundColor Green
Write-Host "=====================================================" -ForegroundColor Green

# Configurar identidad de git si no existe
$gitName = git config user.name
if (-not $gitName) {
    git config user.name "themiguedev"
    git config user.email "themiguedev@users.noreply.github.com"
}

if (-not (Test-Path ".git")) {
    Write-Host "[1/3] Inicializando repositorio Git local..." -ForegroundColor Cyan
    git init
    git branch -M main
} else {
    Write-Host "[1/3] Repositorio Git local listo." -ForegroundColor Cyan
}

if ($RepoUrl -ne "") {
    Write-Host "[2/3] Vinculando remoto: $RepoUrl" -ForegroundColor Cyan
    git remote remove origin 2>$null
    git remote add origin $RepoUrl
}

Write-Host "[3/3] Preparando cambios y subiendo a GitHub..." -ForegroundColor Cyan
git add .
git commit -m "Actualizacion automatica de APK y Pagina Web de Descarga BioCampus"
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n=====================================================" -ForegroundColor Green
    Write-Host " ¡SUBIDA EXITOSA A GITHUB!" -ForegroundColor Green
    Write-Host " Tu página estará disponible en unos segundos en GitHub Pages." -ForegroundColor Yellow
    Write-Host "=====================================================" -ForegroundColor Green
} else {
    Write-Host "`n[AVISO] Si la subida requiere autenticacion, ingresa tus credenciales de GitHub." -ForegroundColor Red
}
