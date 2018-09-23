
Write-Host -ForegroundColor Magenta "CreateList undo"

Write-Host "Remove list 'Status List'"

Remove-PnPList -Identity "Status List" -Recycle:$false -Force

Write-Host "Done."
