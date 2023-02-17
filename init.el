;; Useful Defaults
(setq inhibit-splash-screen t)
(setq inhibit-start-up-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq initial-scratch-message "")
(show-paren-mode t)
(setq linum-format "%4d \u2502 ")
(setq use-short-answers t)
(setq confirm-kill-processes nil)
(setq-default cursor-type 'bar)
(setq confirm-kill-emacs #'y-or-n-p)
(global-set-key (kbd "C-x o") 'ace-window)
(save-place-mode 1)
(setq use-dialog-box nil)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq history-length 5)
(recentf-mode 1)
(setq recentf-max-menu-items 500)
(setq recentf-max-saved-items 500)
(setq display-line-numbers-type `relative)
;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)
;fuzzy whitespace i-search
(icomplete-mode t)
(setq search-whitespace-regexp ".*")
(setq isearch-lax-whitespace t)
(electric-pair-mode 1)
(setq sentence-end-double-space nil)
(global-set-key (kbd "C--") `textsize-decrement)
(global-set-key (kbd "C-=") `textsize-increment)
(global-hide-mode-line-mode)

;; (add-to-list 'load-path "~/.emacs.d/lisp/")
;; (require `bookmark+)

;; === Helm ===
(require `helm)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "C-h a") 'helm-apropos)
(global-set-key (kbd "C-x f") `helm-recentf)
(global-set-key (kbd "C-x C-f") `helm-find-files)
(global-set-key (kbd "C-x C-b") `helm-buffers-list)
(global-set-key (kbd "C-x b") `helm-buffers-list)
(global-set-key (kbd "C-x r b") `helm-bookmarks)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(setq helm-minibuffer-history-key "M-p")
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(setq helm-split-window-inside-p t)
(helm-mode t)
;; === --- ===

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi))
 '(fringe-mode 0 nil (fringe))
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(aggressive-indent evil-numbers
		       (\, hide-mode-line)
		       evil-snipe helm hydra buffer-move yaml-mode highlight-indentation eat web-mode expand-region dired-toggle-sudo rg calfw-org calfw-cal calfw evil-surround heaven-and-hell dired-launch workgroups2 cider xclip workgroups which-key use-package try textsize recentf-ext rainbow-delimiters python-black projectile popup peep-dired pdf-tools olivetti magit key-chord gdscript-mode evil-collection eglot company blacken async ace-window)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


;; === Company Mode ===
(global-company-mode)
					; No delay in showing suggestions.
(setq company-idle-delay 0)
(setq company-selection-wrap-around t)
					; Use tab key to cycle through suggestions.
					; ('tng' means 'tab and go')
(company-tng-configure-default)
;; === --- ===


;; === Major Mode Hooks ===

(add-hook `before-save-hook `delete-trailing-whitespace)

;; Dired
(add-hook 'dired-mode-hook #'dired-hide-details-mode)
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))
(add-hook 'dired-mode 'peep-dired)
(setq dired-dwim-target t)

;; Dired Launch
;; use xdg-open as the default launcher
(setq dired-launch-default-launcher '("xdg-open"))
(setf dired-launch-extensions-map
      '(;; specify LibreOffice as the preferred application for
        ("html" ("firefox"))
        ("odt" ("libreofficedev5.3"))))

;; Prog
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'aggressive-indent-mode)

;; Text
(add-hook `text-mode-hook `visual-line-mode)
(add-hook `text-mode-hook `follow-mode)
(add-hook `text-mode-hook `flyspell-mode)
(add-hook `text-mode-hook `flyspell-buffer)
(add-hook `text-mode-hook `olivetti-mode)
;; (add-hook `text-mode-hook `fringe-mode 0)

;; Yaml
(add-hook 'yaml-mode-hook (lambda ()
                              (olivetti-mode -1)))
