$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = "https://github.com/emacs-eask/cli/releases/download/$($env:ChocolateyPackageVersion)/eask_$($env:ChocolateyPackageVersion)_win-x64.zip"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url64bit      = $url64

  checksumType  = 'sha256'
  checksum64    = '51bf94123863b41d3d987b6178c497eb08c8dd979bcfd8d1985ad3342cf572f7'
}

Install-ChocolateyZipPackage @packageArgs
