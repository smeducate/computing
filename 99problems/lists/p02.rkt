;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname p02) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

; Problem 1
; 
; Find the last but one box of a list.
;     Example:
;     * (my-but-last '(a b c d))
;     (C D)


;; List -> List

;; Given a list returns the last but one element of the list

(check-expect (my-but-last '(a b c d)) '(c d))
(check-expect (my-but-last '(a)) null)
(check-expect (my-but-last '()) null)

;(define (my-but-last l) l) ;this is the stub

(define (my-but-last xl)
  (cond[(empty? xl) empty]
       [(empty? (rest xl)) empty]
       [(empty? (rest (rest xl))) xl]
       [else (my-but-last (rest xl))])) 