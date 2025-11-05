;;; early-init.el --- pro3 early-init -*- lexical-binding: t -*-
(setq package-enable-at-startup nil
      inhibit-startup-message t
      inhibit-startup-screen t
      frame-resize-pixelwise t)
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'menu-bar-mode)   (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode)   (tool-bar-mode -1))
(when (equal (getenv "PRO_FORCE_FONT") "1")
  (push '(font . "DejaVu Sans Mono-12") default-frame-alist))
;;; early-init.el ends here
