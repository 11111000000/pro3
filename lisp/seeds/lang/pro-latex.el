;;; pro-latex.el --- LaTeX via AUCTeX (optional) -*- lexical-binding: t -*-

(when (or (executable-find "latexmk")
          (executable-find "pdflatex"))
  (use-package tex
    :ensure auctex
    :mode ("\\.tex\\'" . latex-mode)))

(provide 'pro-latex)
;;; pro-latex.el ends here
