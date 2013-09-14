(provide 'dp-dired)

(require-package 'dired+)

(setq diredp-hide-details-initially-flag nil)
(setq global-dired-hide-details-mode -1)

(after-load 'dired
  (require 'dired+)
  (setq dired-recursive-deletes 'top))
