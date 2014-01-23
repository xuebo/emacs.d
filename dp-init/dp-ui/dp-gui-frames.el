(provide 'dp-gui-frames)

;; Suppress GUI features
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
;; highlights the line to make the cursor even more visible
(setq global-hl-line-mode t)
;; enabled line number mode in global
(global-linum-mode t)
;; enable column number mode
(column-number-mode t)
;; the indication mode. eg. `k' for 10^3
(size-indication-mode t)
;; Show a marker in the left fringe for lines not in the buffer
(setq indicate-empty-lines t)

;; Window size and features
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

(defun adjust-opacity (frame incr)
  (let* ((oldalpha (or (frame-parameter frame 'alpha) 100))
         (newalpha (+ incr oldalpha)))
    (when (and (<= frame-alpha-lower-limit newalpha) (>= 100 newalpha))
      (modify-frame-parameters frame (list (cons 'alpha newalpha))))))

(global-set-key (kbd "C-(") '(lambda () (interactive) (adjust-opacity nil -5)))
(global-set-key (kbd "C-)") '(lambda () (interactive) (adjust-opacity nil 5)))
(global-set-key (kbd "C-*") '(lambda () (interactive) (modify-frame-parameters nil `((alpha . 100)))))

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame
              (unless window-system
                (set-frame-parameter nil 'menu-bar-lines 0)))))

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))
