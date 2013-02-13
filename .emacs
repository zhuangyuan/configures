(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
 
 (add-to-list `load-path "~/.emacs.d/site-lisp/") ;;lisp code load directory

(transient-mark-mode t) ;; highlight selected area

(setq-default indent-tabs-mode nil) ;;use space rather than tabs in the indent

;;Maximize the windows when startup

(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key [(meta ?/)] 'hippie-expand) ;;代码补全

(global-font-lock-mode t)  ;;语法高亮

 ;;C sh 折叠
(add-hook `c-mode-common-hook `hs-minor-mode)
(add-hook `sh-mode-common-hook `hs-minor-mode)

(global-set-key [f9] `\hs-toggle-hiding)  ;; F9 代码折叠展开键

(define-key ctl-x-map "l" 'goto-line)   ;;set c-x-l linenum as go to lines

(global-set-key[f3] (lambda() (interactive)(save-buffer)(kill-emacs))) ;; set F4 as save and exit
'(global-linum-mode t) ;;显示行号
(setq linum-format "%4d ")
(add-hook 'find-file-hook (lambda () (linum-mode 1)))


(global-set-key[f4] (lambda() (interactive)(split-window-horizontally)(other-window 1)))
(global-set-key[f5] 'gdb)
(global-set-key[f6] 'eshell)

;;(require 'linum)    ;;use linum.el

;;(add-hook 'find-file-hooks (lambda()(linum-mode 1)))

;; (defun qiang-comment-dwim-line (&optional arg)
;;   "Replacement for the comment-dwim command. If no region is selected and current line is not blank and we are not at the end of the line, then comment current line. Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
;;   (interactive "*P")
;;   (comment-normalize-vars)
;;   (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
;;       (comment-region (line-beginning-position) (line-end-position))
;;     (comment-dwim arg)))
;; (global-set-key (kbd "C-;") 'qiang-comment-dwim-line) 

;;(setq backup-directory-alist (quote (("."."./.backups"))))

(setq backup-by-copying t)
(setq backup-directory-alist `(("." . "./.saves")))
(setq delete-old-versions t
      kept-old-version 2
      kept-new-version 8
      version-control t)

(fset 'yes-or-no-p 'y-or-n-p);;y n replace yes no

(column-number-mode t)

(setq kill-ring-max 200)

(setq frame-title-format "emacs@%b") ;; title shows buffer name

(setq user-full-name "Yuan Zhuang")
(setq user-email-address "yz148@duke.edu")

(setq display-time-day-and-date t)
(display-time)
(setq display-time-day-and-date t)

(setq c-default-style "bsd"
  c-basic-offset 4)  ;; set the indent style same as the K&R's book when using C-x-h X-M-\
(defun linux-c-mode()
  (interactive)
  (imenu-add-menubar-index) ;;index of functions
  (which-function-mode) ;;current function
)

(set-default-font "Courier 10 Pitch-14")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;AUCTeX 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (load "auctex.el" nil t t)
;; (load "tex-site.el" nil t t)
;; (load "preview-latex.el" nil t t)

;; (setq TeX-electric-escape t)
;; (setq LaTeX-math-mode t)

;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)

;; (setq TeX-auto-untabify t) ;; 不使用 TAB字符缩进
;; (setq LaTeX-document-regexp "document\\|CJK\\*?")  ;; CJK 环境中不缩进
;; (setq TeX-newline-function 'newline-and-indent) ;;回车时自动缩进

;; (add-hook 'LaTeX-mode-hook #'LaTeX-install-toolbar)
;; (add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)

;; (autoload 'LaTeX-preview-setup "preview")
;; (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)

;; (autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
;; (autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
;; (autoload 'reftex-citation "reftex-cite" "Make citation" nil)
;; (autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)                        
;; (setq reftex-plug-into-AUCTeX t)

;; (setq reftex-revisit-to-follow t
;;       reftex-auto-recenter-toc t)
;; (add-hook 'TeX-mode-hook
;;           (lambda ()
;;             (setq reftex-plug-into-AUCTeX t)
;;             (turn-on-reftex)
;;             ))

;; ;;把beamer的frametitle也放入reftex目录缓冲中，但需要把\frametitle写在行首
;; (setq reftex-section-levels
;;       '(("part" . 0) ("chapter" . 1) ("section" . 2) 
;; ("subsection" . 3)
;;         ("frametitle" . 4) ("subsubsection" . 4) 
;; ("paragraph" . 5)
;;         ("subparagraph" . 6) ("addchap" . -1) ("addsec" . -2)))

;; ;;bibtex的设置
;; (setq bibtex-autokey-names 1
;;       bibtex-autokey-names-stretch 1
;;       bibtex-autokey-name-separator "-"
;;       bibtex-autokey-additional-names "-et.al."
;;       bibtex-autokey-name-case-convert 'identity
;;       bibtex-autokey-name-year-separator "-"
;;       bibtex-autokey-titlewords-stretch 0
;;       bibtex-autokey-titlewords 0
;;       bibtex-maintain-sorted-entries 'plain
;;       bibtex-entry-format '(opts-or-alts numerical-fields))

;; Calendar 中 p C 可以看到我们的阴历有中文的天干地支。
(setq mark-diary-entries-in-calendar t)
(setq appt-issue-message nil)
(setq mark-holidays-in-calendar nil)
(setq view-calendar-holidays-initially nil)

(setq chinese-calendar-celestial-stem
      ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
      ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"])

;; (server-start)

(global-set-key [f11] 'my-maximized)

;最大化
(defun my-maximized ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
)

;; (require 'aspell)

(defun turn-spell-checking-on ()
  "Turn speck-mode or flyspell-mode on."
  ;; (speck-mode 1)
  (flyspell-mode 1)
  )

(add-hook 'text-mode-hook 'turn-spell-checking-on)

;; (load-file "~/.emacs.d/site-lisp/cedet-1.1/common/cedet.el")
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu
