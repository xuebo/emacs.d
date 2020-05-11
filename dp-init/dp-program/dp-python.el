(provide 'dp-python)

(require-package 'python-mode)


(add-auto-mode 'python-mode "\\.py\\'")


(use-package python-mode
  :defer t
  ;; :commands (lsp lsp-deferred)
  ;; :bind (("M-s O" . moccur)
  ;; 	 :map isearch-mode-map
  ;; 	 ("M-o" . isearch-moccur)
  ;; 	 ("M-O" . isearch-moccur-all))
  ;; :bind (("C-c m" . lsp-ui-imenu)
  ;; 	 ("C-]" . lsp-ui-peek-find-definition)
  ;; 	 ("C-<" . lsp-ui-peek-jump-backward)
  ;; 	 ("C->" . lsp-ui-peek-jump-forward)
  ;; 	 ("C-c f" . lsp-ui-peek-find-references))
  :init 
  ;; (add-hook 'web-mode-hook #'lsp)
  ;; (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  ;; (add-hook 'typescript-mode-hook #'lsp)
  ;; (add-hook 'rjsx-mode-hook #'lsp))
  )

