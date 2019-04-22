;;; package -- summary
;;; Commentary:

;;; Code:
(require-package 'projectile)
;; (projectile-mode)

(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

(require 'dp-helm)
(require-package 'helm-projectile)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(defun projectile-phpgrep ()
  "Perform rgrep in the project."
  (interactive)
  (let ((search-regexp (if (and transient-mark-mode mark-active)
                           (buffer-substring (region-beginning) (region-end))
                         (read-string (projectile-prepend-project-name "PhpGrep for: ") (thing-at-point 'symbol))))
        (root-dir (expand-file-name (projectile-project-root))))
    (require 'grep)
    ;; paths for find-grep should relative and without trailing /
    (let ((grep-find-ignored-directories nil)
          (grep-find-ignored-files nil))
      (grep-compute-defaults)
      (rgrep search-regexp "*.php " root-dir))))

(defun projectile-erlgrep ()
  "Perform rgrep in the project."
  (interactive)
  (let ((search-regexp (if (and transient-mark-mode mark-active)
                           (buffer-substring (region-beginning) (region-end))
                         (read-string (projectile-prepend-project-name "ErlGrep for: ") (thing-at-point 'symbol))))
        (root-dir (expand-file-name (projectile-project-root))))
    (require 'grep)
    ;; paths for find-grep should relative and without trailing /
    (let ((grep-find-ignored-directories nil)
          (grep-find-ignored-files nil))
      (grep-compute-defaults)
      (rgrep search-regexp "*.erl .hrl" root-dir))))

(defun projectile-file-grep (search-regexp file-type dir)
  "Perform rgrep in the project."
  (interactive "ssearch string:\nsfile type<*.[php|js]>:\nDdir:")
  (require 'grep)
  ;; paths for find-grep should relative and without trailing /
  (let ((search-regexp
	 (or search-regexp
	     (if (and transient-mark-mode mark-active)
		 (buffer-substring (region-beginning) (region-end))
	       (read-string
		(projectile-prepend-project-name
		 "PhpGrep for: ")
		(thing-at-point 'symbol)))))
	(dir (or dir
		 (expand-file-name (projectile-project-root))))
	(grep-find-ignored-directories nil)
	(grep-find-ignored-files nil))
  (grep-compute-defaults)
  (rgrep search-regexp file-type dir)))

(provide 'dp-projectile)
;;; de-evil.el ends here.
