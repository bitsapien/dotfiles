;;; ~/gitdisk/projects/dotfiles/doom-emacs/.doom.d/falaf.el -*- lexical-binding: t; -*-

(defun capitalize-kebab-case (sentence)
  "Capitalise text that look like abc-def to Abc Def"
  (capitalize (replace-regexp-in-string "-" " " sentence))
  )

; Markdown insert image from clipboard
; Install pngpaste on Mac
(defun insert-image-from-clipboard-to-markdown (filename)
  "Markdown insert image from clipboard"
  (shell-command-to-string (string-join "pngpaste " (string-join filename ".png")))
    )
