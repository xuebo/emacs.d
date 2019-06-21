(provide 'dp-themes)

;; cursor color
(add-hook 'window-setup-hook '(lambda () (set-cursor-color "red")))
(add-hook 'after-make-frame-functions 
	  '(lambda (f) (with-selected-frame 
			   f (set-cursor-color "red"))))
(set-cursor-color "red")
(defvar blink-cursor-colors (list  "yellow" "chartreuse" "violet" "snow")
  "On each blink the cursor will cycle to the next color in this list.")

(setq blink-cursor-count 0)
(defun blink-cursor-timer-function ()
  "Zarza wrote this cyberpunk variant of timer `blink-cursor-timer'. 
Warning: overwrites original version in `frame.el'.

This one changes the cursor color on each blink. Define colors in `blink-cursor-colors'."
  (when (not (internal-show-cursor-p))
    (when (>= blink-cursor-count (length blink-cursor-colors))
      (setq blink-cursor-count 0))
    (set-cursor-color (nth blink-cursor-count blink-cursor-colors))
    (setq blink-cursor-count (+ 1 blink-cursor-count))
    )
  (internal-show-cursor nil (not (internal-show-cursor-p))))

(require-package 'color-theme)
(color-theme-initialize)
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
;;(cool)

