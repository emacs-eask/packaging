(define-public node-env-variable
  (package
    (name "node-env-variable")
    (version "0.0.4")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/bigpipe/env-variable")
               (commit version)))
        (file-name (git-file-name name version))
        (sha256
         (base32
          "0nnpxjxfhy4na7fixb7p3ww6ard5xgggfm83b78i333867r4gmsq"))))
    (build-system node-build-system)
    (arguments '(#:tests? #f)) ; No tests.
    (home-page "https://github.com/bigpipe/env-variable")
    (synopsis "Environment variables for Node with fallbacks")
    (description "This package provides environment variables with
@code{process.env}, @code{window.name}, @code{location.hash} and
@code{localStorage} fallbacks.")
    (license license:expat)))
