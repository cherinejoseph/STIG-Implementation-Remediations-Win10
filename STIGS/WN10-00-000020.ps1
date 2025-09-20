<#
.SYNOPSIS
    This PowerShell script ensures that Secure Boot is enabled on Windows 10 systems to prevent unauthorized firmware or OS loaders from running.

.NOTES
    Author          : Cherine Joseph
    LinkedIn        : linkedin.com/in/cherine-joseph
    GitHub          : github.com/cherinejoseph
    Date Created    : 2025-09-18
    Last Modified   : 2025-09-18
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000020

.TESTED ON
    Date(s) Tested  : 2025-09-18
    Tested By       : 2025-09-18
    Systems Tested  : Windows 10
    PowerShell Ver. : PowerShell ISE

.USAGE
    Please download the script and execute as administrator.
#>

# Check if the system supports Secure Boot
$secureBootStatus = Confirm-SecureBootUEFI -ErrorAction SilentlyContinue

if ($secureBootStatus -eq $true) {
    Write-Output "Secure Boot is already enabled."
} elseif ($secureBootStatus -eq $false) {
    Write-Output "Secure Boot is disabled. Please enable it in the UEFI/BIOS settings manually."
} else {
    Write-Output "Secure Boot check is not supported on this system."
}
