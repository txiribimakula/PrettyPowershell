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

function GetPressedKeyCode() {
    return $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown").VirtualKeyCode
}

function ToggleSelection($selectedLine) {
    return $selectedLines -bxor [math]::Pow(2, $selectedLine)
}

function MoveToNext() {
    if($selectedLine -eq 2) {
        return 0
    }
    return $selectedLine + 1
}

function MoveToPrevious() {
    if($selectedLine -eq 0) {
        return 2
    }
    return $selectedLine - 1
}

$selectedLine = 0
$selectedLines = 0

while($pressedKeyCode -ne 13)
{
    WriteOptions @("Option 1", "Option 2", "Option 3") $selectedLines $selectedLine
    $pressedKeyCode = GetPressedKeyCode
    switch ($pressedKeyCode) {
        40 { $selectedLine = MoveToNext $selectedLine }
        38 { $selectedLine = MoveToPrevious $selectedLine }
        32 { $selectedLines = ToggleSelection $selectedLine }
        Default {}
    }
    DeleteLines 3
}

WriteOptions @("Option 1", "Option 2", "Option 3") $selectedLines -1
