;;; scoop-update.el --- Update Homebrew formula  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'github-tags)

(let* ((response (cdr (github-tags "emacs-eask/cli")))
       (tags (plist-get response :names))
       (latest (car tags))
       (version)
       (beg) (end))
  (with-current-buffer (find-file "bucket/eask-cli.json")
    (goto-char (point-min))
    (when (search-forward "\"version\": " nil t)
      (when-let ((beg (1+ (point)))
                 (end (- (line-end-position) 2))
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
;;; scoop-update.el ends here
