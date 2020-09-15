;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname meza-j-philpot-r-hw2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Robert Philpot
;rphilpot
;Jair Meza
;jdmeza

;;1).
(define-struct DVD(HD? Number-of-DVDs Unlimited?))
;;DVD is a (make-DVD Boolean Natural Boolean)
;; HD? is either:
;;   true  - which enables HD definition
;;   false - which does not enable HD definition
;; Number-of-DVDs is 1-4 inclusive
;; Unlimited? is either:
;;   true  - allows unlimited streaming
;;   false - does not allow unlimited streaming
;; example:
(define DVD1(make-DVD #false 4 #true))

(define-struct Streaming(Platform HD? Unlimited?))
;; Streaming is a (make-streaming Boolean String Boolean)
;; interp: represents a streaming plan
;; Platform is either:
;;   "PC"
;;   "Mac"
;;   "Android phone"
;;   "Roku"
;; HD? is either:
;;   true  - which enables HD definition
;;   false - which does not enable HD definition
;; Unlimited? is either:
;;   true  - allows unlimited streaming
;;   false - does not allow unlimited streaming
;; example:
(define STREAMING1 (make-Streaming "PC" #true #false))

;;2).
;; DVD-fcn: DVD -> ...
;; (define (DVD-fcn a-DVD)
;;   (... (DVD-HD? a-DVD)
;;        (DVD-Number-of-DVDs a-DVD)
;;        (DVD-Unlimited? a-DVD)))

;;Streaming-fcn: Streaming -> ...
;; (define (Streaming-fcn a-Streaming)
;;   (... (Streaming-Platform a-Streaming)
;;        (Streaming-HD? a-Streaming)
;;        (Streaming-Unlimited? a-Streaming)))

;;plan-fcn: plan -> ...
; (define (plan-fcn a-plan)
;   (cond
;    [(DVD? a-plan) (DVD-fcn a-plan)]
;    [(Streaming? a-plan) (Streaming-fcn a-plan)]))

;;3).
(define DVD2 (make-DVD #false 4 #true))
(define DVD3 (make-DVD #true 3 #true))
(define DVD4 (make-DVD #false 3 #true))
(define DVD5 (make-DVD #true 4 #true))
(define DVD6 (make-DVD #true 2 #false))
(define DVD7 (make-DVD #false 4 #false))

(define STREAMING2 (make-Streaming "Netflix" #true #false))
(define STREAMING3 (make-Streaming "Roku" #false #false))
(define STREAMING4 (make-Streaming "Android" #false #true))
(define STREAMING5 (make-Streaming "PC" #true #true))

(check-expect (monthly-cost DVD2) 13.99)
(check-expect (monthly-cost DVD3) 14.49)
(check-expect (monthly-cost DVD4) 12.99)
(check-expect (monthly-cost DVD5) 15.99)
(check-expect (monthly-cost DVD6) 9.99)
(check-expect (monthly-cost DVD7) 10.99)
(check-expect (monthly-cost STREAMING2) 4.99)
(check-expect (monthly-cost STREAMING3) 2.99)
(check-expect (monthly-cost STREAMING4) 7.99)
(check-expect (monthly-cost STREAMING5) 9.99)

;; Number-of-DVDs-cost: a-DVD -> Number
;; consumes a DVD plan and produces the cost of all the DVDs
;; Number-of-DVDs-cost: a-DVD -> ...
;(define (Number-of-DVDs-cost a-DVD)
;  ...)
(define COST-PER-DVD 7.99)  ;Cost per each DVD
(define (Number-of-DVDs-cost a-DVD)
  (+ COST-PER-DVD (- (DVD-Number-of-DVDs a-DVD) 1)))

;; DVD-HD?-cost: a-DVD -> Number
;;consumes a DVD and produces 0 if DVD is not HD and the cost of HD if DVD is an HD
;; DVD-HD?-cost: a-DVD -> ...
;(define (DVD-HD?-cost a-DVD)
;  ...)
(define HD-PER-DVD-PRICE 0.5)  ;price for each HD dvd
(define (DVD-HD?-cost a-DVD)
  (if (DVD-HD? a-DVD) (* (DVD-Number-of-DVDs a-DVD) HD-PER-DVD-PRICE) 0))

;;Unlimited?-cost: a-DVD -> Natural
;;consumes a DVD and produces 0 if DVD is not Unlimited and 3 if DVD is unlimited
;;Unlimited?-cost: a-DVD -> ...
;(define (Unlimited?-cost a-DVD)
;  ...)
(define UNLIMITED-DVD-PRICE 3)
(define (Unlimited?-cost a-DVD)
  (if (DVD-Unlimited? a-DVD) UNLIMITED-DVD-PRICE 0))

;;Stream-HD?: a-Stream -> Number
;;consumes a Stream and produces 4.99 if Stream is HD and 2.99 if a Stream is SD
;;Stream-HD?: a-Stream -> ...
;(define (Stream-HD? a-Stream)
;  ...)
(define HD-STREAMING-PRICE 4.99)  ;price for HD streaming
(define SD-STREAMING-PRICE 2.99)  ;price for SD streaming
(define (Stream-HD? a-Stream)
  (if (Streaming-HD? a-Stream) HD-STREAMING-PRICE SD-STREAMING-PRICE))

;;Stream-Unlimited?: a-Stream -> Natural
;;consumes a Stream and produces 5 if a Stream is Unlimited and 0 if Stream is not unlimited
;;Stream-Unlimited?: a-Stream -> ...
; (define (Stream-Unlimited? a-Stream)
;  ...)
(define UNLIMITED-STREAMING-PRICE 5)  ;price for unlimited streaming
(define (Stream-Unlimited? a-Stream)
  (if (Streaming-Unlimited? a-Stream) UNLIMITED-STREAMING-PRICE 0))

;;DVD-monthly-cost: DVD -> Natural
;;consumes a DVD and produces the monthly cost for the plan
;;DVD-monthly-cost: DVD -> ...
; (define (DVD-monthly-cost a-DVD)
;  ...)
(define (DVD-monthly-cost a-DVD)
  (+ (Number-of-DVDs-cost a-DVD) (DVD-HD?-cost a-DVD) (Unlimited?-cost a-DVD)))

;;Streaming-monthly-cost: DVD -> Natural
;;consumes a Streaming and produces the monthly cost for the plan
;;Streaming-monthly-cost: Streaming -> ...
; (define (Streaming-monthly-cost a-Stream)
;  ...)
(define (Streaming-monthly-cost a-Stream)
  (+ (Stream-HD? a-Stream) (Stream-Unlimited? a-Stream)))

;;monthly-cost: rental-plan -> Number
;; consumes a plan and produces the total cost of DVD if rental plan is a DVD plan or the total cost of a Stream if rental plan is a Streaming plan
;;monthly-cost: rental-plan -> ...
;(define (monthly-cost rental-plan)
;  (cond [(DVD? rental-plan) ...]
;        [(Streaming? rental-plan) ...]))
(define (monthly-cost rental-plan)
  (cond [(DVD? rental-plan) (DVD-monthly-cost rental-plan)]
        [(Streaming? rental-plan) (Streaming-monthly-cost rental-plan)]))

;;4).
(check-expect (make-high-def STREAMING2) (make-Streaming "Netflix" #true #false))
(check-expect (make-high-def STREAMING3) (make-Streaming "Roku" #true #false))
(check-expect (make-high-def STREAMING5) (make-Streaming "PC" #true #true))

(check-expect (make-high-def DVD2) (make-DVD #true 4 #true))
(check-expect (make-high-def DVD5) (make-DVD #true 4 #true))
(check-expect (make-high-def DVD6) (make-DVD #true 2 #false))

;; make-high-def: rental-plan -> plan
;;consumes a plan and produces a DVD plan with HD? true if rental plan is a DVD plan or a Streaming plan with HD? true if rental plan is a Streaming plan
;;make-high-def: rental-plan -> ...
;(define (make-high-def rental-plan)
;  (cond [(DVD? rental-plan) ...]
;        [(Streaming? rental-plan) ...]))
(define (make-high-def rental-plan)
  (cond [(DVD? rental-plan) (make-DVD #true (DVD-Number-of-DVDs rental-plan) (DVD-Unlimited? rental-plan))]
        [(Streaming? rental-plan) (make-Streaming (Streaming-Platform rental-plan) #true (Streaming-Unlimited? rental-plan))]))
;;5).
(check-expect (contains-all-numbers? (cons "CS1101" (cons "A1" (cons "32" empty)))) true)
(check-expect (contains-all-numbers? (cons "CS1101" (cons "A-one" empty))) false)
(check-expect (contains-all-numbers? empty) #false)
(check-expect (contains-all-numbers? (cons "Cather" (cons "is" (cons "19" (cons "years" (cons "old" empty)))))) #true)
(check-expect (contains-all-numbers? (cons "Cather" (cons "does" (cons "like" (cons "eating" (cons "19 apples" empty)))))) #false)
(check-expect (contains-all-numbers? (cons "Professor" (cons "Engling" (cons "is" (cons "100" (cons "percent" (cons "nice" empty))))))) #true)

;;contains-all-numbers?: los -> boolean
;;consumes a list of numbers and produces true if a cons contains only integers and false if none of the cons contains only integers

;;contains-all-numbers?: los -> ...
;(define (contains-all-numbers? los)
;  (cond
;   [(empty? los) ...]
;   [else
;    (if (string-numeric? (first los)) ...])
  
(define (contains-all-numbers? los)
  (cond
   [(empty? los) false]
   [else
    (if (string-numeric? (first los)) true
        (contains-all-numbers? (rest los)))]))

;; 6).
(check-expect (count-X empty) 0)
(check-expect (count-X (cons "Xenon" (cons "xaw" (cons "0193" (cons "xx" (cons "1hX" empty)))))) 5)
(check-expect (count-X (cons "Xenonx" (cons "xaWX" (cons "01baX3" (cons "xX" (cons "1heXxhX" empty)))))) 10)

;; String-count-x: loc -> Natural
;; consumes a list of characters and produces the amount of times x or X is a character in the list of characters

;;String-count-x: loc -> ..
;(define (String-count-x loc)
;  (cond
;    [(empty? loc) ...]
;    [(char=? (first loc) #\x) ...]
;    [(char=? (first loc) #\X) ...]
;    [else
;     ...]))
(define (String-count-x loc)
  (cond
    [(empty? loc) 0]
    [(char=? (first loc) #\x) (+ 1 (String-count-x (rest loc)))]
    [(char=? (first loc) #\X) (+ 1 (String-count-x (rest loc)))]
    [else
     (String-count-x (rest loc))]))

;;count-X: los -> Natural
;;consumes a list of strings and produces the amount of times x or X is a character in the list of strings

;;count-X: los -> ...
;(define (count-X los)
;  (cond
;    [(empty? los) ...]
;    [(cons? los) ...]))
(define (count-X los)
  (cond
    [(empty? los) 0]
    [(cons? los) (+ (String-count-x (string->list (first los))) (count-X (rest los)))]))

;;string->list

;; 7).
;; ListOfNaturals is one of:
;; empty
;; cons ListOfNaturals
(check-expect (lengths-of-strings empty) empty)
(check-expect (lengths-of-strings (cons "Xenon" (cons "xaw" (cons "0193" (cons "xx" (cons "1hX" empty))))))
              (cons 5 (cons 3 (cons 4 (cons 2 (cons 3 empty))))))
(check-expect (lengths-of-strings (cons "Cather" (cons "likes" (cons "to" (cons "eat" (cons "apples" empty))))))
              (cons 6 (cons 5 (cons 2 (cons 3 (cons 6 empty))))))

;;lengths-of-strings: los -> list
;;consumes a list of strings and produces a list of numbers containg the length of characters in each string

;;lengths-of-strings: los -> ...
;(define (lengths-of-strings los)
;  (cond
;    [(empty? los) ...]
;    [(cons? los) ...]))
(define (lengths-of-strings los)
  (cond
    [(empty? los) empty]
    [(cons? los) (cons (string-length (first los)) (lengths-of-strings (rest los)))]))