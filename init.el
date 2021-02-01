;; load files
(add-to-list `load-path (getenv "DEFAULT_EMACS_SETTING_PATH"))

;; package
(require 'better-defaults)
(require 'package)
(require 'use-package)

;; action
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; load theme
(load-theme 'zenburn t)

             
;; basic setting
(add-hook 'prog-mode-hook `linum-mode)

;; load elpy
(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

;; elpy flymake
(setq elpy-remove-modeline-lighter t)

(advice-add 'elpy-modules-remove-modeline-lighter
            :around (lambda (fun &rest args)
                      (unless (eq (car args) 'flymake-mode)
                        (apply fun args))))



;; ace window
(global-set-key (kbd "M-o") 'ace-window)

