(define-skeleton c-header-skeleton
  "Make the ifndef block at the beginning of a C header file"
  "Type variable: "
  "#ifndef " str "_H" \n
  "#define " str "_H 1" \n
  \n
  "#endif"
  )

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (define-key
	      c-mode-base-map
	      [?\C-{ ?h]
	      'c-header-skeleton
	      )
	    )
	  )

(setq c-default-style "k&r")

(setq-default c-basic-offset 4
	      tab-width 4
	      indent-tabs-mode t)
