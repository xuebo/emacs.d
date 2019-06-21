;;; provide dp-web
(provide 'dp-web)

(defun dp/web-mode-init ()
  (setq indent-tabs-mode nil))

(require-package 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.htm\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ctp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.dwt\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.selmer.clj\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

;;(add-to-list 'web-mode-engines-alist '("selmer" . "\\.selmer\\."))
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
	("selmer" . "\\.selmer\\.")
        ("blade"  . "\\.blade\\.")))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-style-padding 2)
  (setq web-mode-script-padding 2)
)

(add-hook 'web-mode-hook  'my-web-mode-hook)
(add-hook 'web-mode-hook 'dp/web-mode-init)
;;;

;;;; .dir-locals.el
;; ;; emacs use web-mode for vue & js code
;; ((nil . ((eval . (progn
;; 		   ;;(message " >>>> dir-locals.el")
;; 		   (add-hook 'rjsx-mode-hook 'prettier-js-mode)
;; 		   (add-hook 'web-mode-hook 'prettier-js-mode)
;; 		   ;; (add-hook 'web-mode-hook 'company-mode)
;; 		   ;; (add-hook 'web-mode-hook
;; 		   ;; 	     (lambda ()
;; 		   ;; 		 (setq company-backends '((company-css) (company-dabbrev) (company-files) (company-lsp)))))
;; 		   ;; (add-hook 'rjsx-mode-hook
;; 		   ;; 	     (lambda ()
;; 		   ;; 	       (progn
;; 		   ;; 		 (setq company-backends '((company-lsp) (company-dabbrev) (company-files) )))))
;; 		   (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
;; 		   (add-to-list 'auto-mode-alist '("\\.jsx.js\\'" . rjsx-mode))))))

;;  ;; set web mode variables
;;  (web-mode
;;   (indent-tabs-mode . nil)
;;   (tab-width . 2)
;;   (eval . (progn
;; 	    (setq web-mode-markup-indent-offset 2)
;; 	    (setq web-mode-css-indent-offset 2)
;; 	    (setq web-mode-code-indent-offset 2)
;; 	    (setq web-mode-style-padding 0)
;; 	    (setq web-mode-script-padding 0)))))
