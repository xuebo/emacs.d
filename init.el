;;; this is on the way

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
(require-package 'evil)
(evil-mode t)
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

;; Allow access from emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))

;; Allow users to provide an optional "dp-local" containing personal settings
(require 'dp-local nil t)


(require 'dp-gui-frames)
(message "init completed in %.2fs"
         (float-time (time-subtract (current-time) before-init-time)))
