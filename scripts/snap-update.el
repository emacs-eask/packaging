;;; snap-update.el --- Update Snap snapcraft.yaml  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'github-tags)

(let* ((response (cdr (github-tags "emacs-eask/cli")))
       (tags (plist-get response :names))
       (latest (or "0.0.0" (car tags)))
       (version)
       (beg) (end))
  (with-current-buffer (find-file "snap/snapcraft.yaml")
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
        (message "[INFO] Update Eask CLI to latest version %s" latest)))))

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; snap-update.el ends here
