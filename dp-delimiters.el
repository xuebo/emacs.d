(provide 'dp-delimiters)

;; parenthesis matched but not blink
;; parenthesis matched highlighted within these
;; and use rainbow-delimiters
(setq blink-matching-paren nil)
(show-paren-mode)
;; (setq show-paren-match nil)
(require-package 'rainbow-delimiters)
(global-rainbow-delimiters-mode)
