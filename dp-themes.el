(provide 'dp-themes)

;; color-theme
(add-to-list 'load-path "~/.emacs.d/color-theme/")
;;(add-to-list 'load-path "~/.emacs.d/color-theme/themes/")
(require 'color-theme)
(color-theme-initialize)
;; (color-theme-gnome2)
;; (color-theme-dark-laptop)
;; (color-theme-high-contrast)
;; (color-theme-lethe)
;; (color-theme-pok-wog)
;; (color-theme-word-perfect)

(when (< emacs-major-version 24)
  (require-package 'color-theme))

;; Toggle between light and dark
(defun cool ()
  "Activate a cool color theme."
  (interactive)
  (color-theme-pok-wob))

(defun sweet ()
  "Activate a sweet color theme."
  (interactive)
  (color-theme-hello-kitty))

(defun crazy ()
  "Activate a crazy color theme."
  (interactive)
  (color-theme-high-contrast))
