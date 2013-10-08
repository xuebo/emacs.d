;;;

(require-package 'php-mode)
(require-package 'smarty-mode)

;; (defun pear/php-mode-init()
;;   "Set some buffer-local variables."
;;   (setq case-fold-search t)
;;   (c-set-offset 'arglist-intro '+)
;;   (c-set-offset 'arglist-close '0)
;; )
;; (add-hook 'php-mode-hook 'pear/php-mode-init)

(defun wicked/php-mode-init ()
  "Set some buffer-local variables."
  (setq case-fold-search t) 
  (setq indent-tabs-mode nil)
  (setq fill-column 78)
  (setq c-basic-offset 4)
  (c-set-offset 'arglist-cont 0)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'case-label 2)
  (c-set-offset 'arglist-close 0))

(add-hook 'php-mode-hook 'wicked/php-mode-init)

(provide 'dp-php)
;;; dp-php.el ends here
