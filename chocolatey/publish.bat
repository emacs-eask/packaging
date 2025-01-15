@echo off

SET VER=0.10.3

choco pack

choco push eask-cli.%VER%.nupkg -s https://push.chocolatey.org/
