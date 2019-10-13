;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq mac-option-key-is-meta nil                        ;; Remapping Meta to CMD
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none
      projectile-project-search-path '("~/gitdisk/tw/" "~/gitdisk/projects/") ;; Projectile search paths 🔍
      indent-tabs-mode nil                              ;; No Tabs ⌨️
      tab-width 2                                       ;; Cause tab widths matter
      truncate-lines t
      global-visual-line-mode t                         ;; Why you no word wrap Emacs !
      )

(custom-set-variables
 '(zoom-mode t))                                        ;; Zoom splits that are focussed

(when (fboundp 'windmove-default-keybindings)           ;; Move around split screen using Shift + arrow keys
  (windmove-default-keybindings))

(add-hook 'org-shiftup-final-hook 'windmove-up)         ;; Make windmove work in Org mode
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

(setq easy-hugo-basedir "~/gitdisk/projects/blog/bitsapien/")                 ;; HUGO blog
(setq easy-hugo-postdir "content/posts")
(setq easy-hugo-url "https://bitsapien.dev/blog")
(setq easy-hugo-sshdomain "bitsapien.dev")
(setq easy-hugo-root "/var/www/blog/")
(setq easy-hugo-previewtime "300")
(define-key global-map (kbd "C-c C-e") 'easy-hugo)
)

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