(add-hook 'yaml-mode-hook 'highlight-indentation-mode)
(add-hook 'yaml-mode-hook 'whitespace-mode)
(add-hook 'yaml-mode-hook
	  (lambda()
	    (add-hook 'evil-insert-state-exit-hook `delete-trailing-whitespace)))

;; Web
(add-hook 'web-mode-hook 'highlight-indentation-mode)

;; === --- ===

;; === Window & Buffer Management ===
(global-set-key (kbd "C-S-i") `window-split-toggle)
;; shortcuts for resizing frames
(global-set-key (kbd "C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<down>") 'shrink-window)
(global-set-key (kbd "C-<up>") 'enlarge-window)
(global-set-key (kbd "C-x C-d") `dired-jump)
;; Ability to move buffers relative to eachother
(require `buffer-move)
(global-set-key (kbd "C-S-k")     'buf-move-up)
(global-set-key (kbd "C-S-j")   'buf-move-down)
(global-set-key (kbd "C-S-h")   'buf-move-left)
(global-set-key (kbd "C-S-l")  'buf-move-right)
;; Toggle Horizontal and Vertical Buffers function
(defun window-split-toggle ()
  "Toggle between horizontal and vertical split with two windows."
  (interactive)
  (if (> (length (window-list)) 2)
      (error "Can't toggle with more than 2 windows!")
    (let ((func (if (window-full-height-p)
                    #'split-window-vertically
                  #'split-window-horizontally)))
      (delete-other-windows)
      (funcall func)
      (save-selected-window
        (other-window 1)
        (switch-to-buffer (other-buffer))))))
;; === --- ===

; === evil mode configuarion ===

(setq evil-want-C-u-scroll t)
(setq evil-respect-visual-line-mode t)
;; Exiting insert mode wont move cursor back
(setq evil-move-beyond-eol t)
(setq evil-move-cursor-back nil)
(setq evil-want-keybinding nil)
;; (setq evil-want-minibuffer t)
(require `evil-numbers)

(evil-mode)
(evil-collection-init)
(global-evil-surround-mode 1)
(evil-snipe-mode 1)


;; indicate mode by cursor color
(setq evil-default-cursor (quote (t "#750000"))
    evil-visual-state-cursor '("#a800e0" box)
    evil-normal-state-cursor '("#878787" box)
    evil-insert-state-cursor '("#e27300" box)
    evil-emacs-state-cursor '("#6666ff" box)
    )

;; avy
(setq avy-timeout-seconds 0.40)
(setq avy-case-fold-search nil)
(setq avy-keys (nconc (number-sequence ?a ?z) (number-sequence ?A ?Z)))

;; = Evil Dired Bindings =
(evil-collection-define-key 'normal 'dired-mode-map "h" 'dired-up-directory
    "o" 'dired-find-file-other-window
    "p" 'peep-dired
    "L" 'dired-launch-command
    "y" 'dired-copy-filename-as-kill
    "K" 'dired-launch-with-prompt-command
    "s" 'dired-toggle-sudo
    "T" `dired-create-empty-file
    "W" 'wdired-change-to-wdired-mode
    "l" 'dired-find-file)

;; Emacs dired bindings too
(define-key dired-mode-map (kbd "T") `dired-create-empty-file)
;; I want avy too

(evil-define-key 'normal peep-dired-mode-map (kbd "<SPC>") 'peep-dired-scroll-page-down
                                             (kbd "C-<SPC>") 'peep-dired-scroll-page-up
                                             (kbd "<backspace>") 'peep-dired-scroll-page-up
                                             (kbd "k") 'peep-dired-prev-file
                                             (kbd "j") 'peep-dired-next-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

(setq peep-dired-ignored-extensions '("mkv" "iso" "mp4"))

;; = Basic evil Bindings =

;; = Motion state Bindings =
(define-key evil-motion-state-map (kbd "SPC") 'avy-goto-char-timer)
(define-key evil-motion-state-map (kbd "|") `helm-all-mark-rings)
(define-key evil-motion-state-map (kbd "\\") 'evil-jump-backward-swap)
;; (define-key evil-motion-state-map (kbd "C-j") 'evil-avy-goto-line-below)
;; (define-key evil-motion-state-map (kbd "C-k") 'evil-avy-goto-line-above)
;; (define-key evil-motion-state-map (kbd "C-j") 'evil-jump-backward)
;; (define-key evil-motion-state-map (kbd "C-k") 'evil-jump-forward)
;; (define-key evil-motion-state-map (kbd "C-j") 'evil-normal-state)
(define-key evil-motion-state-map (kbd "U") 'undo-redo)
;; (define-key evil-motion-state-map (kbd "f") 'evil-snipe-s)
;; (define-key evil-motion-state-map (kbd "F") 'evil-snipe-S)
;; (define-key evil-motion-state-map (kbd "t") 'evil-snipe-x)
;; (define-key evil-motion-state-map (kbd "T") 'evil-snipe-X)
(define-key evil-motion-state-map (kbd "C-S-f") 'scroll-other-window)
(define-key evil-motion-state-map (kbd "C-S-b") 'scroll-other-window-down)
(define-key evil-motion-state-map (kbd "RET") nil)
;; (define-key evil-motion-state-map (kbd "C-u u") `universal-argument)
(define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)
(define-key evil-normal-state-map (kbd "C-a") 'rectangle-number-lines)

;; = Insert state Bindings =
(define-key evil-insert-state-map (kbd "C-g") `evil-normal-state)
;; Add a shortcut for rectangle number stuff and
;; Set rectangle--default-line-number-format so no space
;; https://emacs.stackexchange.com/questions/27621/how-to-supply-universal-argument-c-u-to-a-function-call-inside-a-binding-state

;; (global-set-key (kbd "C-x r N")
;;   (lamda() (interactive)
;; 	(let ((current-prefix-arg 1))
;; 	  (call-interactively #`rectangle-number-lines))))


(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)
;; === --- ===


;; == Misc Packages ==

(which-key-mode)

;; Projectile
(projectile-mode t)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; sentence-highlight ===========
(defgroup hl-sentence nil
  "Highlight the current sentence."
  :group 'convenience)

;;;###autoload
(defface hl-sentence '((t :inherit highlight))
  "The face used to highlight the current sentence."
  :group 'hl-sentence)

(defun hl-sentence-begin-pos ()
  "Return the point of the beginning of a sentence."
  (save-excursion
    (unless (= (point) (point-max))
      (forward-char))
    (backward-sentence)
    (point)))

(defun hl-sentence-end-pos ()
  "Return the point of the end of a sentence."
  (save-excursion
    (unless (= (point) (point-max))
      (forward-char))
    (backward-sentence)
    (forward-sentence)
    (point)))

(defvar hl-sentence-extent nil
  "The location of the hl-sentence-mode overlay.")

;;;###autoload
(define-minor-mode hl-sentence-mode
  "Enable highlighting of currentent sentence."
  :init-value nil
  (if hl-sentence-mode
      (add-hook 'post-command-hook 'hl-sentence-current nil t)
    (move-overlay hl-sentence-extent 0 0 (current-buffer))
    (remove-hook 'post-command-hook 'hl-sentence-current t)))

(defun hl-sentence-current ()
  "Highlight current sentence."
  (and hl-sentence-mode (> (buffer-size) 0)
       (boundp 'hl-sentence-extent)
       hl-sentence-extent
       (move-overlay hl-sentence-extent
		     (hl-sentence-begin-pos)
		     (hl-sentence-end-pos)
		     (current-buffer))))

(setq hl-sentence-extent (make-overlay 0 0))
(overlay-put hl-sentence-extent 'face 'hl-sentence)

(provide 'hl-sentence)
;; (set-face-attribute 'hl-sentence nil
;;                     :foreground "#444")

;; === --- ===



(winner-mode)
(define-key winner-mode-map (kbd "C-S-u") `winner-undo)
(define-key winner-mode-map (kbd "C-S-r") `winner-redo)

;; Org-mode Configurations
(setq org-agenda-files `("~/Documents/org/Deadlines.org"
			 "~/Documents/org/Inbox.org"
			 "~/Documents/org/School.org"
			 "~/Documents/org/Projects.org"
			 ))
(setq org-todo-keywords
      '((sequence "TODO" "PROJECT"  "|" "DONE" "REVIEW")))
(setq org-startup-folded t)
;; (setq org-agenda-skip-deadline-if-done t)
;; (org-babel-do-load-languages '((emacs-lisp . t) (shell . t)))
;; (org-confirm-babel-evaluate nil)


;; == Change between light and dark themes
(setq heaven-and-hell-theme-type 'dark)
(setq heaven-and-hell-themes
      '((lighf . modes-operandi)
        (dark . modus-vivendi)))
;; Optionall, load themes without asking for confirmation.
(setq heaven-and-hell-load-theme-no-confirm t)
;; Add init-hook so heaven-and-hell can load your theme
(add-hook 'after-init-hook 'heaven-and-hell-init-hook)
;; Set keys to toggle theme and return to default emacs theme
(global-set-key (kbd "C-c 8") 'heaven-and-hell-toggle-theme)
;; ====


;; === Expand region config
(require 'expand-region)
(define-key evil-motion-state-map (kbd "S-SPC") 'er/expand-region)
(define-key evil-visual-state-map (kbd "S-SPC") 'er/expand-region)
;; ==

;; Web related things : web-mode
(require `web-mode)
;; https://web-mode.org/
(setq web-mode-enable-current-element-highlight t)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
;; ===

;; Start Server
(server-start)
