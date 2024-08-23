;;; snap-update.el --- Update Snap snapcraft.yaml  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(load-file "./scripts/_prepare.el")

(let* ((latest (get-latest-tag))
       (version)
       (beg) (end))
  (with-find-file "snap/snapcraft.yaml"
    (goto-char (point-min))
    (when (search-forward "version: " nil t)
      (when-let ((beg (point))
                 (end (line-end-position))
                 (version (buffer-substring beg end))
                 (_ (not (string= version latest)))
                 (new-content (string-replace version latest (buffer-string))))
        (erase-buffer)
        (insert new-content)
        (save-buffer)
        (message "[INFO] Updated file %s to version %s" tf latest)))))

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; snap-update.el ends here
