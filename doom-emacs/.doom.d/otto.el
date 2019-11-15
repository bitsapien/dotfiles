;;; ~/gitdisk/projects/dotfiles/doom-emacs/.doom.d/otto.el -*- lexical-binding: t; -*-

;; Write a function that takes the name of the project and sends it to al cc that would open up the corresponding github/circleci page
(defun open-circleci ()
  "Return project name."
  (interactive)
  (shell-command-to-string
   (concat "$HOME/aliaser cc "
           (car (last (butlast (split-string (read-directory-name "Project Name:") "/")))))))

(global-set-key (kbd "C-S-c") 'open-circleci)
(defun open-github ()
  "Return project name."
  (interactive)
  (shell-command-to-string
   (concat "$HOME/aliaser gb "
           (car (last (butlast (split-string (read-directory-name "Project Name:") "/")))))))

(global-set-key (kbd "C-S-g") 'open-github)
