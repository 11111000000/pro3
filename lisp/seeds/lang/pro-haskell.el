;;; pro-haskell.el --- Minimal Haskell support (optional) -*- lexical-binding: t -*-

(when (or (executable-find "ghc")
          (executable-find "stack"))
  (use-package haskell-mode
    :ensure t
    :mode ("\\.hs\\'" . haskell-mode)
    :hook ((haskell-mode . interactive-haskell-mode))))

(provide 'pro-haskell)
;;; pro-haskell.el ends here
