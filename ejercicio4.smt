; ejercicio4
; int triangle ( int a , int b , int c) {
;   if ( a <= 0 | | b <= 0 | | c <= 0 ) {
;       return 4;
;   }
;   if ( ! ( a + b > c && a + c > b && b + c > a ) ) {
;       return 4;
;   }
;   if ( a == b && b == c ) {
;       return 1;
;   }
;   if ( a == b | | b == c | | a == c ) {
;       return 2;
;   }
;   return 3;
; }

(declare-const a Int)
(declare-const b Int)
(declare-const c Int)

; C1: a <= 0 || b <= 0 || c <= 0
;(assert (or (<= a 0) (or (<= b 0)(<= c 0))))

; !C1: !(a <= 0 || b <= 0 || c <= 0)
; C2: !(a + b > c && a + c > b && b + c > a )
;(assert (not (or (<= a 0) (or (<= b 0)(<= c 0)))))
;(assert (not(and (> (+ a b) c)(and (> (+ a c) b)(> (+ b c) a)))))

; !C1: !(a <= 0 || b <= 0 || c <= 0)
; !C2: (a + b > c && a + c > b && b + c > a )
; C3: a == b && b == c
;(assert (not (or (<= a 0) (or (<= b 0)(<= c 0)))))
;(assert (and (> (+ a b) c)(and (> (+ a c) b)(> (+ b c) a))))
;(assert (and (= a b)(= b c)))

; !C1: !(a <= 0 || b <= 0 || c <= 0)
; !C2:  (a + b > c && a + c > b && b + c > a )
; !C3: !(a == b && b == c)
; C4: a == b || b == c || a == c
;(assert (not (or (<= a 0) (or (<= b 0)(<= c 0)))))
;(assert (and (> (+ a b) c)(and (> (+ a c) b)(> (+ b c) a))))
;(assert (not(and (= a b)(= b c))))
;(assert (or (= a b)(or (= b c)(= a c))))

; !C1: !(a <= 0 || b <= 0 || c <= 0)
; !C2:  (a + b > c && a + c > b && b + c > a )
; !C3: !(a == b && b == c)
; !C4: !(a == b || b == c || a == c)
(assert (not (or (<= a 0) (or (<= b 0)(<= c 0)))))
(assert (and (> (+ a b) c)(and (> (+ a c) b)(> (+ b c) a))))
(assert (not(and (= a b)(= b c))))
(assert (not(or (= a b)(or (= b c)(= a c)))))

(check-sat)
(get-model)