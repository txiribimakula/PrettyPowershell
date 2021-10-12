Clear-Host
Write-Host "Whole text is in green" -ForegroundColor White
Write-Host "Whole text is in red" -ForegroundColor White
Write-Host "Whole text is in white" -ForegroundColor White
$PressedKey = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Clear-Host
Write-Host "Whole text is in green" -ForegroundColor White
Write-Host "Whole text is in red" -ForegroundColor Green
Write-Host "Whole text is in white" -ForegroundColor White
$PressedKey = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Clear-Host
Write-Host "Whole text is in green" -ForegroundColor White
Write-Host "Whole text is in red" -ForegroundColor White
Write-Host "Whole text is in white" -ForegroundColor Green
$PressedKey = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
$PressedKey.VirtualKeyCode