;;; pro-seeds-readme.el --- Generate README-seeds.org from seed headers -*- lexical-binding: t -*-

(require 'pro-seeds-loader)

(defun pro/generate-seeds-readme ()
  "Generate README-seeds.org aggregating all seeds' doclines."
  (interactive)
  (let* ((seeds-dir pro/seeds-root)
         (out (expand-file-name "../README-seeds.org" user-emacs-directory))
         (files (sort (directory-files-recursively seeds-dir "\\.el\\'") #'string<)))
    (with-temp-file out
      (insert "#+TITLE: Seeds catalog\n\n* Seeds\n\n")
      (dolist (file files)
        (let ((name (file-name-nondirectory file))
              (doc ""))
          (with-temp-buffer
            (insert-file-contents file)
            (goto-char (point-min))
            (when (re-search-forward "^;;; .*--- \\(.*\\) [-*]" nil t)
              (setq doc (match-string 1))))
          (insert (format "- %s — %s\n" name (or doc ""))))))
    (pro//msg "README-seeds.org updated: %s" out)))

;; Key for generating the seeds catalog
(global-set-key (kbd "C-c R") #'pro/generate-seeds-readme)

(provide 'pro-seeds-readme)
;;; pro-seeds-readme.el ends here
