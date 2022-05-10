$ErrorActionPreference = 'Stop';

$easkExe = Get-ChildItem $(Split-Path -Parent $MyInvocation.MyCommand.Definition) | Where-Object -Property Name -Match "eask.exe"

if (-Not($easkExe)) 
{
    Write-Error -Message "eask exe is not found, please contact the maintainer of the package" -Category ResourceUnavailable
}

Write-Host "found eask exe in $($easkExe.FullName)"
Write-Host "attempting to remove it" 
Remove-Item $easkExe.FullName
