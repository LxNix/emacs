(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(el-get 'sync)
(require 'auto-complete-config)
(ac-config-default)
(distel-setup)

;---------------------------------------------------
(setq default-frame-alist '((height . 45) (width . 100)))
;(setq default-directory "~/")

;按键绑定
(global-set-key [(control k)] `kill-whole-line)
(global-set-key "\M-[c" `next-buffer)
(global-set-key "\M-[d" `switch-to-prev-buffer)
(global-set-key "\M-[a" `other-window)
(global-set-key "\C-@" `move-beginning-of-line)
(global-set-key [(meta x)] 'smex)
(global-set-key [(meta shift x)] 'execute-extended-command)


(setq ring-bell-function 'ignore)
(setq linum-format "%3d ")
(global-linum-mode)
(line-number-mode t) 

(desktop-save-mode 1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(setq visible-bell t) 
(setq default-tab-width 4) 
(setq tab-width 4)
(blink-cursor-mode -1)
(global-hl-line-mode 1)
(setq auto-save-default nil)

(mouse-avoidance-mode 'animate)

(show-paren-mode t)
(setq show-paren-style 'parentheses)


(setq make-backup-files nil)

(setq display-time-day-and-date t)
(display-time)

(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)

;;'y' for 'yes', 'n' for 'no'
(fset 'yes-or-no-p 'y-or-n-p) 


(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(define-key global-map [C-return] 'set-mark-command)
(setq scroll-margin 3
      scroll-conservatively 10000)
(auto-image-file-mode)
(setq frame-title-format "emacs@%b")
(global-font-lock-mode t)


;;---------------------------------------
;; Erlang mode
(setq load-path (cons  "/usr/lib/erlang/lib/tools-2.8.2/emacs" load-path))
(setq erlang-root-dir "/usr/lib/erlang/")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
(require 'erlang-start)


;; Some Erlang customizations
(add-hook 'erlang-mode-hook
  (lambda ()
  ;; when starting an Erlang shell in Emacs, default in the node name
    (setq inferior-erlang-machine-options '("-sname" "emacs" "-setcookie" "today"))
    ;; add Erlang functions to an imenu menu
    (imenu-add-to-menubar "imenu")))
;; A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("/C-/M-i"   erl-complete)
    ("/M-?"      erl-complete) 
    ("/M-."      erl-find-source-under-point)
    ("/M-,"      erl-find-source-unwind) 
    ("/M-*"      erl-find-source-unwind) 
    )
  "Additional keys to bind when in Erlang shell.")
(add-hook 'erlang-shell-mode-hook
   (lambda ()
     ;; add some Distel bindings to the Erlang shell
     (dolist (spec distel-shell-keys)
       (define-key erlang-shell-mode-map (car spec) (cadr spec)))))

;(require 'session)
;(add-hook 'after-init-hook 'session-initialize)
(setq desktop-globals-to-save '(desktop-missing-file-warning))
