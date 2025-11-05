;;; pro-rss.el --- RSS via Elfeed (optional) -*- lexical-binding: t -*-

(use-package elfeed
  :ensure t
  :commands (elfeed)
  :config
  (setq elfeed-feeds
        '("https://planet.emacslife.com/atom.xml"
          "https://emacs.meta.stackexchange.com/feeds"))
  (global-set-key (kbd "C-c f") #'elfeed))

(provide 'pro-rss)
;;; pro-rss.el ends here
