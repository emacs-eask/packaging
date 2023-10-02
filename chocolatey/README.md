# chocolatey-eask

Chocolatey install for Eask CLI

## Modifying the package

- Edit the `eask-cli.nuspec` configuration file.
- Edit the `./tools/chocolateyInstall.ps1` install script
- ~~Edit the `./tools/chocolateyUninstall.ps1` uninstall script~~
- You **must** save your files with *UTF-8* character encoding without BOM.

_Note:_ Make sure you install checksum (`choco install checksum`) and calculate checksums for the 32bit and 64bit copies of eask in the [Install-ChocolateyZipPackage](https://chocolatey.org/docs/helpers-install-chocolatey-zip-package) command of the `chocolateyInstall.ps1` file.

### Generating Checksum

Use the `checksum` tool to calculate the sha256 checksum for each of the zip files from the eask releases:

`C:\DirectoryWhereeaskZipIsAt>checksum -f=".\eask_0.6.17_win-x64.zip" -t=sha256`

## Build the package

- Run `choco pack` in the same directory as `eask-cli.nuspec`

_Note: If you are running this from a command prompt/powershell prompt, you want to run it as Administrator._

## Test the package

_Note: testing should probably be done on a Virtual Machine_
(See: https://github.com/chocolatey/chocolatey-test-environment)

- In the package directory, use:
  - `choco install eask-cli -s "$pwd" -f` (powershell)
  - `choco install eask-cli -s '%cd%' -f` (everywhere else)
- Or, use the full path:
  - `choco install eask-cli -source 'c:\path\to\package' -f`

After executing the install, ensure that `eask.exe` is installed by executing the following command from the command prompt: `eask --version`. If it is properly installed, you will see the current version of eask.

### Test uninstallation

_Note: the Chocolatey install path on windows is typically `C:\ProgramData\chocolatey`_

- Execute the following command to uninstall eask:
    + `choco uninstall eask-cli -y`

After executing the uninstall ensure that `eask.exe` is not found in the Chocoloatey install path. You can also try running `eask --version` from the commandline to see if it is still installed


## Publish the package to the Chocolatey community feed repository:

- `choco apikey -k [API_KEY_HERE] -source https://push.chocolatey.org/`
- `choco push eask-cli.[version num].nupkg -s https://push.chocolatey.org/` (package name can be omitted)

See the [Chocolatey Packages Quick Start][quickstart] for more information.


[quickstart]: https://github.com/chocolatey/choco/wiki/CreatePackagesQuickStart
