(provide 'dp-auto-complete)
;;use company mode instead auto-complete

(require-package 'company)

;; (require-package 'company-box)

(require-package 'company-tern)

(require-package 'company-quickhelp)


(use-package company
  :diminish company-mode
  :ensure t
  :defer 2

  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay .1)
  (company-minimum-prefix-length 2)
  (company-show-numbers t)
  (company-tooltip-align-annotations 't)
  (global-company-mode t)

  :config
  (setq company-idle-delay              0.1
	company-minimum-prefix-length   2
	company-show-numbers            t
	company-tooltip-limit           20
	company-dabbrev-downcase        nil
	company-backends                '((company-gtags)
					  (company-files)
					  (company-dabbrev)
					  (company-dabbrev-code)
					  ;; (company-tern)
					  (company-yasnippet)))

  :init (progn
	  (add-hook 'after-init-hook 'global-company-mode)
	  ;; (add-hook 'company-mode-hook 'company-box-mode)
	  (add-hook 'company-mode-hook 'company-quickhelp-mode))

  :bind (([tab] . company-complete-common)
	 ("M-/" . company-complete)))










;; (require-package 'auto-complete)
;; (require 'auto-complete-config)

;; (global-auto-complete-mode t)
;; (setq ac-expand-on-auto-complete 1)
;; (ac-set-trigger-key "TAB")
;; (setq ac-auto-start t)
;; (ac-flyspell-workaround)

;; ;; (define-key ac-mode-map (kbd "C-/") 'auto-complete)
;; ;; (define-key ac-completing-map "C-/" 'ac-complete)

;; (setq ac-dwim t) ; To get pop-ups with docs even if a word is uniquely completed

;; ;; Use Emacs' built-in TAB completion hooks to trigger AC (Emacs >= 23.2)
;; (setq tab-always-indent 'complete)  ;; use 't when auto-complete is disabled
;; (setq tab-always-indent nil)

;; ;;(add-to-list 'completion-styles 'initials t)

;; ;; TODO: find solution for php, c++, haskell modes where TAB always does something

;; ;; hook AC into completion-at-point
;; (defun sanityinc/auto-complete-at-point ()
;;   (when (and (not (minibufferp)) 
;; 	     (fboundp 'auto-complete-mode)
;; 	     auto-complete-mode)
;;     (auto-complete)))

;; (defun set-auto-complete-as-completion-at-point-function ()
;;   (add-to-list 'completion-at-point-functions 'sanityinc/auto-complete-at-point))

;; ;;(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)


;; (set-default 'ac-sources
;;              '(ac-source-imenu
;;                ac-source-dictionary
;;                ac-source-words-in-buffer
;;                ac-source-words-in-same-mode-buffers
;;                ac-source-words-in-all-buffer))

;; (dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
;;                 sass-mode yaml-mode csv-mode espresso-mode haskell-mode
;;                 html-mode nxml-mode sh-mode smarty-mode clojure-mode
;;                 lisp-mode textile-mode markdown-mode tuareg-mode
;;                 js3-mode css-mode less-css-mode sql-mode ielm-mode))
;;   (add-to-list 'ac-modes mode))


;; ;; Exclude very large buffers from dabbrev
;; (defun sanityinc/dabbrev-friend-buffer (other-buffer)
;;   (< (buffer-size other-buffer) (* 1 1024 1024)))

;; (setq dabbrev-friend-buffer-function 'sanityinc/dabbrev-friend-buffer)
