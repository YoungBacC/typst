#import "../../templates/hwt.typ": *
#show: conf.with("Math 131B", "Jack Olson", "May 22, 2026", "7")

#problem(1)[
  Let $x in RR$.
  #set enum(numbering: "(a)")
  + We have $cos(x + pi) = - cos(x)$ and $sin(x + pi) = - sin(x)$. In particular we have $cos(x+ 2pi) = cos(x)$ and $sin(x +2pi) = sin(x).$ 

  + We have $sin(x) = 0$ if and only if $x = k pi$ where $k in ZZ$.

  + We have $cos(x) = 0$ if and only if $x = k pi + 1/2$ where $k in ZZ$
]

#proof(append: " of (a)")[
  By Theorem 4.7.2 (d) we have $cos(x + pi) = cos(x)cos(pi) - sin(x)sin(pi).$ By definition of $pi$, we have that $cos(pi) = -1$ and $sin(pi) = 0$. So we have $cos(x+pi) = -cos(x).$ Similarly, $sin(x + pi) = sin(x)cos(pi) + cos(x)sin(pi) = -sin(x).$ From these results we have, $cos(x + 2pi) = cos((x+pi) + pi) = cos(x + pi)cos(pi) - sin(x +pi)sin(pi) = cos(x).$ Symmetrically, $sin(x+2pi) = sin((x+pi) + pi) = sin(x+pi)cos(pi) + cos(x+pi)sin(pi) = sin(x).$
]

#proof(append: " of (b)")[
  $==>.$ Suppose $sin (x) = 0.$ For any $x$ we can write $x = k pi + r$ where $k in ZZ$ and $0<= r<pi$. Then we have that $sin(x) = sin(k pi + r) = 0.$ We claim that $sin(r) = 0$. By properties of $pi$, observe that $sin(x+ pi)  = -sin(x), forall x$. In other words, we have that $sin(x) = 0 <==> sin(x + pi) = 0$. So for $sin(k pi + r)$ we can repeatedly shift by $pi$ $k$-times toward 0 to get that $sin(r) = 0$. Suppose for the sake of contradiction that $r != 0$. Then by assumption $r in (0, pi),$ i.e., $r in {x >0 | sin(x) = 0}$ and $r < pi.$ But this is a contradiction since by definition $pi := inf {x >0 | sin(x) = 0}.$ So we must have that $r =0$. Thus $x = k pi$ where $k in ZZ$.\
  $<==.$ Suppose $x = k pi$ where $k in ZZ$. Then we have $sin(x) = sin(k pi)$. Note that we can write $sin(k pi) = sin(0 + k pi).$ Since $sin(0) = 0$, then by the same logic that was shown above, $sin(k pi) = 0$.
]

#set math.equation(numbering: "(1)")
#proof(append: " of (c)")[
  $==>.$ Suppose $cos(x) = 0$. We first show that $cos(x) = sin(x + pi/2).$ Note by the addition property we have $ sin(x + pi/2) = sin(x)cos(pi/2) + cos(x) sin(pi/2). $ So we need to find the values for $sin(pi/2)$ and $cos(pi/2)$. We also have $ 0 = sin(pi) = sin(pi/2 + pi/2) = 2 sin(pi/2) cos(pi/2). $ Since $sin(x) > 0$ for $x in (0, pi)$, then $sin(pi/2) > 0$. Then by $(2)$, we have $cos(pi/2) = 0$. By the addition property for $cos$ we have, $ -1 = cos(pi) = cos(pi/2 + pi/2) = cos^2(pi/2) - sin^2 (pi/2). $ Since $cos(pi/2) = 0$, then by $(3)$ we have $1 = sin^2(pi/2)$. Since we have that $sin(pi/2) >0$, then we have $sin(pi/2) = 1$. Then by (1), we have $sin(x + pi/2) = sin(x) dot 0 + cos(x) dot 1 = cos(x).$ So by assumption $sin(x + pi/2) = 0.$ By (b), $x + pi/2 = k pi => x = k pi - pi/2 => x = (k-1)pi + pi/2$. Since $k-1 in ZZ$ we are done.\
  $<==.$ Suppose $x = (k+1/2)pi$ for some $k in ZZ$. Then we have $cos(k pi + pi/2) = cos((k+1)pi - pi/2) = sin((k+1)pi) =^((b)) 0.$ 
]

