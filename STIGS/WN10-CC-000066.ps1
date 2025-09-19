<#
.SYNOPSIS
    This PowerShell script ensures that command line information is recorded for all process creation events, enhancing audit trails for system activity, improving the ability to investigate security incidents, and detecting suspicious or malicious process execution.

.NOTES
    Author          : Cherine Joseph
    LinkedIn        : linkedin.com/in/cherine-joseph
    GitHub          : github.com/cherinejoseph
    Date Created    : 2025-09-18
    Last Modified   : 2025-09-18
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000066

.TESTED ON
    Date(s) Tested  : 2025-09-18
    Tested By       : 2025-09-18
    Systems Tested  : Windows 10
    PowerShell Ver. : PowerShell ISE

.USAGE
    Please download the script and execute as Administrator.
    Example:
    PS C:\> .\WN10-CC-000066.ps1
#>

# Registry path and value to include command line data for process creation events
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit"
$valueName = "ProcessCreationIncludeCmdLine_Enabled"
$valueData = 1  # 1 = Enabled

# Create the key if it does not exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Apply the registry setting
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

Write-Host "STIG WN10-CC-000066 remediated: Command line data will be included in process creation events."
