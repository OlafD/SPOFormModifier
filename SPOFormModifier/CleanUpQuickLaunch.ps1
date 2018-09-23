
Write-Host -ForegroundColor Magenta "Clean-up quicklaunch"

$node = Get-PnPNavigationNode -Location QuickLaunch | Where { $_.Title -eq "Recent" }

if ($node -ne $null)
{
	Remove-PnPNavigationNode -Identity $node -Force 

	Write-Host "Node 'Recent' removed"
}

Write-Host "Done."
