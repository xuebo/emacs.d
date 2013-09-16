;;; this is on the way

(defvar *is-a-mac* nil)

(add-to-list 'load-path user-emacs-directory)
;; Wow, measure start time
(require 'dp-benchmarking) 

(require 'dp-utils)
;; Must come before elpa, as it may provide package.el
(require 'dp-site-lisp)
;; Machinery for installing required packages
(require 'dp-elpa)      
;; Set up $PATH 
(require 'dp-exec-path)

;; evil package
(require 'dp-evil)
(require 'dp-themes)

(require-package 'wgrep)
(require-package 'project-local-variables)
(require-package 'diminish)
(require-package 'scratch)
(require-package 'mwe-log-commands)

(require 'dp-delimiters)
(require 'dp-dired)
(require 'dp-uniquify)
(require 'dp-ibuffer)
(require 'dp-flycheck)

(require 'dp-recentf)
(require 'dp-ido)
(require 'dp-hippie-expand)
(require 'dp-auto-complete)
(require 'dp-windows)
(require 'dp-sessions)
(require 'dp-font)
(require 'dp-mmm)
(require 'dp-growl)

;;; vc
(require 'dp-darcs)
(require 'dp-git)

;;;program
(require 'dp-markdown)
(require 'dp-org)
(require 'dp-javascript)
(require 'dp-php)
(require 'dp-nxml)
(require 'dp-css)
(require 'dp-haml)
(require 'dp-sql)
(require 'dp-geben)

;;;leisure time
(require 'dp-leisure)

;; Allow access from emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))

(require 'dp-gui-frames)

;; Allow users to provide an optional "dp-local" containing personal settings
(require 'dp-local nil t)

(message "init completed in %.2fs"
         (float-time (time-subtract (current-time) before-init-time)))