#set math.equation(numbering: none)
#problem(2)[
  Let $tan: (-pi/2, pi/2) -> RR$ such that $tan(x) := sin(x)/cos(x).$ Show that $tan$ is differentiable and monotone increasing, with $(tan(x))' = 1 + tan^2(x),$ and $lim_(x->pi/2) tan(x) = +oo$ and $lim(x->-pi/2) tan(x) = -oo.$ Conclude that $tan$ is in fact a bijection from $(-pi/2, pi/2) -> RR$, and thus has an inverse function $tan^(-1): RR -> (-pi/2, pi/2).$ Show that $(tan^(-1)(x))' = 1/(1+x^2).$
]

#proof()[
  Note that $sin, cos$ are both differentiable function on $RR$ and in particular $(-pi/2, pi/2).$ Also note that $cos(x) = 0 <==> x = k pi + pi/2$ and for any $x in (-pi/2, pi/2), space x != k pi + pi/2, space forall k.$ Hence we have that $cos$ is non zero on $(-pi/2, pi/2)$. This means that $tan(x)$ is differentiable. We have $ dif/(dif x) tan(x) = dif/ (dif x) sin(x)/cos(x) = (cos(x)cos(x) - sin(x)(-sin(x)))/(cos(x))^2 = 1 + tan(x)^2. $ Note that $1 + tan(x)^2 > 0, space forall x in (-pi/2, pi/2).$ So $tan(x)$ is a strictly increasing function on its domain. \
  Now we claim that $lim_(x->pi/2) tan(x) = +oo$ and $lim_(x->-pi/2)tan(x) = -oo.$ Indeed, as $x-> pi/2$ we have that $sin(x) -> 1$ and $cos(x) -> 0^+$ since we must approach $pi/2$ from the left to stay on the domain of $tan$. This means that $tan(x) := sin(x)/cos(x)$ gets arbitarily positive as $x-> pi/2$, i.e., $tan(x) -> +oo$. Similarly as $x-> -pi/2$, $sin(x) -> -1$ and $cos(x) -> 0^+$. So $sin(x)/cos(x)$ gets arbitarily negative, i.e., $tan(x) -> -oo$.  Since $tan$ is monotone increasing, $tan$ is injective. Also since $tan$ is differentiable, and in particular continuous, we have that $tan$ is surjective since on its domain it approaches $-oo$ and $+oo$, i.e., by IVT $tan$ must reach all values in $RR$. It follows that $tan$ is bijective and hence an inverse function $tan^(-1): RR -> (-pi/2, pi/2)$ exists. By the inverse function theorem since $tan'(x) = 1+tan^2(x) >0$, we have, $ (tan^(-1)(x))' = 1/(tan'(tan^(-1)(x))) = 1/(1+tan^2(tan^(-1)(x))) = 1/(1+x^2). $
]

#set enum(numbering: "(a)")
#problem(3)[
  (Basic properties of $C(RR\/ZZ; CC)$)
  + (Boundedness) If $f in C(RR\/ZZ; CC)$, then $f$ is bounded.
  + (Vector space and algebra properties) If $f,g in C(RR\/ZZ; CC),$ then the functions $f+g$, $f-g$, and $f g$ are also in $C(RR\/ZZ; CC).$ Also if $c in CC$, then the function $c f$ is also in $C(RR\/ZZ; CC).$
  + (Closure under uniform limits) If $(f_n)_(n=1)^oo$ is a sequence of functions in $C(RR\/ZZ; CC)$ which converges uniformly to another function $f:RR-> CC$, then $f$ is also in $C(RR\/ZZ; CC).$
]

#proof(append: " of (a)")[
  We first show that $f$ is bounded on $[0,1].$ Note that $[0,1]$ is a compact inteval in $RR$. Since by assumption $f$ is continuous, then the image of $f$ on $[0,1]$ is also compact, and in particular bounded. In other words we have that there exists $M>0$ such that for any $x in [0,1]$, $|f(x)|< M$. Let $x in RR$. Note that $x$ can be written in terms of its integer and fractional part as $x = k + y$, where $k in ZZ$ and $y in [0,1)$. Since $f$ is $ZZ$-periodic by assumption, then we have $|f(x)| = |f(k +y)| = |f(y)| < M$. Thus $f$ is bounded. 
]

