;;; choco-update.el --- Update Choco nuspec  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(load-file "./scripts/_prepare.el")

(let* ((latest (get-latest-tag))
       (version)
       (beg) (end)
       (data (checksum-data "win-x64" latest))
       (updated))
  (with-find-file "chocolatey/eask-cli.nuspec"
    (goto-char (point-min))
    (when (search-forward "<version>" nil t)
      (when-let ((beg (point))
                 (end (- (line-end-position) 10))
                 (version (buffer-substring beg end))
                 (_ (not (string= version latest)))
                 (new-content (string-replace version latest (buffer-string))))
        (erase-buffer)
        (insert new-content)
        (save-buffer)
        (setq updated t)
        (message "[INFO] Updated file %s to version %s" tf latest))))
  (when updated
    (with-find-file "chocolatey/tools/chocolateyinstall.ps1"
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
