;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname middle-seat) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; middle-seat.rkt

; 
; PROBLEM:
; 
; Using the SeatNum data definition below design a function
; that produces true if the given seat number in the middle where
; middle means not 1 and 32. 
; 


;; SeatNum -> Boolean
;; produce true if the given seat number is anywhere on the middle of the row
(check-expect (middle?  1) false)
(check-expect (middle? 16) true)        
(check-expect (middle? 32) false)       

;(define (middle? sn) false)  ;stub
;<use template from SeatNum>

(define (middle? sn)
  (and (not (= sn 1))
       (not (= sn 32))))
