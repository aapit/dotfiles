(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((eval add-hook 'after-save-hook
      (lambda nil
        (org-babel-tangle))
      nil t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(italic ((t (:foreground "medium slate blue" :slant italic))))
 '(org-date ((t (:foreground "chocolate"))))
 '(org-document-info-keyword ((t (:inherit shadow :foreground "dim gray"))))
 '(org-document-title ((t (:background "gray11" :foreground "#b877db" :weight bold :height 1.3 :family "FantasqueSansMono Nerd Font"))))
 '(org-link ((t (:inherit underline :foreground "chocolate"))))
 '(org-meta-line ((t (:foreground "dim gray"))))
 '(org-property-value ((t (:foreground "light gray"))) t)
 '(org-special-keyword ((t (:foreground "dim gray"))))
 '(org-tag ((t (:foreground "hot pink" :weight normal)))))
