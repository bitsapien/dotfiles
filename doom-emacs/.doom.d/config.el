;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq mac-option-key-is-meta nil                        ;; Remapping Meta to CMD
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none
      projectile-project-search-path '("~/gitdisk/tw/") ;; Projectile search paths 🔍
      indent-tabs-mode nil                              ;; No Tabs ⌨️
      tab-width 2                                       ;; Cause tab widths matter
      truncate-lines t                                  ;; Word wrap at end of screen
      )

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
