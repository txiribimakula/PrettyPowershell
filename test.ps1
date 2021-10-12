function WriteOption($index, $text, $selectedLines, $selectedLine) {
    Write-Host $(If ($selectedLines -band [math]::Pow(2, $index)) {"[x]"} Else {"[ ]"}) $text -ForegroundColor $(If ($selectedLine -eq $index) {"Green"} Else {"White"})
}

function WriteOptions($texts, $selectedLines, $selectedLine) {
    for ($i = 0; $i -lt  $texts.Count; $i++) {
        WriteOption $i $texts[$i] $selectedLines $selectedLine
    }
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

function GetSelectedLine($pressedKeyCode) {
    if($pressedKeyCode -eq 40) {
        $selectedLine = $selectedLine + 1
        if($selectedLine -eq 3) {
            $selectedLine = 0
        }
    } elseif($pressedKeyCode -eq 38) {
        $selectedLine = $selectedLine - 1
        if($selectedLine -eq -1) {
            $selectedLine = 2
        }
    }
    return $selectedLine
}

function GetPressedKeyCode() {
    return $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown").VirtualKeyCode
}

$selectedLine = 0
$selectedLines = 0

while($pressedKeyCode -ne 13)
{
    WriteOptions @("Option 1", "Option 2", "Option 3") $selectedLines $selectedLine
    $pressedKeyCode = GetPressedKeyCode
    $selectedLine = GetSelectedLine $pressedKeyCode
    if($pressedKeyCode -eq 32) {
        $selectedLines = $selectedLines -bxor [math]::Pow(2, $selectedLine)
    }
    DeleteLines 3
}

WriteOptions @("Option 1", "Option 2", "Option 3") $selectedLines -1
