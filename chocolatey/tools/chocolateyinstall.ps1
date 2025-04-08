$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = "https://github.com/emacs-eask/cli/releases/download/$($env:ChocolateyPackageVersion)/eask_$($env:ChocolateyPackageVersion)_win-x64.zip"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url64bit      = $url64

  checksumType  = 'sha256'
  checksum64    = '4ca329093429799efee816b0f8f844fa615c49682658f6030132a0d8ca1e49cb'
}

Install-ChocolateyZipPackage @packageArgs
