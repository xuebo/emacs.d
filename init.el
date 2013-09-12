;;; this is on the way
;;; imitate purcell

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
