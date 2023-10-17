;;; update-checksum.el --- Update Checksum files  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(load-file "./scripts/_prepare.el")

(defun openssl-command (type zip)
  "Return openssl command by TYPE and ZIP."
  (cond
   (elenv-macos
    (cl-case type
      (:sha256 (format "openssl dgst -sha256 %s" zip))
      (:rmd160 (format "openssl dgst -rmd160 %s" zip))
      (:size   (format "stat -f%%z %s" zip))))
   (elenv-linux
    (cl-case type
      (:sha256 (format "openssl dgst -sha256 %s" zip))
      (:rmd160 (format "openssl dgst -rmd160 %s" zip))  ; XXX: This doesn't work!
      (:size   (format "stat -c \"%%s\" %s" zip))))
   (elenv-windows
    (cl-case type
      (:sha256 (format "scripts/filehash.ps1 %s SHA256" zip))
      (:rmd160 (format "scripts/filehash.ps1 %s RIPEMD160" zip))
      (:size   (format "scripts/item.ps1 %s" zip))))))

(defun openssl-parse-output (type output)
  "Extract hash from OUTPUT by TYPE."
  (cond
   (elenv-macos
    (cl-case type
      ((or :sha256 :rmd160) (nth 1 (split-string output " ")))
      (:size                output)))
   (elenv-linux
    (cl-case type
      ((or :sha256 :rmd160) (nth 1 (split-string output " ")))
      (:size                output)))
   (elenv-windows output)))

(let* ((ver (getenv "EASK_VER"))
       (zip (concat "~/" (getenv "EASK_ZIP")))
       (dir (file-name-nondirectory zip))
       (parent (format "./checksum/%s/%s/" ver dir))
       (rmd160 (shell-command-to-string (openssl-command :rmd160 zip)))
       (rmd160 (openssl-parse-output :rmd160 rmd160))
       (sha256 (shell-command-to-string (openssl-command :sha256 zip)))
       (sha256 (openssl-parse-output :sha256 sha256))
       (size   (shell-command-to-string (openssl-command :size zip)))
       (size   (openssl-parse-output :size size)))
  (ignore-errors (make-directory parent t))
  (message "rmd160: %s" rmd160)
  (message "sha256: %s" sha256)
  (message "size: %s" size)
  (write-region rmd160 nil (concat parent "rmd160"))
  (write-region sha256 nil (concat parent "sha256"))
  (write-region size nil (concat parent "size")))

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; update-checksum.el ends here
