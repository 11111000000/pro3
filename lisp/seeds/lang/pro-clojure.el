;;; pro-clojure.el --- Minimal Clojure support (optional) -*- lexical-binding: t -*-

(when (or (executable-find "clojure")
          (executable-find "lein"))
  (use-package clojure-mode
    :ensure t
    :mode ("\\.clj\\'" . clojure-mode))
  (use-package cider
    :ensure t
    :after clojure-mode
    :hook (clojure-mode . cider-mode)))

(provide 'pro-clojure)
;;; pro-clojure.el ends here
