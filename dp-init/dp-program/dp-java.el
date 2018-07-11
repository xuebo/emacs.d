;(require-package 'eclim)
(require-package 'auto-complete)
;;(require-package 'ac-emacs-eclim)


(defun my-java-mode-hook ()
  (help-at-pt-set-timer)
  (ac-config-default)
  (setq ac-auto-start nil)
  ;(ac-emacs-eclim-config)
  (remove 'ac-source-clang 'ac-sources)
  ;; (eclim-mode t)
  )

(defun wicked/java-mode-init ()
  "Set some buffer-local variables."
    (setq case-fold-search t) 
    (setq tab-always-indent t)
    (setq indent-tabs-mode nil)
    (setq fill-column 78)
    (setq c-basic-offset 4)
    (setq tab-width 4)
    (setq-default tab-width 4)
    (setq tab-stop-list (number-sequence 4 200 4)) 
    (c-set-offset 'arglist-cont 0)
    (c-set-offset 'arglist-intro '+)
    (c-set-offset 'case-label 2)
    (c-set-offset 'arglist-close 0))

;; (setq eclimd-autostart nil)
;; (setq eclim-auto-save t
;;       eclimd-wait-for-process nil
;;       eclimd-default-workspace "~/work/eclipse/"
;;       help-at-pt-display-when-idle t
;;       help-at-pt-timer-delay 0.1
;;       ac-delay 0.5)

(add-hook 'java-mode-hook 'wicked/java-mode-init)
(add-hook 'java-mode-hook 'my-java-mode-hook)

(require-package 'meghanada)
(add-hook 'java-mode-hook
          (lambda ()
            ;; meghanada-mode on
            (meghanada-mode t)
            (setq c-basic-offset 2)
            ;; use code format
            ;;(add-hook 'before-save-hook 'meghanada-code-beautify-before-save)
			))

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
(evil-define-key 'normal meghanada-mode-map
  (kbd "C-]") 'meghanada-jump-declaration
  (kbd "C-c C-c r") 'meghanada-reference
  (kbd "M-RET") 'meghanada-import-all)
(evil-define-key 'insert meghanada-mode-map
  (kbd "C-]") 'meghanada-jump-declaration
  (kbd "C-c C-c r") 'meghanada-reference
  (kbd "M-RET") 'meghanada-import-all)

(provide 'dp-java)
