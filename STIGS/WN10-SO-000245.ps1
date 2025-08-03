<#
.SYNOPSIS
    This PowerShell script ensures the built-in Administrator account runs in Admin Approval Mode by enabling the required User Account Control (UAC) setting.
.NOTES
    Author          : Cherine Joseph
    LinkedIn        : linkedin.com/in/cherine-joseph    
    GitHub          : github.com/cherinejoseph
    Date Created    : 2025-08-02
    Last Modified   : 2025-08-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000245

.TESTED ON
    Date(s) Tested  : 2025-08-02
    Tested By       : Cherine Joseph
    Systems Tested  : Windows 10
    PowerShell Ver. : PowerShell ISE

.USAGE
    Please download the script and execute as administrator. 
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000245-Remediation.ps1
#>

# Define the registry key and value for "User Account Control: Admin Approval Mode for the Built-in Administrator account"
$RegistryKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$RegistryValueName = "FilterAdministratorToken"
$RegistryValueData = 1  # 1 = Enabled (Admin Approval Mode enabled for Built-in Administrator account)

# Set the registry value to enable Admin Approval Mode for the Built-in Administrator account
Set-ItemProperty -Path $RegistryKeyPath -Name $RegistryValueName -Value $RegistryValueData

Write-Host "'User Account Control: Admin Approval Mode for the Built-in Administrator account' has been enabled."
