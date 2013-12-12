;;; package -- summary
;;; Commentary:

;;; Code:

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

(defun my-move-key (keymap-from keymap-to key)
  "Moves key binding from one keymap to another, deleting from the old location. "
  (define-key keymap-to key (lookup-key keymap-from key))
  (define-key keymap-from key nil))
(my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
(my-move-key evil-motion-state-map evil-normal-state-map " ")

(defun wicked/evil-emacs-state-init (hooks)
  (mapc (lambda (hook)
	  (add-hook
	   hook
	   (lambda () (evil-motion-state))))
	hooks))

(wicked/evil-emacs-state-init
 (list 'dired-mode-hook
       'geben-mode-hook
       'ibuffer-mode-hook))

(provide 'dp-evil)
;;; de-evil.el ends here.
