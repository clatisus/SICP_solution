#lang sicp
(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter old-guess x)
  (let ((new-guess (improve old-guess x)))
    (if (good-enough? old-guess new-guess)
        new-guess
        (sqrt-iter new-guess x))))

(define (good-enough? old-guess new-guess)
  (<= (abs (- new-guess old-guess))
      (* old-guess 0.001)))

;; this is much better than 1-6.rkt when x is critical small or big
;; if x is small, the original one will get wrong answer
;; if x is big, the original one will get tle

;; The above solutions fail for x = 0. It hangs and never finishes evaluating.
;; because (* old-guess 0.001) could reach 0
;; so we should change < to <= (which I already did)