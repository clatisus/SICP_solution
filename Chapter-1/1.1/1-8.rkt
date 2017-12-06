#lang sicp
(define (cuberoot x)
  (cuberoot-iter 1.0 x))

(define (cuberoot-iter old-guess x)
  (let ((new-guess (improve old-guess x)))
    (if (good-enough? old-guess new-guess)
        new-guess
        (cuberoot-iter new-guess x))))

(define (improve y x)
  (/ (+ y y (/ x (* y y)))
     3))

(define (good-enough? old-guess new-guess)
  (<= (abs (- old-guess new-guess))
      (* old-guess 0.001)))

      