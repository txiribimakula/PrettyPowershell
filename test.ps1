function WriteOption($index, $text, $selectedLines, $selectedLine) {
    Write-Host $(If ($selectedLines -band [math]::Pow(2, $index)) {"[x]"} Else {"[ ]"}) $text -ForegroundColor $(If ($selectedLine -eq $index) {"Green"} Else {"White"})
}

function DeleteLines($quantity) {
    $currentCursorPosition  = $Host.UI.RawUI.CursorPosition.Y
    $consoleWidth = $Host.UI.RawUI.BufferSize.Width
    $i = 0
    for ($i; $i -lt $quantity; $i++) {
        [Console]::SetCursorPosition(0,($currentCursorPosition - $i))
        [Console]::Write("{0,-$consoleWidth}" -f " ")
    }
    [Console]::SetCursorPosition(0,($currentCursorPosition - $quantity))
}

function GetSelectedLine() {
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
    }
    return $selectedLine
}

$selectedLine = 0
$selectedLines = 0

while($pressedKey.VirtualKeyCode -ne 13)
{
    WriteOption 0 "Option 1" $selectedLines $selectedLine
    WriteOption 1 "Option 2" $selectedLines $selectedLine
    WriteOption 2 "Option 3" $selectedLines $selectedLine
    $pressedKey = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    $selectedLine = GetSelectedLine
    if($pressedKey.VirtualKeyCode -eq 32) {
        $selectedLines = $selectedLines -bxor [math]::Pow(2, $selectedLine)
    }

    DeleteLines 3
}

WriteOption 0 "Option 1" $selectedLines -1
WriteOption 1 "Option 2" $selectedLines -1
WriteOption 2 "Option 3" $selectedLines -1
