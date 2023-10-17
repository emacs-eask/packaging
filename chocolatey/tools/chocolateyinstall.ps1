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

  checksum      = 'd85b4741597fd5f4bad1409474880a3b9972503aa3bf2e800473e46769498c22'
  checksumType  = 'sha256'
  checksum64    = 'd85b4741597fd5f4bad1409474880a3b9972503aa3bf2e800473e46769498c22'
}

Install-ChocolateyZipPackage @packageArgs
