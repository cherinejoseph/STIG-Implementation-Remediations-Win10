<#
.SYNOPSIS
    This PowerShell script configures Windows to reprocess Group Policy objects (GPOs) even if no changes have been made. This ensures that any unauthorized configuration changes on the system are corrected and remain aligned with domain-based Group Policy settings.

.NOTES
    Author          : Cherine Joseph
    LinkedIn        : linkedin.com/in/cherine-joseph
    GitHub          : github.com/cherinejoseph
    Date Created    : 2025-09-18
    Last Modified   : 2025-09-18
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000090

.TESTED ON
    Date(s) Tested  : 2025-09-18
    Tested By       : 2025-09-18
    Systems Tested  : Windows 10
    PowerShell Ver. : PowerShell ISE

.USAGE
    Please download the script and execute as Administrator.
    Example:
    PS C:\> .\WN10-CC-000090.ps1
#>

# Registry path and value to force GPO reprocessing
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"
$valueName = "NoGPOListChanges"
$valueData = 0  # 0 = Process even if GPOs have not changed

# Create the key if it does not exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Apply the registry setting
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

Write-Host "STIG WN10-CC-000090 remediated: Group Policy objects will be reprocessed even if they have not changed."
