;;; .doom.d/config.el -*- lexical-binding: t; -*-

(setq user-full-name "bitsapien"
      user-mail-address "bitsapien@gmail.com")

(setenv "PATH" "/usr/local/opt/helm@2/bin:/Users/rahulc/.emacs.d/bin/:/usr/local/Cellar/emacs-plus/26.3/Emacs.app/Contents/MacOS/bin:/Users/rahulc/.cargo/bin:/Users/rahulc/.cargo/bin:/Users/rahulc/bin:/usr/local/bin:/Users/rahulc/.cargo/bin:/usr/local/Cellar/zsh/5.8/bin:/Users/rahulc/.cache/zsh4humans/v4/fzf/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/rahulc/dotfiles/bin:/Users/rahulc/go/bin:/Users/rahulc/Library/Python/2.7/bin:/Users/rahulc/.vim/plugged/vim-iced/bin")
(setenv "NODE_PATH" "/usr/local/lib/node_modules")

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

(load! "neptune.el")
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
      doom-theme 'doom-dracula                          ;; Set doom theme
     doom-font (font-spec :family "FuraCode Nerd Font" :size 12))
(if (fboundp 'mac-auto-operator-composition-mode)
    (mac-auto-operator-composition-mode))

(custom-set-variables
 '(zoom-mode t))                                        ;; Zoom splits that are focussed

(when (fboundp 'windmove-default-keybindings)           ;; Move around split screen using Shift + arrow keys
  (windmove-default-keybindings))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "$PROJECT_HOME/bitsapien-blog/notes/org/")
(setq org-todo-keywords
      '((sequence "TODO" "SCHEDULED" "DOING" "DELEGATED" "|" "DONE")))
(add-hook 'org-shiftup-final-hook 'windmove-up)         ;; Make windmove work in Org mode
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)



;;(add-hook 'python-mode-hook 'blacken-mode)
(add-hook 'ruby-mode-hook #'rubocopfmt-mode)

(add-hook 'after-init-hook 'global-emojify-mode)       ;; Enable global emoji rendering :stuck_out_tongue_closed_eyes:

;; Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

(setq easy-hugo-basedir "~/gitdisk/projects/bitsapien-blog/"
      easy-hugo-postdir "content/posts"
      easy-hugo-url "https://bitsapien.dev/blog"
      easy-hugo-preview-url "http://127.0.0.1:1313/blog/posts"
      easy-hugo-sshdomain "bitsapien.dev"
      easy-hugo-root "/var/www/blog/"
      easy-hugo-previewtime "300")
;;(def-package! easy-hugo
;;  :init
;;  (set-evil-initial-state! 'easy-hugo-mode 'emacs))



(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . nil)
   (elixir . t)))

(defun clone-and-open-project ()
  "Clones and opens project"
  (interactive)
  (shell-command-to-string (concat "clone " (read-string "Clone URL:"))))


(global-set-key (kbd "C-M-p") 'clone-and-open-project)
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)

;; Prettier
(require 'prettier-js)
(add-hook 'js2-mode-hook 'prettier-js-mode)
