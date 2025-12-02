@echo off

SET VER=0.12.0

choco pack

choco push eask-cli.%VER%.nupkg -s https://push.chocolatey.org/

timeout 3
