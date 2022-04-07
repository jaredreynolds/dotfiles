# Install-Module -Name AWS.Tools.Installer
Update-Module -Name AWS.Tools.Installer

# Get-AWSService | Select-Object ModuleName
$tools = @(
    'AWS.Tools.DynamoDBv2',
    'AWS.Tools.ECR',
    'AWS.Tools.EventBridge',
    'AWS.Tools.S3',
    'AWS.Tools.SecurityToken')

Install-AWSToolsModule $tools -Cleanup

Get-Module -ListAvailable -Name AWS.Tools*
