;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Meza-J-Lab2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Jair Meza
; jdmeza

;; structs

(define-struct dvd (HD? num-of-discs unlimited?))
;; Dvd is a (make-dvd String Natural[1, 4] Boolean)
;; interp: represents a dvd plan
;; HD? is either:
;;   true
;;   false
;; number-of-discs is 1-4 inclusive
;; unlimited? is either:
;;   true
;;   false

;; example:
(define DVD-PLAN (make-dvd true 3 true))

#;
(define (dvd-fcn dvd)
  (... (dvd-HD? dvd)
       (dvd-num-of-discs dvd)
       (dvd-unlimited? dvd)))

(define-struct streaming (HD? platform unlimited?))
;; Streaming is a (make-streaming Boolean String Boolean)
;; interp: represents a streaming plan
;; HD? is either:
;;   true
;;   false
;; platform is either:
;;   "PC"
;;   "Mac"
;;   "Android phone"
;;   "Roku"
;; unlimited? is either:
;;   true
;;   false
;; example:
(define STREAM-PLAN (make-streaming false "Roku" false))

#;
(define (streaming-fcn streaming)
  (... (streaming-HD? streaming)
       (streaming-platform streaming)
       (streaming-unlimited? streaming)))

;; Itemization
;; Plan is either:
;; dvd
;; streaming

#;
(define (plan-fcn dvd)
  (cond [(dvd? plan) (... (dvd-def plan)
                          (dvd-num-of-discs plan)
                          (dvd-HD? plan))]
        [(streaming? plan) (... (streaming-HD? plan)
                                (streaming-platform plan)
                                (streaming-unlimited? plan))]))

;; monthly-cost: Plan -> Number
;; Consumes a plan and produces the monthly cost

;; Template
#;
(define (monthly-cost plan)
  (if (dvd? plan)
      ...
      ...))

;; Helper Functions

;; dvd-num-cost: Natural -> Number
;; consumes a Natural number and produces the price associated with that number of dvd's
(define (dvd-num-cost num)
  (cond [(= num 1) 7.99]
        [(= num 2) 8.99]
        [(= num 3) 9.99]
        [(= num 4) 10.99]))

;; dvd-hd-cost: Natural -> Number
;; consumes a Natural number and produces the price associated with that number of dvd's when the plan is HD
(define (dvd-hd-cost num)
  (cond [(= num 1) .5]
        [(= num 2) 1]
        [(= num 3) 1.5]
        [(= num 4) 2]))

;; dvd-unlim-cost: Plan -> Number
;; consumes a Plan and produces the price if it is in unlimited or not
(define (dvd-unlim-cost plan)
  (if (dvd-unlimited? plan)
      3
      0))

;; streaming-hd-cost: Plan -> Number
;; consumes a Plan and produces the price if it is in hd or not
(define (streaming-hd-cost plan)
  (if (streaming-HD? plan)
      4.99
      2.99))

;; streaming-unlim-cost: Plan -> Number
;; consumes a Plan and produces the price if it is in unlimited or not
(define (streaming-unlim-cost plan)
  (if (streaming-unlimited? plan)
      5
      0))

(define (monthly-cost plan)
  (if (dvd? plan)
      (+(dvd-num-cost (dvd-num-of-discs plan)) (dvd-hd-cost (dvd-num-of-discs plan)) (dvd-unlim-cost plan))
      (+ (streaming-hd-cost plan) (streaming-unlim-cost plan))))

;; make-high-def: Plan -> Plan
;; consumes a plan and produces a plan with HD enabled
;; template
#;
(define (make-high-def plan)
  (if (dvd?) ...
      ...))

(define (make-high-def plan)
  (if (dvd? plan)
      (make-dvd true (dvd-num-of-discs plan) (dvd-unlimited? plan))
      (make-streaming true (streaming-platform plan) (streaming-unlimited? plan))))

(define DVD1 (make-dvd false 3 true))
(define STRM1 (make-streaming false "Mac" true))

;; a ListOfString is one of
;; empty
;; (cons String ListOfString)
;; interp: ListOfString represents a list of strings




  







