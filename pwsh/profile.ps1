if ($IsMacOS) {
  $env:PATH += ':/usr/local/bin'
}

function global:PromptWriteErrorInfo() {
  if ($global:GitPromptValues.DollarQuestion) { return }

  "`e[31m!" + ($global:GitPromptValues.LastExitCode ? $global:GitPromptValues.LastExitCode : '') + " `e[0m"
}

try {
  Import-Module posh-git -ErrorAction Silent
  $global:GitPromptSettings.BeforePath.Text = '$(PromptWriteErrorInfo)'
}
catch {
  Write-Warning 'posh-git is not installed or is misconfigured.'
}

$env:CLICOLOR = 1
$env:LSCOLORS = 'GxFxCxDxBxegedabagaced'

$LessExists = (Get-Command less -ErrorAction Ignore) ? $true : $false

function Get-HelpPaged() {
  if ($LessExists) {
    Get-Help @args | less
  }
  else {
    Get-Help @args | more
  }
}

function Get-HelpDetailPaged() {
  Get-HelpPaged @args
}

Set-Alias gh  Get-HelpPaged
Set-Alias ghd Get-HelpDetailPaged

Set-PSReadLineOption -PredictionSource History
