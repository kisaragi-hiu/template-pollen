#lang racket

(module setup racket
  (provide omitted-path?)
  (define omitted-path?
    (lambda (path)
      (or (regexp-match #rx"node_modules" path)
          (regexp-match #rx"\\.css$" path)
          (regexp-match #rx"README\\.md" path)
          (regexp-match #rx"\\.json$" path)))))

(require pollen/decode
         pollen/template)

(provide root
         to-html
         (all-defined-out))

(define to-html ->html)

(define (root . elems)
  `(main ()
    ,@(decode-elements
       elems
       #:txexpr-elements-proc decode-paragraphs)))
