## Usage

```
sudo curl -SsL -o /etc/apt/trusted.gpg.d/easksource.gpg https://raw.githubusercontent.com/emacs-eask/packaging/master/debian/KEY.gpg
sudo curl -SsL -o /etc/apt/sources.list.d/easksource.listhttps://raw.githubusercontent.com/emacs-eask/packaging/master/debian/easksource.list
sudo apt update
sudo apt install eask-cli
```
