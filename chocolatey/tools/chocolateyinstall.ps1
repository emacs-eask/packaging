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

  checksum      = '127ad376162ce6c80489d4da87d80898c17b34f518d3cbb7f50c073f6701400f'
  checksumType  = 'sha256'
  checksum64    = '127ad376162ce6c80489d4da87d80898c17b34f518d3cbb7f50c073f6701400f'
}

Install-ChocolateyZipPackage @packageArgs
