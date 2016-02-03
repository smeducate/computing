;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname make-box) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; make-box-starter.rkt

; 
; PROBLEM:
; 
; You might want to create boxes of different colours.
; 
; Use the How to Design Functions (HtDF) recipe to design a function that consumes a color, and creates a 
; solid 10x10 square of that colour.  Follow the HtDF recipe and leave behind commented out versions of
; the stub and template.
; 

;color -> Image ;Signature
;;Takes a color as RGB and returns a solid 10X10 square filled with the given color
(check-expect (make-box (make-color 255 0 0)) (square 10 "solid" "red"))
(check-expect (make-box (make-color 128 255 0)) (square 10 "solid" (make-color 128 255 0)))

;(define (make-box c)
;  (square 10 "solid" "blue"))

;;template
;(define (make-box c) 
;  (...c))

(define (make-box c)
  (square 10 "solid" c))