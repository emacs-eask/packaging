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
      (:rmd160 (format "openssl dgst -rmd160 %s" zip))))
   (elenv-linux
    (cl-case type
      (:sha256 (format "openssl dgst -sha256 %s" zip))
      (:rmd160 (format "openssl dgst -rmd160 %s" zip))))  ; XXX: This doesn't work!
   (elenv-windows
    (cl-case type
      (:sha256 (format "certutil -hashfile %s SHA256" zip))
      (:rmd160 (format "echo Not supported" zip))))))

(defun sh-cmd-to-str (cmd)
  "Like the function `shell-command-to-string' but trim the CMD output."
  (string-trim (shell-command-to-string cmd)))

(defun hex-to-base-x (hex base)
  "Convert HEX string to BASE."
  (let ((base (if (stringp base) base
                (substring (eask-2str base) 1))))  ; Accept keyword.
    (sh-cmd-to-str (format "echo %s | xxd -r -p | %s" hex base))))

(defun openssl-parse-output (type output)
  "Extract hash from OUTPUT by TYPE."
  (cond
   (elenv-macos
    (cl-case type
      ((or :sha256 :rmd160) (nth 1 (split-string output " ")))))
   (elenv-linux
    (cl-case type
      ((or :sha256 :rmd160) (nth 1 (split-string output " ")))))
   (elenv-windows
    (cl-case type
      ((or :sha256 :rmd160) (nth 1 (split-string output "\n")))))))

(let* ((ver    (getenv "EASK_VER"))
       (zip    (getenv "EASK_ZIP"))
       (dir    (file-name-nondirectory zip))
       (parent (format "./checksum/%s/%s/" ver dir))
       (rmd160 (sh-cmd-to-str (openssl-command :rmd160 zip)))
       (rmd160 (openssl-parse-output :rmd160 rmd160))
       (sha256 (sh-cmd-to-str (openssl-command :sha256 zip)))
       (sha256 (openssl-parse-output :sha256 sha256))
       (size   (file-size zip)))
  ;; RMD-160
  (let* ((root (concat parent "rmd160/"))
         (hex  rmd160))
    (ignore-errors (make-directory root t))
    ;; Hex
    (let ((file (concat root "hex")))
      (message "%s: %s" file hex)
      (write-region hex nil file))
    ;; Base32
    (let ((file (concat root "base32"))
          (base (hex-to-base-x hex :base32)))
      (message "%s: %s" file base)
      (write-region base nil file))
    ;; Base64
    (let ((file (concat root "base64"))
          (base (hex-to-base-x hex :base64)))
      (message "%s: %s" file base)
      (write-region base nil file)))

  ;; SHA-256
  (let* ((root (concat parent "sha256/"))
         (hex  sha256))
    (ignore-errors (make-directory root t))
    ;; Hex
    (let ((file (concat root "hex")))
      (message "%s: %s" file hex)
      (write-region hex nil file))
    ;; Base32
    (let ((file (concat root "base32"))
          (base (hex-to-base-x hex :base32)))
      (message "%s: %s" file base)
      (write-region base nil file))
    ;; Base64
    (let ((file (concat root "base64"))
          (base (hex-to-base-x hex :base64)))
      (message "%s: %s" file base)
      (write-region base nil file)))

  ;; Size
  (let ((file (concat parent "size")))
    (message "%s: %s" file size)
    (write-region size nil file)))

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; update-checksum.el ends here
