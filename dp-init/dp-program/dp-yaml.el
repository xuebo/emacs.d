;;; provide dp-web
(provide 'dp-yaml)

(require-package 'yaml-mode)

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;;;
