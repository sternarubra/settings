(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(delete-selection-mode 1)
;; yanks overwrites the region

(defun indent-whole-buffer ()
  "Indent the entire buffer according to the current mode"
  (interactive)
  (indent-region (point-min) (point-max))
  )

(define-key global-map
  [?\C-{ ?\t]
  'indent-whole-buffer
  )

(define-key global-map
  [?\C-{ ?\L]
  (lambda () (interactive) (copyright "Landmark Acoustics LLC"))
)

(add-hook 'octave-mode-hook
	  (lambda ()
	    (abbrev-mode 1)
	    (auto-fill-mode 1)
	    (if (eq window-system 'x)
		(font-lock-mode 1))))
;; octave-mode autofill goodness

(load-file ".c-hooks.el")
(load-file ".cpp-hooks.el")
