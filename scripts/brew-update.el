;;; brew-update.el --- Update Homebrew formula  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'github-tags)

(let* ((response (cdr (github-tags "emacs-eask/cli")))
       (tags (plist-get response :names))
       (latest (or "0.5.5" (car tags)))
       (version)
       (beg) (end))
  (with-current-buffer (find-file "Formula/eask-cli.rb")
    (goto-char (point-min))
    (when (search-forward "version " nil t)
      (setq beg (1+ (point))
            end (1- (line-end-position))
            version (buffer-substring beg end))
      (unless (string= version latest)
        (delete-region beg end)
        (forward-char 1)
        (insert latest)))
    (save-buffer)))

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; brew-update.el ends here
