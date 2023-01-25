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

(define o1 '())

(mark-clock-start)

(loop 10000
    (lambda ()
      (begin
        (set! o1 (new-struct-instance A))
        (let ((o2 (new-struct-instance B))
              (o3 (new-struct-instance C))
              (o4 (new-struct-instance A))
              (o5 (new-struct-instance B))
              (o6 (new-struct-instance C))
              (o7 (new-struct-instance A))
              (o8 (new-struct-instance B))
              (o9 (new-struct-instance C))
              (o10 (new-struct-instance A)))
          (begin
            (set-field o1 "field1" o2)
            (set-field o2 "field2" o3)
            (set-field o3 "field1" o4)
            (set-field o4 "field2" o5)
            (set-field o5 "field1" o6)
            (set-field o6 "field2" o7)
            (set-field o7 "field1" o8)
            (set-field o8 "field2" o9)
            (set-field o9 "field1" o10)
          ))
        (gc))))

(mark-clock-end)
(print-clock-time-cost)
