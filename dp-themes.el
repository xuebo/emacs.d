(provide 'dp-themes)

(require-package 'color-theme)
(require 'dp-color-themes)

;; Toggle cool, sweet and crazy. 
(defun cool ()
  "Activate a cool color theme."
  (interactive)
  (color-theme-xuebo-black-white))

(defun sweet ()
  "Activate a sweet color theme."
  (interactive)
  (color-theme-hello-kitty))

(defun crazy ()
  "Activate a crazy color theme."
  (interactive)
  (color-theme-high-contrast))
;; default theme
(sweet)
