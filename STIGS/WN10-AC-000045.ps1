<#
.SYNOPSIS
    This PowerShell script disables reversible password encryption on Windows 10 systems, 
    ensuring that stored passwords are not recoverable in clear text. 
    Disabling this setting strengthens account security and prevents unauthorized access 
    in case of system compromise.

.NOTES
    Author          : Josh Madakor
    LinkedIn        : linkedin.com/in/joshmadakor/
    GitHub          : github.com/joshmadakor1
    Date Created    : 2024-09-09
    Last Modified   : 2025-09-18
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000045

.TESTED ON
    Date(s) Tested  : 2025-09-18
    Tested By       : 2025-09-18
    Systems Tested  : Windows 10
    PowerShell Ver. : PowerShell ISE

.USAGE
    Please download the script and execute as administrator.
#>

# Disable reversible password encryption
try {
    Write-Host "Disabling reversible password encryption..."
    secedit /export /cfg "$env:TEMP\secpol.cfg" | Out-Null

    (Get-Content "$env:TEMP\secpol.cfg") -replace 'ClearTextPassword = 1','ClearTextPassword = 0' | 
        Set-Content "$env:TEMP\secpol.cfg"

    secedit /configure /db "$env:windir\security\database\secedit.sdb" /cfg "$env:TEMP\secpol.cfg" /areas SECURITYPOLICY
    Write-Host "Reversible password encryption disabled successfully."
} catch {
    Write-Error "An error occurred: $_"
}
