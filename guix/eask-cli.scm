;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2024 Jen-Chieh Shen <jcs090218@gmail.com>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (gnu packages node-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages python)
  #:use-module (gnu packages web)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system node))

;;;
;;; Please: Try to add new module packages in alphabetic order.
;;;

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
          "1li618smw62xkz4h51accxskdpmg7agj9pvvlzll5kw4sahck9hv"))))
    (build-system node-build-system)
    (arguments '(#:tests? #f)) ; No tests.
    (home-page "https://github.com/emacs-eask/cli")
    (synopsis "Elisp Package Manager")
    (description "CLI for building, running, testing, and managing
your Emacs Lisp dependencies")
    (license license:gpl3+)))

node-eask-cli

;;;
;;; Avoid adding new packages to the end of this file. To reduce the chances
;;; of a merge conflict, place them above in alphabetic order.
;;;
