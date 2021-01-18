(provide 'dp-themes)

;; cursor color
(add-hook 'window-setup-hook '(lambda () (set-cursor-color "red")))
(add-hook 'after-make-frame-functions 
	  '(lambda (f) (with-selected-frame 
			   f (set-cursor-color "red"))))
(set-cursor-color "red")
;; (defvar blink-cursor-colors (list  "yellow" "chartreuse" "violet" "snow")
;;   "On each blink the cursor will cycle to the next color in this list.")

(defvar blink-cursor-colors (list  "#ffffff" "#e66fa6" "#ccfd9f" "#e21d1d")
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

;; (require-package 'color-theme)
;; (color-theme-initialize)
;; (require 'dp-color-themes)

;; ;; Toggle cool, sweet and crazy. 
;; (defun cool ()
;;   "Activate a cool color theme."
;;   (interactive)
;;   (color-theme-xuebo-black-white))

;; (defun sweet ()
;;   "Activate a sweet color theme."
;;   (interactive)
;;   (color-theme-hello-kitty))

;; (defun crazy ()
;;   "Activate a crazy color theme."
;;   (interactive)
;;   (color-theme-high-contrast))


;; (require-package 'doom-themes)
;; (require 'doom-themes)


;; ;; use doom themes
;; ;; Global settings (defaults)
;; (setq doom-themes-enable-bold t	; if nil, bold is universally disabled
;;       doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; ;; may have their own settings.


;; ;;(load-theme 'doom-one t)
;; ;; (load-theme 'doom-vibrant t)
;; ;; (load-theme 'doom-city-lights t)
;; ;; (load-theme 'doom-dracula t)
;; ;; (load-theme 'doom-Iosvkem t)
;; ;; (load-theme 'doom-solarized-light t)
;; ;; (load-theme 'doom-spacegrey t)
;; ;; (load-theme 'doom-peacock t)
;; ;; (load-theme 'doom-molokai t)

;; ;; Enable flashing mode-line on errors
;; (doom-themes-visual-bell-config)

;; ;; Enable custom neotree theme (all-the-icons must be installed!)
;; (doom-themes-neotree-config)
;; ;; or for treemacs users
;; (doom-themes-treemacs-config)

;; ;; Corrects (and improves) org-mode's native fontification.
;; (doom-themes-org-config)
;; ;; default theme
;; ;;(cool)

;; idea darkula theme
(require-package 'idea-darkula-theme)
(load-theme 'idea-darkula t)

;; dracula
;; (require-package 'dracula-theme)
;; (load-theme 'dracula t)
