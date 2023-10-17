;;; choco-update.el --- Update Choco nuspec  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(load-file "./scripts/_prepare.el")

(require 'github-tags)

(let* ((response (cdr (github-tags "emacs-eask/cli")))
       (tags (plist-get response :names))
       (latest (car tags))
       (version)
       (beg) (end)
       (data (checksum-data "win-x64" latest))
       (updated))
  (with-current-buffer (find-file "chocolatey/eask-cli.nuspec")
    (goto-char (point-min))
    (when (search-forward "<version>" nil t)
      (when-let ((beg (point))
                 (end (- (line-end-position) 10))
                 (version (buffer-substring beg end))
                 ;;(_ (not (string= version latest)))
                 (new-content (string-replace version latest (buffer-string))))
        (erase-buffer)
        (insert new-content)
        (save-buffer)
        (setq updated t)
        (message "[INFO] Update Eask CLI to latest version %s" latest))))
  (when updated
    (with-current-buffer (find-file "chocolatey/tools/chocolateyinstall.ps1")
      (goto-char (point-min))
      (when (search-forward "checksum      = '" nil t)
        (delete-region (point) (1- (line-end-position)))
        (insert (plist-get data :sha256)))
      (goto-char (point-min))
      (when (search-forward "checksum64    = '" nil t)
        (delete-region (point) (1- (line-end-position)))
        (insert (plist-get data :sha256)))
      (save-buffer))))

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; choco-update.el ends here
