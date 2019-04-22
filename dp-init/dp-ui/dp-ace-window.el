(require-package 'ace-window)

(global-set-key (kbd "M-o") 'ace-window)
(setq aw-keys '(?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?0))

(setq aw-dispatch-always t)

(setq aw-dispatch-alist
      '((?x aw-delete-window "Delete Window")
	(?m aw-swap-window "Swap Windows")
	(?M aw-move-window "Move Window")
	(?c aw-copy-window "Copy Window")
	(?j aw-switch-buffer-in-window "Select Buffer")
	(?n aw-flip-window)
	(?u aw-switch-buffer-other-window "Switch Buffer Other Window")
	(?f aw-split-window-fair "Split Fair Window")
	(?v aw-split-window-vert "Split Vert Window")
	(?h aw-split-window-horz "Split Horz Window")
	(?O delete-other-windows "Delete Other Windows")
	(?? aw-show-dispatch-help)))

(provide 'dp-ace-window)
