;win7
;(setenv "HOME" "d:/emacs/")
;(load "~/.emacs.d/init.el")

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(setq my:el-get-packages '(
    el-get auto-complete
    smex erlang-mode distel))
(el-get nil my:el-get-packages)

(global-set-key [(meta x)] 'smex)
(global-set-key [(meta shift x)] 'execute-extended-command)
;############################

;(setq default-frame-alist '((height . 45) (width . 90)))
(setq ring-bell-function 'ignore)
(setq inhibit-startup-message t)
(global-linum-mode t)
(setq linum-format "%2d ")
(setq visible-bell t) 
(setq default-tab-width 4) 
(setq tab-width 4)
(setq make-backup-files nil)
(global-hl-line-mode t)
(setq column-number-mode t)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(desktop-save-mode t)
(show-paren-mode t)

(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(display-time)
(fset 'yes-or-no-p 'y-or-n-p) 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "ÐÂËÎÌå" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))
