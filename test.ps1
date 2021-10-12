$currentLine = 0

while($pressedKey.VirtualKeyCode -ne 13)
{
    Clear-Host
    $currentLine
    Write-Host "Whole text is in green" -ForegroundColor $(If ($currentLine -eq 0) {"Green"} Else {"White"})
    Write-Host "Whole text is in red" -ForegroundColor $(If ($currentLine -eq 1) {"Green"} Else {"White"})
    Write-Host "Whole text is in white" -ForegroundColor $(If ($currentLine -eq 2) {"Green"} Else {"White"})
    $pressedKey = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    if($pressedKey.VirtualKeyCode -eq 40) {
        $currentLine = $currentLine + 1
    }
}