;;; pro-seeds-list.el --- Seeds index buffer -*- lexical-binding: t -*-

(require 'pro-seeds-loader)

(defun pro/list-seeds ()
  "Show a buffer listing all seeds with brief doclines."
  (interactive)
  (let* ((dir pro/seeds-root)
         (files (sort (directory-files-recursively dir "\\.el\\'") #'string<)))
    (with-current-buffer (get-buffer-create "*Seeds Index*")
      (erase-buffer)
      (insert (format "Seeds index\nDirectory: %s\n\n" dir))
      (dolist (file files)
        (let ((doc ""))
          (with-temp-buffer
            (insert-file-contents file)
            (goto-char (point-min))
            (when (re-search-forward "^;;; .*--- \\(.*\\) [-*]" nil t)
              (setq doc (match-string 1))))
          (insert (format "- %s — %s\n" (file-name-nondirectory file) doc))))
      (goto-char (point-min))
      (view-mode 1)
      (pop-to-buffer (current-buffer)))))

;; Keys for quick actions
(global-set-key (kbd "C-c s") #'pro/list-seeds)
(global-set-key (kbd "C-c e") #'pro/print-env-info)
;; C-c R binding is set in pro-seeds-readme

(provide 'pro-seeds-list)
;;; pro-seeds-list.el ends here
