;;; pro-zen.el --- Simple zen mode (fullscreen, hide mode-line) -*- lexical-binding: t -*-

(defvar pro--saved-mode-line nil)
(defvar pro--zen-mode-on nil)

(defun pro/zen-mode (&optional arg)
  "Toggle zen mode. With negative ARG, disable."
  (interactive "P")
  (if (or (and arg (< (prefix-numeric-value arg) 1))
          (bound-and-true-p pro--zen-mode-on))
      (progn
        (setq mode-line-format pro--saved-mode-line)
        (when (frame-parameter nil 'fullscreen)
          (set-frame-parameter nil 'fullscreen nil))
        (setq pro--zen-mode-on nil)
        (message "Zen mode off"))
    (setq pro--saved-mode-line mode-line-format)
    (setq mode-line-format nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)
    (setq pro--zen-mode-on t)
    (message "Zen mode on")))
(global-set-key (kbd "<f11>") #'pro/zen-mode)

(provide 'pro-zen)
;;; pro-zen.el ends here
