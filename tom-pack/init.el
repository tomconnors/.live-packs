;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

;; maintain old key bindings
(live-ignore-packs '(stable/bindings-pack stable/colour-pack))

;; to specify exactly what packs I want:
;; (live-use-packs
;;  '(live/foundation-pack
;;    live/clojure-pack
;;    live/lang-pack
;;    live/power-pack))﻿

;; git gutter mode fights with linum mode.
;; i find line numbers more useful
(global-git-gutter-mode -1)

;; for line numbers
(require 'linum)
(global-linum-mode)


;; get rid of fancy f's replacing regular old fn's
(add-hook 'clojure-mode-hook
          (lambda ()
            (font-lock-remove-keywords
             nil `(("(\\(fn\\)[\[[:space:]]"
                    (0 (progn (compose-region (match-beginning 1)
                                              (match-end 1) "λ")
                              nil)))
                   ("\\(#\\)("
                    (0 (progn (compose-region (match-beginning 1)
                                              (match-end 1) "ƒ")
                              nil)))
                   ("\\(#\\){"
                    (0 (progn (compose-region (match-beginning 1)
                                              (match-end 1) "∈")
                              nil)))))))

;; enable window navigation with shift + arrow
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; split window at start up
;; (add-hook 'emacs-startup-hook (split-window-horizontally))

;; turn off yas tab-expansions
;; (i'd like to be able to expand with C-TAB, but can't figure it out.)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map [(tab)] nil)

;; I like smaller tabs
(setq-default tab-width 2)

;; Treat LESS like CSS
;; (add-to-list 'auto-mode-alist '("\\.less\\'" . css-mode))

;; smaller font
(set-face-attribute 'default nil :height 102)

;; hopefully this speeds everything up?
;;(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)
