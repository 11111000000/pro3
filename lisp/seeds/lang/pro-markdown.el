;;; pro-markdown.el --- Markdown mode minimal -*- lexical-binding: t -*-

(when (or (executable-find "markdown")
          (executable-find "pandoc"))
  (use-package markdown-mode
    :ensure t
    :mode ("\\.md\\'" . markdown-mode)))

(provide 'pro-markdown)
;;; pro-markdown.el ends here