#proof(append: " of (b)")[
  Let $f, g in C(RR\/ZZ; CC).$ Then for any $x in RR$ and $k in ZZ$, we have that $f(x + k) = f(x)$ and $g(x +k) = g(x)$. Since $f, g$ both continuous, then $f+g$ is also continuous by the additive limit law. We also have that since $CC$ is a vector space, then $(f+g): RR -> CC$. It suffices to show that $f+g$ is $ZZ$-periodic. Take any $x in RR, k in Z$. Then $(f+g)(x + k) = f(x +k) = g(x +k) = f(x) + g(x) = (f+g)(x).$ Thus $f+g$ is $ZZ$-periodic. The proof for $f-g$ is symmetric. Continuity of $f g$ follows from the multiplication limit law, and since $CC$ is a vector space, then $f g : RR -> CC$. Take any $x in RR, k in ZZ$. Then $(f g)(x + k) = f(x+k) g(x+k) = f(x) g(x) = (f g)(x)$. So $f g$ is $ZZ$-periodic. Continuity of $c f$ follows from scalar multiplication of limits. The fact that $c f: RR -> CC$ follows from the same logic above. Take any $x in RR, k in ZZ$. Then $(c f)(x +k) = c f(x+k) = c f(x) = (c f)(x).$
]

#proof(append: " of (c)")[
  Let $(f_n)_(n=1)^oo$ be a sequence of functions in $C(RR\/ZZ; CC)$ which converges uniformly to another function $f:RR -> CC$. Let $epsilon >0$ uniform convergence there exists an $N$ such that for all $x in RR$ and $n >= N$, we have $|f_n (x) - f(x)| < epsilon\/2.$ Let $k in ZZ$. Fix $n>N$. Then for all $x in RR$, we have $|f(x) -f(x + k)| <= |f(x) - f_n(x)| + |f_n (x) - f_n (x+k)| + |f_n (x+k) - f(x+k)| < epsilon\/2 + 0 + epsilon\/2 = epsilon. $ Since $epsilon$ was arbitary, then we have that $f(x) = f(x +k)$, i.e., $f$ is $ZZ$-periodic. Also note that since $f_n -> f$ uniformly and each $f_n$ continuous, then $f$ is also continuous. It follows that $f in C(RR\/ZZ; CC).$
]

#problem(4)[
  Show that $C(RR\/ZZ; CC)$ with the sup norm metric $d_oo$ is a metric space. Furthermore show that this metric space is complete.
]

#set enum(numbering: "(1)")
#proof()[
  We need to verify the four properties of metric spaces.
  + Take any $f, g in C(RR\/ZZ; CC)$ such that $f(x) != g(x)$ for at least one $x in RR.$ Then $d_oo (f, g) = sup_(x in RR) |f(x) - g(x)| > 0$. This is because there exists $x in RR$ where $f(x) != g(x) => |f(x) - g(x)| >0$.
  + Take $f in C(RR\/ZZ; CC)$. Then $d_oo (f, f) = sup_(x in RR)|f(x) - f(x)| = 0.$
  + Take any $f, g in C(RR\/ZZ; CC).$ Then $d_oo (f, g) = sup_(x in RR) |f(x) - g(x)| = sup_(x in RR) |g(x) - f(x)| = d_oo (g, f).$
  + Take any $f,g,h in C(RR\/ZZ; CC)$. Then we have, 
  $ d_oo (f, g) &= sup_(x in RR) |f(x) - g(x)|\
  & <=^(triangle) sup_(x in RR) (|f(x) - h(x)| + |h(x) - g(x)|) \
  & <= sup_(x in RR) |f(x) - h(x)| + sup_(x in RR) |h(x) - g(x)|\
  & = d_oo (f,h) + d_oo (h, g) $

  We now show that $(C(RR\/ZZ; CC), d_oo)$ is complete. Since all functions in $C(RR\/ZZ; CC)$ are continuous and bounded, then $C(RR\/ZZ; CC) subset C(RR -> CC)$. Since $CC$ is complete when equipped with its standard metric, then $C(RR -> CC)$ is also complete when equipped with the sup norm metric by Theorem 3.4.5. Note by Lemma 5.1.5 (c), we have that $C(RR\/ZZ; CC)$ is closed with respect to the sup norm metric. Then for any cauchy sequence $(f_n)_n subset C(RR\/ZZ; CC)$ we have that $(f_n)_n subset C(RR -> CC).$ Since $C(RR -> CC)$ cauchy, then $f_n$ converges in $C(RR -> CC)$. But since $C(RR\/ZZ; CC)$ is closed and $f_n in C(RR\/ZZ; CC)$ for all $n$, then we must have that $f_n$ converges in $C(RR\/ZZ; CC).$ Hence $C(RR\/ZZ; CC)$ is complete with respect to the sup norm metric.
]