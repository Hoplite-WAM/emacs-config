;; === Useful Defaults ===
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
(blink-cursor-mode 0)
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
(global-flycheck-mode)
(global-visual-line-mode)
;; Very important! Sets tabs and indents to 2 globally!
(setq-default tab-width 2)
(setq standard-indent 2)
(setq-default indent-tabs-mode nil)
;; ===
;; (add-to-list 'load-path
;; "~/.emacs.d/lisp/")
;; (require 'bookmark+)

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
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(css-indent-offset 2)
 '(custom-enabled-themes '(solarized-selenized-dark))
 '(custom-safe-themes
   '("285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "3e200d49451ec4b8baa068c989e7fba2a97646091fd555eca0ee5a1386d56077" "efcecf09905ff85a7c80025551c657299a4d18c5fcfedd3b2f2b6287e4edd659" "524fa911b70d6b94d71585c9f0c5966fe85fb3a9ddd635362bfabd1a7981a307" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36" "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633" "57a29645c35ae5ce1660d5987d3da5869b048477a7801ce7ab57bfb25ce12d3e" default))
 '(fringe-mode 0 nil (fringe))
 '(helm-minibuffer-history-key "M-p")
 '(js-indent-level 2)
 '(org-agenda-custom-commands
   '(("n" "My Custom View"
      ((agenda ""
               ((org-agenda-span 1)
                (org-deadline-warning-days 3)))
       (agenda ""
               ((org-agenda-overriding-header "Important Dates")
                (org-agenda-span 1)
                (org-deadline-warning-days 1000)
                (org-agenda-show-all-dates nil)
                (org-agenda-entry-types
                 '(:deadline))
                (org-agenda-skip-function
                 '(org-agenda-skip-entry-if `notregexp "\\* DEADLINE"))))
       (agenda ""
               ((org-agenda-overriding-header "Appointments")
                (org-agenda-span 1)
                (org-deadline-warning-days 1000)
                (org-agenda-show-all-dates nil)
                (org-agenda-entry-types
                 '(:deadline))
                (org-agenda-skip-function
                 '(org-agenda-skip-entry-if `notregexp "\\* APPOINTMENT"))))
       (todo "WAITING"
             ((org-agenda-overriding-header "Waiting")
              (org-agenda-prefix-format "  ")))
       (todo "GET-DONE"
             ((org-agenda-overriding-header "Needs Scheduling or Deadline")
              (org-agenda-prefix-format "  ")
              (org-agenda-skip-function
               '(org-agenda-skip-entry-if 'deadline 'scheduled 'notregexp "\\* GET-DONE"))))
       (todo "WHEN-FREE"
             ((org-agenda-overriding-header "Free Time")
              (org-agenda-prefix-format "  ")))
       (todo "NOT-COMMITED"
             ((org-agenda-overriding-header "Unplanned"))))
      nil)))
 '(org-agenda-prefix-format
   '((agenda . "--- %s %t - ")
     (todo . " %i %-12:c")
     (tags . " %i %-12:c")
     (search . " %i %-12:c")))
 '(package-selected-packages
   '(solarized-theme zenity-color-picker zeal-at-point undo-tree evil-matchit evil-exchange evil-args yasnippet evil-numbers
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
;; === --- ===


;; === Major Mode Hooks ===


;; (add-hook 'org-agenda-after-show-hook’ 'evil-emacs-state)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (add-hook `evil-insert-state-exit-hook (lambda () (untabify (point-min) (point-max))))

;; Dired
(add-hook 'dired-mode-hook #'dired-hide-details-mode)
(add-hook 'dired-mode-hook 'olivetti-mode)
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

;; Snippet Mode
(require 'yasnippet)
(add-hook `yas-after-exit-snippet-hook `evil-normal-state)
(setq yas-snippet-dirs
      `("~/.emacs.d/snippets"
  ))
(yas-global-mode 1)

;; Config mode
(add-hook 'conf-mode-hook #'rainbow-delimiters-mode)
(add-hook 'conf-mode-hook #'display-line-numbers-mode)

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
;; (add-hook 'web-mode-hook 'highlight-indentation-mode)
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

(winner-mode)
(define-key winner-mode-map (kbd "C-S-u") `winner-undo)
(define-key winner-mode-map (kbd "C-S-r") `winner-redo)

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

; === Evil mode configuarion ===

(setq evil-want-C-u-scroll t)
(setq evil-respect-visual-line-mode t)
;; Exiting insert mode wont move cursor back
(setq evil-move-beyond-eol t)
(setq evil-move-cursor-back nil)
(setq evil-want-keybinding nil)
(require `undo-tree)
(global-undo-tree-mode)
(setq evil-undo-system `undo-tree)
(require `evil-numbers)
(global-evil-matchit-mode 1)
(setq evil-jumps-cross-buffers nil)
(setq-default evil-shift-width 2)

(evil-mode)
(evil-collection-init)
(global-evil-surround-mode 1)
(evil-snipe-mode 1)

;; indicate mode by cursor color
(setq evil-default-cursor (quote (t "#750000"))
    evil-visual-state-cursor '("#a800e0" box)
    evil-normal-state-cursor '("#878787" box)
    evil-insert-state-cursor '("#e27300" box)
    evil-replace-state-cursor '("red" box)
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
(define-key evil-motion-state-map (kbd "C-SPC") `helm-buffers-list)
(define-key evil-motion-state-map (kbd "|") `helm-global-mark-ring)
(define-key evil-motion-state-map (kbd "\\") `helm-mark-ring)
(define-key evil-motion-state-map (kbd "C-S-f") 'scroll-other-window)
(define-key evil-motion-state-map (kbd "C-S-b") 'scroll-other-window-down)
(define-key evil-motion-state-map (kbd "RET") nil)
(define-key evil-motion-state-map (kbd "DEL") nil)
(define-key evil-normal-state-map (kbd "DEL") nil)
(define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)
(define-key evil-normal-state-map (kbd "C-a") 'rectangle-number-lines)
(define-key evil-motion-state-map (kbd "M-y") 'yank-from-kill-ring)

;; === Evil Args ===
;; bind evil-args text objects
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

;; == custom - function start ==
(defun evil-args--forward-opener (&optional count)
  (let ((openers-regexp (regexp-opt evil-args-openers))
  (closers-regexp (regexp-opt evil-args-closers))
  (openers-and-closers-regexp (regexp-opt (append evil-args-openers
              evil-args-closers)))
  (end -1)
  (count (or count 1)))
    (save-excursion
      (while (> count 0)
  ;; search forward for an opener
  (if (not (re-search-forward openers-and-closers-regexp nil t))
            ;; not found (do nothing more)
            (setq count 0)
    ;; found
    (backward-char)
    ;; if looking at a closer (stop)
    (if (looking-at-p closers-regexp)
              (setq count 0)
            ;; if looking at an opener
            (setq end (+ (point) 1))
            (forward-char)
            (setq count (- count 1)))
    )))
    (if (> end 0) (goto-char end))))

;;;###autoload
(defun evil-jump-in-args (count)
  "Move the cursor in the next enclosing matching pairs."
  (interactive "p")
  (evil-args--forward-opener count))
;; == custom - function end ==

;;  === Make emacs state basically be evil insert state ===
(define-key evil-normal-state-map "i" 'evil-emacs-state)
(define-key evil-emacs-state-map (kbd "<escape>") 'evil-normal-state)
(define-key evil-emacs-state-map (kbd "C-g") 'evil-normal-state)

(defun my-evil-change-or-open-line (orig-fun &rest args)
  "Wrapper for `evil-change', `evil-open-below', and `evil-open-above'
   that enters Emacs state afterwards."
  (apply orig-fun args)
  (evil-emacs-state))

(advice-add #'evil-change :around #'my-evil-change-or-open-line)
(advice-add #'evil-open-below :around #'my-evil-change-or-open-line)
(advice-add #'evil-open-above :around #'my-evil-change-or-open-line)

(define-key evil-normal-state-map "c" #'evil-change)
(define-key evil-visual-state-map "c" #'evil-change)
(define-key evil-motion-state-map "c" #'evil-change)

(define-key evil-normal-state-map "o" #'evil-open-below)
(define-key evil-visual-state-map "o" #'evil-open-below)
(define-key evil-motion-state-map "o" #'evil-open-below)

(define-key evil-normal-state-map "O" #'evil-open-above)
(define-key evil-visual-state-map "O" #'evil-open-above)
(define-key evil-motion-state-map "O" #'evil-open-above)
;; === ===

;; bind evil-forward/backward-args
(define-key evil-normal-state-map "/" 'evil-forward-arg)
(define-key evil-normal-state-map "/" 'evil-forward-arg)
(define-key evil-motion-state-map "?" 'evil-backward-arg)
(define-key evil-motion-state-map "?" 'evil-backward-arg)

;; bind evil-jump-out-args
(define-key evil-normal-state-map "N" 'evil-jump-out-args)
(define-key evil-normal-state-map "n" 'evil-jump-in-args)

(require `evil-args)
(require `evil-exchange)
(evil-exchange-install)


;; === -End of Evil Args- ===

;; = Insert state Bindings =
(define-key evil-insert-state-map (kbd "C-g") `evil-normal-state)
(define-key evil-replace-state-map (kbd "C-g") `evil-normal-state)


;; == Creates Marks for j and k greater than 1 line away
;; https://www.reddit.com/r/emacs/comments/8flkrg/evil_add_numbered_movement_to_the_jump_list/
(defun my-jump-advice (oldfun &rest args)
  "Creates Marks for j and k greater than 1 line away"
  (let ((old-pos (point)))
    (apply oldfun args)
    (when (> (abs (- (line-number-at-pos old-pos) (line-number-at-pos (point))))
             1)
      (evil-set-jump old-pos))))

(advice-add 'evil-next-line :around #'my-jump-advice)
(advice-add 'evil-previous-line :around #'my-jump-advice)
;; == --- ==

;; === --- End of Evil Configuration --- ===


;; == Misc Packages ==

;; Web related things : web-mode
(require `web-mode)
;; https://web-mode.org/
(setq web-mode-enable-current-element-highlight t)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
;; ===


(which-key-mode)

;; === Org-mode Configurations ===
(global-set-key (kbd "C-c a") `org-agenda)
(setq org-log-repeat nil)
(setq org-todo-repeat-to-state "GET-DONE")
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-files `("~/Documents/Synced Documents/org/Deadlines.org"
       "~/Documents/Synced Documents/org/Inbox.org"
       ;; "~/Documents/org/Bills.org"
       "~/Documents/Synced Documents/org/School.org"
       "~/Documents/Synced Documents/org/Projects.org"
       "~/Documents/Synced Documents/org/Appointments.org"
       ))
(setq org-todo-keywords
      '((sequence "WAITING" "APPOINTMENT" "DEADLINE" "NOT-COMMITED" "WHEN-FREE" "GET-DONE" "NEXT" "PROJECT" "GOAL" "|" "DONE" "CANCELED")))
(setq org-startup-folded t)
(setq org-todo-keyword-faces
      '(("NOT-COMMITED" . "grey")
  ("PROJECT" . "#cf40cd")
  ("WAITING" . "#469DE9")
  ("NEXT" . "yellow")
  ("AUTO-PAY" . "yellow")
  ("CANCELED" . "#663300")
  ("WHEN-FREE" . "#E79BE8")
   ))

(org-babel-do-load-languages
    'org-babel-load-languages
    '(
    (shell . t)
    ))

;; (org-babel-confirm-evaluate nil)

;; === End of Org Configuration ===


;; == Change between light and dark themes
;; (setq heaven-and-hell-theme-type 'dark)
;; (setq heaven-and-hell-themes
;;       '((light . 'modus-operanti)
;;         (dark . 'solarized-dark)))
;; ;; Optionall, load themes without asking for confirmation.
;; (setq heaven-and-hell-load-theme-no-confirm t)
;; ;; Add init-hook so heaven-and-hell can load your theme
;; (add-hook 'after-init-hook 'heaven-and-hell-init-hook)
;; ;; Set keys to toggle theme and return to default emacs theme
;; (global-set-key (kbd "C-c 8") 'heaven-and-hell-toggle-theme)
;; ====

;; === Expand region config
(require 'expand-region)
(define-key evil-motion-state-map (kbd "S-SPC") 'er/expand-region)
(define-key evil-visual-state-map (kbd "S-SPC") 'er/expand-region)

(require 'expand-region-core)
(require 'web-mode-expansions)
(require 'html-mode-expansions)
(require 'js-mode-expansions)
(require 'css-mode-expansions)
(require 'python-mode-expansions)
(require 'yaml-mode-expansions)
(require 'text-mode-expansions)
(require 'the-org-mode-expansions)
;; ==

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
;; ===

;; Start Server
(server-start)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
