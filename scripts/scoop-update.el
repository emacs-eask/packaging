;;; scoop-update.el --- Update Scoop Bucket  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(load-file "./scripts/_prepare.el")

(let* ((latest (get-latest-tag))
       (version)
       (beg) (end)
       (x64-data   (checksum-data "win-x64" latest))
       (arm64-data (checksum-data "win-arm64" latest)))
  (with-find-file "bucket/eask-cli.json"
    (goto-char (point-min))
    (when (search-forward "\"version\": " nil t)
      (when-let ((beg (1+ (point)))
                 (end (- (line-end-position) 2))
                 (version (buffer-substring beg end))
                 (_ (not (string= version latest)))
                 (new-content (string-replace version latest (buffer-string))))
        (erase-buffer)
        (insert new-content)
        ;; x64
        (goto-char (point-min))
        (when (and (search-forward "\"64bit\": " nil t)
                   (search-forward "\"hash\": \"" nil t))
          (delete-region (point) (1- (line-end-position)))
          (insert (plist-get x64-data :sha256)))
        ;; arm64
        (goto-char (point-min))
        (when (and (search-forward "\"arm64\": " nil t)
                   (search-forward "\"hash\": \"" nil t))
          (delete-region (point) (1- (line-end-position)))
          (insert (plist-get arm64-data :sha256)))
        (save-buffer)
        (message "[INFO] Updated file %s to version %s" tf latest)))))

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; scoop-update.el ends here
