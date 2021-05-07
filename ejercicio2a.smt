; ejercicio2a
; 3x + 2y = 36
(declare-fun x () Int)
(declare-fun y () Int)
(assert (= (+ (* 3 x) (* 2 y)) 36))
(check-sat)
(get-model)