(provide 'dp-themes)

;; cursor color
(set-cursor-color "hotpink")

(let ((spec '((t (:family "Nimbus Roman")))))
        (mapc (lambda (face)
            (face-spec-set face spec)
            (put face 'face-defface-spec spec))
            '(default menu)))

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
