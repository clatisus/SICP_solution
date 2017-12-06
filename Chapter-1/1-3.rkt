#lang sicp
(define (func a b c)
  (cond ((and (not (> a b))
              (not (> a c))) (+ b c))
        ((not (> b c)) (+ a c))
        (else (+ a b))))

