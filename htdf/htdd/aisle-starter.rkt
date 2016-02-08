;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname aisle-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; aisle-starter.rkt

; 
; PROBLEM:
; 
; Using the SeatNum data definition below design a function
; that produces true if the given seat number is on the aisle. 
; 


;; Data definitions:

;; SeatNum is Natural[1, 32]
;; Interp. Seat numbers in a row, 1 and 32 are aisle seats
(define SN1  1) ;aisle
(define SN2 12) ;middle
(define SN3 32) ;aisle
#;
(define (fn-for-seat-num sn)
  (... sn)) 

;; Template rules used:
;;  atomic non-distinct: Natural[1, 32]


;; Functions:
;; SeatNum -> Boolean
;; produce true if a given seat number is a aisle
(check-expect (aisle? 1) true)
(check-expect (aisle? 12) false)
(check-expect (aisle? 32) true)

;;(define (aisle? sn) false) ;stub

; use template from seatnum
(define (aisle? sn)
  (or (= sn 1)(= sn 32)))