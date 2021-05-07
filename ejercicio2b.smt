; ejercicio2b
; 5x + 4y = 64
(declare-fun x () Int)
(declare-fun y () Int)
(assert (= (+ (* 5 x) (* 4 y)) 64))
(check-sat)
(get-model)