;;; pro-profiles.el --- Profiles and category mapping -*- lexical-binding: t -*-

(defvar pro/profile-table
  '(("base"   . (ui edit search org tools))
    ("dev"    . (vcs lang tools))
    ("writer" . (ui org tools))
    ("wm"     . (ui tools)))
  "Profile to seed category mapping.")

(defun pro/profile-categories (name)
  "Return list of categories for profile NAME."
  (or (cdr (assoc name pro/profile-table))
      (cdr (assoc "base" pro/profile-table))))

(provide 'pro-profiles)
;;; pro-profiles.el ends here
