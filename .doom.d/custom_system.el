;;; custom_system.el -*- lexical-binding: t; -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2a2e38" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(custom-safe-themes
   (quote
    ("1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "82360e5f96244ce8cc6e765eeebe7788c2c5f3aeb96c1a765629c5c7937c0b5b" "6c3b5f4391572c4176908bb30eddc1718344b8eaff50e162e36f271f6de015ca" "7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "54cf3f8314ce89c4d7e20ae52f7ff0739efb458f4326a2ca075bf34bc0b4f499" "7d708f0168f54b90fc91692811263c995bebb9f68b8b7525d0e2200da9bc903c" "c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" "730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "b5fff23b86b3fd2dd2cc86aa3b27ee91513adaefeaa75adc8af35a45ffb6c499" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" "5b809c3eae60da2af8a8cfba4e9e04b4d608cb49584cb5998f6e4a1c87c057c4" "425cf02839fa7c5ebd6cb11f8074f6b8463ae6ed3eeb4cf5a2b18ffc33383b0b" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "9efb2d10bfb38fe7cd4586afb3e644d082cbcdb7435f3d1e8dd9413cbe5e61fc" "9f15d03580b08dae41a1e5c1f00d1f1aa99fea121ca32c28e2abec9563c6e32c" "6177ecbffb8f37756012c9ee9fd73fc043520836d254397566e37c6204118852" "25f1b2ace87d23d803b42267fafdc38b31472e444c2aaa9069aa2c06be8955b2" "e2acbf379aa541e07373395b977a99c878c30f20c3761aac23e9223345526bcc" "3d3807f1070bb91a68d6638a708ee09e63c0825ad21809c87138e676a60bda5d" "bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "fe94e2e42ccaa9714dd0f83a5aa1efeef819e22c5774115a9984293af609fce7" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "912cac216b96560654f4f15a3a4d8ba47d9c604cbc3b04801e465fb67a0234f0" "55bd5c449a9fbeab3c07ac78d3995b077294aa82b116dc339fd487d0242799e6" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(deft-default-extension "org" t)
 '(deft-directory "~/Nextcloud/org-mode/")
 '(deft-recursive t)
 '(deft-use-filter-string-for-filename t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(fci-rule-color "#6272a4")
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(objed-cursor-color "#ff5555")
 '(org-journal-date-format "%Y-%m-%d, %A")
 '(org-journal-date-prefix "#+title: ")
 '(org-journal-dir "~/Nextcloud/org-mode/journal/")
 '(org-journal-file-format "%Y-%m-%d.org")
 '(package-selected-packages
   (quote
    (counsel-fd drag-stuff yaml-mode emmet-mode web-mode fish-mode company-shell flycheck-cython cython-mode lsp-python-ms poetry conda pyenv-mode pipenv python-pytest nose py-isort pyimport anaconda-mode hack-mode php-extras php-refactor-mode ox-pandoc ox-hugo org-attach company-org-roam org-roam-protocol evil-org-agenda evil-org org-pdftools org-clock org-crypt org-superstar toc-org evil-markdown npm-mode js2-refactor xref-js2 tide typescript-mode rjsx-mode js2-mode counsel-jq json-mode dante buttercup elisp-demos flycheck-cask elisp-mode evil-magit magit-gitflow magit-todos github-review forge define-word dash-docs helm-xref ivy-xref dumb-jump eros dap-ui-mode dap-mode realgud-trepan-ni realgud jinja2-mode ansible flycheck-posframe flycheck-popup-tip flycheck undo-fu-session undo-fu fd-dired dired-x all-the-icons-dired ranger diff-hl diredfl dired-rsync dired auto-yasnippet yasnippet evil-vimish-fold exato evil-visualstar evil-traces evil-snipe evil-nerd-commenter evil-quick-diff evil-exchange evil-embrace evil-easymotion mixed-pitch git-gutter treemacs-persp treemacs-magit treemacs-projectile treemacs-evil treemacs volatile-highlights evil-goggles evil-anzu anzu doom-modeline hl-todo solaire-mode doom-themes ivy-prescient flx ivy-posframe wgrep counsel-projectile counsel all-the-icons-ivy ivy-rich ivy company-dict company-box company-prescient company-tng php-mode disable-mouse linum-relative org-rifle helm-org-rifle org-ql multiple-cursors-core smart-mode-line org-journal deft org-roam-server)))
 '(pdf-view-midnight-colors (cons "#f8f8f2" "#282a36"))
 '(rustic-ansi-faces
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(safe-local-variable-values
   (quote
    ((org-pm-perc . 1.25)
     (org-testing-perc . 1.15)
     (org-pm-perc2 . 1.15)
     (org-pm-perc2 . 1\.15N)
     (bla . hoi)
     (org-pm-perc . 1.15)
     (eval add-hook
           (quote after-save-hook)
           (lambda nil
             (org-babel-tangle))
           nil t))))
 '(vc-annotate-background "#282a36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#50fa7b")
    (cons 40 "#85fa80")
    (cons 60 "#bbf986")
    (cons 80 "#f1fa8c")
    (cons 100 "#f5e381")
    (cons 120 "#face76")
    (cons 140 "#ffb86c")
    (cons 160 "#ffa38a")
    (cons 180 "#ff8ea8")
    (cons 200 "#ff79c6")
    (cons 220 "#ff6da0")
    (cons 240 "#ff617a")
    (cons 260 "#ff5555")
    (cons 280 "#d45558")
    (cons 300 "#aa565a")
    (cons 320 "#80565d")
    (cons 340 "#6272a4")
    (cons 360 "#6272a4")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-emph-face ((t (:foreground "cyan"))))
 '(org-footnote ((t (:foreground "#ccccdd"))))
 '(org-level-4 ((t (:weight regular :foreground "#AE66B6"))))
 '(org-level-5 ((t (:weight regular :foreground "#AE66B6"))))
 '(org-level-6 ((t (:weight regular :foreground "#AE66B6"))))
 '(org-level-7 ((t (:weight regular :foreground "#AE66B6"))))
 '(org-level-8 ((t (:weight regular :foreground "#AE66B6"))))
 '(org-link ((t (:underline nil))))
 '(org-roam-backlink ((t (:size 0.8))))
 '(org-roam-link ((t (:foreground "#8B61AB"))))
 '(org-roam-link-current ((t (:foreground "#57287C"))))
 '(org-table ((t (:weight regular :foreground "#dddddd"))))
 '(org-verbatim ((t (:foreground "cyan")))))
(put 'narrow-to-region 'disabled nil)
