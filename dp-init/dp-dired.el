(provide 'dp-dired)

;(require-package 'dired+)
 
(setq diredp-hide-details-initially-flag nil)
(setq global-dired-hide-details-mode -1)

(define-key global-map "\C-x\C-j" 'dired-jump)
(define-key global-map "\C-x4\C-j" 'dired-jump-other-window)

;; (after-load 'dired
;;   (require 'dired+)
;;   (setq dired-recursive-deletes 'top))

(add-hook 'dired-mode-hook 'hl-line-mode)
