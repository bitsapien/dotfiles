;;; .doom.d/config.el -*- lexical-binding: t; -*-


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

(add-hook 'org-shiftup-final-hook 'windmove-up)         ;; Make windmove work in Org mode
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

(setq org-todo-keywords
      '((sequence "TODO" "SCHEDULED" "DOING" "DELEGATED" "|" "DONE")))


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



;;; line 1

;;; line 2

(def-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                         :time-grid t
                                         :scheduled today)
                                  (:name "Due today"
                                         :deadline today)
                                  (:name "Important"
                                         :priority "A")
                                  (:name "Overdue"
                                         :deadline past)
                                  (:name "Due soon"
                                         :deadline future)
                                  (:name "Big Outcomesj"
                                         :tag "bo")))
  :config
  (org-super-agenda-mode))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . nil)
   (elixir . t)))

(defun clone-and-open-project ()
  "Clones and opens project"
  (interactive)
  (shell-command-to-string (concat "clone " (read-string "Clone URL:")))
)

(global-set-key (kbd "C-M-p") 'clone-and-open-project)
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
