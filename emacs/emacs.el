;; --- Clean Up the Interface ---  -*- lexical-binding: t;
-*-
(setq inhibit-startup-message t)    ; Suppress the welcome screen
;;(tool-bar-mode -1)                  ; Disable the graphical tool bar
(menu-bar-mode -1)                  ; Disable the menu bar
;;(scroll-bar-mode -1)                ; Disable the window scroll bar

;; --- Editor Comforts ---
(global-display-line-numbers-mode t); Turn on line numbers everywhere
(setq column-number-mode t)         ; Show the column number in the mode line
(blink-cursor-mode -1)              ; Stop the cursor from blinking
(fset 'yes-or-no-p 'y-or-n-p)       ; Change "yes/no" prompts to quick "y/n"

;; --- Keep Your Init File Clean ---
;; This forces interactive "M-x customize" settings into a separate file
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; --- Manage Packages & Themes ---
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org") t)
(package-initialize)

;; -*- lexical-binding: t; -*-
(define-advice display-warning (:around (orig-fun type &rest args) silence-missing-lexical-binding-cookie)
  "Silence warnings about missing lexical-binding cookies."
  (if (memq 'missing-lexbind-cookie type)
      t
    (apply orig-fun type args)))

(add-to-list 'load-path "~/.emacs.d/lisp/")
;;(require 'my-custom-file)
(load custom-file 'noerror 'nomessage)

