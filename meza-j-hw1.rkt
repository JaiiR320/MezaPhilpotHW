;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname meza-j-hw1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Jair Meza
;; jdmeza

(define-struct restaurant (name food tables capacity veg?))
;; Restaurant is a (make-restaurant name type tables capacity veg?)
;; interp. represents a restaurant where
;; name is the name of the establishment
;; food is the type of food (italian, mexican, american, bbq etc.)
;; tables is the number of tables
;; capacity is how many seats there are
;; veg? is whether or not it has vegetarian options

; examples
(define FIVE-GUYS (make-restaurant "Five Guys" "American" 20 80 false))
(define ARMSBY-ABBEY (make-restaurant "Armsby Abbey" "Bar"  15 45 true))
(define TECH (make-restaurant "Tech Pizza" "Pizza Shop" 40 300 true))

;; constructor
;; make-restaurant: String String Natural Natural Boolean -> Restaurant

;; selector(s)
;; restaurant-name: Restaurant -> String
;; restaurant-food: Restaurant -> String
;; restaurant-tables: Restaurant -> Natural
;; restaurant-capacity: Restaurant -> Natural
;; restaurant-veg?: Restaurant -> Boolean

;; predicate
;; restaurant? AnyType -> Boolean

;; Restaurant-type: Restaurant -> String
;; consumes a restaurant and produces a String, where String is
;; "event venue" if tables >= 30 and capacity >= 250
;; "vegetarian friendly" if there are veg options
;; food, where food is the original kind if neither of these apply

(check-expect (restaurant-type ARMSBY-ABBEY) "vegetarian friendly")
(check-expect (restaurant-type TECH) "event venue")
(check-expect (restaurant-type FIVE-GUYS) "American")

(define (restaurant-type res)
  (cond [(and (>= (restaurant-tables res) 30) (>= (restaurant-capacity res) 250)) "event venue"]
        [(restaurant-veg? res) "vegetarian friendly"]
        [else (restaurant-food res)]))

(define-struct date (month day year))
;; Date is a (make-date day month year)
;; represents a date, where
;; day is the day
;; month is the month
;; year is the year
;;examples
(define SEPT9 (make-date 9 9 2020))
(define OCT3 (make-date 10 3 2020))
(define JAN1 (make-date 1 1 2021))

(define-struct reservation (restaurant name phone date party))
;; Reservation is a (make-reservation Restaurant name phone Date party)
;; represents a reservation where
;; Restaurant is a restaurant
;; name is the person's name
;; phone is the persons phone numher
;; Date is a date
;; party is the party size

;;examples
(define SALLY-RES (make-reservation TECH "Sally" "401-123-0428" SEPT9 10))
(define JOSH-RES (make-reservation ARMSBY-ABBEY "Josh" "346-192-5728" OCT3 2))
(define WILL-RES (make-reservation TECH "Will" "465-846-5913" JAN1 8))


(check-expect (add-to-party JOSH-RES 3) (make-reservation (make-restaurant "Armsby Abbey" "Bar" 15 45 #true) "Josh" "346-192-5728" (make-date 10 3 2020) 5))
;; Add-to-party: Reservation Natural -> Reservation
;; consumes a Reservationa and a number and adds produces a reservation with increased party size based off the number
(define (add-to-party reserv party)
  (make-reservation (reservation-restaurant reserv) (reservation-name reserv) (reservation-phone reserv) (reservation-date reserv) (+ party (reservation-party reserv))))

;; precedes?: Date Date -> Boolean
;; consumes a date and a date and produces true if the first date precedes the second, and false if it does not

(check-expect (precedes? SEPT9 JAN1) true)
(check-expect (precedes? JAN1 OCT3) false)
(check-expect (precedes? SEPT9 OCT3) true)
(check-expect (precedes? SEPT9 SEPT9) false)

(define (precedes? date-a date-b)
  (cond [(< (date-year date-a) (date-year date-b)) true]
        [(> (date-year date-a) (date-year date-b)) false]
        [(= (date-year date-a) (date-year date-b))
        (cond [(< (date-month date-a) (date-month date-b)) true]
              [(> (date-month date-a) (date-month date-b)) false]
              [(= (date-month date-a) (date-month date-b))
              (cond [(< (date-day date-a) (date-day date-b)) true]
                    [(> (date-day date-a) (date-day date-b)) false]
                    [(= (date-day date-a) (date-day date-b)) false])])]))

;; Reservation-OK?: Reservation Date -> String
;; consumes a Reservation and a Date and produces false if the date precedes the reservation date, or if party is greater than capacity

(check-expect (reservation-OK? SALLY-RES SEPT9) true)
(check-expect (reservation-OK? (add-to-party SALLY-RES 400) SEPT9) false)


(define (reservation-OK? reserv day)
  (if (or (precedes? day (reservation-date reserv)) (> (reservation-party reserv) (restaurant-capacity (reservation-restaurant reserv))))
      false
      true))




































