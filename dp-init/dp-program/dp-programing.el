(provide 'dp-programing)
(require-package 'electric-spacing)
(require-package 'lsp-mode)

(require-package 'lsp-vue)
(require-package 'lsp-javascript-typescript)

(use-package lsp-mode
  :defer t
  :commands (lsp lsp-deferred)
  ;; :bind (("M-s O" . moccur)
  ;; 	 :map isearch-mode-map
  ;; 	 ("M-o" . isearch-moccur)
  ;; 	 ("M-O" . isearch-moccur-all))
  :bind (("C-c m" . lsp-ui-imenu)
	 ("C-]" . lsp-ui-peek-find-definition)
	 ("C-<" . lsp-ui-peek-jump-backward)
	 ("C->" . lsp-ui-peek-jump-forward)
	 ("C-c f" . lsp-ui-peek-find-references))
  :init 
  (add-hook 'web-mode-hook #'lsp)
  (add-hook 'python-mode-hook #'lsp)
  (add-hook 'c++-mode-hook #'lsp)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  (add-hook 'typescript-mode-hook #'lsp)
  (add-hook 'rjsx-mode-hook #'lsp))

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
(use-package company-lsp :commands company-lsp)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;(add-hook 'java-mode-hook #'lsp)
;(add-hook 'web-mode-hook #'lsp-deferred)

(which-function-mode 1)
(require 'dp-csharp)
(require 'dp-markdown)
(require 'dp-org)
(require 'dp-javascript)
(require 'dp-python)
(require 'dp-php)
(require 'dp-nxml)
(require 'dp-css)
(require 'dp-haml)
(require 'dp-web)
(require 'dp-sql)
(require 'dp-geben)

(require 'dp-paredit)
(require 'dp-haskell)
(require 'dp-elisp)
(require 'dp-slime)
(require 'dp-clojure)
(require 'dp-cl)
(require 'dp-java)
(require 'dp-solidity)

(require 'dp-http)
(require 'dp-yaml)

