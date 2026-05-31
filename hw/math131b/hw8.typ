#import "../../templates/hwt.typ": *
#show: conf.with("Math 131B", "Jack Olson", "May 27, 2026", "8")

//inner product
#let ip(x, y) = $lr(chevron.l #x, #y chevron.r)$

#set enum(numbering: "(a)")
#problem(1)[
  Let $f,g in C(RR\/ZZ; CC).$
  + We have $norm(f)_2 =0 <==> f=0.$
  + We have $abs(ip(f,g)) <= norm(f)_2 norm(g)_2.$
  + We have $norm(f + g)_2 <= norm(f)_2 + norm(g)_2.$
  + If $ip(f,g) = 0$, then $norm(f+g)_2^2 = norm(f)_2^2 + norm(g)_2^2.$
  + We have $norm(c f)_2 = abs(c) norm(f)_2$ for all $c in CC.$
]

#proof(append: " of (a)")[
  By Lemma 5.2.5 we have $norm(f)_2 = 0 <==> sqrt(ip(f,f)) = 0 <==> ip(f,f) =0 <==> f=0.$
]

#set math.equation(numbering: "(1)")
#proof(append: " of (b)")[
  We have two cases.\ *Case 1:* $norm(g)_2 =0.$ Then we have $abs(ip(f,g)) = abs(ip(f,0)) = 0 = norm(f)_2 norm(0)_2 = norm(f)_2 norm(g)_2.$\ *Case 2:* $norm(g)_2 != 0$. Notice that $ ip(f - ip(f,g)/(norm(g)_2^2)g, g) &= ip(f,g) - ip(f,g)/norm(g)_2^2 ip(g,g)\ &= ip(f,g) - ip(f,g) norm(g)_2^2/norm(g)_2^2\ &= ip(f,g) - ip(f,g)\ &=0. $ Further, by equation (1) we have $ ip(f - ip(f,g)/(norm(g)_2^2)g, ip(f,g)/(norm(g)_2^2) g) &= overline((ip(f,g)/(norm(g)_2^2))) ip(f - ip(f,g)/(norm(g)_2^2)g, g)\ &= 0. $ Then, $ 0 &<= norm(f - ip(f,g)/norm(g)_2^2 g)\ &= ip(f - ip(f,g)/norm(g)_2^2 g , f - ip(f,g)/norm(g)_2^2 g)\ &= ip(f - ip(f,g)/norm(g)_2^2 g, f) - ip(f - ip(f,g)/norm(g)_2^2, ip(f,g)/norm(g)_2^2 g)\ &=^((2)) ip(f - ip(f,g)/norm(g)_2^2, f). $ Then we have, $ ip(f - ip(f,g)/norm(g)_2^2, f) &= ip(f,f) - ip(f,g)/norm(g)_2^2 ip(g,f)\ &= norm(f)_2^2 - abs(ip(f,g))^2/ norm(g)_2^2 $ Combining (3) and (4) we get $0 <= norm(f)_2^2 - abs(ip(f,g))^2\/norm(g)_2^2 ==> abs(ip(f,g))^2 <= norm(f)_2^2 norm(g)_2^2 ==> abs(ip(f,g)) <= norm(f)_2 norm(g)_2.$
]

#set math.equation(numbering: none)

#proof(append: " of (c)")[
  Notice that $ norm(f + g)_2^2 &= ip(f + g, f + g)\ &= ip(f+g, f) + ip(f + g, g)\ &= ip(f,f) + ip(f,g) + ip(g, f) + ip(g, g)\ &= norm(f)_2^2 + norm(g)_2^2 + ip(f,g) + ip(g,f)\ &<=^("C.S") norm(f)_2^2 + norm(g)^2 + 2 norm(f)_2 norm(g)_2\ &= (norm(f)_2 + norm(g)_2)^2. $ So we have $norm(f + g)_2^2 <= (norm(f)_2 + norm(g)_2)^2 ==> norm(f+g)_2 <= norm(f)_2 + norm(g)_2.$
]

#proof(append: " to (d)")[
  From (c) we have $norm(f+g)_2^2 = norm(f)_2^2 + norm(g)_2^2 + ip(f,g) + ip(g,f).$ By assumption we have $\ ip(f,g) =0 ==> ip(g,f) = 0.$ So we get $norm(f + g)_2^2  =norm(f)_2^2 + norm(g)_2^2.$
]

#proof(append: " of (e)")[
  We have $norm(c f)_2^2 = ip(c f, c f) = c overline(c) ip(f,f) = abs(c)^2 norm(f)_2^2.$ So we have $norm(c f)_2 = abs(c) norm(f)_2.$
]

#problem(2)[
  Show that for any $f in C(RR\/ZZ; CC)$ we have $norm(f)_2 <= norm(f)_oo.$
]

