;;; pro-journal.el --- Daily org journal -*- lexical-binding: t -*-

(defvar pro/journal-directory
  (expand-file-name "../org/journal" user-emacs-directory)
  "Directory for daily journals.")

(defun pro/open-today-journal ()
  "Open or create today's journal file."
  (interactive)
  (let* ((dir pro/journal-directory)
         (file (expand-file-name (format-time-string "%Y-%m-%d.org") dir)))
    (unless (file-directory-p dir) (make-directory dir t))
    (find-file file)
    (when (zerop (buffer-size))
      (insert (format "#+TITLE: Journal %s\n\n* %s\n\n"
                      (format-time-string "%Y-%m-%d")
                      (format-time-string "%H:%M %A")))
      (save-buffer))
    (goto-char (point-max))
    (message "Journal ready: %s" file)))

(global-set-key (kbd "C-c j") #'pro/open-today-journal)

(provide 'pro-journal)
;;; pro-journal.el ends here
