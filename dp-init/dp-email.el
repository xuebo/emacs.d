;;; package --- summary

;; (require-package 'mu4e)

;; ;;;
;; (setq mu4e-update-interval 600)

;; (setq mu4e-get-mail-command "offlineimap")
;; (setq mu4e-drafts-folder "/home/xb/email/drafts")

;; (setq mu4e-user-mail-address-list
;;       (list
;;        "xuebo.com.cn@gmial.com"
;;        "bb_cn@163.com"
;;        "110105258@qq.com"
;;        "boyce.xue@sh.fieldschina.com"))

;; (setq message-kill-buffer-on-exit t)

;; ;; Use fancy chars
;; (setq mu4e-use-fancy-chars t)

;; ;; Shortcuts
;; (setq mu4e-maildir-shortcuts
;;       '(("/home/xb/email/163/inbox" . ?e)
;;         ("/home/xb/email/gmail/inbox" . ?g)
;;         ("/home/xb/email/qq/inbox" . ?q)
;;         ("/home/xb/email/filedchina/" . ?f)))

;; ;; Smart refile locations
;; (setq mu4e-refile-folder
;;       (lambda (msg)
;;         (cond
;;          ;; messages sent directly to me go to /archive
;;          ;; also `mu4e-user-mail-address-regexp' can be used
;;          ((mu4e-message-contact-field-matches msg :to "110105258@qq.com")
;;           "/qq/archive")
;;          ((mu4e-message-contact-field-matches msg :to "xuebo.com.cn@gmail.com")
;;           "/gmail/archive")
;;          ((mu4e-message-contact-field-matches msg :to "bb_cn@163.com")
;;           "/163/archive")
;;          ((mu4e-message-contact-field-matches msg :to "boyce.xue@sh.fieldschina.com")
;;           "/fieldchina/archive")
;;          ;; everything else goes to /archive
;;          ;; important to have a catch-all at the end!
;;          (t  "/oops/archive"))))

;; ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
;; (setq mu4e-sent-messages-behavior 'delete)


;; ;; Try to display images in mu4e
;; (setq mu4e-view-show-images t
;;       mu4e-view-image-max-width 800)

;; ;; sending mail
;; (setq message-send-mail-function 'message-send-mail-with-sendmail
;;       sendmail-program "/usr/bin/msmtp"
;;       user-full-name "Xue Bo")


;; (setq mu4e-confirm-quit nil
;;       mu4e-headers-date-format "%d/%b/%Y %H:%M" ; date format
;;       mu4e-html2text-command "html2text -utf8 -width 72"
;;       )

;; ;; Borrowed from http://ionrock.org/emacs-email-and-mu.html
;; ;; Choose account label to feed msmtp -a option based on From header
;; ;; in Message buffer; This function must be added to
;; ;; message-send-mail-hook for on-the-fly change of From address before
;; ;; sending message since message-send-mail-hook is processed right
;; ;; before sending message.
;; (defun choose-msmtp-account ()
;;   (if (message-mail-p)
;;       (save-excursion
;;         (let*
;;             ((from (save-restriction
;;                      (message-narrow-to-headers)
;;                      (message-fetch-field "from")))
;;              (account
;;               (cond
;;                ((string-match "xuebo.com.cn@gmail.com" from) "gmail")
;;                ((string-match "bb_cn@163.com" from) "163")
;;                ((string-match "110105258@qq.com" from) "qq")
;;                ((string-match "boyce.xue@sh.fieldschina.com" from) "fieldschina"))))
;;           (setq message-sendmail-extra-arguments (list '"-a" account))))))

;; (setq message-sendmail-envelope-from 'header)

;; (add-hook 'message-send-mail-hook 'choose-msmtp-account)

;; ;; (add-to-list 'mu4e-bookmarks
;; ;;              '("maildir:/Gitorious/inbox OR maildir:/Shortcut/inbox OR maildir:/Gmail/inbox flag:unread" "Today's news" ?z))
;; ;; (add-to-list 'mu4e-bookmarks
;; ;;              '("maildir:/Gmail/gitorious-ml flag:unread" "Unread on the mailing list" ?m))

(provide 'dp-email)
;;;
