(setq user-full-name "G V Datta Adithya"
      user-mail-address "dat.adithya@gmail.com")
(setq display-line-numbers-type t)

(setq doom-theme 'doom-one)

(setq doom-font (font-spec :family "Source Code Pro" :size 13 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "Source Code Pro") ; inherits `doom-font''s :size
      doom-unicode-font (font-spec :family "Source Code Pro" :size 12)
      doom-big-font (font-spec :family "Source Code Pro" :size 19))

(setq org-agenda-files (quote("~/Documents/org/tasks.org"
                              "~/Documents/org/meetings.org"))
      org-deadline-warning-days 7
      org-directory "~/Documents/org/")

(setq elfeed-feeds
      '("https://news.ycombinator.com/rss"))
