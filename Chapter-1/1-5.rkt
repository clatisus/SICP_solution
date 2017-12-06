#lang sicp
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

; Using application-order evaluation, then never terminates
; Using normal-order evaluation, output = 0

(test 0 (p))