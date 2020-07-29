;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq calendar-week-start-day 1)
(setq
 display-time-format "%H:%M"
 display-time-24hr-format t)

(load! "secrets.el" doom-private-dir)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "brave-browser")

(setenv "LANG" "en_US.UTF-8")

(setq doom-font (font-spec :family "Liberation Mono" :size 36))
(setq doom-unicode-font (font-spec :name "Symbola"))

(add-hook 'emacs-startup-hook (lambda ()
    (global-disable-mouse-mode)
))

(setq doom-theme 'doom-horizon)
(setq display-time-use-mail-icon t)
(setq display-line-numbers-type 'relative)
(setq org-ellipsis "…")

(add-hook 'emacs-startup-hook (lambda ()
    (toggle-frame-fullscreen)
    (display-battery-mode)
    (delete-selection-mode 1) ; Replace selection when inserting text
))

(add-hook 'after-init-hook #'global-emojify-mode)

;; Unfortunately, at this point [2020-07-08 Wed],
;; there is no way to style regular non-link text in the Org-roam buffer.
;; Therefore, the only customizable property that blends in with the rest is link color.
(custom-set-faces
 '(org-roam-link ((t (:foreground "#8B61AB"))))
 '(org-roam-link-current ((t (:foreground "#57287C"))))
)

;; Org-mode checkboxes
(add-hook 'evil-org-mode-hook (lambda ()
   "Beautify Org Checkbox Symbol"
   (push '("[ ]" . "☐") prettify-symbols-alist)
   (push '("[X]" . "☑" ) prettify-symbols-alist)
   (push '("[-]" . "⊡" ) prettify-symbols-alist)
   (prettify-symbols-mode)))

(when (> (display-pixel-width) '3000)
  (set-popup-rule! "*Org Agenda*" :side 'left :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "CAPTURE-" :side 'left :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*Capture*" :side 'left :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*Messages*" :side 'left :size .30 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*helm*" :side 'left :size .30 :select t :vslot 5 :ttl 3))
(when (< (display-pixel-width) '2000)
  (set-popup-rule! "*Org Agenda*" :side 'bottom :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "CAPTURE-" :side 'left :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*Capture*" :side 'bottom :size .30 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*Messages*" :side 'left :size .30 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*helm*" :side 'bottom :size .30 :select t :vslot 5 :ttl 3))

(setq org-agenda-span 'week)

;; Hide /emphasis markers for italics/ in org-mode
(setq org-hide-emphasis-markers t)

; Disabling for performance, for now
;(setq org-startup-with-inline-images t)

(setq-default org-download-image-dir "~/Nextcloud/org-mode/pics")

;; Follow output
(setq compilation-scroll-output t)

;; Open
(map! :leader
    :prefix "o"
    :desc "Shell" "z" #'shell
    :desc "Term" "t" #'term
)

;; Quick window split shortcuts
(map! :leader
    :prefix "w"
    :desc "Split Hori" "-" #'evil-window-split
    :desc "Split Vert" "\\" #'evil-window-vsplit
)

(map! :after evil-org
    :map evil-org-mode-map
    :n "M-j" #'org-metadown
    :n "M-k" #'org-metaup
)
;; Export
(map! :after evil-org
    :map org-mode-map
    :leader
    :prefix ("e" . "export")
    :desc "html export (buffer)" "h" #'org-html-export-to-html
    :desc "various (region to pdf, etc)" "v" #'org-export-dispatch
    :desc "pdf (buffer)" "p" #'org-latex-export-to-pdf
)
;; Agenda
(map!
    :leader
    :desc "Agenda" "a" #'org-agenda
)

;; Insert
(map! :after org-roam
        :map org-roam-mode-map
        :leader
        :prefix "i"
        :desc "Timestamp" "T" #'org-time-stamp
        :desc "Timestamp inactive" "t" #'org-time-stamp-inactive
)
;; Notes
(map! :after org-roam
        :map org-mode-map
        :leader
        :prefix "n"
        :desc "Find, Insert note" "q" #'org-roam-find-file
        :desc "Graph server" "g" #'org-roam-server-mode
        :desc "Rifle" "." #'helm-org-rifle
)

(setq org-roam-ref-capture-templates
    '(("r" "ref" plain (function org-roam-capture--get-point)
        "%?"
        :file-name "websites/${slug}"
        :head "#+TITLE: ${title}
#+ROAM_KEY: ${ref}
- source :: ${ref}"
        :unnarrowed t)))

(setq org-roam-capture-templates
    `(
        ; Default
        ("d" "Default" plain #'org-roam-capture--get-point "%?"
        :file-name "${slug}"
        :head "%(concat \"#+TITLE: ${title}\n#+roam_alias: \n#+roam_tags: \n#+date: \" (format-time-string \"%Y-%m-%d\" (current-time) t) \"\n* \" (upcase-initials \"${title}\") \"\n\")"
        :unnarrowed t)
        ; Software
        ("s" "Software" plain #'org-roam-capture--get-point "%?"
        :file-name "${slug}"
        :head "%(concat \"#+TITLE: ${title}\n#+roam_alias: \n#+roam_tags: software tech\n#+date: \" (format-time-string \"%Y-%m-%d\" (current-time) t) \"\n* \" (upcase-initials \"${title}\") \"\n\")"
        :unnarrowed t)
        ; GRRR Project
        ("p" "GRRR Project" plain #'org-roam-capture--get-point "%?"
        :file-name "${slug}"
        :head "%(concat \"#+TITLE: ${title}\n#+roam_alias: \n#+roam_tags: grrr project\n#+date: \" (format-time-string \"%Y-%m-%d\" (current-time) t) \"\n* \" (upcase-initials \"${title}\") \"\n\")"
        :unnarrowed t)
    )
)

(after! evil-org
    (setq org-capture-templates
        `(
            ; Todo Group
            ("t" "Todo")
            ; Inbox home
            ("tt" "Todo Thuis" entry (file+headline "~/Notes/todo-thuis.org" "Inbox")
                "* TODO %?\n%i\n"
                :unnarrowed t)
            ; Inbox GRRR
            ("tg" "Todo GRRR" entry (file+headline "~/Notes/todo-grrr.org" "Inbox")
                "* TODO %?\n%i\n"
                :unnarrowed t)
            ; Log Group
            ("l" "Log")
            ; B log
            ("lb" "B log" entry (file+olp+datetree "~/Notes/hashlog.org")
                "* %U %?\n%i\n"
                :tree-type week
                :prepend t
                :unnarrowed t)
            ; Health
            ("lh" "Health" entry (file+olp+datetree "~/Notes/healthlog.org")
                "* %U \n|Sys|%?|\n|Dia||\n|Puls||\n|SpO2||\n|Methyl|\n|Coffee||\n"
                :tree-type week
                :prepend t
                :unnarrowed t)
            ("lj" "Journal" entry (file+olp+datetree "~/Notes/journal.org")
                "* %U %?\n%i\n"
                :tree-type week
                :prepend t
                :unnarrowed t)
            ; GRRR log
            ("lg" "GRRR log" entry (file+olp+datetree "~/Notes/grrr-log.org")
                "* %U %?\n%i\n"
                :tree-type week
                :clock-in t
                :prepend t
                :unnarrowed t)
        )
    )
)

;; Capture shortcuts: Todos
(map!
    :leader
    :prefix ("d" . "todo")
    :desc "Thuis" "t" (lambda () (interactive) (org-capture nil "tt"))
    :desc "GRRR" "g" (lambda () (interactive) (org-capture nil "tg"))
)
;; Capture shortcuts: Logs
(map!
    :leader
    :prefix ("l" . "log")
    :desc "GRRR" "g" (lambda () (interactive) (org-capture nil "lg"))
    :desc "B log" "b" (lambda () (interactive) (org-capture nil "lb"))
    :desc "Health log" "h" (lambda () (interactive) (org-capture nil "lh"))
    :desc "Journal" "j" (lambda () (interactive) (org-capture nil "lj"))
)

(defun aap/notmuch-delete-search-message ()
    "Toggle trash tag for message."
    (interactive)
    (evil-collection-notmuch-toggle-tag "trash" "search" 'notmuch-search-next-thread))

(defun aap/notmuch-delete-show-message ()
  "Toggle trash tag for message."
  (interactive)
  (evil-collection-notmuch-toggle-tag "trash" "show"))

(map! :after notmuch
      :map notmuch-search-mode-map
      :nv "d" #'aap/notmuch-delete-search-message)
(map! :after notmuch
      :map notmuch-show-mode-map
      :nv "d" #'aap/notmuch-delete-show-message)

(setq sendmail-program "gmi")

(defun aap/set-mail-sender-grrr ()
    (interactive)
    (setq message-sendmail-extra-arguments '("send" "--quiet" "-t" "-C" "~/Mail/account.grrr"))
)
(defun aap/set-mail-sender-personal ()
    (interactive)
    (setq message-sendmail-extra-arguments '("send" "--quiet" "-t" "-C" "~/Mail/account.personal"))
)

(aap/set-mail-sender-personal)

(setq notmuch-fcc-dirs nil)

(setq org-agenda-custom-commands
    '(
        ("b" "Both" agenda "Universeel"
         ((org-agenda-files '("~/Nextcloud/org-mode/notes/todo-thuis.org" "~/Nextcloud/org-mode/notes/todo-grrr.org"))))
        ("z" "Zelf" agenda "Persoonlijk"
         ((org-agenda-files '("~/Nextcloud/org-mode/notes/todo-thuis.org"))))
        ("g" "GRRR" agenda "Werk"
         ((org-agenda-files '("~/Nextcloud/org-mode/notes/todo-grrr.org"))))
    )
)

(after! org
    (add-to-list 'org-latex-packages-alist "\\hypersetup{setpagesize=false}" t)
    (add-to-list 'org-latex-packages-alist "\\hypersetup{colorlinks=true}" t)
    (add-to-list 'org-latex-packages-alist "\\hypersetup{linkcolor=blue}" t)
    (add-to-list 'org-latex-packages-alist "\\hypersetup{draft}" t)
)

(after! org
    (add-to-list 'org-latex-packages-alist "\\usepackage{lmodern}" t)
)

(after! org
    (add-to-list 'org-latex-packages-alist "\\setlength\\parindent{0pt}" t)
)

;; `org-directory' must be set before org loads.
(setq org-directory "~/Nextcloud/org-mode/notes/")

(after! org
    (setq org-agenda-dim-blocked-tasks nil)
    (setq org-agenda-inhibit-startup nil)
    (setq org-agenda-use-tag-inheritance nil)
    (setq org-agenda-ignore-properties '(visibility category))
    (setq org-agenda-sticky t)
)

(setq org-todo-keywords
    '((sequence "TODO" "NEXT" "DONE" "PROJ")))

(setq org-roam-directory "~/Nextcloud/org-mode/notes/")
(setq org-roam-buffer-width 0.3)
(setq org-roam-buffer "Org-roam Sidebar")

(setq org-roam-graph-exclude-matcher '("private" "dailies"))

(use-package! simple-httpd
  :defer t
  :after org
  :config
  (setq httpd-root "/var/www")
)
;; Auto-start of graph server disabled to improve startup performance
;;(httpd-start)

;;  :ensure nil
(use-package! org-roam-server
  :defer t
  :after org
  :load-path "~/Scripts/note/org-roam-server")

;; org-ql for queries
;(use-package org-ql)

;; org-rifle for fast narrow-down searches
;(use-package helm-org-rifle
;  :after org
;)

(after! 'deft
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory "~/Nextcloud/org-mode/")
)
(use-package! deft
  :after org
  :defer t
 ;:bind
 ;("C-c n d" . deft)
  :custom
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory "~/Nextcloud/org-mode/")
  :config
  (setq deft-file-limit 200)
)

;; php
(use-package! phpactor
  :mode "\\.php\\'"
  :defer t
)
(use-package! company-phpactor
  :mode "\\.php\\'"
  :defer t
)
;;(composer-setup-managed-phar)
;;(phpactor-install-or-update)
(use-package! php-mode
  :mode "\\.php\\'"
  :defer t
  :hook ((php-mode . (lambda () (set (make-local-variable 'company-backends)
       '(;; list of backends
         company-phpactor
         company-files
         ))))))

(setq org-plantuml-jar-path (expand-file-name "~/Apps/PlantUML/plantuml.jar")
      plantuml-default-exec-mode 'jar)
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))

(setq projectile-project-search-path '("~/Scripts/" "~/Sites/" "~/Remotes" "~/Lab"))

;; When using evil-mode be sure to run (global-undo-tree-mode -1) to avoid problems.
;; https://github.com/emacsmirror/undo-fu-session
(add-hook 'emacs-startup-hook (lambda ()
    (global-undo-tree-mode -1)
))

(setq undo-fu-session-file-limit 150)

(setq undo-limit 40000000) ; Set to 40 Mb
(setq evil-want-fine-undo t) ; Prevent all changes acting like one big blob

(use-package goalmap
  :load-path "~/.doom.d/packages/goalmap")
