(provide 'dp-evil)

(require-package 'evil)
(setq evil-default-cursor '("hotpink" box))
 ;; evil-default-cursor
 ;; evil-normal-state-cursor
 ;; evil-insert-state-cursor
 ;; evil-visual-state-cursor
 ;; evil-replace-state-cursor
 ;; evil-operator-state-cursor
 ;; evil-motion-state-cursor
 ;; evil-emacs-state-cursor

(evil-mode t)
;; change mode-line color by evil state
   (lexical-let ((default-color (cons (face-background 'mode-line)
                                      (face-foreground 'mode-line))))
     (add-hook 'post-command-hook
       (lambda ()
         (let ((color (cond ((minibufferp) default-color)
                            ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                            ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                            ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                            (t default-color))))
           (set-face-background 'mode-line (car color))
           (set-face-foreground 'mode-line (cdr color))))))
