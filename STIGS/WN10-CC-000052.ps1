<#
.SYNOPSIS
    Configures Windows 10 to prioritize ECC curves with longer key lengths first.
    This ensures stronger encryption algorithms (NistP384 over NistP256) are used 
    to protect data and communications, enhancing overall cryptographic security.

.NOTES
    Author          : Cherine Joseph
    LinkedIn        : linkedin.com/in/cherine-joseph
    GitHub          : github.com/cherinejoseph
    Date Created    : 2025-09-18
    Last Modified   : 2025-09-18
    Version         : 1.0
    STIG-ID         : WN10-CC-000052

.TESTED ON
    Date(s) Tested  : 2025-09-18
    Tested By       : 2025-09-18
    Systems Tested  : Windows 10
    PowerShell Ver. : PowerShell ISE

.USAGE
    Please download the script and execute as administrator.
#>

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002"
$regName = "EccCurves"
$eccOrder = @("NistP384","NistP256")

try {
    # Create registry path if it doesn't exist
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    # Set the ECC curve order
    Set-ItemProperty -Path $regPath -Name $regName -Value $eccOrder -Type MultiString
    Write-Host "ECC curve order configured successfully: $($eccOrder -join ', ')"
} catch {
    Write-Error "Failed to configure ECC curve order: $_"
}
