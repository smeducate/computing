;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname boxify) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; boxify-starter.rkt

; 
; PROBLEM:
; 
; Use the How to Design Functions (HtDF) recipe to design a function that consumes an image, 
; and appears to put a box around it. Note that you can do this by creating an "outline" 
; rectangle that is bigger than the image, and then using overlay to put it on top of the image. 
; For example:
; 
; (boxify (ellipse 60 30 "solid" "red")) should produce .
; 
; Remember, when we say DESIGN, we mean follow the recipe.
; 
; Leave behind commented out versions of the stub and template.
; 

;; Image -> Image
;; The function should produce a rectangle around the given image such that it is completely
;; surrounded

(check-expect (boxify (circle 10 "solid" "red"))
               (overlay (rectangle 22 22 "outline" "black")
                        (circle 10 "solid" "red")))

(check-expect (boxify (ellipse 60 30 "solid" "red"))
              (overlay (rectangle 65 35 "outline" "black")
                       (ellipse 60 30 "solid" "red")))

;;(define (boxify img) (rectangle 4 4 "outline" "black")) ;stub

;;(define (boxify img)
;;  (...img))

(define (boxify img)
  (overlay (rectangle (+ (image-width img) 2) (+ (image-height img) 2) "outline" "black")
           img))