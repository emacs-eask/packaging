;;; _prepare.el --- Prepration  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'cl-lib)
(require 'subr-x)

(require 'elenv)

;;
;;; Util

(defun file-size (file)
  "Return file's size."
  (with-temp-buffer (insert-file-contents file) (eask-2str (buffer-size))))

(defun file-to-string (file)
  "Return file's string."
  (with-temp-buffer (insert-file-contents file) (buffer-string)))

(defun checksum-zip (type version)
  "Return checksum zip path."
  (cl-case type
    (`npm (format "cli-%s.tgz" version))
    (t    (format "eask_%s_%s.zip" version type))))

(defun checksum-data (type version)
  "Return checksum data from TYPE and eask's VERSION."
  (let* ((zip (checksum-zip type version))
         (sha256 (format "checksum/%s/%s/sha256" version zip))
         (rmd160 (format "checksum/%s/%s/rmd160" version zip))
         (size   (format "checksum/%s/%s/size" version zip)))
    `( :sha256 ,(string-trim (file-to-string sha256))
       :rmd160 ,(string-trim (file-to-string rmd160))
       :size   ,(string-trim (file-to-string size)))))

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; _prepare.el ends here
