(define-public node-eask-cli
  (package
    (name "node-eask-cli")
    (version "0.12.6")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/emacs-eask/cli")
               (commit version)))
        (file-name (git-file-name name version))
        (sha256
         (base32
          "KHVIF36T3OXGZWLIT5MFBSEJLJ7C3THW2FVZII3SZH4G4EBW2ZLA"))))
    (build-system node-build-system)
    (arguments '(#:tests? #f))
    (home-page "https://emacs-eask.github.io/")
    (synopsis "CLI for building, runing, testing, and managing your Emacs Lisp dependencies")
    (description "Eask, originally created as a package development
tool for Elisp projects, has since evolved into a versatile utility
for Emacs Lisp that can be used to develop packages, manage configuration
dependencies, and run Elisp programs as a runtime.")
    (license license:gpl3+)))
