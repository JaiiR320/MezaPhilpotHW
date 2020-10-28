;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname dsojknan) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
 (map identity (map sub1 (build-list 5 identity)))
(map abs (map sub1 (build-list 5 abs)))

(define-struct buoy (name top bottom num))
(define-struct ticket (plate meter fine))

(define LOT (list
             (make-ticket 1 1 10)
             (make-ticket 2 2 25)
             (make-ticket 3 3 35)
             (make-ticket 4 4 45)
             (make-ticket 5 2 55)
             (make-ticket 6 2 65)))

(define LOB (list
             (make-buoy "A" "r" "b" 1)
             (make-buoy "B" "r" "b" 2)
             (make-buoy "C" "f" "g" 3)
             (make-buoy "D" "a" "b" 4)
             (make-buoy "E" "e" "r" 5)))

(define (rem lot t)
  (local [(define (rem-h ti)
            (if (= t (ticket-meter ti))
                false
                true))]
    (set! LOT (filter rem-h lot))))

(define (col lob a b)
  (local [(define (col-h acc)
            (cond [(empty? acc) empty]
                  [else
                   (if (and (string=? a (buoy-top (first acc))) (string=? b (buoy-bottom (first acc))))
                       (append (list (first acc)) (col-h (rest acc)))
                       (col-h (rest acc)))]))]
    (col-h lob)))

             
(col LOB "r" "b")

(define (hi)
  (local [(define (hh l)
            (cond [(empty? l) empty]
                  [else
                   (if (> (ticket-fine (first l)) 25)
                       (append (list (make-ticket
                                      (ticket-plate (first l))
                                      (ticket-meter (first l))
                                      (- (ticket-fine (first l)) 10)))
                               (hh (rest l)))
                       (append (list (first l)) (hh (rest l))))]))]
    (set! LOT (hh LOT))))
(hi)

(define-struct adult (name y s))
(define BEYONCE (shared ((-1- (make-adult "b" 1 (make-adult "z" 2 -1-)))) -1-))
(define JAYZ (shared ((-2- (make-adult "z" 1 BEYONCE))) -2-))



