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

(define a (new-struct-instance A))

(define func
  (lambda ()
    (let ((tail nil))
      (begin
        (loop 1000
          (lambda ()
            (begin
              (let ((b (new-struct-instance B))
                    (c (new-struct-instance C))
                    (d (new-struct-instance D))
                    (e (new-struct-instance E))
                    (f (new-struct-instance F))
                    (g (new-struct-instance G))
                    (h (new-struct-instance H))
                    (i (new-struct-instance I))
                    (j (new-struct-instance J))
                    (k (new-struct-instance K)))
                (begin
                  (if (not (null? tail))
                      (set-field tail "field1" b 43)
                      (set-field a "field1" b 44))
                  (set-field b "field2" c 45)
                  (set-field c "field1" d 46)
                  (set-field d "field2" e 47)
                  (set-field e "field1" f 48)
                  (set-field f "field2" g 49)
                  (set-field g "field1" h 50)
                  (set-field h "field2" i 51)
                  (set-field i "field1" j 52)
                  (set-field j "field2" k 53)
                  (set! tail k))))))
        (assert-dead tail)))))

(mark-clock-start)
(loop 1000
  (lambda ()
    (begin
     (func))))
(mark-clock-end)
(print-clock-time-cost)
