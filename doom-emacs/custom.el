(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company-php ac-php php-mode vue-mode)))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;(use-package! lsp
;  :init
;  (setq lsp-pyls-plugins-pylint-enabled t)
;  (setq lsp-pyls-plugins-autopep8-enabled nil)
;  (setq lsp-pyls-plugins-yapf-enabled t)
;  (setq lsp-pyls-plugins-pyflakes-enabled nil)
; )

; Treemacs config
(treemacs)
(treemacs-indent-guide-mode 'line)
(treemacs-git-mode 'deferred)
