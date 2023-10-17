$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = "https://github.com/emacs-eask/cli/releases/download/$($env:ChocolateyPackageVersion)/eask_$($env:ChocolateyPackageVersion)_win-x64.zip"
$url64      = "https://github.com/emacs-eask/cli/releases/download/$($env:ChocolateyPackageVersion)/eask_$($env:ChocolateyPackageVersion)_win-x64.zip"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64

  checksum      = '2e7da88d965e33d7eb42fce993fb4a07c7013da1d7b82ddf83790d0590b218c2'
  checksumType  = 'sha256'
  checksum64    = '2e7da88d965e33d7eb42fce993fb4a07c7013da1d7b82ddf83790d0590b218c2'
}

Install-ChocolateyZipPackage @packageArgs
