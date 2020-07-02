;; .emacs.d/init.el

;; ===================================
;; melpa package support
;; ===================================
;; enables basic packaging support
(require 'package)

;; adds the melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; initializes the package infrastructure
(package-initialize)

;; if there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; installs packages
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (ripgrep rg projectile naysayer-theme material-theme better-defaults))))


;; ===================================
;; basic customization
;; ===================================

(setq inhibit-startup-message t)    ;; hide the startup message
					;(load-theme 'naysayer t)            ;; load naysayer theme

;; user-defined init.el ends here
;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

; display column number
(setq column-number-mode t)


(tool-bar-mode -1)        ; disable toolbar
(menu-bar-mode -1)        ; disable menu
(toggle-scroll-bar -1)    ; disable scrolling

(show-paren-mode 1) ; enable paranthesis mode

; change indentation to 2 in python mode
(add-hook 'python-mode-hook '(lambda () 
 (setq python-indent 2)))


;; projectile settings

;(projectile-mode)
;(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; rg default key bindings
(global-set-key (kbd "C-c s") #'rg-menu)
(with-eval-after-load 'rg
   ;; Your settings goes here.
)


; jonathan blow's emacs theme :)
;;
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#d3b58d" :background "#041818"))))
 '(custom-group-tag-face ((t (:underline t :foreground "lightblue"))) t)
 '(custom-variable-tag-face ((t (:underline t :foreground "lightblue"))) t)
 '(font-lock-builtin-face ((t nil)))
 ; '(font-lock-comment-face ((t (:foreground "yellow"))))
 '(font-lock-comment-face ((t (:foreground "#3fdf1f"))))
 '(font-lock-function-name-face ((((class color) (background dark)) (:foreground "white")))) 
 '(font-lock-keyword-face ((t (:foreground "white" ))))
 ; '(font-lock-string-face ((t (:foreground "gray160" :background "gray16"))))
 '(font-lock-string-face ((t (:foreground "#0fdfaf"))))
 '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "#c8d4ec"))))  
; '(font-lock-warning-face ((t (:foreground "#695a46"))))
 '(font-lock-warning-face ((t (:foreground "#504038"))))
 '(highlight ((t (:foreground "navyblue" :background "darkseagreen2"))))
 '(mode-line ((t (:inverse-video t))))
 '(region ((t (:background "blue"))))
 '(widget-field-face ((t (:foreground "white"))) t)
 '(widget-single-line-field-face ((t (:background "darkgray"))) t))

(global-font-lock-mode 1)
(set-cursor-color "lightgreen")
(set-background-color "#072626")
(global-set-key [C-return] 'save-buffer)

;(set-face-attribute 'default nil :font "Anonymous Pro-15")
(set-face-attribute 'default nil :font "Consolas-10")

(set-face-foreground 'font-lock-builtin-face         "lightgreen")

;;quick window movement
(windmove-default-keybindings)

;; show file path in the frame title

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))
 

;; c++ mode indentation settings

(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(c-set-offset 'case-label '+)

;enable modify region by pasting over/removing
(delete-selection-mode 1)
