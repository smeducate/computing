;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname area) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; area-starter.rkt

; 
; PROBLEM:
; 
; DESIGN a function called area that consumes the length of one side 
; of a square and produces the area of the square.
; 
; Remember, when we say DESIGN, we mean follow the recipe.
; 
; Leave behind commented out versions of the stub and template.
; 

;; Number -> Number

;; Given the length of a square, produce a area

(check-expect (area 2) 4)
(check-expect (area 3) 9)
(check-expect (area 3.2) (* 3.2 3.2))

;;(define (area n) 0) ; this is a stub

;; (area 2) should produce 4
;; (area 3) should produce 9
;; (area 3.2) should produce 10.24

(define (area l)
  (* l l))