;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)
;;(package-refresh-contents)

;; use-package
(eval-when-compile
  (require 'use-package))

;; flycheck
(use-package flycheck
  :ensure t)

;; Tab settings
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)

;; Smooth scrolling
;; Source: https://www.emacswiki.org/emacs/SmoothScrolling
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Whitespace
(add-hook 'prog-mode-hook 'whitespace-mode)

;; rainbow parens
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Make window simpler.
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

;; Mouse support
(xterm-mouse-mode 1)

;; nano-emacs
(add-to-list 'load-path "~/.emacs.d/nano-emacs")
;; Default layout (optional)
(require 'nano-layout)
(require 'nano-theme-dark)
;;(require 'nano-theme-light)
;; Theme
(require 'nano-faces)
(nano-faces)
(require 'nano-theme)
(nano-theme)

;; Nano header & mode lines (optional)
(require 'nano-modeline)

;; Nano + org mode + faces
(with-eval-after-load 'org
  (set-face-attribute 'org-level-1 nil
                      :inherit 'nano-face-popout
                      :height 1.0)
  (set-face-attribute 'org-level-2 nil
                      :inherit 'nano-face-popout
                      :height 1.0)
  (set-face-attribute 'org-level-3 nil
                      :inherit 'nano-face-popout
                      :height 1.0)
  (set-face-attribute 'org-level-4 nil
                      :inherit 'nano-face-popout
                      :height 1.0)
  (set-face-attribute 'org-level-5 nil :inherit 'nano-face-popout)
  (set-face-attribute 'org-level-6 nil :inherit 'nano-face-popout)
  (set-face-attribute 'org-level-7 nil :inherit 'nano-face-popout)
  (set-face-attribute 'org-level-8 nil :inherit 'nano-face-popout)
  (set-face-attribute 'org-code nil :inherit 'nano-face-salient :weight 'normal)
  (set-face-attribute 'org-list-dt nil :inherit 'nano-face-salient)
  (set-face-attribute 'italic nil :slant 'italic :inherit 'nano-face-salient)
  (set-face-attribute 'bold nil :weight 'bold :inherit 'nano-face-salient))

(with-eval-after-load 'markdown-mode
  (set-face-attribute 'markdown-header-face nil :inherit 'nano-face-popout)
  (set-face-attribute 'markdown-header-face-1 nil :inherit 'markdown-header-face)
  (set-face-attribute 'markdown-header-face-2 nil :inherit 'markdown-header-face)
  (set-face-attribute 'markdown-header-face-3 nil :inherit 'markdown-header-face)
  (set-face-attribute 'markdown-header-face-4 nil :inherit 'markdown-header-face)
  (set-face-attribute 'markdown-header-face-5 nil :inherit 'markdown-header-face)
  (set-face-attribute 'markdown-header-face-6 nil :inherit 'markdown-header-face)
  (set-face-attribute 'markdown-inline-code-face nil :inherit 'nano-face-salient))

;; org-bullets
(defun org-bullets-on ()
  (org-bullets-mode 1))
(use-package org-bullets
  :config
  (add-hook 'org-mode-hook #'org-bullets-on))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-electric-left-right-brace t)
 '(blink-cursor-mode nil)
 '(cursor-type 'bar)
 '(frame-resize-pixelwise t)
 '(magit-diff-use-overlays nil)
 '(markdown-fontify-code-blocks-natively t)
 '(org-agenda-files
   '("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org-todo/todo.org"))
 '(org-format-latex-options
   '(:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-hide-emphasis-markers t)
 '(org-highlight-latex-and-related '(native))
 '(org-html-htmlize-output-type 'inline-css)
 '(org-latex-listings 'minted)
 '(org-latex-packages-alist '((newfloat minted nil)))
 '(org-log-done 'time)
 '(org-roam-graph-extra-config
   '(("layout" . "neato")
     ("overlap" . "false")
     ("splines" . "true")))
 '(org-roam-graph-viewer "/Applications/Firefox.app/Contents/MacOS/Firefox")
 '(org-startup-folded 'content)
 '(org-startup-truncated nil)
 '(package-selected-packages
   '(hy-mode racket-mode geiser-chicken org-roam-server org-bullets pylint org-roam yaml-mode ob-rust flycheck-haskell flycheck-rust use-package flycheck magit smart-mode-line dashboard edit-indirect sage-shell-mode org rust-mode haskell-mode rainbow-delimiters geiser htmlize auctex markdown-mode))
 '(prettify-symbols-unprettify-at-point 'right-edge)
 '(python-shell-interpreter "python3")
 '(reftex-label-alist '(("theorem" 104 "thm:" nil nil ("theorem"))))
 '(sage-shell:use-prompt-toolkit nil)
 '(sage-shell:use-simple-prompt t)
 '(show-paren-delay 0)
 '(whitespace-style
   '(face trailing tabs spaces newline empty indentation space-after-tab space-before-tab space-mark tab-mark newline-mark)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-sectioning-5-face ((t (:inherit nano-face-popout :weight bold))))
 '(font-latex-subscript-face ((t (:height 1.0))))
 '(font-latex-superscript-face ((t (:height 1.0))))
 '(whitespace-empty ((t (:inherit nano-face-header-critical))))
 '(whitespace-hspace ((t (:inherit nano-face-faded))))
 '(whitespace-indentation ((t (:inherit nano-face-header-critical))))
 '(whitespace-newline ((t (:inherit nano-face-faded))))
 '(whitespace-space ((t (:inherit nano-face-faded))))
 '(whitespace-space-after-tab ((t (:inherit nano-face-header-critical))))
 '(whitespace-tab ((t (:inherit nano-face-faded))))
 '(whitespace-trailing ((t (:inherit nano-face-header-critical)))))

