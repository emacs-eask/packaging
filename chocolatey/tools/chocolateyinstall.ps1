$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = "https://github.com/emacs-eask/cli/releases/download/$($env:ChocolateyPackageVersion)/eask_$($env:ChocolateyPackageVersion)_win-x64.zip"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url64bit      = $url64

  checksumType  = 'sha256'
  checksum64    = '07a56bb3f1910d3168eb4a8e731aa55e9edbab472e422bfdf3d5d5a256fcb7d2'
}

Install-ChocolateyZipPackage @packageArgs
