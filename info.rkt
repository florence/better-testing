#lang setup/infotab
(define name "cover")
(define collection "cover")
(define deps '(("base" #:version "6.2.900.6") "errortrace-lib" "rackunit-lib"
               "syntax-color-lib" "compiler-lib"))
(define build-deps
  '("racket-doc" "scribble-lib" "typed-racket-doc" "htdp-lib"
    "net-doc" "scribble-doc" "at-exp-lib" "scheme-lib"))

(define raco-commands
  '(("cover" (submod cover/raco main) "a code coverage tool" 30)))

(define scribblings '(("scribblings/cover.scrbl" (multi-page))))

(define test-omit-paths (list "tests/error-file.rkt" "scribblings"))
(define cover-omit-paths (list "tests/nested.rkt"))

(define cover-formats '(("html" cover generate-html-coverage)
                        ("coveralls" cover generate-coveralls-coverage)
                        ("raw" cover generate-raw-coverage)))

(define test-command-line-arguments '(("tests/arg.rkt" ("a"))))

(define version "2.0.2")
