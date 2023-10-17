;;; _prepare.el --- Prepration  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'subr-x)

;;
;;; Util

(defun file-to-string (file)
  "Return file's string."
  (with-temp-buffer (insert-file-contents file) (buffer-string)))

(defun checksum-data (path version)
  "Return checksum data from PATH and eask's VERSION."
  `( :sha256 ,(file-to-string (format "checksum/%s/" version))
     :rmd160 ,(file-to-string )
     :size   ,(file-to-string )))

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; _prepare.el ends here
