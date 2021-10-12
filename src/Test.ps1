Import-Module -Name ".\OptionsSelector.psm1"

$options = @("Option 1", "Option 2", "Option 3", "Option 4")

Write-Host "Select an option:"
$selectedOption = GetSelectedOption $options


Write-Host ""

Write-Host "Select options:"
GetSelectedOptions $options
