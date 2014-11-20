;;;

(require-package 'php-mode)

(let (( php-yas-path
	(concat user-emacs-directory
		"/include/php-auto-yasnippets/")))
  (if (file-exists-p php-yas-path)
      (progn
	(load-file (concat php-yas-path "php-auto-yasnippets.el"))
	(require 'php-auto-yasnippets)
	(setq php-auto-yasnippet-php-program
	      (concat php-yas-path "Create-PHP-YASnippet.php"))
	(define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet))))

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

(add-hook 'php-mode-hook 'php-enable-symfony2-coding-style)
(add-hook 'php-mode-hook 'yas-minor-mode-on)

(provide 'dp-php)
;;; dp-php.el ends here
