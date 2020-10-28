;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname philpot-r-hw1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Robert Philpot

;;1).
;; signature: Restaurant is a make-Restaurant String String Natural Natural Boolean -> Restaurant
(define-struct Restaurant (restaurant-name food-type table-count total-capacity vegetarian-option))

(define Herradura (make-Restaurant "Herradura" "Mexican" 12 60 #true))
(define Five-Guys(make-Restaurant "Five Guys" "American" 8 32 #false))
(define Olive-Garden (make-Restaurant "Olive Garden" "Italian" 40 300 #true))

;;2).

;;constructor
;; make-Restaurant: String String Natural Natural Boolean
;;selector:
;; restaurant-name: Restaurant -> String
;; restaurant-name consumes Restaurant and produces the name of restaurant
;; food-type: Restaurant -> String
;; food-type consumes Restaurant and produces the type of food restaurant provides
;; table-count: Restaurant -> Natural
;; table-count consumes Restaurant and produces the number of tables at restaurant
;; total-capacity: Restaurant -> Natural
;; total-capacity consumes Restaurant and produces the capacity number at restaurant
;; vegetarian-option: Restaurant -> Boolean
;; vegetarian-option consumes Restaurant and produces true if Restaurant provides vegetarian option and false otherwise
;;predicate:
;;Restaurant-anytype -> Boolean

;;

;;3).
;; signature: restaurant-type consumes restaurant -> String
(define (restaurant-type restaurant)
  (cond
   [(and (>= (Restaurant-table-count restaurant) 30) (>= (Restaurant-total-capacity restaurant) 250)) "event venue"]
   [(and (Restaurant-vegetarian-option restaurant) #true) "vegetarian-friendly"]
   [else (Restaurant-food-type restaurant)]
   ))

;;4).
(define-struct Date(month day year))

(define 01/05/2021 (make-Date 01 05 2021))
(define 11/21/2021 (make-Date 11 21 2021))
(define 11/21/1998 (make-Date 11 21 1998))

(define-struct Reservation (restaurant name phone-number date party))

(define Robby(make-Reservation Herradura "Robby Philpot" 9999999999 01/05/2021 4))
(define Nathan (make-Reservation Five-Guys "Nathan Schmidtt" 9312245087 11/21/2021 7))
(define Jessica (make-Reservation Olive-Garden "Jessica Gould" 9214877761 11/21/1998 11))

;;5).
(define (add-to-party reservation number)
  (make-Reservation (Reservation-restaurant reservation) (Reservation-name reservation) (Reservation-phone-number reservation) (Reservation-date reservation) (+ (Reservation-party reservation) number)))

;;6).
;;(< (+ (+ (* (Date-year date1) 10000) (* (Date-month date1) 100)) (Date-year date1))
;;   (+ (+ (* (Date-year date2) 10000) (* (Date-month date2) 100)) (Date-year date2)))
(define (precedes? date1 date2)
  (cond
    [(< (Date-year date1) (Date-year date2)) #true]
    [(and (= (Date-year date1) (Date-year date2)) (< (Date-month date1) (Date-month date2))) #true]
    [(and (and (= (Date-year date1) (Date-year date2)) (= (Date-month date1) (Date-month date2))) (< (Date-day date1) (Date-day date2))) #true]
    [else #false]))

;;7).
(define (reservation-OK? reservation date)
  (precedes? (Reservation-date reservation) date))
  