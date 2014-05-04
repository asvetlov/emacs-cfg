(server-start)


(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/")

(setq inhibit-splash-screen t) ;; no splash screen
(setq column-number-mode t)

(setq grep-highlight-matches t)

(setq tab-width 4
      whitespace-style '(face tabs spaces trailing lines space-before-tab newline indentation empty space-after-tab)
      whitespace-line-column 80)


(setq c-basic-offset 4)

(setq global-whitespace-mode t)
; space-mark tab-mark newline-mark

;(setq tab-width 5
;      whitespace-style '(trailing lines-tail space-after-tab space-before-tab)
;      whitespace-line-column 80)

(progn
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))  ;; no toolbar
  (menu-bar-mode nil) ;;no menubar
  (scroll-bar-mode nil) ;; no scroll bar
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(default-input-method "russian-computer")
 '(delete-old-versions t)
 '(frame-background-mode (quote dark))
 '(indent-tabs-mode nil)
 '(kill-do-not-save-duplicates t)
 '(kill-ring-max 10000)
 '(kill-whole-line t)
 '(make-backup-files nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
 '(safe-local-variable-values (quote ((require-final-newline) (test-case-name . twisted\.trial\.test) (test-case-name . twisted\.test\.test_internet\,twisted\.internet\.test\.test_posixbase) (test-case-name . twisted\.test\.test_ssl) (test-case-name . twisted\.test\.test_stdio) (test-case-name . twisted\.test\.test_fdesc) (encoding . utf-8) (test-case-name . twisted) (test-case-name . twisted\.test\.test_failure) (test-case-name . twisted\.test\.test_defer\,twisted\.test\.test_defgen\,twisted\.internet\.test\.test_inlinecb) (test-case-name . twisted\.test\.test_process) (test-case-name . twisted\.test\.test_iutils) (test-case-name . twisted\.words\.test\.test_jabbercomponent) (test-case-name . twisted\.words\.test\.test_jabberclient) (test-case-name . twisted\.test\.test_abstract) (test-case-name . twisted\.internet\.test\.test_pollingfile) (test-case-name . twisted\.test\.test_task\,twisted\.test\.test_cooperator) (test-case-name . twisted\.internet\.test\.test_inotify) (test-case-name . twisted\.test\.test_internet) (test-case-name . twisted\.web\.test\.test_xmlrpc))))
 '(save-interprogram-paste-before-kill t)
 '(scroll-step 1)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(x-select-enable-clipboard t)
 '(x-select-enable-primary nil))



;(setq show-trailing-whitespace t)
(fset 'yes-or-no-p 'y-or-n-p)


(load-theme 'tangotango t)  

;(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)
(ido-mode t)
(require 'uniquify)
(setq uniquify-buffer-name-style t)

;(require 'org-install)
(autoload 'org-install "org-install" "" t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(autoload 'ack "ack" "" t)
;; projects root
(require 'project-root)
(setq project-roots
      `(("Django project"
         :root-contains-files ("manage.py")
         :filename-regex ,(regexify-ext-list '(py html css js sh))
         :exclude-paths '("contrib"))
        ("Sphinx documentation"
         :root-contains-files ("Makefile" "conf.py")
         :filename-regex ,(regexify-ext-list '(py rst))
         :exclude-paths '("_build"))
        ("Python project with buildout"
         :root-contains-files ("../../buildout.cfg")
         :filename-regex ,(regexify-ext-list '(py)))
        ("Generic Python project"
         :root-contains-files ("setup.py")
         :filename-regex ,(regexify-ext-list '(py)))
        ("Generic Mercurial project"
         :root-contains-files (".hg"))
        ("Generic Bazaar project"
         :root-contains-files (".bzr"))
        ;("Generic Subversion project"
        ; :root-contains-files (".bzr"))
        ("Generic git project"
         :root-contains-files (".git"))))

(global-set-key (kbd "C-c p f") 'project-root-find-file)
(global-set-key (kbd "C-c p g") 'project-root-grep)
(global-set-key (kbd "C-c p a") 'project-root-ack)
(global-set-key (kbd "C-c p d") 'project-root-goto-root)
(global-set-key (kbd "C-c p l") 'project-root-browse-seen-projects)

(require 'flyspell)
(require 'ispell)

(setq ispell-program-name "aspell")

(add-to-list 'interpreter-mode-alist '("python3" . python-mode))
(setq python-shell-interpreter "ipython3")
;(elpy-use-ipython)
(setq elpy-rpc-python-command "python3")
(elpy-enable)

;whitespace-mode
(defun myyy-python-hook ()
  (require 'whitespace)
  (whitespace-mode t))

(add-hook 'python-mode-hook 'myyy-python-hook)
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
;(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "~/projects/envs/")

;web-mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jinja2\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-engines-alist
      '(("jinja2"    . "\\.jinja2\\'"))
)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

;rst-mode
;'(rst-level-face-base-color "grey60")

(defun myyy-rst-hook ()
  (setq tab-width 4
        indent-tabs-mode nil)
  (require 'whitespace)
  (whitespace-mode t))

(add-hook 'rst-mode-hook 'myyy-rst-hook)

;coffee-mode
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

'(coffee-tab-width 4)

(defun myyy-coffee-hook ()
  (setq tab-width 4
        indent-tabs-mode nil)
  (require 'whitespace)
  (whitespace-mode t))

(add-hook 'coffee-mode-hook 'myyy-coffee-hook)

;actionscript-mode
(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))

(defun myyy-actionscript-hook ()
  (setq tab-width 4
        indent-tabs-mode nil)
  (require 'whitespace)
  (whitespace-mode t))

(add-hook 'actionscript-mode-hook 'myyy-actionscript-hook)

;cython-mode
(add-to-list 'auto-mode-alist '("\\.pyx$" . cython-mode))

(defun myyy-cython-hook ()
  (setq tab-width 4
        indent-tabs-mode nil)
  (require 'whitespace)
  (whitespace-mode t))

(add-hook 'cython-mode-hook 'myyy-cython-hook)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 113 :family "DejaVu Sans Mono")))))

