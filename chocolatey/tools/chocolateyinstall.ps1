$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = "https://github.com/emacs-eask/cli/releases/download/$($env:ChocolateyPackageVersion)/eask_$($env:ChocolateyPackageVersion)_win-x64.zip"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url64bit      = $url64

  checksumType  = 'sha256'
  checksum64    = '2d339fe5dbe885ec659f3a880cebd3a7bbb3ebc7d35e6c8648f6efbb1ed3a06a'
}

Install-ChocolateyZipPackage @packageArgs
