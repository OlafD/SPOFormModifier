
# the script is assuming that a connection to a SharePoint Online site is already established

Write-Host -ForegroundColor Magenta "Upload scripts"

Write-Host "Create scripts library"

$l = New-PnPList -Title "Scripts" -Template DocumentLibrary -Url "scripts" -OnQuickLaunch:$false

Write-Host "Disable modern ui for scripts library"

$list = Get-PnPList -Identity "Scripts" -Includes "ListExperienceOptions"
(Get-PnPContext).Load($list)
Invoke-PnPQuery

$list.ListExperienceOptions = "ClassicExperience"
$list.Update()
Invoke-PnPQuery

Write-Host "Upload the script files"

Write-Host "- FormModifierLoader.js"

$f = Add-PnPFile -Path .\Scripts\FormModifierLoader.js -Folder "scripts"

Write-Host "- StatusListNewForm.js"

$f = Add-PnPFile -Path .\Scripts\StatusListNewForm.js -Folder "scripts"

Write-Host "- StatusListDispForm.js"

$f = Add-PnPFile -Path .\Scripts\StatusListDispForm.js -Folder "scripts"

Write-Host "- StatusListEditForm.js"

$f = Add-PnPFile -Path .\Scripts\StatusListEditForm.js -Folder "scripts"

Write-Host "Register script files"

Write-Host "- jQuery"

$jsLink = Get-PnPJavaScriptLink -Name "jQuery" -Scope Site

if ($jsLink -ne $null)
{
	Remove-PnPJavaScriptLink -Identity "jQuery" -Scope Site -Force
}

Add-PnPJavaScriptLink -Name "jQuery" -Url "https://code.jquery.com/jquery.min.js" -Sequence 10 -Scope Site

Write-Host "- FormModifierLoader.js"

$site = Get-PnPSite
$fileUrl = $site.Url + "/Scripts/FormModifierLoader.js"

$jsLink = Get-PnPJavaScriptLink -Name "FormModifierLoader" -Scope Site

if ($jsLink -ne $null)
{
	Remove-PnPJavaScriptLink -Identity "FormModifierLoader" -Scope Site -Force
}

Write-Host $fileUrl

Add-PnPJavaScriptLink -Name "FormModifierLoader" -Url $fileUrl -Sequence 15 -Scope Site

Write-Host "Done."
