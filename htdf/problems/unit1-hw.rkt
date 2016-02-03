;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname unit1-hw) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; PROBLEM:
; 
; Design a function that consumes two images and produces true if the first
; is larger than the second.
; 
; Once you have submitted your solution, watch the assessment tutorial video in the next
; tab before completing your self-assessment.

;; Image, Image -> Boolean
;; Takes to image and produces True if the first image has a height and width greater than
;; the second image

(check-expect (larger? (rectangle 30 40 "solid" "blue")
                       (rectangle 10 29 "solid" "red")) true)

(check-expect (larger? (rectangle 10 40 "solid" "blue")
                       (rectangle 100 29 "solid" "red")) false)

(check-expect (larger? (rectangle 100 40 "solid" "blue")
                       (rectangle 80 100 "solid" "red")) false)

(check-expect (larger? (rectangle 40 40 "solid" "blue")
                       (rectangle 100 29 "solid" "red")) false)

(check-expect (larger? (circle 300 "solid" "blue")
                       (rectangle 100 299 "solid" "red")) true)

(check-expect (larger? (rectangle 30 40 "solid" "blue")
                       (rectangle 30 40 "solid" "red")) false)




;(define (larger? img1 img2) false) ; stub

;;(larger (circle 10) (circle 20)) should produce false
;;(larger (circle 20) (circle 10)) should produce true
;;(larger (ircle 10) (circle 10)) should produce false
;;(larger (circle 300) (rectangle 20 100 outline red)) should produce true

;(define (larger? img1 img2)
;  (...img1))

(define (larger? img1 img2)
  (if (and (> (image-height img1) (image-height img2))
           (> (image-width img1) (image-width img2)))
      true
      false))