(package "packaging"
         "0.0.0"
         "Packaging for Eask CLI")

(website-url "https://github.com/emacs-eask/packaging")
(keywords "packaging" "tools")

(script "test" "echo \"Error: no test specified\" && exit 1")
(script "update-checksum" "eask load scripts/update-checksum.el")
(script "snap-update" "eask load scripts/snap-update.el")
(script "brew-update" "eask load scripts/brew-update.el")
(script "port-update" "eask load scripts/port-update.el")
(script "choco-update" "eask load scripts/choco-update.el")
(script "scoop-update" "eask load scripts/scoop-update.el")

(source 'gnu)
(source 'melpa)
(source 'jcs-elpa)

(depends-on "emacs" "26.1")
(depends-on "github-tags")
