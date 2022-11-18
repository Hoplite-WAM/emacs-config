
;; Useful Defaults 
(setq inhibit-splash-screen t)
(setq inhibit-start-up-message t)
(global-display-line-numbers-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq initial-scratch-message "")
(toggle-frame-fullscreen)
(show-paren-mode t)
(global-hl-line-mode 1)
(setq use-short-answers t)
(setq confirm-kill-processes nil) 
(setq-default cursor-type 'bar)
(setq confirm-kill-emacs #'y-or-n-p)

;; Enable fuzzy search
(require `ido)
(ido-mode t)

;; === Package Management ===
(require `package)
;;     That will prevent this function being run again.
(setq package-enable-at-startup nil)
(add-to-list `package-archives
`("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p `use-package)
(package-refresh-contents)
(package-install `use-package)) 

(use-package try
:ensure t)	     

(use-package which-key
	     :ensure t
	     :config
	     (which-key-mode))

;; === ===

;; Wheatgrass theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wheatgrass)))
 '(package-selected-packages
   (quote
    (gdscript-mode which-key try use-package xclip textsize recentf-ext python-black projectile pdf-tools magit key-chord helm evil eglot company blacken avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; === evil mode configuarion ===
(evil-mode)

; space-bar for word jump
(define-key evil-motion-state-map (kbd "SPC") 'avy-goto-char-timer)
(setq key-chord-two-keys-delay 0.5)

;; return to normal mode with double tap j
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;; Return to normal state after x seconds of inaction

(defun evil-normalize-all-buffers ()
  "Force a drop to normal state."
  (unless (eq evil-state 'normal)
    (dolist (buffer (buffer-list))
      (set-buffer buffer)
      (unless (or (minibufferp)
                  (eq evil-state 'emacs))
        (evil-force-normal-state)))
    (message "Dropped back to normal state in all buffers")))

(defvar evil-normal-timer
  (run-with-idle-timer 4.0 t #'evil-normalize-all-buffers)
  "Drop back to normal state after idle for 4.0 seconds.")

;; === ===

;; === Python-Configuration ==

(use-package eglot
  :ensure t
  :defer t
  :hook (python-mode . eglot-ensure))

;; === === 
