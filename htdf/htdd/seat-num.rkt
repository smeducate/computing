;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname seat-num) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; seat-num-starter.rkt

; 
; PROBLEM:
; 
; Imagine that you are designing a program to manage ticket sales for a
; theatre. (Also imagine that the theatre is perfectly rectangular in shape!) 
; 
; Design a data definition to represent a seat number in a row, where each 
; row has 32 seats. (Just the seat number, not the row number.)
;  

;; Seatnum is Integer[1, 32]
;; interp. seat numbers in a theatre are betwen 1 and 32 where 1 and  32 are isle seats
(define SN-LOWEST 1)     ; lowest-isle
(define SN-middle 12)    ;  middle
(define SN-HIGHEST 32)   ; highest-isle
#;
(define (fn-for-seatnum sn)
  (... sn))

;; Template rules used:
;;  - atomic non-distinct: Integer[1, 32]