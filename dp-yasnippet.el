(provide 'dp-yasnippet)

(require-package 'yasnippet)
(yas-global-mode t)

;; Develop and keep my snippets under these
(setq yas/root-directory 
      (expand-file-name "/mysnippets" user-emacs-directory))

;; Map `yas/load-directory' to every element
;;(mapc 'yas/load-directory yas/root-directory)
(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt))
