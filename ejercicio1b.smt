; ejercicio1b
; (x ∧ y) ≡ ¬(¬x ∨ ¬y)
(declare-const x Bool)
(declare-const y Bool)
(assert ( = (and x y) (not (or (not x)(not y)))))
(check-sat)
(get-model)