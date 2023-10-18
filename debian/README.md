## Usage

```
sudo curl -SsL -o /etc/apt/trusted.gpg.d/easksource.gpg https://raw.githubusercontent.com/emacs-eask/packaging/master/debian/KEY.gpg
sudo curl -SsL -o /etc/apt/sources.list.d/easksource.list https://raw.githubusercontent.com/emacs-eask/packaging/master/debian/easksource.list
sudo apt update --allow-insecure-repositories
sudo apt install eask-cli
```

## Export GPG key in ASCII armored version

```
gpg --armor --export-secret-key D0CF12A37328A46974F4DA35B6121C7BD46BDEE5
```

- https://github.com/crazy-max/ghaction-import-gpg#prerequisites
- https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key.
