Import-Module -Name ".\OptionsSelector.psm1"

Write-Host "Select an option:"
GetSelectedOption @("Option 1", "Option 2", "Option 3", "Option 4")

Write-Host ""

Write-Host "Select options:"
GetSelectedOptions @("Option 1", "Option 2", "Option 3", "Option 4")
