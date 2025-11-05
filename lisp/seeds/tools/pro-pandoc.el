;;; pro-pandoc.el --- Pandoc integration (optional) -*- lexical-binding: t -*-

(when (executable-find "pandoc")
  (use-package pandoc-mode
    :ensure t
    :hook ((markdown-mode . pandoc-mode)
           (org-mode . pandoc-mode)
           (latex-mode . pandoc-mode))))

(provide 'pro-pandoc)
;;; pro-pandoc.el ends here
