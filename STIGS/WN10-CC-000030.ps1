<#
.SYNOPSIS
    Configures Windows 10 to prevent ICMP redirects from overriding OSPF-generated routes.
    Disabling ICMP redirects ensures network traffic follows proper routing paths and
    avoids potential misrouting or unauthorized route changes.

.NOTES
    Author          : Josh Madakor
    GitHub          : github.com/joshmadakor1
    Date Created    : 2025-09-18
    STIG-ID         : WN10-CC-000030
    Severity        : Low

.USAGE
    Run this script as Administrator. No reboot is required.
#>

$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
$regName = "EnableICMPRedirect"
$regValue = 0

try {
    # Create the registry path if it doesn't exist (safety check)
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    # Set the registry value to disable ICMP redirects
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord
    Write-Host "ICMP redirects are now disabled (EnableICMPRedirect = 0)."
} catch {
    Write-Error "Failed to set EnableICMPRedirect: $_"
}
