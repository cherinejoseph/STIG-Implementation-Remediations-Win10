<#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 local accounts enforce a minimum password length of 14 characters.

.NOTES
    Author          : Josh Madakor
    LinkedIn        : linkedin.com/in/joshmadakor/
    GitHub          : github.com/joshmadakor1
    Date Created    : 2025-09-18
    Last Modified   : 2025-09-18
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000035

.TESTED ON
    Date(s) Tested  : 2025-09-18
    Tested By       : 2025-09-18
    Systems Tested  : Windows 10
    PowerShell Ver. : PowerShell ISE

.USAGE
    Please download the script and execute as administrator.
#>

# Ensure the script is run as administrator
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Error "This script must be run as Administrator."
    Exit
}

# Define minimum password length
$MinPasswordLength = 14

# Export current local security policy
$SecPolCfg = "C:\Temp\secpol.cfg"
secedit /export /cfg $SecPolCfg

# Update the MinimumPasswordLength setting
(Get-Content $SecPolCfg) -replace 'MinimumPasswordLength = \d+', "MinimumPasswordLength = $MinPasswordLength" | Set-Content $SecPolCfg

# Apply the updated security policy
secedit /configure /db C:\Windows\security\local.sdb /cfg $SecPolCfg /areas SECURITYPOLICY

# Clean up temporary file
Remove-Item $SecPolCfg -Force

Write-Output "STIG WN10-AC-000035 remediated: Minimum password length set to $MinPasswordLength characters."
