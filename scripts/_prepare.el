;;; _prepare.el --- Prepration  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'cl-lib)
(require 'subr-x)

(require 'elenv)

;;
;;; Util

(defmacro with-find-file (filename &rest body)
  "Execute BODY in FILENAME."
  (declare (indent 1) (debug t))
  `(let ((tf ,filename)) (with-current-buffer (find-file tf) ,@body)))

(defun file-size (filename)
  "Return FILENAME's size."
  (eask-2str (file-attribute-size (file-attributes filename))))

(defun file-to-string (filename)
  "Return FILENAME's string."
  (with-temp-buffer (insert-file-contents filename) (buffer-string)))

(defun checksum-zip (type version)
  "Return checksum zip path."
  (cl-case type
    (`npm (format "cli-%s.tgz" version))
    (t
     (cond ((string-match-p "win" type)
            (format "eask_%s_%s.zip" version type))
           (t
            (format "eask_%s_%s.tar.gz" version type))))))

(defun checksum-data (type version)
  "Return checksum data from TYPE and eask's VERSION."
  (let* ((zip           (checksum-zip type version))
         (rmd160/hex    (format "checksum/%s/%s/rmd160/hex"    version zip))
         (rmd160/base32 (format "checksum/%s/%s/rmd160/base32" version zip))
         (rmd160/base64 (format "checksum/%s/%s/rmd160/base64" version zip))
         (sha256/hex    (format "checksum/%s/%s/sha256/hex"    version zip))
         (sha256/base32 (format "checksum/%s/%s/rmd160/base32" version zip))
         (sha256/base64 (format "checksum/%s/%s/rmd160/base64" version zip))
         (size          (format "checksum/%s/%s/size"          version zip)))
    `( :sha256/hex    ,(string-trim (file-to-string sha256/hex))
       :sha256/base32 ,(string-trim (file-to-string sha256/base32))
       :sha256/base64 ,(string-trim (file-to-string sha256/base64))
       :rmd160/hex    ,(string-trim (file-to-string rmd160/hex))
       :rmd160/base32 ,(string-trim (file-to-string rmd160/base32))
       :rmd160/base64 ,(string-trim (file-to-string rmd160/base64))
       :size          ,(string-trim (file-to-string size)))))

(defun get-latest-tag ()
  "Return the latest tag (not including pre-release)."
  (require 'github-tags)
  (if-let* ((repo "emacs-eask/cli")
            (response (cdr (github-tags repo)))
            (tags (plist-get response :names))
            (latest (nth 1 tags)))  ; Skip the first one since it's the pre-release!
      latest
    (user-error "[ERROR] Latest tag not found in repository: %s" repo)))

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; _prepare.el ends here
