<#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 audit policies use subcategories, enabling more precise auditing of system activity for better detection of unauthorized actions and improved forensic analysis.

.NOTES
    Author          : Cherine Joseph
    LinkedIn        : linkedin.com/in/cherine-joseph
    GitHub          : github.com/cherinejoseph
    Date Created    : 2025-09-18
    Last Modified   : 2025-09-18
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000030

.TESTED ON
    Date(s) Tested  : 2025-09-18
    Tested By       : 2025-09-18
    Systems Tested  : Windows 10
    PowerShell Ver. : PowerShell ISE

.USAGE
    Please download the script and execute as Administrator.
    Example:
    PS C:\> .\WN10-SO-000030.ps1
#>

# Registry path and value to enable audit policy subcategories
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
$valueName = "SCENoApplyLegacyAuditPolicy"
$valueData = 1  # 1 = Enabled

# Create the key if it does not exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Apply the registry setting
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

Write-Host "STIG WN10-SO-000030 remediated: Audit policies now use subcategories for detailed auditing."
