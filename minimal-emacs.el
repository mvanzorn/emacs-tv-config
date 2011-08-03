;;; Minimal-emacs.el - Minimal config for Emacs.

;;; Code:

(require 'cl)
(blink-cursor-mode -1)
(show-paren-mode 1)

(add-to-list 'load-path "~/elisp/")
(add-to-list 'load-path "~/elisp/anything")
(add-to-list 'load-path "~/.emacs.d/emacs-config-laptop")

;(require 'init-anything-thierry)
;; (when (require 'dired)
;;   (require 'tv-utils))

;; Recursive buffers
(require 'mb-depth)
(setq enable-recursive-minibuffers t)
(minibuffer-depth-indicate-mode 1)

(setq completion-cycle-threshold t)

;;; Anything minimal config
(require 'anything-config)
;(autoload 'anything-find-files "anything-config" nil t)
;(autoload 'anything-M-x "anything-config" nil t)
(require 'anything-match-plugin)
;(require 'anything-complete)
(require 'autodoc)
(global-set-key (kbd "C-x C-f") 'anything-find-files)
(global-set-key (kbd "M-x") 'anything-M-x)
(global-set-key (kbd "C-x C-b") 'anything-buffers+)

;; (require 'descbinds-anything)
;; (descbinds-anything-install)            ; C-h b, C-x C-h
(fset 'yes-or-no-p 'y-or-n-p)
(require 'tv-utils)


;; Ioccur
(require 'ioccur)
(global-set-key (kbd "C-c o") 'ioccur)
(global-set-key (kbd "C-c C-o") 'ioccur-find-buffer-matching)
;(load "~/.emacs.d/elisp-objects/ioccur-history.elc")

;; Auto completion
;; (add-hook 'minibuffer-setup-hook
;;           (lambda () (add-hook 'post-command-hook
;;                                'minibuffer-completion-help nil t)))

;; Eldoc
(require 'eldoc-eval)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(with-current-buffer "*scratch*" (lisp-interaction-mode)) 
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(add-hook 'eshell-mode-hook 'turn-on-eldoc-mode)

