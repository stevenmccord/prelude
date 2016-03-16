;;; personal.el --- Prelude's personal configuration entry point.
;;
;; Copyright (c) 2015 Steven McCord
;;
;; Author: Steven McCord <steven.a.mccord@gmail.com>
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This is Steven McCord's personal emacs personalization file

;;; Code:
;; Adding line numbers on the side and a space with solid seperator
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")

;; adding preview mode for markdown
(setq markdown-command (concat  "grip --gfm " (buffer-file-name) "--export -"))
(delete-selection-mode)

;; adding the ability to copy from the emacs selection
(defun pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))

(global-set-key (kbd "C-c c") 'pbcopy)
(global-set-key (kbd "C-c v") 'pbpaste)
(global-set-key (kbd "C-c x") 'pbcut)

;;; personal.el ends here
