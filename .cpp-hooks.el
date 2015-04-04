(add-to-list 'auto-mode-alist
             '("\\.tpp\\'" . (lambda ()
			       (c++-mode))))

(define-skeleton cpp-namespace-skelly
  "Make a namespace block"
  "Namespace: "
  "namespace " str " {"\n
  \n
  "}")

(define-skeleton cpp-class-declaration-skelly
  "Make a class declaration"
  "Class Name: "
  "class " str 
  ("parent class: "
   ": public " str
   ("additional parents: " ", public " str)
   )
  " {" \n
  "public:" \n
  str "();" \n
  "~" str "();" \n
  "protected:"\n
  "};"
  )

(define-skeleton cpp-ds-plugin-declaration-skelly
  "Make a DSToValue plugin declaration"
  "Base Name: "
  "struct DS" str "Pol {" \n
  "~DS" str "Pol(){}" \n
  "double perform(const DigitalSignal& s);" \n
  "protected:" \n
  "DS" str "Pol(){}" \n
  "};"\n
  \n
  "using DS" str " = DSToValueTemplate< DS" str "Pol >;"\n
  )

(define-skeleton cpp-iterator-template-skelly
  "Define a template member function prototype that takes an iterator range"
  "Return Type: "
  "template<typename It>"\n
  str " "
  ("Function Name: "
   str "(It b, It e);"
   )
  )

(define-skeleton cpp-boost-test-skelly
  "Print the header information for a boost unit test module"
  "Class Header File Basename: "
  "#define BOOST_TEST_MODULE " str \n
  \n
  "#include <boost/test/unit_test.hpp>"\n
  "#include \"" str ".hpp\""\n
  \n
  \n
  "using namespace LAC;"\n
  "using namespace std;"\n
  \n
  )

(add-hook 'c++-mode-hook
	  (lambda () (define-key
		       c++-mode-map
		       [?\C-{ ?c]
		       'cpp-class-declaration-skelly
		       )
	    )
	  )

(add-hook 'c++-mode-hook
	  (lambda () (define-key
		       c++-mode-map
		       [?\C-{ ?p]
		       'cpp-ds-plugin-declaration-skelly
		       )
	    )
	  )

(add-hook 'c++-mode-hook
	  (lambda () (define-key
		       c++-mode-map
		       [?\C-{ ?I]
		       'cpp-iterator-template-skelly
		       )
	    )
	  )


(add-hook 'c++-mode-hook
	  (lambda () (define-key
		       c++-mode-map
		       [?\C-{ ?n]
		       (lambda ()
			 (interactive)
			 (cpp-namespace-skelly "LAC")
			 )
		       )
	    )
	  )

(add-hook 'c++-mode-hook
	  (lambda () (define-key
		       c++-mode-map
		       [?\C-{ ?b]
		       (lambda ()
			 (interactive)
			 (cpp-boost-test-skelly)
			 )
		       )
	    )
	  )


