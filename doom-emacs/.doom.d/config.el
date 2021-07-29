;;; .doom.d/config.el -*- lexical-binding: t; -*-


(setq user-full-name "bitsapien"
      user-mail-address "bitsapien@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;;(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(load! "falaf.el")
;; Place your private configuration here
(setq mac-option-key-is-meta t                        ;; Remapping Meta to CMD
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none
      projectile-project-search-path '("~/gitdisk/tw/" "~/gitdisk/projects/") ;; Projectile search paths 🔍
      indent-tabs-mode nil                              ;; No Tabs ⌨️
      tab-width 2                                       ;; Cause tab widths matter
      truncate-lines t
      global-visual-line-mode t                         ;; Why you no word wrap Emacs !
      auto-revert-mode t                                ;; Refresh buffers on local disk changes
      doom-theme 'doom-dracula)                          ;; Set doom theme
(if (fboundp 'mac-auto-operator-composition-mode)
    (mac-auto-operator-composition-mode))

(custom-set-variables
 '(zoom-mode t))                                        ;; Zoom splits that are focussed

(when (fboundp 'windmove-default-keybindings)           ;; Move around split screen using Shift + arrow keys
  (windmove-default-keybindings))

;; -----------------------------------------------------------------------------
;; Org Mode
;; -----------------------------------------------------------------------------
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org
        (setq org-directory (concat (getenv "PROJECT_HOME") "/org/"))
        (setq org-agenda-files
              (concat (getenv "PROJECT_HOME") "/org/main.org"))
        (setq org-todo-keywords
        '((sequence
                "TODO"
                "HOLD"
                "SCHEDULED"
                "IN-PROGRESS"
                "DEADLINE"
                "HABIT" "|" "DONE" "CANCELLED")))
        ;; Make windmove work in Org mode
        (add-hook 'org-shiftup-final-hook 'windmove-up)
        (add-hook 'org-shiftleft-final-hook 'windmove-left)
        (add-hook 'org-shiftdown-final-hook 'windmove-down)
        (add-hook 'org-shiftright-final-hook 'windmove-right)
        ;; --------------------------------------------------------------------
        ;; Org Agenda
        ;; --------------------------------------------------------------------
        ;; In progress items
        (setq org-agenda-custom-commands
        '(("c" todo "IN-PROGRESS")))
  )
;; -----------------------------------------------------------------------------
;; Wrap lines at 80 characters
;; -----------------------------------------------------------------------------
(add-hook 'text-mode-hook #'auto-fill-mode)
(add-hook 'org-mode-hook #'auto-fill-mode)
(setq-default fill-column 79)
;; -----------------------------------------------------------------------------
;; Full screen and font size for monitor
;; -----------------------------------------------------------------------------
(add-hook 'window-setup-hook #'toggle-frame-fullscreen)
(setq doom-font (font-spec :family "FuraCode Nerd Font" :size 19))
;; -----------------------------------------------------------------------------
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . nil)
   (elixir . t)))