#proof()[
  It must be noted that for any $f in C(RR\/ZZ; CC)$ we have $sup_(x in RR) abs(f(x))^2 = sup_(x in [0,1]) abs(f(x))^2$ since $f$ is $ZZ"-periodic"$. Notice $norm(f)_2^2 = integral_0^1 abs(f(x))^2 d x <= integral_0^1 sup_(x in [0,1]) abs(f(x))^2 d x = sup_(x in [0,1]) abs(f(x))^2.$\
  #v(1em)
   *Lemma:* If A is a set with real numbers greater than or equal to zero and is bounded, then $alpha := sup A$ exists and, in particular $alpha^2 = sup A^2$, where $A^2 := {x^2 | x in A}.$ 
  #proof()[
    For all $x in A$ $x<= alpha ==> x^2 <= alpha^2.$ So $alpha^2$ is an upper bound for $A^2$. Let $beta$ be another upper bound for $A^2.$ So for all $x in A$, we have $x^2 <= beta$. So $x <= sqrt(beta)$, i.e., $sqrt(beta)$ is an upper bound for $A$. So we must have $sqrt(beta) >= alpha ==> beta >= alpha^2.$ So $alpha^2 = sup A^2.$
  ]
  By lemma above we have $sup_(x in [0,1]) abs(f(x))^2 = (sup_(x in [0,1]) abs(f(x)))^2.$ So we get $norm(f)_2^2 <= (sup_(x in [0,1]) abs(f(x)))^2 = norm(f)_oo^2$, i.e., $norm(f)_2 <= norm(f)_oo.$ 
]
#v(3em)

#problem(3)[
  Prove that $L^2$ metric $d_(L^2)$ on $C(RR\/ZZ; CC)$ does indeed turn $C(RR\/ZZ; CC)$ into a metric space.
]

#set enum(numbering: "(1)")
#proof()[
  We need to show the metric space axioms are held.
  + We wish to show $d_(L^2)(f,g) > 0$ for $f,g in C(RR\/ZZ; CC)$ where $f$ is not identically $g.$ Indeed, since $f$ not identically $g$, then there exists $x in RR$ such that $|f(x) - g(x)| > 0 ==> |f(x) - g(x)|^2 > 0.$ So $d_(L^2)(f, g) = integral_0^1 |f(x)-g(x)|^2 d x >0$. 
  + We wish to show for any $f in C(RR\/ZZ; CC)$, we have $d_(L^2)(f,f) = 0.$ Take any $f in C(RR\/ZZ; CC)$. Then we have $|f(x) - f(x)|^2 = 0$ for all $x in [0,1]$. Hence $d_(L^2)(f,f) = integral_0^1 |f(x)-f(x)|^2 d x = 0.$
  + We wish to show for any $f, g in C(RR\/ZZ; CC)$ we have that $d_(L^2)(f,g) = d_(L^2)(g,f).$ Indeed for any $f, g in C(RR\/ZZ; CC)$ we have that $d_(L^2)(f,g) = integral_0^1 |f(x) - g(x)|^2 d x = integral_0^1 |g(x) -f(x)|^2 d x  =d_(L^2)(g,f).$
  + We wish to show that for any $f,g,h in C(RR\/ZZ; CC), d(f,g) <= d_(L^2)(f,h) + d_(L^2)(h,g).$ Take any $f,g, h in C(RR\/ZZ; CC)$. By triangle inequality of the $L^2$ norm, we have, $d_(L^2)(f,g) = norm(f-g)_2 = norm((f-h) + (h-g))_2 <= norm(f-h)_2 + norm(h - g)_2 = d_(L^2)(f,h) + d_(L^2)(h,g)$ 
  Since all axioms are held, it follows that $(C(RR\/ZZ; CC), d_(L^2))$ is a metric space.
]

#problem(4)[
  For any $n,m in ZZ$ we have $ip(e_n, e_m) = 1$ when $n = m$ and $ip(e_n, e_m) = 0$ when $n != m.$ Also $norm(e_n)_2 = 1.$
]

#proof()[
  Let $m, n in ZZ$. Then $ ip(e_n, e_m) = integral_0^1 e_n overline(e_m) = integral_0^1 e^(2pi i n x) e^(-2 pi i m x) d x = integral_0^1 e^(2 pi i (n-m)x) d x. $ Notice that if $n=m$, then we have $ integral_0^1 e^(2 pi i (n-m)x) d x = integral_0^1 e^0 d x = 1. $ Notice that if $n!=m$, then we have $ integral_0^1 e^(2 pi i (n-m)x) d x = [e^(2 pi i (n-m)x)/(2 pi i (n-m))]_0^1 = 1/(2 pi i (n-m))(e^(2pi i (n-m))-1). $ Since $n-m in ZZ$ then we have $ e^(2 pi i (n-m))=cos(2(n-m)pi) + i sin(2 (n-m) pi) = 1 + i dot 0 = 1. $ So we have, $ 1/(2 pi i (n-m))(e^(2pi i (n-m))-1) = 0. $ It follows that $ ip(e_n, e_m) = cases(1 "if" n=m, 0 "if" n!=m) $ Also we have $ norm(e_n) = sqrt(ip(e_n, e_n)) = sqrt(1) = 1. $
]