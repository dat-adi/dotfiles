'(dired-clean-confirm-killing-deleted-buffers nil) ;; don't ask whether to kill buffers containing deleted files.

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
;;(require 'smtpmail)
(setq user-full-name "Datta Adithya"
      user-mail-address "adithya.19bce7119@vitap.ac.in"
     mu4e-get-mail-command "mbsync -c ~/.config/mu4e/mbsyncrc -a"
      mu4e-update-interval  300
      mu4e-main-buffer-hide-personal-addresses t
      message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      mu4e-sent-folder "/Maildir/adithya-university/Sent"
      mu4e-drafts-folder "/Maildir/adithya-university/Drafts"
      mu4e-trash-folder "/Maildir/adithya-university/Trash"
      mu4e-maildir-shortcuts
      '(("/Maildir/adithya-university/Inbox"      . ?i)
        ("/Maildir/adithya-university/Sent Items" . ?s)
        ("/Maildir/adithya-university/Drafts"     . ?d)
        ("/Maildir/adithya-university/Trash"      . ?t)))

(setq doom-theme 'doom-one)

(setq
 org-agenda-files (quote("~/Documents/org/tasks.org"
                         "~/Documents/org/meetings.org"))
 org-deadline-warning-days 7
 org-directory "~/Documents/org/")

(setq elfeed-feeds
      '("https://news.ycombinator.com/rss"))
