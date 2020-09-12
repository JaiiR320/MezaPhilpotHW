;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname meza-j-philpot-r-hw1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Robert Philpot
;; rphilpot
;; Jair Meza
;; jdmeza

;;1).
;; signature: Restaurant is a make-Restaurant String String Natural Natural Boolean -> Restaurant
(define-struct Restaurant (restaurant-name food-type table-count total-capacity vegetarian-option))
;; Restaurant is a (make-restaurant name type tables capacity veg?)
;; interp. represents a restaurant where
;; restaurant-name is the name of the establishment
;; food-type is the type of food (italian, mexican, american, bbq etc.)
;; table-count is the number of tables
;; total-capacity is how many seats there are
;; vegetarian-option is whether or not it has vegetarian options

(define Herradura (make-Restaurant "Herradura" "Mexican" 12 60 #true))
(define Five-Guys(make-Restaurant "Five Guys" "American" 8 32 #false))
(define Olive-Garden (make-Restaurant "Olive Garden" "Italian" 40 300 #true))
(define FIVE-GUYS (make-Restaurant "Five Guys" "American" 20 80 false))
(define ARMSBY-ABBEY (make-Restaurant "Armsby Abbey" "Bar"  15 45 true))
(define TECH (make-Restaurant "Tech Pizza" "Pizza Shop" 40 300 true))

;;2).

;;constructor
;; make-Restaurant: String String Natural Natural Boolean
;;selector:
;; Restaurant-restaurant-name -> String
;; restaurant-name consumes Restaurant and produces the name of restaurant
;; Restaurant-food-type -> String
;; food-type consumes Restaurant and produces the type of food restaurant provides
;; Restaurant-table-count -> Natural
;; table-count consumes Restaurant and produces the number of tables at restaurant
;; Restaurant-total-capacity -> Natural
;; total-capacity consumes Restaurant and produces the capacity number at restaurant
;; Restaurant-vegetarian-option -> Boolean
;; vegetarian-option consumes Restaurant and produces true if Restaurant provides vegetarian option and false otherwise
;;predicate:
;;Restaurant? type -> Boolean

;;

;;3).
;; signature: restaurant-type: Restaurant -> String
;; consumes a Restaurant and produces a String, where String is
;; "event venue" if tables >= 30 and capacity >= 250
;; "vegetarian-friendly" if there are veg options
;; food-type, where food-type is the original kind if neither of these apply
(define (restaurant-type restaurant)
  (cond
   [(and (>= (Restaurant-table-count restaurant) 30) (>= (Restaurant-total-capacity restaurant) 250)) "event venue"]
   [(and (Restaurant-vegetarian-option restaurant) #true) "vegetarian-friendly"]
   [else (Restaurant-food-type restaurant)]
   ))

(check-expect (restaurant-type ARMSBY-ABBEY) "vegetarian-friendly")
(check-expect (restaurant-type TECH) "event venue")
(check-expect (restaurant-type FIVE-GUYS) "American")

;;4).
;; signature: Date is a make-Date month day year -> Date
(define-struct Date(month day year))
;; Date is a (make-date day month year)
;; represents a date, where
;; day is the day [1,30]
;; month is the month [1,12]
;; year is the year

(define 01/05/2021 (make-Date 01 05 2021))
(define 11/21/2021 (make-Date 11 21 2021))
(define 11/21/1998 (make-Date 11 21 1998))
(define SEPT9 (make-Date 9 9 2020))
(define SEPT10 (make-Date 9 10 2020))
(define OCT3 (make-Date 10 3 2020))
(define JAN1 (make-Date 1 1 2021))

;; make-Reservation: Restaurant String Natural Date Natural -> Reservation
(define-struct Reservation (restaurant name phone-number date party))
;; Reservation is a (make-reservation restaurant name phone-number date party)
;; represents a reservation where
;; Restaurant is a restaurant
;; name is the person's name
;; phone is the persons phone numher
;; Date is a Date
;; party is the party size

(define Robby(make-Reservation Herradura "Robby Philpot" 9999999999 01/05/2021 4))
(define Nathan (make-Reservation Five-Guys "Nathan Schmidtt" 9312245087 11/21/2021 7))
(define Jessica (make-Reservation Olive-Garden "Jessica Gould" 9214877761 11/21/1998 11))

(define SALLY-RES (make-Reservation TECH "Sally" "401-123-0428" SEPT9 10))
(define JOSH-RES (make-Reservation ARMSBY-ABBEY "Josh" "346-192-5728" OCT3 2))
(define WILL-RES (make-Reservation TECH "Will" "465-846-5913" JAN1 8))

;;5).
;; add-to-party: reservation number -> Reservation
;; consumes a Reservationa and a number and adds produces a reservation with increased party size based off the number

(define (add-to-party reservation number)
  (make-Reservation (Reservation-restaurant reservation) (Reservation-name reservation) (Reservation-phone-number reservation) (Reservation-date reservation) (+ (Reservation-party reservation) number)))

(check-expect (add-to-party JOSH-RES 3) (make-Reservation (make-Restaurant "Armsby Abbey" "Bar" 15 45 #true) "Josh" "346-192-5728" (make-Date 10 3 2020) 5))
(check-expect (add-to-party WILL-RES 6) (make-Reservation TECH "Will" "465-846-5913" JAN1 14))
(check-expect (add-to-party SALLY-RES 2) (make-Reservation TECH "Sally" "401-123-0428" SEPT9 12))

;;6).
;; precedes?: date1 date2 -> Boolean
;; consumes a date and a date and produces true if the first date precedes the second, and false if it does not

(define (precedes? date1 date2)
  (cond
    [(< (Date-year date1) (Date-year date2)) #true]
    [(and (= (Date-year date1) (Date-year date2)) (< (Date-month date1) (Date-month date2))) #true]
    [(and (and (= (Date-year date1) (Date-year date2)) (= (Date-month date1) (Date-month date2))) (< (Date-day date1) (Date-day date2))) #true]
    [else #false]))

(check-expect (precedes? SEPT9 JAN1) true)
(check-expect (precedes? JAN1 OCT3) false)
(check-expect (precedes? SEPT9 OCT3) true)
(check-expect (precedes? SEPT9 SEPT10) true)

;;7).
;; reservation-OK?: reservation date -> boolean
;; consumes a Reservation and a Date and produces false if the date precedes the reservation date, or if party is greater than capacity

(define (reservation-OK? reserv day)
  (if (or (precedes? day (Reservation-date reserv)) (> (Reservation-party reserv) (Restaurant-total-capacity (Reservation-restaurant reserv))))
      false
      true))

(check-expect (reservation-OK? SALLY-RES SEPT9) true)
(check-expect (reservation-OK? (add-to-party SALLY-RES 400) SEPT9) false)
  