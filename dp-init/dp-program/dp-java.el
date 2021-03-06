(require-package 'auto-complete)


;; (require-package 'lsp-java)
;; (add-hook 'java-mode-hook #'lsp)


;; (require-package 'cc-mode)
;; (require-package 'treemacs)

;; (condition-case nil
;;     (require 'use-package)
;;   (file-error
;;    (require 'package)
;;    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;    (package-initialize)
;;    (package-refresh-contents)
;;    (package-install 'use-package)
;;    (require 'use-package)))

;; (use-package projectile :ensure t)

;; (use-package treemacs :ensure t)

;; (use-package yasnippet :ensure t)

;; (use-package lsp-mode :ensure t)

;; (use-package hydra :ensure t)

;; (use-package company-lsp :ensure t)

;; (use-package lsp-ui :ensure t)

;; (use-package lsp-java :ensure t :after lsp
;;   :config (add-hook 'java-mode-hook 'lsp))

;; (use-package dap-mode
;;   :ensure t :after lsp-mode
;;   :config
;;   (dap-mode t)
;;   (dap-ui-mode t))

;; (use-package dap-java :after (lsp-java))

;; (use-package lsp-java-treemacs :after (treemacs))

















;; (defun my-java-mode-hook ()
;;   (help-at-pt-set-timer)
;;   (ac-config-default)
;;   (setq ac-auto-start nil)
;;   (remove 'ac-source-clang 'ac-sources))

;; (defun wicked/java-mode-init ()
;;   "Set some buffer-local variables."
;;     (setq case-fold-search t) 
;;     (setq tab-always-indent t)
;;     (setq indent-tabs-mode nil)
;;     (setq fill-column 78)
;;     (setq c-basic-offset 4)
;;     (setq tab-width 4)
;;     (setq-default tab-width 4)
;;     (setq tab-stop-list (number-sequence 4 200 4)) 
;;     (c-set-offset 'arglist-cont 0)
;;     (c-set-offset 'arglist-intro '+)
;;     (c-set-offset 'case-label 2)
;;     (c-set-offset 'arglist-close 0))


;; (setq help-at-pt-display-when-idle t
;;       help-at-pt-timer-delay 0.1
;;       ac-delay 0.5)

;; ;;(add-hook 'java-mode-hook 'wicked/java-mode-init)
;; ;;(add-hook 'java-mode-hook 'my-java-mode-hook)

;; ;;(require-package 'meghanada)
;; (require-package 'lsp)
;; (require-package 'lsp-java)
;; (add-hook 'java-mode-hook
;;           (lambda ()
;;             ;; meghanada-mode on
;; 	    ;;(meghanada-mode t)
;; 	    (lsp-mode t)
;;             (flycheck-mode +1)
;;             (setq c-basic-offset 4)
;; 	    (setq indent-tabs-mode nil)
;; 	    (infer-indentation-style)
;;             (setq smart-operator-mode t)
;;             ;; use code format
;;             ;;(add-hook 'before-save-hook 'meghanada-code-beautify-before-save)
;;             ))

(add-to-list 'file-name-handler-alist '("\\.class$" . javap-handler))

(defun javap-handler (op &rest args)
  "Handle .class files by putting the output of javap in the buffer."
  (cond
   ((eq op 'get-file-buffer)
    (let ((file (car args)))
      (with-current-buffer (create-file-buffer file)
        (call-process "javap" nil (current-buffer) nil "-verbose"
                      "-classpath" (file-name-directory file)
                      (file-name-sans-extension
                       (file-name-nondirectory file)))
        (setq buffer-file-name file)
        (setq buffer-read-only t)
        (set-buffer-modified-p nil)
        (goto-char (point-min))
        (java-mode)
        (current-buffer))))
   ((javap-handler-real op args))))

(defun javap-handler-real (operation args)
  "Run the real handler without the javap handler installed."
  (let ((inhibit-file-name-handlers
         (cons 'javap-handler
               (and (eq inhibit-file-name-operation operation)
                    inhibit-file-name-handlers)))
        (inhibit-file-name-operation operation))
    (apply operation args)))

;; set binding key for meghanada
;; (evil-define-key 'normal meghanada-mode-map
;;   (kbd "C-]") 'meghanada-jump-declaration
;;   (kbd "C-c C-c r") 'meghanada-reference
;;   (kbd "M-RET") 'meghanada-import-all)
;; (evil-define-key 'insert meghanada-mode-map
;;   (kbd "C-]") 'meghanada-jump-declaration
;;   (kbd "C-c C-c r") 'meghanada-reference
;;   (kbd "M-RET") 'meghanada-import-all)

(provide 'dp-java)
