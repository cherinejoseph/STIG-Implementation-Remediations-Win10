<#
.SYNOPSIS
    This PowerShell script configures Windows 10 to audit successful changes to MPSSVC (Microsoft Protection Service) rule-level policies, providing a detailed audit trail to detect unauthorized policy modifications and assist in security investigations.

.NOTES
    Author          : Cherine Joseph
    LinkedIn        : linkedin.com/in/cherine-joseph
    GitHub          : github.com/cherinejoseph
    Date Created    : 2025-09-18
    Last Modified   : 2025-09-18
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000575

.TESTED ON
    Date(s) Tested  : 2025-09-18
    Tested By       : 2025-09-18
    Systems Tested  : Windows 10
    PowerShell Ver. : PowerShell ISE

.USAGE
    Please download the script and execute as Administrator.
    Example:
    PS C:\> .\WN10-AU-000575.ps1
#>

# Enable auditing for MPSSVC Rule-Level Policy Change (Success) using AuditPol
# Ensure detailed auditing is active for Policy Change subcategories
$auditSubcategory = "MPSSVC Rule-Level Policy Change"
$auditSetting = "Success"

# Apply the audit policy setting
AuditPol.exe /set /subcategory:"$auditSubcategory" /success:enable /failure:disable

Write-Host "STIG WN10-AU-000575 remediated: MPSSVC Rule-Level Policy Change auditing enabled for Success events."
