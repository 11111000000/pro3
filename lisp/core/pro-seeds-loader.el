;;; pro-seeds-loader.el --- Seed loader, profiles and soft-disable -*- lexical-binding: t -*-

(require 'seq)

(defvar pro/quiet (not (equal (getenv "PRO_VERBOSE") "1"))
  "When non-nil, reduce informational messages unless PRO_VERBOSE=1.")

(defun pro//msg (fmt &rest args)
  "Display message when not in quiet mode."
  (unless pro/quiet
    (apply #'message fmt args)))

(defgroup pro/seeds nil
  "Seed loader and housekeeping."
  :group 'convenience)

(defvar pro/seeds-root (expand-file-name "../lisp/seeds" user-emacs-directory)
  "Root directory containing seed subdirectories by category.")

(defvar pro/disabled-seeds '()
  "List of seed feature symbols to skip when loading.")

(defvar pro/seed-usage-file (expand-file-name "../var/seed-usage.el" user-emacs-directory)
  "File path storing an alist of (FEATURE . LAST-USE-TIME).")

(defun pro//read-usage ()
  (when (file-exists-p pro/seed-usage-file)
    (condition-case _e
        (with-temp-buffer
          (insert-file-contents pro/seed-usage-file)
          (read (current-buffer)))
      (error nil))))

(defun pro//write-usage (alist)
  (with-temp-file pro/seed-usage-file
    (prin1 alist (current-buffer))))

(defun pro/seed-record-use (feature)
  "Record FEATURE as used now."
  (let* ((now (float-time))
         (data (pro//read-usage))
         (data (assq-delete-all feature data)))
    (push (cons feature now) data)
    (pro//write-usage data)))

(defun pro/seed-categories ()
  "Return list of available category directories."
  (when (file-directory-p pro/seeds-root)
    (seq-filter
     (lambda (f) (file-directory-p (expand-file-name f pro/seeds-root)))
     (directory-files pro/seeds-root nil "^[^.].*"))))

(defun pro/seed-files-in-category (cat)
  "Return absolute file paths to .el seeds in category CAT."
  (let ((dir (expand-file-name (format "%s" cat) pro/seeds-root)))
    (when (file-directory-p dir)
      (sort (directory-files dir t "\\.el\\'") #'string<))))

(defun pro/all-seed-files (&optional categories)
  "Return all seed files. If CATEGORIES non-nil, limit to them."
  (let ((cats (or categories (pro/seed-categories))))
    (apply #'append (mapcar #'pro/seed-files-in-category cats))))

(defun pro/feature-from-file (file)
  "Derive feature symbol from FILE basename."
  (intern (file-name-base file)))

(defun pro/load-seed-file (file)
  "Load a seed FILE if not soft-disabled. Record usage."
  (let* ((feat (pro/feature-from-file file)))
    (unless (member feat pro/disabled-seeds)
      (condition-case err
          (progn
            (load file nil 'nomessage)
            (pro/seed-record-use feat))
        (error
         (pro//msg "Seed load error %s: %s" feat (error-message-string err)))))))

(defun pro/load-profile (&optional profile-name)
  "Load seeds according to PROFILE-NAME and current OS availability."
  (let* ((name (or profile-name "base"))
         (cats (pro/profile-categories name))
         (files (pro/all-seed-files cats)))
    (mapc #'pro/load-seed-file files)
    (pro//msg "Profile '%s' loaded (%d seeds)." name (length files))))

;; Interactive helpers

(defun pro/all-seed-names ()
  "All available seed feature names as symbols."
  (mapcar #'pro/feature-from-file (pro/all-seed-files)))

(defun pro/soft-disable-seed (name)
  "Soft-disable seed NAME (symbol)."
  (interactive
   (list (intern (completing-read "Disable seed: " (mapcar #'symbol-name (pro/all-seed-names)) nil t))))
  (let ((sym name)
        (file (expand-file-name "../etc/disabled-seeds.el" user-emacs-directory)))
    (unless (member sym pro/disabled-seeds)
      (add-to-list 'pro/disabled-seeds sym))
    (with-temp-file file
      (insert ";; Soft-disabled seeds. Edit carefully.\n"
              "(setq pro/disabled-seeds '\n  (")
      (insert (mapconcat (lambda (s) (format "%S" s))
                         (sort (copy-sequence pro/disabled-seeds)
                               (lambda (a b) (string< (symbol-name a) (symbol-name b))))
                         " "))
      (insert "))\n"))
    (pro//msg "Seed %S soft-disabled." sym)))

(defun pro/soft-enable-seed (name)
  "Re-enable previously soft-disabled seed NAME."
  (interactive
   (list (intern (completing-read "Enable seed: " (mapcar #'symbol-name pro/disabled-seeds) nil t))))
  (setq pro/disabled-seeds (remove name pro/disabled-seeds))
  (let ((file (expand-file-name "../etc/disabled-seeds.el" user-emacs-directory)))
    (with-temp-file file
      (insert ";; Soft-disabled seeds. Edit carefully.\n"
              "(setq pro/disabled-seeds '\n  (")
      (insert (mapconcat (lambda (s) (format "%S" s))
                         (sort (copy-sequence pro/disabled-seeds)
                               (lambda (a b) (string< (symbol-name a) (symbol-name b))))
                         " "))
      (insert "))\n")))
  (pro//msg "Seed %S enabled." name))

(defun pro/review-unused-seeds (&optional days)
  "Review seeds unused for DAYS (default 30). Offer to soft-disable."
  (interactive "P")
  (let* ((days (or (and days (prefix-numeric-value days)) 30))
         (limit (- (float-time) (* days 86400.0)))
         (usage (or (pro//read-usage) '()))
         (all (pro/all-seed-names))
         (unused (seq-filter
                  (lambda (s)
                    (let ((t (cdr (assq s usage))))
                      (or (null t) (< t limit))))
                  all)))
    (if (null unused)
        (pro//msg "No seeds unused for > %d days." days)
      (let* ((choices (mapcar #'symbol-name unused))
             (pick (completing-read-multiple
                    (format "Soft-disable unused (> %d days), pick (comma sep): " days)
                    choices nil t)))
        (dolist (p pick)
          (pro/soft-disable-seed (intern p)))))))

(provide 'pro-seeds-loader)
;;; pro-seeds-loader.el ends here
