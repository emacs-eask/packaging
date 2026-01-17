(define-public node-eask-cli
  (package
    (name "node-eask-cli")
    (version "0.12.2")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/emacs-eask/cli")
               (commit version)))
        (file-name (git-file-name name version))
        (sha256
         (base32
          "IYEWB5RGCZ5FDVUBWVM2C5TT3XS56Y523VXXBHAADPREXFKMIZRA"))))
    (build-system node-build-system)
    (arguments '(#:tests? #f))
    (home-page "https://emacs-eask.github.io/")
    (synopsis "CLI for building, runing, testing, and managing your Emacs Lisp dependencies")
    (description "Eask, originally created as a package development
tool for Elisp projects, has since evolved into a versatile utility
for Emacs Lisp that can be used to develop packages, manage configuration
dependencies, and run Elisp programs as a runtime.")
    (license license:gpl3+)))
