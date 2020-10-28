;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname meza-j-philpot-r-hw6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; Jair Meza
;; jdmeza
;; Robert Philpot
;; rlphilpot

;;1).
(define-struct course (department course-num teacher max-enroll ListOfStudent))
;; course is a (make-course String Natural String Natural ListOfStudent)
;; department is name of department offering course
;; course-num is the course number
;; teacher is name of faculty member
;; max-enroll is max number of students that can enroll for course
;; ListOfStudent is one of:
;; - empty
;; - (cons Student ListOfStudent)

(define-struct student (name ID ListOfCourse))
;; student is a (make-student String Natural ListOfCourse)
;; name is name of student
;; ID is student's ID number
;; ListOfCourse is one of:
;; - empty
;; - (cons course ListOfCourse)

;;2).
;; Courses is a list of courses
;; Courses is a mutatable variable
(define Courses empty)
;; Students is a list of students
;; stores is a mutatable variable
(define Students empty)

;;3).
;;add-student: name ID -> (void)
;;consumes a name and ID and mutates the Students variable
;;EFFECT: mutates the student variable by adding a student
;;test cases
(check-expect(student-helper-fn 432 (list (make-student "joe" 432 empty) (make-student "rob" 543 empty) (make-student "jim" 583 empty))) true)
(check-expect (student-helper-fn 348093 (list (make-student "joe" 432 empty) (make-student "rob" 543 empty) (make-student "jim" 583 empty))) false)
(check-expect (student-helper-fn 1 empty) false)

(define (add-student name ID)
  (if (student-helper-fn ID Students)
      (error "You done messed up")
      (set! Students (cons (make-student name ID empty) Students))))

;;student-helper-fn: Natural ListOfStudents -> Boolean
;;consumes a Student ID and a ListOfStudents and returns
;; - true if the student is in the list
;; - false if the student is not in the list
;;test cases
(check-expect (student-helper-fn 789 (list (make-student "Chris" 789 '()) (make-student "Ann" 456 '()) (make-student "Joe" 123 '()))) true)
(check-expect (student-helper-fn 44567 (list (make-student "Chris" 789 '()) (make-student "Ann" 456 '()) (make-student "Joe" 123 '()))) false)
(check-expect (student-helper-fn 255 '()) false)

(define (student-helper-fn ID a-los)
  (local [
          (define (student-helper-fn ID a-los acc)
            (cond
              [(empty? a-los) acc]
              [(cons? a-los)
               (if (= ID (student-ID (first a-los)))
                   (not acc)
                   (student-helper-fn ID (rest a-los) acc))]))](student-helper-fn ID a-los false)))

;;examples
(add-student "Joe" 123)
(add-student "Ann" 456)
(add-student "Chris" 789)

;;4).
;;add-course: String Natural String Natural -> (void)
;;consumes a department, course number teacher and enrollment capacity and extends Courses
;;EFFECT: changes the number of courses in Courses by adding a new course
(define (add-course department course-num teacher max-enroll)
  (if (course-helper-fn Courses department course-num)
      (error "Course already exists")
      (set! Courses (cons (make-course department course-num teacher max-enroll empty) Courses))))

;;course-helper-fn: ListOfCourses String Natural -> Boolean
;;consumes a list of courses, a department, and a course number and produces
;; - true if the course exists in the list
;; - false if the course does not exist in the list
;;test cases
(check-expect (course-helper-fn (list (make-course "CS" 1101 "Hamel" 100 '()) (make-course "BI" 1000 "Rulfs" 20 '()) (make-course "MA" 2201 "Servatius" 50 '())) "BI" 1000) true)
(check-expect (course-helper-fn '() "QWE" 6453465) false)
(check-expect (course-helper-fn (list (make-course "CS" 1101 "Hamel" 100 '()) (make-course "BI" 1000 "Rulfs" 20 '()) (make-course "MA" 2201 "Servatius" 50 '())) "GJ" 563457) false)
(check-expect (course-helper-fn (list (make-course "CS" 1101 "Hamel" 100 '()) (make-course "BI" 1000 "Rulfs" 20 '()) (make-course "MA" 2201 "Servatius" 50 '())) "GJ" 563457) false)

(define (course-helper-fn a-loc department course-num)
  (local [
          (define (course-helper-fn a-loc acc)
            (cond
              [(empty? a-loc) acc]
              [(cons? a-loc)
               (if (and (string=? department (course-department (first a-loc))) (= course-num (course-course-num (first a-loc))))
                   (not acc)
                   (course-helper-fn (rest a-loc) acc))]))](course-helper-fn a-loc false)))

;;examples
(add-course "CS" 1101 "Hamel" 100)
(add-course "BI" 1000 "Rulfs" 20)
(add-course "MA" 2201 "Servatius" 50)


;;5).
;;add-to-course: Natural String Natural -> (void)
;;consumes a Student ID, a department and a course number and produces (void) and mutates Students and Courses
;;EFFECT: adds to the ListOfStudent in a course in Courses and adds to ListOfCourse in a student in Students
(define (add-to-course ID department course-num)
  (if (and (course-helper-fn Courses department course-num) (student-helper-fn ID Students))
      (if (< (length (course-ListOfStudent (return-course department course-num Courses))) (course-max-enroll (return-course department course-num Courses))) 
          (begin (set-student-ListOfCourse! (return-student ID Students) (cons (return-course department course-num Courses) (student-ListOfCourse (return-student ID Students))))
                 (set-course-ListOfStudent! (return-course department course-num Courses) (cons (return-student ID Students) (course-ListOfStudent (return-course department course-num Courses)))))
          (error "maximum enrollment reached"))
      (error "no such student or course")))


;;return-student: Natural ListOfStudents -> Student
;;consumes a Student ID and returns the corresponding student from the list
;;test cases
(check-expect (return-student 123 Students) (make-student "Joe" 123 '()))
(check-expect (return-student 4232134 Students) '())
(check-expect (return-student 123 '()) '())

(define (return-student ID a-los)
  (cond
    [(empty? a-los) empty]
    [(cons? a-los)
     (if (= ID (student-ID (first a-los)))
         (first a-los)
         (return-student ID (rest a-los)))]))

;;return-student: Natural ListOfCourses -> Course
;;consumes a Course number and department and returns the corresponding course from the list
;;test cases
(check-expect (return-course "CS" 1101 Courses) (make-course "CS" 1101 "Hamel" 100 '()))
(check-expect (return-course "PQ" 1345 Courses) '())
(check-expect (return-course "CS" 1101 '()) '())

(define (return-course department course-num a-loc)
  (cond
    [(empty? a-loc) empty]
    [(cons? a-loc)
     (if (and (= (course-course-num (first a-loc)) course-num) (string=? (course-department (first a-loc)) department))
         (first a-loc)
         (return-course department course-num (rest a-loc)))]))

;;6)
;;largest-enrollment -> (void)
;;consumes nothing and produces the first course with the highest amount of current students
(define (largest-enrollment)
  (if (empty? Courses)
      (error "No courses exist")
      (local [
          (define (largest-enrollment-helper-fn a-loc course-acc)
            (cond
              [(empty? a-loc) course-acc]
              [(cons? a-loc)
               (if (< (length (course-ListOfStudent course-acc)) (length (course-ListOfStudent (first a-loc))))
                   (largest-enrollment-helper-fn (rest a-loc) (course-ListOfStudent (first a-loc)))
                   (largest-enrollment-helper-fn (rest a-loc) course-acc))]))] (largest-enrollment-helper-fn Courses (first Courses)))))