;; Org babel languages
(require 'ob-lisp)
(require 'ob-latex)
(require 'ob-haskell)
(require 'ob-python)
(require 'ob-rust)
(require 'ob-C)

;; Org mode
(add-hook 'org-mode-hook 'visual-line-mode)
(setq org-edit-src-content-indentation 0)

;; Org-ref
;;(require 'org-ref)
;;(setq reftex-default-bibliography '("/Users/ramiroleal/Desktop/bib/references.bib"))
;;(setq org-ref-default-bibliography '("/Users/ramiroleal/Desktop/bib/references.bib"))

;; Narrowing
(put 'narrow-to-region 'disabled nil)
(put 'LaTeX-narrow-to-environment 'disabled nil)
(put 'TeX-narrow-to-group 'disabled nil)

;; Foldout
(with-eval-after-load "outline"
  (require 'foldout))

;; Outline Minor Mode
(defun my-narrow-outline ()
  "Runs (foldout-zoom-subtree 0)"
  (interactive)
  (foldout-zoom-subtree 0))

(defun my-widen-outline ()
  "Runs (progn (foldout-exit-fold -1) (outline-hide-body) (outline-hide-body))"
  (interactive)
  (foldout-exit-fold 1)
  (outline-show-branches)
  (outline-hide-body))

(defun outline-keys ()
  (define-key outline-minor-mode-map (kbd "C-c i") 'my-narrow-outline)
  (define-key outline-minor-mode-map (kbd "C-c o") 'my-widen-outline)
  (define-key outline-minor-mode-map (kbd "C-c e") #'outline-show-subtree)
  (define-key outline-minor-mode-map (kbd "C-c d") #'outline-hide-subtree))

(add-hook 'outline-minor-mode-hook #'outline-keys)

(add-hook 'prog-mode-hook #'outline-minor-mode)

;; LaTeX
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (outline-minor-mode)
            (outline-hide-body)))

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'whitespace-mode)
(add-hook 'TeX-mode-hook 'prettify-symbols-mode)
(add-hook 'TeX-mode-hook
  (lambda () (setq TeX-command-extra-options "-shell-escape")))

;; Rust
(require 'rust-mode)
(define-key rust-mode-map (kbd "C-c C-c") 'rust-check)

;; flycheck rust
(add-hook 'rust-mode-hook #'flycheck-mode)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; flycheck haskell
(with-eval-after-load 'haskell-mode
  (add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

;; dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-banner-logo-title "Welcome to GNU Emacs / N Λ N O edition")
(setq dashboard-startup-banner 'logo)
(setq dashboard-center-content t)
(setq dashboard-week-agenda t)
(setq dashboard-items '((recents . 10)
                        (agenda)))
(setq dashboard-set-footer nil)
(setq dashboard-path-style 'truncate-middle)
;;(setq dashboard-page-separator "\n\n")

;; show paren mode
(show-paren-mode 1)

;; org-roam
(setq org-roam-directory "~/Documents/org-roam")
(add-hook 'after-init-hook 'org-roam-mode)
(setq org-roam-tag-sources '(prop vanilla))
(setq org-roam-dailies-directory "~/Documents/org-roam/org-daily")
;;(setq org-roam-graph-exclude-matcher '("org-daily"))
(defun get-time-string ()
  (format-time-string "%I:%M %p"))
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         #'org-roam-capture--get-point
         "* %(get-time-string) %?"
         :file-name "~/Documents/org-roam/org-daily/%<%Y-%m-%d>"
         :head "#+title: %<%Y-%m-%d>\n\n")))

(defun org-roam-filename-to-title (f)
  (s-titleize (s-replace-all '(("_" . " ") ("-" . " ")) f)))

(defun org-roam-add-templates ()
  (add-to-list 'org-roam-capture-templates
               '("l" "literature-note" plain #'org-roam-capture--get-point
                 "This is a paper review of the paper %?

* What is this paper about?

** Section summary

* My thoughts on the paper

** Strengths and weaknesses

** Impact

** Interesting follow-up work

** Surprising ideas/concepts

** Questions

* Reading Questions
"
                 :file-name "%<%Y%m%d%H%M%S>-${slug}"
                 :head "#+title: %(org-roam-filename-to-title \"${title}\")
#+roam_tags: literature-note\n\n"
                 :unnarrowed t))

  (add-to-list 'org-roam-capture-templates
               '("c" "concept-note" plain #'org-roam-capture--get-point
                 "%?"
                 :file-name "%<%Y%m%d%H%M%S>-${slug}"
                 :head "#+title: %(org-roam-filename-to-title \"${title}\")
#+roam_tags: concept-note\n\n"
                 :unnarrowed t)))

(add-hook 'org-roam-mode-hook #'org-roam-add-templates)

(defun org-roam-insert-with-description ()
  "Prompts user for a link description and passes that description
to `org-roam-insert'."
  (interactive)
  (org-roam-insert nil nil nil (read-string "Description:") nil))

;; org-roam-server
(require 'org-roam-protocol)
(use-package org-roam-server
  :ensure t
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows 'to
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))

;; SMURF
(defun smurf-connect ()
  (interactive)
  (dired "/ssh:cryo@smurf-srv12:docker/smurf/dev_sw/slotN/emulator/pysmurf-custom-transmitter-example"))

(defun smurf-compile ()
  "Compiles the custom transmitter in the docker.

Note: The smurf_server_s4 docker must be running when this function
is called"
  (interactive)
  (compile "docker exec -w \"/usr/local/src/pysmurf-custom-transmitter-example/build\" smurf_server_s4 make"))

(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

(defun badaq-connect ()
  (interactive)
  (dired "/ssh:badaq@171.64.109.90:gcp_src"))

;; CS 244
(defun old-mininet-connect ()
  (interactive)
  (dired "/ssh:mininet@localhost#2222:"))

(defun mininet-connect ()
  (interactive)
  (dired "/ssh:mininet@localhost#2233:"))

(defun myth-connect ()
  (interactive)
  (dired "/ssh:ramiro2@myth.stanford.edu:"))

;; man-pages
(defun man-tramp ()
  "A primitive version of `man' that works with tramp"
  (interactive)
  (shell-command (concat "man " (read-string "Manual Entry: ")))
  (set-buffer "*Shell Command Output*")
  (Man-fontify-manpage))

;; open todos file
(defun todos ()
  (interactive)
  (find-file "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org-todo/todo.org"))

(provide '.emacs)
;;; .emacs ends here
