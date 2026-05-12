#import "../templates/hwt.typ": *
#show: conf.with("Math 131B", "Jack Olson", "May 11, 2026", "6")

#problem(7)[
  Let $a in "int"E$, $E subset.eq RR$, and $f$ a real analytic function at $a$. So $f(x) = sum_(n=0)^infinity C_n (x-a)^(n)$ on $(a-r, a+r)$ for some $r>0$. Then for any $k>= 0$, $f$ is k-times differentiable on $(a-r, a+r)$ and 
  $ f^((k)) (x) = sum_(n=0)^infinity C_(n+k) (n+1)(n+1) space dots.h.c space (n+k) (x-a)^n = sum_(n=0)^infinity C_(n+k) (n+k)!/n! (x-a)^n $ on $(a-r, a+r).$
]