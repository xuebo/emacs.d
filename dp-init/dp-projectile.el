;;; package -- summary
;;; Commentary:

;;; Code:
(require-package 'projectile)
(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

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

(provide 'dp-projectile)
;;; de-evil.el ends here.
