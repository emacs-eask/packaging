(define-public node-eask-cli
  (package
    (name "node-eask-cli")
    (version "0.10.2")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/emacs-eask/cli")
               (commit version)))
        (file-name (git-file-name name version))
        (sha256
         (base32
          "0nnpxjxfhy4na7fixb7p3ww6ard5xgggfm83b78i333867r4gmsq"))))
    (build-system node-build-system)
    (arguments '(#:tests? #f)) ; No tests.
    (home-page "https://github.com/emacs-eask/cli")
    (synopsis "Elisp Package Manager")
    (description "CLI for building, running, testing, and managing
your Emacs Lisp dependencies")
    (license license:gpl3+)))
