#lang racket

(module setup racket
  (provide omitted-path?)
  (define omitted-path?
    (lambda (path)
      (or (regexp-match #rx"node_modules" path)
          (regexp-match #rx"\\.css$" path)
          (regexp-match #rx"README\\.md" path)
          (regexp-match #rx"\\.json$" path)))))

(provide (all-defined-out))

(require pollen/template)

(define to-html ->html)

(define (root . elems)
  `(main () ,@elems))
