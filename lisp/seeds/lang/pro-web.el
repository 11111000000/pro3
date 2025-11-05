;;; pro-web.el --- Basic web modes (html/css/js/ts) -*- lexical-binding: t -*-

(use-package web-mode
  :ensure t
  :mode ("\\.html?\\'" . web-mode))

(use-package emmet-mode
  :ensure t
  :hook ((web-mode . emmet-mode)
         (css-mode . emmet-mode)))

(use-package js
  :ensure nil
  :mode ("\\.js\\'" . js-mode))

(use-package typescript-mode
  :ensure t
  :mode ("\\.ts\\'" . typescript-mode))

(provide 'pro-web)
;;; pro-web.el ends here
