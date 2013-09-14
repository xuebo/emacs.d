(provide 'dp-growl)

(require-package 'todochiku)

(require 'todochiku) ;; growl notifications when compilation finishes
(setq todochiku-icons-directory
      (expand-file-name "site-lisp/todochiku-icons" user-emacs-directory))

(defcustom terminal-notifier-path
  "/Applications/terminal-notifier.app/Contents/MacOS/terminal-notifier"
  "Path to the terminal-notifier app for Mountain Lion, if installed.
See https://github.com/alloy/terminal-notifier for more information.")

;; (when (and *is-a-mac* (file-executable-p terminal-notifier-path))
;;   (defadvice todochiku-get-arguments (around todochiku-terminal-notifier activate)
;;     (setq ad-return-value
;;           (list "-title" title "-message" message "-activate" "org.gnu.Emacs")))
;;   (setq todochiku-command terminal-notifier-path))

(defadvice todochiku-message (around check-for-helper activate)
  "Suppress message attempts when the `todochiku-command' program is missing."
  (when (executable-find todochiku-command)
    ad-do-it))
