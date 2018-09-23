
Write-Host -ForegroundColor Magenta "UploadAndRegisterScripts undo"

Write-Host "Unregister scripts"

Write-Host "- FormModifierLoader"

Remove-PnPJavaScriptLink -Identity "FormModifierLoader" -Scope Site -Force

Write-Host "- jQuery"

Remove-PnPJavaScriptLink -Identity "jQuery" -Scope Site -Force

Write-Host "Remove scripts library"

Remove-PnPList "Scripts" -Force

Write-Host "Done."
