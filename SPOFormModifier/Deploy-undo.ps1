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

. .\UploadAndRegisterScripts-undo.ps1

. .\CreateList-undo.ps1

Write-Host -ForegroundColor Green "Retraction done."
