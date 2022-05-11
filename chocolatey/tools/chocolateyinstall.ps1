$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = "https://github.com/emacs-eask/eask/releases/download/$($env:ChocolateyPackageVersion)/eask_$($env:ChocolateyPackageVersion)_win-x64.zip"
$url64      = "https://github.com/emacs-eask/eask/releases/download/$($env:ChocolateyPackageVersion)/eask_$($env:ChocolateyPackageVersion)_win-x64.zip"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64

  checksum      = '721AC91BF248D69C98538BA4C90AC7C804D5F3E0BFFAB15F6986067D2F3446CB'
  checksumType  = 'sha256'
  checksum64    = '721AC91BF248D69C98538BA4C90AC7C804D5F3E0BFFAB15F6986067D2F3446CB'
}

Install-ChocolateyZipPackage @packageArgs
