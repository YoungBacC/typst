#import "../templates/hwt.typ": *
#show: conf.with("Math 131B", "Jack Olson", "May 11, 2026", "6")

#problem(1)[
  Let $a in "int"E$, $E subset.eq RR$, and $f$ a real analytic function at $a$. So $f(x) = sum_(n=0)^infinity C_n (x-a)^(n)$ on $(a-r, a+r)$ for some $r>0$. Then for any $k>= 0$, $f$ is k-times differentiable on $(a-r, a+r)$ and 
  $ f^((k)) (x) = sum_(n=0)^infinity C_(n+k) (n+1)(n+1) space dots.h.c space (n+k) (x-a)^n = sum_(n=0)^infinity C_(n+k) (n+k)!/n! (x-a)^n $ on $(a-r, a+r).$
]

#proof()[
  We will proceed by induction on $k.$ For $k=0$ we have $ f^((0))(x) = f(x) = sum_(n=0)^infinity C_(n+0) (n+0)!/n! (x-a)^n. $ Now assume we have the $k"-th"$ derivative such that $f^((k))(x) = sum_(n=0)^infinity C_(n+k) (n+k)!/(n!) (x-a)^n.$ Then $f^((k))$ is real analytic and hence uniformly convergent. So by Theorem 4.1.6 (d) we have,
  $ f^((k+1)) (x) & = dif/(dif x)(sum_(n=0)^infinity C_(n+k) (n+k)!/n! (x-a)^(n)) \
  & = sum_(n=0)^infinity dif/(dif x) (C_(n+k) (n+k)!/n! (x-a)^(n)) \
  & = sum_(n=1)^infinity C_(n+k) (n+k)!/n! n (x-a)^(n-1)\ 
  & = sum_(n=0)^infinity C_(n+k+1) (n+k+1)!/(n+1)! (n+1) (x-a)^n\
  & = sum_(n=0)^infinity C_(n+(k+1)) (n+(k+1))!/n! (x-a)^n. $

  By induction on $k$, we are done.
]