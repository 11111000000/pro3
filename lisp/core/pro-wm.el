;;; pro-wm.el --- Optional EXWM bootstrap -*- lexical-binding: t -*-

(defun pro//exwm-requested-p ()
  "Return non-nil when EXWM should be started."
  (or (getenv "PRO_WITH_EXWM")
      (and (boundp 'command-line-args) (member "--with-exwm" command-line-args))))

(when (and (pro//exwm-requested-p)
           (require 'exwm nil t)
           (getenv "DISPLAY"))
  (setq exwm-workspace-number 1)
  (exwm-enable)
  (message "EXWM session enabled."))

(provide 'pro-wm)
;;; pro-wm.el ends here
