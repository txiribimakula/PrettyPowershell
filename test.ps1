$selectedLine = 0
$selectedLines = 0

while($pressedKey.VirtualKeyCode -ne 13)
{
    Write-Host $(If ($selectedLines -band 1) {"[x]"} Else {"[ ]"}) "Option 1" -ForegroundColor $(If ($selectedLine -eq 0) {"Green"} Else {"White"})
    Write-Host $(If ($selectedLines -band 2) {"[x]"} Else {"[ ]"}) "Option 2" -ForegroundColor $(If ($selectedLine -eq 1) {"Green"} Else {"White"})
    Write-Host $(If ($selectedLines -band 4) {"[x]"} Else {"[ ]"}) "Option 3" -ForegroundColor $(If ($selectedLine -eq 2) {"Green"} Else {"White"})
    $pressedKey = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    if($pressedKey.VirtualKeyCode -eq 40) {
        $selectedLine = $selectedLine + 1
        if($selectedLine -eq 3) {
            $selectedLine = 0
        }
    } elseif($pressedKey.VirtualKeyCode -eq 38) {
        $selectedLine = $selectedLine - 1
        if($selectedLine -eq -1) {
            $selectedLine = 2
        }
    } elseif($pressedKey.VirtualKeyCode -eq 32) {
        $selectedLines = $selectedLines -bxor [math]::Pow(2, $selectedLine)
    }

    $currentCursorPosition  = $Host.UI.RawUI.CursorPosition.Y
    $consoleWidth = $Host.UI.RawUI.BufferSize.Width
    $consoleHeight = 3
    $i = 0
    for ($i; $i -lt $consoleHeight; $i++) {
        [Console]::SetCursorPosition(0,($currentCursorPosition - $i))
        [Console]::Write("{0,-$consoleWidth}" -f " ")
    }
    [Console]::SetCursorPosition(0,($currentCursorPosition - $consoleHeight))
}

$selectedLine = -1
Write-Host $(If ($selectedLines -band 1) {"[x]"} Else {"[ ]"}) "Option 1" -ForegroundColor $(If ($selectedLine -eq 0) {"Green"} Else {"White"})
Write-Host $(If ($selectedLines -band 2) {"[x]"} Else {"[ ]"}) "Option 2" -ForegroundColor $(If ($selectedLine -eq 1) {"Green"} Else {"White"})
Write-Host $(If ($selectedLines -band 4) {"[x]"} Else {"[ ]"}) "Option 3" -ForegroundColor $(If ($selectedLine -eq 2) {"Green"} Else {"White"})
