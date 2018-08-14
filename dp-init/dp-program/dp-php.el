;;;

(require-package 'php-mode)
(require-package 'ac-php)
(require-package 'company-php)

(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.install\\'" . php-mode))

;; use php auto yasnippets for php standard functions.
;; (let (( php-yas-path
;; 	(concat user-emacs-directory
;; 		"/include/php-auto-yasnippets/")))
;;   (if (file-exists-p php-yas-path)
;;       (progn
;; 	(load-file (concat php-yas-path "php-auto-yasnippets.el"))
;; 	(require 'php-auto-yasnippets)
;; 	(setq php-auto-yasnippet-php-program
;; 	      (concat php-yas-path "Create-PHP-YASnippet.php"))
;; 	(define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet))))

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

;; (add-hook 'php-mode-hook 'php-enable-symfony2-coding-style)
;; (remove-hook 'php-mode-hook 'php-enable-symfony2-coding-style)
(add-hook 'php-mode-hook 'wicked/php-mode-init)
(add-hook 'php-mode-hook 'yas-minor-mode-on)
;; (add-hook 'php-mode-hook '(lambda ()
;; 			    (auto-complete-mode t)
;; 			    (require 'ac-php)
;; 			    (setq ac-sources  '(ac-source-php ) )
;; 			    (yas-global-mode 1)
;; 			    (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
;; 			    (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
;; 			    ))
;; (add-hook 'php-mode-hook
;; 	  '(lambda ()
;; 	     (require 'company-php)
;; 	     (company-mode t)
;; 	     (add-to-list 'company-backends 'company-ac-php-backend )))

(provide 'dp-php)
;;; dp-php.el ends here
