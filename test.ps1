$currentLine = 0
$selectedLines = 0

while($pressedKey.VirtualKeyCode -ne 13)
{
    Write-Host $(If ($selectedLines -band 1) {"[x]"} Else {"[ ]"}) "Option 1" -ForegroundColor $(If ($currentLine -eq 0) {"Green"} Else {"White"})
    Write-Host $(If ($selectedLines -band 2) {"[x]"} Else {"[ ]"}) "Option 2" -ForegroundColor $(If ($currentLine -eq 1) {"Green"} Else {"White"})
    Write-Host $(If ($selectedLines -band 4) {"[x]"} Else {"[ ]"}) "Option 3" -ForegroundColor $(If ($currentLine -eq 2) {"Green"} Else {"White"})
    $pressedKey = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    if($pressedKey.VirtualKeyCode -eq 40) {
        $currentLine = $currentLine + 1
        if($currentLine -eq 3) {
            $currentLine = 0
        }
    } elseif($pressedKey.VirtualKeyCode -eq 38) {
        $currentLine = $currentLine - 1
        if($currentLine -eq -1) {
            $currentLine = 2
        }
    } elseif($pressedKey.VirtualKeyCode -eq 32) {
        $selectedLines = $selectedLines -bxor [math]::Pow(2, $currentLine)
    }

    $currentCursorPosition  = $Host.UI.RawUI.CursorPosition.Y
    $consoleWidth = $Host.UI.RawUI.BufferSize.Width
    $consoleHeight = 3
    $i = 1
    for ($i; $i -le $consoleHeight; $i++) {
        [Console]::SetCursorPosition(0,($currentCursorPosition - $i))
        [Console]::Write("{0,-$consoleWidth}" -f " ")
    }
    [Console]::SetCursorPosition(0,($currentCursorPosition - $consoleHeight))
}