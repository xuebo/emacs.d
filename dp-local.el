(provide 'dp-local)
(add-to-list 'default-frame-alist '(cursor-color . "#c71585"))

;; recursive minibuffers
(setq enable-recursive-minibuffers t)

;; enabled confirm message for `switch-to-buffer' non existent file
;; or buffer
(setq confirm-nonexistent-file-or-buffer t)

;; invoke the focus position when xwindow mouse click
(setq x-mouse-click-focus-ignore-position nil)

;; clipboard before the primary selection
(setq x-select-enable-clipboard t)

;; do not allow auto backup
(setq make-backup-files nil)

;;; add yasnippet path
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode t)

;; Develop and keep my snippets under these
(setq yas/root-directory '("~/.emacs.d/mysnippets"
			   "~/.emacs.d/plugins/yasnippet/snippets"))
;; Map `yas/load-directory' to every element
(mapc 'yas/load-directory yas/root-directory)
(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt))

;;(require 'cedet)
;;(semantic-load-enable-code-helpers)
;;(global-set-key [(control tab)] 'semantic-ia-complete-symbol-menu)

;; slime
(setq inferior-lisp-program "~/hack/sbcl/install.d/bin/sbcl")
(add-to-list 'load-path "~/hack/slime/slime.cvs/slime")
(require 'slime)
(slime-setup '(slime-fancy))

;; smex 
(add-to-list 'load-path "~/.emacs.d/plugins/smex/smex.git")
; Not needed if you use package.el
(require 'smex)
; Can be omitted. This might cause a (minimal) delay
; when Smex is auto-initialized on its first run.
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Php mode 
(add-to-list 'load-path "~/.emacs.d/plugins/php-mode-1.5.0")
(require 'php-mode)

;; geben xdebug and set keys binding
(add-to-list 'load-path "~/.emacs.d/plugins/geben-0.26")
(require 'geben)
(add-hook 'text-mode-hook
 (lambda ()
 (local-set-key (kbd "<F5>") 'geben-run)
 (local-set-key (kbd "<F6>") 'geben-run-to-cursor)
 (local-set-key (kbd "<F8>") 'geben-unset-breakpoint-line)
 (local-set-key (kbd "<F9>") 'geben-set-breakpoint-line)
 (local-set-key (kbd "<F10>") 'geben-step-over)
 (local-set-key (kbd "<F11>") 'geben-step-into)
 (local-set-key (kbd "<F12>") 'geben-mode-help)
 (local-set-key (kbd "C-x C-e") 'geben-eval-expresion)
 )
)

;; add auto-complete
(add-to-list 'load-path "~/.emacs.d/plugins/ac/pos-tip")
(add-to-list 'load-path "~/.emacs.d/plugins/ac/fuzzy")
(add-to-list 'load-path "~/.emacs.d/plugins/ac/popup")
(add-to-list 'load-path "~/.emacs.d/plugins/ac/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/plugins/ac/auto-complete/dict")
(ac-config-default)
;;(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)   ;default is t
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)
(setq ac-dwim t)
(setq ac-fuzzy-enable t)
(setq ac-auto-start nil)
(ac-set-trigger-key "M-i")
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

;; stardict
(require 'stardict)
(global-set-key (kbd "C-c d") 'view-stardict-in-buffer)

;; emms multi-player
(add-to-list 'load-path "~/.emacs.d/plugins/emms/emms.git/lisp")
(require 'emms-setup)
(emms-standard)
(emms-default-players)

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
(put 'scroll-left 'disabled nil)

;; org-mode emphasis mark
(setq org-fontify-emphasized-text t)
