;; adding a seperator for line numbers
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")
(setq markdown-command (concat  "grip --gfm " (buffer-file-name) "--export -"))
