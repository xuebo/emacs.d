(provide 'dp-delimiters)

;; parenthesis matched but not blink
;; parenthesis matched highlighted within these
;; and use rainbow-delimiters
(setq blink-matching-paren nil)
(show-paren-mode)
;; (setq show-paren-match nil)
(load-file "~/.emacs.d/plugins/rainbow-delimiter/rainbow-delimiters.el")
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)
