;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname p01) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))


; Problem 1
; 
; Find the last box of a list.
;     Example:
;     * (my-last '(a b c d))
;     (D)


;; List -> Element

;; Given a list returns the last element of the list

(check-expect (my-last '(a b c d)) 'd)
(check-expect (my-last '(a)) 'a)
(check-expect (my-last '()) null)

;(define (my-last l) (car l)) ;this is the stub

(define (my-last xl)
  (cond[(empty? xl) null]
       [(empty? (cdr xl)) (car xl)]
       [else (my-last (cdr xl))] 
  )
)




