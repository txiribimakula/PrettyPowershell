$currentLine = 0

while($pressedKey.VirtualKeyCode -ne 13)
{
    Clear-Host
    Write-Host "Whole text is in green" -ForegroundColor $(If ($currentLine -eq 0) {"Green"} Else {"White"})
    Write-Host "Whole text is in red" -ForegroundColor White
    Write-Host "Whole text is in white" -ForegroundColor White
    $pressedKey = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}