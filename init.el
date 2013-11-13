(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-ruby
                      clojure-mode
                      clojure-test-mode
                      nrepl
                      auto-complete
                      ac-nrepl
                      fsharp-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(load "~/.emacs.d/user.el")

(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\.fs[iylx]?$" . fsharp-mode))

(setq inferior-fsharp-program
      "C:\Program Files (x86)\Microsoft F#\v4.0\Fsi.exe")

(setq fsharp-compiler
      "C:\Program Files (x86)\Microsoft F#\v4.0\Fsc.exe")
