;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
; Generated config by @aapit

(setq calendar-week-start-day 1)
(setq
 display-time-format "%H:%M"
 display-time-24hr-format t)
(setq system-time-locale "nl_NL.utf8")
(setenv "LANG" "nl_NL.utf8")

(load! "secrets.el" doom-user-dir)

(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 tab-width 4)                                      ; Set width for tabs

(cond ((eq system-type 'darwin)
    (setq browse-url-browser-function 'browse-url-default-browser))
    (t (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "brave"))
)

(setenv "LANG" "en_US.UTF-8")

(setq doom-unicode-font (font-spec :name "Symbola"))

(setq doom-font (font-spec :family "Lotion" :size (if (string= (system-name) "tinynozem") 48 36)))
;(setq doom-font (font-spec :family "DaddyTimeMono" :size (if (string= (system-name) "tinynozem") 48 36)))
;(setq doom-font (font-spec :family "FantasqueSansMono Nerd Font Mono" :size (if (string= (system-name) "tinynozem") 48 36)))

(setq doom-theme 'doom-horizon)
(setq display-time-use-mail-icon t)
(setq display-line-numbers-type 'relative)
(setq org-ellipsis "…")
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

; remove window chrome
(unless (eq system-type 'darwin)
    (setq default-frame-alist '((undecorated . t))
))

(add-hook 'emacs-startup-hook (lambda ()
;(toggle-frame-fullscreen)
;(display-battery-mode)
(delete-selection-mode 1) ; replace selection when inserting text
))

; turn on line wrapping for all doc types
(global-visual-line-mode 1)

; hide ellipsis after collapsed nodes
;(setq org-ellipsis "")
;(set-face-attribute 'org-ellipsis nil :foreground (face-attribute 'default :background))
;(add-hook 'org-mode-hook (lambda () (set display-table (make-display-table))))

(after! org
  (setq org-ellipsis ""))

(defun doom-modeline-conditional-buffer-encoding ()
  "we expect the encoding to be lf utf-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

(when (> (display-pixel-width) '1200)
  (set-popup-rule! "*org agenda*" :side 'left :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "capture-" :side 'left :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*capture*" :side 'left :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*messages*" :side 'left :size .30 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*helm*" :side 'left :size .30 :select t :vslot 5 :ttl 3))
(when (<= (display-pixel-width) '1200)
  (set-popup-rule! "*org agenda*" :side 'bottom :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "capture-" :side 'left :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*capture*" :side 'bottom :size .30 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*messages*" :side 'left :size .30 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*helm*" :side 'bottom :size .30 :select t :vslot 5 :ttl 3))

(setq org-agenda-span 'week)

;; hide /emphasis markers for italics/ in org-mode
(setq org-hide-emphasis-markers t)

; disabling for performance, for now
;(setq org-startup-with-inline-images t)

(setq-default org-download-image-dir "~/Nextcloud/org-mode/pics")

;; follow output
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

(cond ((eq system-type 'darwin)
    (setq prefix-by-os "§"))
    (t (setq prefix-by-os "`"))
)
(map!
   :prefix prefix-by-os
   :n "h" #'evil-window-left
   :n "l" #'evil-window-right
   :n "k" #'evil-window-up
   :n "j" #'evil-window-down
   :n "-" #'evil-window-split
   :n "\\" #'evil-window-vsplit
   :n prefix-by-os #'other-window
   :n "c" '(lambda () (interactive)(+workspace/new))
   :n "x" '(lambda () (interactive)(+workspace/delete (+workspace-current-name)))
   :n "m-x" #'evil-window-delete
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
        :desc "Find, Insert note" "v" #'org-roam-node-find
)
(map! :after org-roam
        :map org-mode-map
        :leader
        :prefix "n"
        :desc "Graph server" "g" #'org-roam-server-mode
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
        ; Hardware
        ("h" "Hardware" plain "%?"
        :target (file+head "${slug}.org"
            "%(concat \"#+title: ${title}\n#+filetags: :hardware:\n#+date: \" (format-time-string \"%Y-%m-%d\" (current-time) t) \"\n\")")
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
            "%(concat \"#+title: ${title}\n#+filetags: :software:\n#+date: \" (format-time-string \"%Y-%m-%d\" (current-time) t) \"\n\")")
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
            ("tt" "Todo Thuis" entry (file+headline "~/Notes/todo.org" "Inbox")
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
        )
    )
)

;; Capture shortcuts: Todos
(map!
    :leader
    :prefix ("d" . "todo")
    :desc "Thuis" "t" (lambda () (interactive) (org-capture nil "tt"))
)
;; Capture shortcuts: Logs
(map!
    :leader
    :prefix ("l" . "log")
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
        "~/Templates/mail-signatures/personal.txt")))
(setq gnus-alias-default-identity "personal")
;; Define rules to match work identity
(setq gnus-alias-identity-rules
    '(
        ("personal"
        ("any" "<\\(.+\\)\\@spreekmeester\\.nl" both) "personal")
        ))

;; Determine identity when message-mode loads
(add-hook 'message-setup-hook 'gnus-alias-determine-identity)

(setq sendmail-program "gmi")

(defun aap/set-mail-sender-personal ()
    (interactive)
    (setq message-sendmail-extra-arguments '("send" "--quiet" "-t" "-C" "~/Mail/account.personal"))
    (when (eq major-mode 'message-mode)
        (gnus-alias-use-identity "personal"))
)

(aap/set-mail-sender-personal)

(map! :leader
    :prefix ("M" . "mail")
    :desc "personal" "p" #'aap/set-mail-sender-personal
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
        ("p" "Privé" agenda "Persoonlijk"
         ((org-agenda-files '("~/Notes/todo.org"))))
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

(use-package! org-superstar
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-headline-bullets-list '("☯" "⚛" "◉" "✸" "✿" "✤" "✜" "○")
  ;(setq org-superstar-headline-bullets-list '("⚛" "◉" "○" "✸" "✿" "✤" "✜" "◆")
        org-superstar-prettify-item-bullets t))

(after! org
    (setq org-agenda-dim-blocked-tasks nil)
    (setq org-agenda-inhibit-startup nil)
    (setq org-agenda-use-tag-inheritance nil)
    (setq org-agenda-ignore-properties '(visibility category))
    (setq org-agenda-sticky t)
)

;(after! org
    (setq org-use-tag-inheritance nil)
    (setq org-tags-exclude-from-inheritance '("crypt" "index"))
;)
(after! evil-org
    (setq org-use-tag-inheritance nil)
    (setq org-tags-exclude-from-inheritance '("crypt" "index"))
)
(after! org
    (setq org-use-tag-inheritance nil)
    (setq org-tags-exclude-from-inheritance '("crypt" "index"))
)
(after! org-roam
    (setq org-use-tag-inheritance nil)
    (setq org-tags-exclude-from-inheritance '("crypt" "index"))
)

(after! org
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)" "PROJ" "IDEA(i)" "HOLD" "ISSUE" "ERROR" "FIX" "WORKAROUND" "QUESTION" "ANSWER")))
  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "maroon1" :weight bold)
                ("NEXT" :foreground "light sea green")
                ("DONE" :foreground "#888888")
                ("PROJ" :foreground "purple1" :weight bold)
                ("IDEA" :foreground "purple1")
                ("HOLD" :foreground "purple1")
                ("ISSUE" :foreground "red" :weight bold)
                ("ERROR" :foreground "red" :weight bold)
                ("FIX" :foreground "green")
                ("WORKAROUND" :foreground "green")
                ("QUESTION" :foreground "maroon1")
                ("ANSWER" :foreground "light sea green")
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

; This can't be a symlink or Org-roam will get confused
(setq org-roam-directory "~/Nextcloud/org-mode/notes/")
; Specifically specified for performance
(setq org-roam-database-connector 'sqlite-builtin)
;(setq org-roam-db-location "~/Nextcloud/org-mode/org-roam.db")

; For performance reasons, delay garbage collection
(use-package! gcmh
  :config
  (setq gcmh-high-read-threshold (* 100 1024 1024) ;; 100MB
        gcmh-idle-delay 10)) ;; Ruim pas op na 10 seconden inactiviteit

(after! org-roam
    (setq org-roam-node-display-template
        (concat (propertize "${doom-tags:30}" 'face 'org-tag) " ${doom-hierarchy:120}"))
)

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(setq lsp-phpactor-path "phpactor")
;; php
;(use-package! phpactor
;  :mode "\\.php\\'"
;  :defer t
;)
;(use-package! company-phpactor
;  :mode "\\.php\\'"
;  :defer t
;)
;;(composer-setup-managed-phar)
;;(phpactor-install-or-update)

; niet meer nodig ivm moderne lsp setup:
;(use-package! php-mode
;  :mode "\\.php\\'"
;  :defer t
;  :hook ((php-mode . (lambda () (set (make-local-variable 'company-backends)
;       '(;; list of backends
;         company-phpactor
;         company-files
;         ))))))

(use-package! gcode-mode
  :mode "\\.gcode\\'"
  :defer t
)

(setq projectile-project-search-path '("~/Scripts/" "~/Sites/" "~/Remotes" "~/Lab"))

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

(setq lsp-dart-sdk-path "/opt/homebrew/Caskroom/flutter/3.38.5/flutter/bin/cache/dart-sdk/")
(setq flutter-sdk-path "/opt/homebrew/Caskroom/flutter/3.38.5/flutter")

(defun my/start-android-emulator ()
  "Ask for an Android emulator and fire it up on the background."
  (interactive)
  (let ((avds (split-string (shell-command-to-string "emulator -list-avds") "\n" t)))
    (if avds
        (let ((chosen-avd (completing-read "Choose emulator: " avds)))
          (start-process "android-emulator" nil "emulator" "-avd" chosen-avd)
          (message "Android emulator '%s' is starting..." chosen-avd))
      (user-error "No Android emulators found."))))

;; Koppel het aan een logische shortcut, bijv. SPC m e (Android Emulator)
(map! :leader
      :desc "Start Android Emulator" "m e" #'my/start-android-emulator)

(use-package! add-node-modules-path
  :hook ((js2-mode . add-node-modules-path)
         (typescript-mode . add-node-modules-path)))

(apheleia-global-mode +1) ;; Formats automatically through Prettier on save
