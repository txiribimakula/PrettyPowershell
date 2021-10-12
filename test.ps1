while($pressedKey.VirtualKeyCode -ne 13)
{
    Clear-Host
    Write-Host "Whole text is in green" -ForegroundColor Green
    Write-Host "Whole text is in red" -ForegroundColor White
    Write-Host "Whole text is in white" -ForegroundColor White
    $pressedKey = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}