#!/usr/bin/env pwsh

$ErrorActionPreference = 'Stop'

Get-Module -Name posh-git -OutVariable module | Out-Null
if ($module.Count -and (Test-Path $module[0].Path)) {
  Write-Host 'Updating posh-git...'
  if ($IsWindows) {
    choco upgrade -y poshgit
  }
  else {
    PowerShellGet\Update-Module posh-git
  }
}
else {
  Write-Host 'Installing posh-git...'
  if ($IsWindows) {
    choco install -y poshgit
  }
  else {
    PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
  }
}

if (!(Test-Path $PROFILE)) {
  New-Item -Path $PROFILE -ItemType File -Force | Out-Null
}

$dotSourceLine = "try { . '~/.dotfiles/pwsh/profile.ps1' } catch { }"
if (! (Get-Item $PROFILE | Select-String -Pattern "^$([regex]::Escape($dotSourceLine))$" -Quiet)) {
  Add-Content $PROFILE "`n$dotSourceLine"
}
