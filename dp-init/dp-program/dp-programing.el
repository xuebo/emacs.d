(provide 'dp-programing)
(require-package 'electric-spacing)
(require-package 'lsp-mode)

(require-package 'lsp-vue)
(require-package 'lsp-javascript-typescript)

(use-package lsp-mode
  :defer t
  :commands (lsp lsp-deferred)
  :init 
  (add-hook 'web-mode-hook #'lsp)
  (add-hook 'typescript-mode-hook #'lsp)
  (add-hook 'rjsx-mode-hook #'lsp))

;(add-hook 'java-mode-hook #'lsp)
;(add-hook 'web-mode-hook #'lsp-deferred)

(which-function-mode 1)
(require 'dp-csharp)
(require 'dp-markdown)
(require 'dp-org)
(require 'dp-javascript)
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

