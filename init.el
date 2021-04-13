(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Minimal UI
(scroll-bar-mode   -1)
(tool-bar-mode     -1)
(tooltip-mode      -1)
(menu-bar-mode     -1)
(blink-cursor-mode -1)

(setq inhibit-startup-message t
      initial-scratch-message ""
      inhibit-splash-screen t)

;; Package configs
(require 'package)
(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/")
	("org"          . "https://orgmode.org/elpa/"))
      package-archive-priorities
      '(("MELPA Stable" . 10)
        ("GNU ELPA"     . 5)
        ("MELPA"        . 1)
	("org"          . 0)))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'delight)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t
	use-package-expand-minimally t
	use-package-compute-statistics t
	use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package)
  (require 'delight)
  (require 'bind-key))

(org-babel-load-file (concat user-emacs-directory "config.org"))
