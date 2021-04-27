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
