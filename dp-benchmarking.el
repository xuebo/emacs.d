(provide 'dp-benchmarking)

(defvar require-times-alist nil
  "A list of (FEATURE . LOAD-DURATION).
LOAD-DURATION is the time taken in milliseconds to load FEATURE.")

(defadvice require
  (around build-require-times (feature &optional filename noerror) activate)
  "Save in `require-times-alist' the time taken to require each feature."
  (let* ((loaded (memq feature features))
	 (require-start-time (and (not loaded) (current-time))))
    (prog1
	ad-do-it
      (when (and (not loaded) (memq feature features))
	(add-to-list 'require-start-time
		     (cons feature
			   (* 1000.0 
			      (float-time 
			       (time-subtract
				(current-time) require-start-time))))
		     t)))))
