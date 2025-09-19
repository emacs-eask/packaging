;;; guix-update.el --- Update GUIX scm  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(load-file "./scripts/_prepare.el")

(let* ((latest (get-latest-tag))
       (version)
       (beg) (end)
       (data (checksum-data "npm" latest)))
  (with-find-file "guix/eask-cli.scm"
    (goto-char (point-min))
    (when (search-forward "(version " nil t)
      (when-let* ((beg (1+ (point)))
                  (end (- (line-end-position) 2))
                  (version (buffer-substring beg end))
                  (_ (not (string= version latest)))
                  (new-content (string-replace version latest (buffer-string))))
        (erase-buffer)
        (insert new-content)
        ;; node
        (goto-char (point-min))
        (when (and (search-forward "(base32" nil t)
                   (search-forward "\"" nil t))
          (delete-region (point) (- (line-end-position) 5))
          (insert (remove-base-padding (plist-get data :sha256/base32))))
        (save-buffer)
        (message "[INFO] Updated file %s to version %s" tf latest)))))

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; guix-update.el ends here
