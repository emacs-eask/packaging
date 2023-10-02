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

  checksum      = 'D85B4741597FD5F4BAD1409474880A3B9972503AA3BF2E800473E46769498C22'
  checksumType  = 'sha256'
  checksum64    = 'D85B4741597FD5F4BAD1409474880A3B9972503AA3BF2E800473E46769498C22'
}

Install-ChocolateyZipPackage @packageArgs
