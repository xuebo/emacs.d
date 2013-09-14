(provide 'dp-themes)

;; cursor color
(set-cursor-color "hotpink")
(defvar blink-cursor-colors (list  "#7cfc00" "#92c48f" "#ff00ff" "#6785c5"
				   "#be369c" "#d9ca65" "#f08080" "#ff1493")
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
(cool)
