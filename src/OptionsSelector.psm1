function WriteOption($index, $text, $selectedOptions, $selectedOption, $isResult) {
    if($selectedOptions -ne -1) {
        $prependText = $(If ($selectedOptions -band [math]::Pow(2, $index)) {" [x]"} Else {" [ ]"})
    } else {
        $prependText = $(If ($selectedOption -eq $index) {" (x)"} Else {" ( )"})
    }
    Write-Host $prependText $text -ForegroundColor $(If ($selectedOption -eq $index -and $isResult -eq $false) {"Green"} Else {"White"})
}

function WriteOptions($texts, $selectedOptions, $selectedOption, $isResult = $false) {
    for ($i = 0; $i -lt  $texts.Count; $i++) {
        WriteOption $i $texts[$i] $selectedOptions $selectedOption $isResult
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

function ToggleAllSelection($selectedOptions, $optionsCount) {
    $maximum = [math]::Pow(2, $optionsCount) - 1
    if($maximum -eq $selectedOptions) {
        return 0
    } else {
        return $maximum
    }
}

function ToggleSelection($selectedOption, $selectedOptions) {
    return $selectedOptions -bxor [math]::Pow(2, $selectedOption)
}

function MoveToNext($selectedOption, $optionsCount) {
    if($selectedOption -eq $optionsCount - 1) {
        return 0
    }
    return $selectedOption + 1
}

function MoveToPrevious($selectedOption, $optionsCount) {
    if($selectedOption -eq 0) {
        return $optionsCount - 1
    }
    return $selectedOption - 1
}

function GetSelectedOptions($options) {
    $selectedOption = 0
    $selectedOptions = 0
    
    while($pressedKeyCode -ne 13)
    {
        WriteOptions $options $selectedOptions $selectedOption
        $pressedKeyCode = GetPressedKeyCode
        switch ($pressedKeyCode) {
            40 { $selectedOption = MoveToNext $selectedOption $options.Count }
            38 { $selectedOption = MoveToPrevious $selectedOption $options.Count }
            32 { $selectedOptions = ToggleSelection $selectedOption $selectedOptions }
            65 { $selectedOptions = ToggleAllSelection $selectedOptions $options.Count }
        }
        DeleteLines $options.Count
    }
    
    WriteOptions $options $selectedOptions -1 $true
    
    return $selectedOptions
}

function GetSelectedOption($options) {
    $selectedOption = 0
    
    while($pressedKeyCode -ne 13)
    {
        WriteOptions $options -1 $selectedOption
        $pressedKeyCode = GetPressedKeyCode
        switch ($pressedKeyCode) {
            40 { $selectedOption = MoveToNext $selectedOption $options.Count }
            38 { $selectedOption = MoveToPrevious $selectedOption $options.Count }
        }
        DeleteLines $options.Count
    }
    
    WriteOptions $options -1 $selectedOption $true
    
    return $selectedOption
}
