;;; pro-ui.el --- Minimal UI settings -*- lexical-binding: t -*-

(setq ring-bell-function 'ignore
      visible-bell nil
      use-dialog-box nil)

;; Keep UI minimal and consistent
(when (boundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (boundp 'menu-bar-mode)   (menu-bar-mode -1))
(when (boundp 'tool-bar-mode)   (tool-bar-mode -1))

(provide 'pro-ui)
;;; pro-ui.el ends here
