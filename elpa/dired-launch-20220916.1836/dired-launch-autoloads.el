;;; dired-launch-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "dired-launch" "dired-launch.el" (0 0 0 0))
;;; Generated autoloads from dired-launch.el

(autoload 'dired-launch-command "dired-launch" "\
Attempt to launch appropriate executables on marked files in the current dired buffer." t nil)

(autoload 'dired-launch-with-prompt-command "dired-launch" "\
For each marked file in the current dired buffer, prompt user to specify an executable and then call the specified executable using that file." t nil)

(autoload 'dired-launch-mode "dired-launch" "\
Add commands to launch executables.

This is a minor mode.  If called interactively, toggle the
`Dired-Launch mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `dired-launch-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(autoload 'dired-launch-enable "dired-launch" "\
Ensure that `dired-launch-mode' will be enabled in `dired-mode'." t nil)

(register-definition-prefixes "dired-launch" '("dired-launch-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; dired-launch-autoloads.el ends here
