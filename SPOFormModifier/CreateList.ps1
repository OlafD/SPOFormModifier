
# the script is assuming that a connection to a SharePoint Online site is already established

Write-Host -ForegroundColor Magenta "Create list"

$listname = "Status List"

$l = New-PnPList -Title $listname -Template GenericList -Url "lists/statuslist" -OnQuickLaunch

Write-Host "Disable modern ui"

$list = Get-PnPList -Identity $listname -Includes "ListExperienceOptions"
(Get-PnPContext).Load($list)
Invoke-PnPQuery

$list.ListExperienceOptions = "ClassicExperience"
$list.Update()
Invoke-PnPQuery

Write-Host "Add fields"

Write-Host "- StatusField"

$fieldXml = [string](Get-Content .\Fields\StatusField.xml)

$f = Add-PnPFieldFromXml -List $listname -FieldXml $fieldXml

Write-Host "- StatusComment"

$fieldXml = [string](Get-Content .\Fields\StatusComment.xml)

$f = Add-PnPFieldFromXml -List $listname -FieldXml $fieldXml

Write-Host "Done."
