(define loop
  (lambda (n func)
  (if (> n 0)
    (begin
      (func)
      (loop (- n 1) func))
    999)))

;; 構造体の定義
(define-struct A ("field1" "field2"))
(define-struct B ("field1" "field2"))
(define-struct C ("field1" "field2"))
(define-struct D ("field1" "field2"))
(define-struct E ("field1" "field2"))
(define-struct F ("field1" "field2"))
(define-struct G ("field1" "field2"))
(define-struct H ("field1" "field2"))
(define-struct I ("field1" "field2"))
(define-struct J ("field1" "field2"))
(define-struct K ("field1" "field2"))

(define a (new-struct-instance-of-A A))

(define func
  (lambda ()
    (let ((tail nil))
      (begin
        (loop 1000
          (lambda ()
            (begin
              (let ((b (new-struct-instance B))
                    (c (new-struct-instance-of-A A))
                    (d (new-struct-instance D))
                    (e (new-struct-instance-of-A A))
                    (f (new-struct-instance F))
                    (g (new-struct-instance-of-A A))
                    (h (new-struct-instance H))
                    (i (new-struct-instance-of-A A))
                    (j (new-struct-instance-of-A A))
                    (k (new-struct-instance-of-A A)))
                (begin
                  (if (not (null? tail))
                      (set-field-of-A tail "field1" b 43)
                      (set-field-of-A a "field1" b 44))
                  (set-field b "field2" c 45)
                  (set-field-of-A c "field1" d 46)
                  (set-field d "field2" e 47)
                  (set-field-of-A e "field1" f 48)
                  (set-field f "field2" g 49)
                  (set-field-of-A g "field1" h 50)
                  (set-field h "field2" i 51)
                  (set-field-of-A i "field1" j 52)
                  (set-field-of-A j "field1" k 53)
                  (set! tail k))))))
        (assert-dead tail)))))

(mark-clock-start)
(loop 1000
  (lambda ()
    (begin
     (func))))
(mark-clock-end)
(print-clock-time-cost)
