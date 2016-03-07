;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname p03) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

; Problem 1
; 
; Find the Kth element in the list.
;     Example:
;     * (element-at '(a b c d) 3)
;     C
; The first element in the list is 1


;; List, Num -> Any

;; Given a list returns the last but one element of the list

(check-expect (element-at '(a b c d) 2) 'b)
(check-expect (element-at '(a) 3) null)
(check-expect (element-at '() 4) null)

;(define (element-at xs n) 'b) ; this is the stub

(define (element-at xs n)
  (cond [(empty? xs) empty]
        [ (or (= 0 n) (= 1 n)) (first xs)]
        [else (element-at (rest xs) (sub1 n))]))
      

(check-expect (element-at-match '(a b c d) 2) 'b)
(check-expect (element-at-match '(a) 3) null)
(check-expect (element-at-match '() 4) null)

(define (element-at-match xs n)
  (match xs
    ['() empty]
    [(cons h t) (if (or (= 0 n) (= 1 n)) h (element-at-match t (sub1 n)))]))