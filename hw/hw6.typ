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

#problem(2)[
  Let $E subset.eq RR$, $a in "int"E$ and let $f:E -> RR$ be a function which is real analytic at $a$ and has the power series expansion $f(x) = sum_(n=0)^infinity c_n (x-a)^n$ for all $x in (a-r, a+r)$ and some $r>0$. Then for any integer $k>=0$, we have $f^((k))(a)=k! c_k$. In particular, we have _Taylors formula_ $ f(x) = sum_(n=0)^infinity (f^((n)) (a))/n! (x-a)^n $ for all $x in (a-r, a+r)$.
]
#v(1cm)
#proof()[
  By assumption, $a$ and $f$ both satisfy the hypothesis of Proposition 4.2.6. So we have $ f^((k))(x) = sum_(n=0)^infinity c_(n+k) (n+k)!/n! (x-a)^n. $ Plugging in $x=a$ we have $ f^((k))(a) & = sum_(n=0)^infinity c_(n+k) (n+k)!/n! (0)^n\
  & = c_k k!/0! (0)^0 + 0 + 0 + dots\ 
  & = c_k k! $
  So we have $ c_k = (f^((k)) (a) )/(k!). $ Plugging this into the power series for $f$, we have $ f(x) = sum_(n=0)^infinity (f^((k)) (a))/k! (x-a)^n. $
]

#set enum(numbering: "(a)")
#problem(3)[
  Logarithm properties

  + For every $x in (0, infinity)$, we have $ln'(x)=1/x$. In particular, by the fundemental theorem of calculus, we have $integral_([a,b]) 1/x = ln(b) - ln(a)$ for any interval $[a,b]$ in $(0, infinity)$.

  + We have $ln(x y) = ln(x) + ln(y)$ for all $x,y in (0,infinity)$.

  + We have $ln(1) = 0$ and $ln(1/x) = - ln(x)$ for all $x in (0, infinity)$.

  + For any $x in (0, infinity)$ and $y in RR$, we have $ln(x^y) = y ln(x)$.

  + For any $x in (-1,1)$, we have $ ln(1-x) = - sum_(n=1)^infinity x^n/n. $ In particular, $ln$ is analytic at $1$, with the power series expansion $ ln(x) = sum_(n=1)^infinity (-1)^(n+1)/n (x-1)^n $ for $x in (0,2)$, with radius of convergence $1.$
]

#proof(append: " of (a)")[
  Let $x in (0, infinity)$. Note, $ln(x) = exp^(-1)(x)$. By the inverse function theorem we have, $ (ln(x))' = (exp^(-1)(x))' = 1/(exp'(exp^(-1)(x))). $ Note from Theorem 4.5.2 (b), we have that $exp' =  exp$. So we have, $ (ln(x))' = 1/(exp(exp^(-1)(x))) = 1/x. $
]

#proof(append: " of (b)")[
  Let $x, y in (0, infinity)$. Note, by Theorem 4.5.2 we have $exp(ln(x) + ln(y)) = exp(ln(x)) dot exp(ln(y)) = x y = exp(ln(x y))$. Since $exp$ is an injective function and we have $exp(ln(x) + ln(y)) = exp(ln(x y))$, then $ln(x) + ln(y) = ln(x y)$.
]

#proof(append: " of (c)")[
  Note, by Theorem 4.5.2 $exp(ln(1)) = 1 = exp(0)$. By injectivity of $exp$, it follows that $ln(1) = 0$. Let $x in (0, infinity)$. Similaryly, $exp(- ln(x)) = 1/(exp(ln(x))) = 1/x = exp(ln(1/x))$. By injectivity of $exp$ we have $ln(1/x) = -ln(x).$
]

#proof(append: " of (d)")[
  Let $x in (0, infinity), y in RR$. By Proposition 4.5.4 we have that $exp(y ln(x)) = e^(y ln(x)) = (e^(ln(x)))^y = (exp(ln(x)))^y = x^y.$ Since $exp(ln(x^y)) = x^y$, then by injectivity we have $ln(x^y) = y ln(x)$.
]

