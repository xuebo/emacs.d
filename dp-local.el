(provide 'dp-local)

;; (global-hl-line-mode)
;; recursive minibuffers
(setq enable-recursive-minibuffers t)

;; enabled confirm message for `switch-to-buffer' non existent file
;; or buffer
(setq confirm-nonexistent-file-or-buffer t)

;; invoke the focus position when xwindow mouse click
(setq x-mouse-click-focus-ignore-position nil)

(put 'scroll-left 'disabled nil)

;; clipboard before the primary selection
;;(setq x-select-enable-clipboard t)

;; do not allow auto backup
(setq make-backup-files nil)

;;(require 'cedet)
;;(semantic-load-enable-code-helpers)
;;(global-set-key [(control tab)] 'semantic-ia-complete-symbol-menu)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ede-project-directories (quote ("/home/xb/work/c"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; hide toolbar
(menu-bar-showhide-tool-bar-menu-customize-disable)

;; emacs windows init
(global-set-key [f11] 'win-fullscreen) 
(defun win-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
(defun win-maximized ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
(win-fullscreen)
