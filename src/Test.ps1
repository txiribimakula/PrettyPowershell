Import-Module -Name ".\OptionsSelector.psm1"

$options = @("Option 1", "Option 2", "Option 3", "Option 4")

Write-Host "Select an option:"
$selectedOption = GetSelectedOption $options
Write-Host "Selection:" $options[$selectedOption]

Write-Host ""

Write-Host "Select options:"
$selectedOptions = GetSelectedOptions $options
for ($i = 0; $i -lt $options.Count; $i++) {
    if($selectedOptions -band [math]::Pow(2, $i)) {
        Write-Host "Selection:" $options[$i]
    }
}