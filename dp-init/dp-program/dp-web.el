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

;;(add-to-list 'web-mode-engines-alist '("selmer" . "\\.selmer\\."))
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
	("selmer" . "\\.selmer\\.")
        ("blade"  . "\\.blade\\.")))

(add-hook 'web-mode-hook 'dp/web-mode-init)
;;;
