@echo off

SET VER=0.9.9

choco pack

choco push eask-cli.%VER%.nupkg -s https://push.chocolatey.org/
