;;; _prepare.el --- Prepration  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'cl-lib)
(require 'subr-x)

;;
;;; Util

(defun file-to-string (file)
  "Return file's string."
  (with-temp-buffer (insert-file-contents file) (buffer-string)))

(defun checksum-zip (symbol version arch)
  "Return checksum zip path."
  (cl-case symbol
    (`npm (format "cli-%s.tgz" version))
    (t (format "eask_%s_%s.zip" version arch))))

(defun checksum-data (symbol version &optional arch)
  "Return checksum data from SYMBOL and eask's VERSION."
  (let ((zip (checksum-zip symbol version arch)))
    `( :sha256 ,(file-to-string (format "checksum/%s/%s/sha256" version zip))
       :rmd160 ,(file-to-string (format "checksum/%s/%s/rmd160" version zip))
       :size   ,(file-to-string (format "checksum/%s/%s/size" version zip)))))

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; _prepare.el ends here
