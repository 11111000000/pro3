;;; pro-notes-cleanup.el --- Gentle org notes/journal housekeeping -*- lexical-binding: t -*-

(require 'seq)

(defgroup pro/notes-cleanup nil
  "Gentle archiving of old notes and journals."
  :group 'convenience)

(defcustom pro/notes-archive-days 180
  "Archive notes/journal files older than this many DAYS."
  :type 'integer)

(defun pro//archive-file (file)
  "Move FILE to org/archive/ preserving name."
  (let* ((root user-emacs-directory)
         (arch (expand-file-name "../org/archive" root))
         (dest (expand-file-name (file-name-nondirectory file) arch)))
    (unless (file-directory-p arch) (make-directory arch t))
    (rename-file file dest t)
    (message "Archived: %s" (file-name-nondirectory file))))

(defun pro/review-old-org-files (&optional days)
  "Interactively archive org/notes and org/journal files older than DAYS (default pro/notes-archive-days)."
  (interactive "P")
  (let* ((days (or (and days (prefix-numeric-value days)) pro/notes-archive-days))
         (limit (- (float-time) (* days 86400.0)))
         (dirs (list (expand-file-name "../org/notes" user-emacs-directory)
                     (expand-file-name "../org/journal" user-emacs-directory)))
         (candidates
          (seq-filter
           (lambda (f)
             (and (string-match-p "\\.org\\'" f)
                  (> (float-time (nth 5 (file-attributes f))) 0)
                  (< (float-time (nth 5 (file-attributes f))) limit)))
           (apply #'append (mapcar (lambda (d)
                                     (when (file-directory-p d)
                                       (directory-files d t "\\.org\\'")))
                                   dirs)))))
    (if (null candidates)
        (message "No org files older than %d days." days)
      (let* ((names (mapcar #'file-name-nondirectory candidates))
             (pick (completing-read-multiple
                    (format "Archive old (> %d days). Pick files (comma sep): " days)
                    names nil t)))
        (dolist (p pick)
          (let* ((full (seq-find (lambda (f) (string= (file-name-nondirectory f) p))
                                 candidates)))
            (when full (pro//archive-file full))))))))

(provide 'pro-notes-cleanup)
;;; pro-notes-cleanup.el ends here
