; ejercicio5
; int magicFunction( double k ) {
;    double [ ] array = { 5.0, 1.0, 3.0 };
;    int c = 0;
;    for(int i = 0; i < 3 ; i++){
;        if(array[i] + k == 0){
;            c++;
;        }
;    }
;    return c ;
; }
(declare-const k Real)

;C1: 5.0 + k == 0 || 1.0 + k == 0 || 3.0 + k == 0
(assert (or (= (+ k 5.0) 0.0)(or (= (+ k 1.0) 0)(= (+ k 3.0) 0))))

;!C1: !(k == 5.0 || k == 1.0 || k == 3.0)
;(assert (not(or (= k 5.0)(or (= k 1.0)(= k 3.0)))))

(check-sat)
(get-model)