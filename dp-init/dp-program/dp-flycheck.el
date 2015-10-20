(provide 'dp-flycheck)

(when (eval-when-compile (>= emacs-major-version 24))
  (require-package 'flycheck)
  (add-hook 'after-init-hook 'global-flycheck-mode))

;; todo why not func???
;; not found flycheck-declare-checker ???
;; (flycheck-declare-checker phpcs
;;       "A PHP syntax checker using the PHP_CodeSniffer.

;; See URL `http://pear.php.net/package/PHP_CodeSniffer/'."
;;       :command '("phpcs" "--standard=Drupal" "--report=emacs" source)
;;       :error-patterns
;;       '(("\\(?1:.*\\):\\(?2:[0-9]+\\):\\(?3:[0-9]+\\): error - \\(?4:.*\\)" error)
;;         ("\\(?1:.*\\):\\(?2:[0-9]+\\):\\(?3:[0-9]+\\): warning - \\(?4:.*\\)" warning))
;;       :modes '(php-mode php+-mode drupal-mode)
;;       :next-checkers '(php))
