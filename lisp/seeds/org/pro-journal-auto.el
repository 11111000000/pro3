;;; pro-journal-auto.el --- Auto open daily journal once per day -*- lexical-binding: t -*-

(require 'subr-x)

(defvar pro/last-journal-flag
  (expand-file-name "../etc/last-journal-entry" user-emacs-directory)
  "File that stores the date of last auto-open action.")

(defun pro/auto-open-journal ()
  "Open today's journal once per day after startup."
  (let* ((today (format-time-string "%Y-%m-%d"))
         (last (when (file-exists-p pro/last-journal-flag)
                 (with-temp-buffer
                   (insert-file-contents pro/last-journal-flag)
                   (string-trim (buffer-string))))))
    (unless (equal today last)
      (run-at-time 2 nil #'pro/open-today-journal)
      (with-temp-file pro/last-journal-flag
        (insert today)))))

(add-hook 'emacs-startup-hook #'pro/auto-open-journal)

(provide 'pro-journal-auto)
;;; pro-journal-auto.el ends here
