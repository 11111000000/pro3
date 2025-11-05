;;; pro-history.el --- History, undo-tree, recentf, savehist -*- lexical-binding: t -*-

(savehist-mode 1)
(recentf-mode 1)

(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode 1)
  :custom
  (undo-tree-auto-save-history t)
  (undo-tree-history-directory-alist
   `(("." . ,(expand-file-name "../var/undo/" user-emacs-directory)))))

;; Simple save-place for cursor positions
(save-place-mode 1)

(provide 'pro-history)
;;; pro-history.el ends here