#proof(append: " of (e)")[
  From (a) we have that for any $x in (-1, 1)$, $(ln(1-x))' = -1/(1-x) = -sum_(n=0)^infinity x^n.$ In order to integrate this we need uniform convergence. Fix $x_0 in (-1, 1)$. Then by Theorem 4.6.1 we have that $-sum_(n=0)^infinity x^n --> -1/(1-x)$ uniformly on $[0,x_0]$ (or $[x_0, 0]$ if $x_0 < 0$) since $[0, x_0]$ is compact and a subinterval of $(-1,1).$ By Theorem 3.7.1 we can move the integral inside the infinite sum. We have,
  $ integral_[0,x_0] -sum_(n=0)^infinity x^n = underbrace(-sum_(n=0)^infinity integral_[0,x_0] x^n, "LHS") = underbrace(integral_[0,x_0] -1/(1-x), "RHS"). $
  For the LHS we have: 
  $ -sum_(n=0)^infinity [x^(n+1)/(n+1)]_0^x_0 = -sum_(n=1)^infinity x_0^n / n $
  And the RHS: 
  $ integral_[0, x_0] -1/(1-x) = ln(1-x)|_0^x_0 = ln(1-x_0). $

  We get LHS $=$ RHS $==> - sum_(n=1)^infinity x_0^n/n = ln(1-x)$, for $x in (-1,1)$.

  #v(1cm)
  Now let $t=1-x.$ For $t in (-1, 1) => x in (0,2)$ we have that $ ln(x) = ln(1-t) = -sum_(n=1)^infinity t^n/n = sum_(n=1)^infinity (1-x)^n/n = sum_(n=1)^infinity (-1)^(n+1)/n (x-1)^n. $ This is a power series for $ln(x)$ centered at $1$.
]

#problem(4)[
  Prove that the natural logarithm function is real analytic on $(0, infinity).$
]

#proof()[
   Let $a in (0, infinity).$ We have that $ (ln(a-x))' = (-1)/(a-x) = -1/a sum_(n=0)^infinity 1/a^n x^n. $ Note that the last equality comes from the geometric series formula where we have convergence for $x in (-a, a).$ Fix $x_0 in (-a, a)$. Then by Theorem 4.1.6 (d), on $[0, x_0]$, $1/a sum_(n=0)^infinity 1/a^n x^n$ converges uniformly to $(-1)/(a-x).$ So we can integrate term by term by Theorem 3.7.1. We have, $ -sum_(n=0)^infinity integral_[0, x_0] 1/a^(n+1) x^n d x = integral_[0,x_0] (-1)/(a-x) d x. $ On the Left hand side of the equality we have $ -sum_(n=0)^infinity [x^(n+1)/(a^(n+1)(n+1))]_0^x_0 = -sum_(n=1)^infinity x_0^n/(a^n n). $ On the right hand side of the equality we have $ [ln(a-x)]_0^x_0 = ln(a-x_0) - ln(a). $ So in full we have, $ ln(a-x) = ln(a) - sum_(n=1)^infinity x^n/(a^n n) $ for any $x in (-a, a).$ Now let $t = a-x$, which means $x=a-t$. For any $t in (-a, a) ==> x in (0, 2a),$ we have $ ln(x) = ln(a-t) = ln(a) - sum_(n=1)^infinity t^n/(a^n n) = ln(a) -sum_(n=1)^infinity (a-x)^n/(a^n n) = ln(a) + sum_(n=1)^infinity (-1)^(n+1)/(a^n n)(x-a)^n. $ 
]

#problem(5)[
  Let $f:RR -> (0, infinity)$ be a positive real analytic function such that $f'(x) = f(x)$ for all $x in RR$. Show that $f(x) = C e^x$ for some positive constant $C.$
]

#proof()[
  We wish to show that $f(x)/e^x = f(x) e^(-x) = C.$ Define $g:RR -> (0, infinity)$ such that $g(x):=f(x) e^(-x)$. Then we have $g'(x) = f'(x) e^(-x) - f(x) e^(-x).$ Since $f'(x) = f(x)$ for all $x in RR$, then $g'(x) = 0.$ Then $g(x) = C$ for some constant $C>0.$ So we have $f(x) e^(-x) = C ==> f(x) = C e^x.$
]
