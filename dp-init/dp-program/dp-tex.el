;;;

(require-package 'auctex)

(defun wicked/tex-mode-init ()
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master t)
  "Set some buffer-local variables.")
(add-hook 'LaTeX-mode-hook 'wicked/tex-mode-init)

(provide 'dp-tex)
;;; dp-php.el ends here
