;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
; Generated config by @aapit

(setq calendar-week-start-day 1)
(setq
 display-time-format "%H:%M"
 display-time-24hr-format t)

(load! "secrets.el" doom-private-dir)

(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 tab-width 4)                                      ; Set width for tabs

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "brave")

(setenv "LANG" "en_US.UTF-8")

(setq doom-unicode-font (font-spec :name "Symbola"))

(setq doom-font (font-spec :family "Liberation Mono" :size (if (string= (system-name) "tinynozem") 38 26)))

(setq doom-theme 'doom-horizon)
(setq display-time-use-mail-icon t)
(setq display-line-numbers-type 'relative)
(setq org-ellipsis "…")
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
                                        ; Remove window chrome
(setq default-frame-alist '((undecorated . t)))

(add-hook 'emacs-startup-hook (lambda ()
                                        ;(toggle-frame-fullscreen)
                                        ;(display-battery-mode)
                                (delete-selection-mode 1) ; Replace selection when inserting text
                                ))

(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

(when (> (display-pixel-width) '1200)
  (set-popup-rule! "*Org Agenda*" :side 'left :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "CAPTURE-" :side 'left :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*Capture*" :side 'left :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*Messages*" :side 'left :size .30 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*helm*" :side 'left :size .30 :select t :vslot 5 :ttl 3))
(when (<= (display-pixel-width) '1200)
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

(map!
   :prefix "`"
   :n "h" #'evil-window-left
   :n "l" #'evil-window-right
   :n "k" #'evil-window-up
   :n "j" #'evil-window-down
   :n "-" #'evil-window-split
   :n "\\" #'evil-window-vsplit
   :n "`" #'other-window
   :n "c" '(lambda () (interactive)(+workspace/new))
   :n "x" '(lambda () (interactive)(+workspace/delete (+workspace-current-name)))
   :n "M-x" #'evil-window-delete
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
        :desc "Find, Insert note" "q" #'org-roam-node-find
        :desc "Graph server" "g" #'org-roam-server-mode
        :desc "Headline link" "h" #'counsel-org-link
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
        ("d" "Default" plain "%?"
        :target (file+head "${slug}.org"
            "%(concat \"#+title: ${title}\n#+filetags: \n#+date: \" (format-time-string \"%Y-%m-%d\" (current-time) t) \"\n\")")
        :unnarrowed t)
        ; Encrypted
        ("e" "Encrypted" plain "%?"
        :target (file+head "${slug}.org.gpg"
            "%(concat \"#+title: ${title}\n#+filetags: \n#+date: \" (format-time-string \"%Y-%m-%d\" (current-time) t) \"\n\")")
        :unnarrowed t)
        ; Company
        ("c" "Company" plain "%?"
        :target (file+head "${slug}.org"
            "%(concat \"#+title: ${title}\n#+filetags: :company:\n#+date: \" (format-time-string \"%Y-%m-%d\" (current-time) t) \"\n\")")
        :unnarrowed t)
        ; GRRR Project
        ("g" "GRRR Project" plain "%?"
        :target (file+head "${slug}.org"
            "%(concat \"#+title: ${title}\n#+filetags: :grrr:project:\n#+date: \" (format-time-string \"%Y-%m-%d\" (current-time) t) \"\n\")")
        :unnarrowed t)
        ; Hardware
        ("h" "Hardware" plain "%?"
        :target (file+head "${slug}.org"
            "%(concat \"#+title: ${title}\n#+filetags: :hardware:tech:\n#+date: \" (format-time-string \"%Y-%m-%d\" (current-time) t) \"\n\")")
        :unnarrowed t)
        ; Location
        ("l" "Location" plain "%?"
        :target (file+head "${slug}.org"
            "%(concat \"#+title: ${title}\n#+filetags: :geo:\n#+date: \" (format-time-string \"%Y-%m-%d\" (current-time) t) \"\n\")")
        :unnarrowed t)
        ; Person
        ("p" "Person" plain "%?"
        :target (file+head "${slug}.org"
            "%(concat \"#+title: ${title}\n#+filetags: :person:\n#+date: \" (format-time-string \"%Y-%m-%d\" (current-time) t) \"\n\")")
        :unnarrowed t)
        ; Software
        ("s" "Software" plain "%?"
        :target (file+head "${slug}.org"
            "%(concat \"#+title: ${title}\n#+filetags: :software:tech:\n#+date: \" (format-time-string \"%Y-%m-%d\" (current-time) t) \"\n\")")
        :unnarrowed t)
        ; Substance
        ("u" "Substance" plain "%?"
        :target (file+head "${slug}.org"
            "%(concat \"#+title: ${title}\n#+filetags: :substance:\n#+date: \" (format-time-string \"%Y-%m-%d\" (current-time) t) \"\n\")")
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
            ("lb" "B log" entry (file+olp+datetree "~/Notes/hashlog.org.gpg")
                "* %U %?\n%i\n"
                :tree-type week
                :prepend t
                :unnarrowed t)
            ; Health
            ("lh" "Health" entry (file+olp+datetree "~/Notes/healthlog.org")
                "* %U \n|Moe (1-10)|%?|\n|Tinnitus (1-10)||\n|Sleep Score||\n|Puls||\n|Sys||\n|Dia||\n|Coffee||\n"
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

(general-setq flycheck-global-modes '(not dir-locals-mode
                                            text-mode
                                            org-mode))

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

(setq gnus-alias-identity-alist
    '(("personal"
        nil ;; Does not refer to any other identity
        "David Spreekmeester <david@spreekmeester.nl>" ;; Sender address
        nil ;; No organization header
        nil ;; No extra headers
        nil ;; No extra body text
        "~/Templates/mail-signatures/personal.txt")
    ("grrr"
        nil
        "David Spreekmeester <david@grrr.nl>"
        "GRRR"
        nil
        nil
        "~/Templates/mail-signatures/grrr.txt")))
(setq gnus-alias-default-identity "grrr")
;; Define rules to match work identity
(setq gnus-alias-identity-rules
    '(
        ("grrr"
        ("any" "<\\(.+\\)\\@grrr\\.nl" both) "grrr")
        )
    )

;; Determine identity when message-mode loads
(add-hook 'message-setup-hook 'gnus-alias-determine-identity)

(setq sendmail-program "gmi")

(defun aap/set-mail-sender-personal ()
    (interactive)
    (setq message-sendmail-extra-arguments '("send" "--quiet" "-t" "-C" "~/Mail/account.personal"))
    (when (eq major-mode 'message-mode)
        (gnus-alias-use-identity "personal"))
)
(defun aap/set-mail-sender-grrr ()
    (interactive)
    (setq message-sendmail-extra-arguments '("send" "--quiet" "-t" "-C" "~/Mail/account.grrr"))
    (when (eq major-mode 'message-mode)
        (gnus-alias-use-identity "grrr"))
)

(aap/set-mail-sender-grrr)

(map! :leader
    :prefix ("M" . "mail")
    :desc "personal" "p" #'aap/set-mail-sender-personal
    :desc "grrr" "g" #'aap/set-mail-sender-grrr
    :desc "select identity" "s" #'gnus-alias-select-identity
)

(setq notmuch-fcc-dirs nil)

;; `org-directory' must be set before org loads.
(setq org-directory "~/Notes/")

(defun my/org-roam-filter-by-tag (tag-name)
  (lambda (node)
    (member tag-name (org-roam-node-tags node))))

(defun my/org-roam-list-notes-by-tag (tag-name)
  (seq-uniq (mapcar #'org-roam-node-file
          (seq-filter
           (my/org-roam-filter-by-tag tag-name)
           (org-roam-node-list)))))

(defun my/org-roam-refresh-agenda-list ()
  (interactive)
  (setq org-agenda-files (my/org-roam-list-notes-by-tag "project")))

;; Build the agenda list the first time for the session
(after! org-roam
    (my/org-roam-refresh-agenda-list))

(setq org-agenda-custom-commands
    '(
        ("b" "Both" agenda "Universeel"
         ((org-agenda-files '("~/Notes/todo-thuis.org" "~/Nextcloud/org-mode/notes/todo-grrr.org"))))
        ("z" "Zelf" agenda "Persoonlijk"
         ((org-agenda-files '("~/Notes/todo-thuis.org"))))
        ("g" "GRRR" agenda "Werk"
         ((org-agenda-files '("~/Notes/todo-grrr.org"))))
    )
)

;(let ((org-super-agenda-groups
;       '((:auto-category t))))
;  (org-agenda-list))

(setq org-super-agenda-groups
      '((:name "Next Items"
               :time-grid t
               :tag ("NEXT" "outbox"))
        (:name "Important"
               :priority "A")
        (:name "Quick Picks"
               :effort< "0:30")
        (:priority<= "B"
                     :scheduled future
                     :order 1)))

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

(after! org
  (add-hook! 'org-mode-hook (lambda ()
                              (org-superstar-mode 1)
                              (org-fancy-priorities-mode 1)
                              ))
  )

(after! org-superstar
  (setq org-superstar-headline-bullets-list '("⚛" "◉" "○" "✸" "✿" "✤" "✜" "◆")
        org-superstar-prettify-item-bullets t))

(after! org
    (setq org-agenda-dim-blocked-tasks nil)
    (setq org-agenda-inhibit-startup nil)
    (setq org-agenda-use-tag-inheritance nil)
    (setq org-agenda-ignore-properties '(visibility category))
    (setq org-agenda-sticky t)
)

(after! org
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)" "PROJ" "IDEA(i)")))
  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "maroon1" :weight bold)
                ("NEXT" :foreground "light sea green")
                ("DONE" :foreground "#888888")
                ("PROJ" :foreground "purple1" :weight bold)
                ("IDEA" :foreground "purple1" :weight bold)
                )))
  (setq-default org-export-with-todo-keywords nil)
  (setq-default org-enforce-todo-dependencies t)
  )

(use-package! org-fancy-priorities
  :defer t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("⚡" "▶" "⏳")))

(setq org-roam-directory "~/Nextcloud/org-mode/notes/")
;(setq org-roam-db-location "~/Nextcloud/org-mode/org-roam.db")
(setq org-roam-buffer-width 0.17)
(setq org-roam-buffer "Org-roam Sidebar")
(setq org-roam-completion-system 'default)

;(use-package! company-org-roam
;  :when (featurep! :completion company)
;  :after org-roam
;  :config
;  (set-company-backend! 'org-roam-mode 'company-org-roam))

(use-package! org-roam-server-light
  :after org-roam
  :commands org-roam-server-light-mode
  :config
  ;; OPTIONAL example settings, `org-roam-server-light' will work without them
  (setq
   ;; enable arrows
   org-roam-server-light-network-vis-options "{ \"edges\": { \"arrows\": { \"to\": { \"enabled\": true,\"scaleFactor\": 1.15 } } } }"

   ;; change background color of web application
   org-roam-server-light-style "body.darkmode { background-color: #121212!important; }"

   ;; set default set of excluded or included tags
   ;; customize only the value of id, in this case "test" and "journal"
   org-roam-server-light-default-include-filters "[{ \"id\": \"test\", \"parent\" : \"tags\"  }]"
   org-roam-server-light-default-exclude-filters "[{ \"id\": \"journal\", \"parent\" : \"tags\"  }]"
   )
  )

(after! org
    (setq org-roam-node-display-template
        (concat (propertize "${doom-tags:30}" 'face 'org-tag) " ${doom-hierarchy:120}"))
)
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

                                        ;(after! plantuml-uml
                                        ;    (setq org-plantuml-jar-path (expand-file-name "~/Apps/PlantUML/plantuml.jar")
                                        ;      plantuml-default-exec-mode 'jar)
                                        ;    (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
                                        ;)

(setq projectile-project-search-path '("~/Scripts/" "~/Sites/" "~/Remotes" "~/Lab"))
