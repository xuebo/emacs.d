(provide 'dp-javascript)

(require-package 'json)
(when (>= emacs-major-version 24)
  (require-package 'js2-mode)
  (require-package 'ac-js2))
(require-package 'js-comint)
(require-package 'coffee-mode)
(require-package 'rainbow-delimiters)
(require-package 'rjsx-mode)
(require-package 'prettier-js)

(defcustom preferred-javascript-mode
  (first (remove-if-not #'fboundp '(js2-mode js-mode)))
  "Javascript mode to use for .js files."
  :type 'symbol
  :group 'programming
  :options '(js2-mode js-mode))

(defvar preferred-javascript-indent-level 2)
(setq js-indent-level 2)

;; Need to first remove from list if present, since elpa adds entries too, which
;; may be in an arbitrary order
(eval-when-compile (require 'cl))
(setq auto-mode-alist (cons `("\\.js\\(\\.erb\\)?\\'" . ,preferred-javascript-mode)
                            (loop for entry in auto-mode-alist
                                  unless (eq preferred-javascript-mode (cdr entry))
                                  collect entry)))


(add-auto-mode 'js-mode
	       "\\.json\\'"
	       "\\.pac\\'")


;; js2-mode
(after-load 'js2-mode
  (add-hook 'js2-mode-hook '(lambda () (setq mode-name "JS2"))))

(setq js2-use-font-lock-faces t
      js2-mode-must-byte-compile nil
      js2-basic-offset preferred-javascript-indent-level
      js2-indent-on-enter-key t
      js2-auto-indent-p t
      js2-bounce-indent-p nil)

(after-load 'js2-mode
  (js2-imenu-extras-setup))

;; js-mode
(setq js-indent-level preferred-javascript-indent-level)


;; standard javascript-mode
(setq javascript-indent-level preferred-javascript-indent-level)

(add-to-list 'interpreter-mode-alist (cons "node" preferred-javascript-mode))


;;; Coffeescript

(after-load 'coffee-mode
  (setq coffee-js-mode preferred-javascript-mode
        coffee-tab-width preferred-javascript-indent-level))

(add-to-list 'auto-mode-alist '("\\.coffee\\.erb\\'" . coffee-mode))

;; ---------------------------------------------------------------------------
;; Run and interact with an inferior JS via js-comint.el
;; ---------------------------------------------------------------------------

(require 'comint)
(setq inferior-js-program-command "node")
(setenv "NODE_NO_READLINE" "1")
(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list
	 'comint-preoutput-filter-functions
	 (lambda (output)
	   (replace-regexp-in-string
	    ".*1G\.\.\..*5G" "..."
	    (replace-regexp-in-string ".*1G.*3G" "&gt;" output))))))

(defvar inferior-js-minor-mode-map (make-sparse-keymap))
(define-key inferior-js-minor-mode-map "\C-x\C-e" 'js-send-last-sexp)
(define-key inferior-js-minor-mode-map "\C-\M-x" 'js-send-last-sexp-and-go)
(define-key inferior-js-minor-mode-map "\C-cb" 'js-send-buffer)
(define-key inferior-js-minor-mode-map "\C-c\C-b" 'js-send-buffer-and-go)
(define-key inferior-js-minor-mode-map "\C-cl" 'js-load-file-and-go)

(define-minor-mode inferior-js-keys-mode
  "Bindings for communicating with an inferior js interpreter."
  nil " InfJS" inferior-js-minor-mode-map)

(dolist (hook '(js2-mode-hook js-mode-hook))
  (add-hook hook 'inferior-js-keys-mode))

;; ---------------------------------------------------------------------------
;; Alternatively, use skewer-mode
;; ---------------------------------------------------------------------------

(when (featurep 'js2-mode)
  (require-package 'skewer-mode)
  (after-load 'skewer-mode
    (add-hook 'skewer-mode-hook
	      (lambda () (inferior-js-keys-mode -1)))))




;;; .dir-locals.el for any project
;; ;; emacs use web-mode for vue & js code
;; ((nil . ((eval . (progn
;; 		   ;;(message " >>>> dir-locals.el")
;; 		   (add-hook 'js2-mode-hook 'prettier-js-mode)
;; 		   (add-hook 'web-mode-hook 'prettier-js-mode)
;; 		   (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
;; 		   (add-to-list 'auto-mode-alist '("\\.jsx.js\\'" . web-mode))))))
;;  ;; set web mode variables
;;  (web-mode
;;   (indent-tabs-mode . nil)
;;   (tab-width . 2)
;;   (eval . (progn
;; 	    (setq web-mode-markup-indent-offset 2)
;; 	    (setq web-mode-css-indent-offset 2)
;; 	    (setq web-mode-code-indent-offset 2)
;; 	    (setq web-mode-style-padding 0)
;; 	    (setq web-mode-script-padding 0)))))
