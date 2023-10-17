Get-FileHash $args[0] -Algorithm $args[1] | select -ExpandProperty Hash
