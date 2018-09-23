param (
	[Parameter(Mandatory=$true)]
	[string]$Url,
	$Credentials
)

if ($Credentials -eq $null)
{
	$Credentials = Get-Credential
}

Connect-PnPOnline -Url $Url -Credentials $Credentials

. .\CreateList.ps1

. .\UploadAndRegisterScripts.ps1

. .\CleanUpQuicklaunch.ps1

Write-Host -ForegroundColor Green "Deployment done."
