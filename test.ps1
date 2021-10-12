$currentLine = 0
$selectedLines = 0

while($pressedKey.VirtualKeyCode -ne 13)
{
    Clear-Host
    Write-Host $(If ($selectedLines -band 1) {"[x]"} Else {"[ ]"}) "Whole text is in green" -ForegroundColor $(If ($currentLine -eq 0) {"Green"} Else {"White"})
    Write-Host $(If ($selectedLines -band 2) {"[x]"} Else {"[ ]"}) "Whole text is in red" -ForegroundColor $(If ($currentLine -eq 1) {"Green"} Else {"White"})
    Write-Host $(If ($selectedLines -band 4) {"[x]"} Else {"[ ]"}) "Whole text is in white" -ForegroundColor $(If ($currentLine -eq 2) {"Green"} Else {"White"})
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
}