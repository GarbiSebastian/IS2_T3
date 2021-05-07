; ejercicio2c
; x ∗ y = 64
(declare-fun x () Int)
(declare-fun y () Int)
(assert (= (* x y) 64))
(check-sat)
(get-model)