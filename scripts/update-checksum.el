;;; update-checksum.el --- Update Checksum files  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(let* ((ver (getenv "EASK_VER"))
       (zip (car (or (directory-files "~/" t "eask_")
                     (directory-files "~/" t "cli-"))))   ; XXX: For npm tgz!
       (dir (file-name-nondirectory zip))
       (parent (format "./checksum/%s/%s/" ver dir))
       (rmd160 (shell-command-to-string (format "openssl dgst -rmd160 %s" zip)))
       (sha256 (shell-command-to-string (format "openssl dgst -sha256 %s" zip)))
       (size   (shell-command-to-string (format "stat -f%z %s" zip))))
  (ignore-errors (make-directory parent t))
  (write-region rmd160 nil (concat parent "rmd160"))
  (write-region sha256 nil (concat parent "sha256"))
  (write-region size nil (concat parent "size")))

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; update-checksum.el ends here
