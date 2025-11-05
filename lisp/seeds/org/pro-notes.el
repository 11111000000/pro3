;;; pro-notes.el --- Simple notes (org or org-roam if available) -*- lexical-binding: t -*-

(defvar pro/notes-directory
  (expand-file-name "../org/notes" user-emacs-directory)
  "Directory for personal notes.")

(defun pro/create-simple-note ()
  "Create a timestamped org note in `pro/notes-directory'."
  (interactive)
  (let* ((dir pro/notes-directory)
         (file (expand-file-name (format-time-string "%Y%m%d-%H%M%S.org") dir)))
    (unless (file-directory-p dir) (make-directory dir t))
    (find-file file)
    (when (zerop (buffer-size))
      (insert (format "#+TITLE: Note %s\n\n" (format-time-string "%Y-%m-%d %H:%M")))
      (save-buffer))
    (message "Note created: %s" file)))

(if (require 'org-roam nil 'noerror)
    (progn
      (setq org-roam-directory (expand-file-name "../org" user-emacs-directory))
      (global-set-key (kbd "C-c n") #'org-roam-node-find))
  (global-set-key (kbd "C-c n") #'pro/create-simple-note))

(provide 'pro-notes)
;;; pro-notes.el ends here
