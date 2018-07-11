(provide 'dp-http)

(require-package 'restclient)

(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))

;; C-c C-c: runs the query under the cursor, tries to pretty-print the response (if possible)
;; C-c C-r: same, but doesn't do anything with the response, just shows the buffer
;; C-c C-v: same as C-c C-c, but doesn't switch focus to other window
;; C-c C-p: jump to the previous query
;; C-c C-n: jump to the next query
;; C-c C-.: mark the query under the cursor
;; C-c C-u: copy query under the cursor as a curl command
;; C-c C-g: start a helm session with sources for variables and requests (if helm is available, of course)
;; C-c n n: narrow to region of current request (including headers)
;; TAB: hide/show current request body, only if
;; C-c C-a: show all collapsed regions
