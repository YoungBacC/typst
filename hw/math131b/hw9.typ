#import "../../templates/hwt.typ": *
#show: conf.with("Math 131B", "Jack Olson", "June 1, 2026", "9")

#set enum(numbering: "(a)")
#problem(1)[
  Let $f, g, h in C(RR\/ZZ; CC)$. 
  + The convolution $f*g$ is continuous and $ZZ$ periodic. In other words $f*g in C(RR\/ZZ; CC)$.
  + We have $f*g = g*f$.
  + We have $f * (g+h) = f*g + f*h, space space (f+g)*h = f*h + g*h,$ and for any $c in CC$, $(c f)*g = c(f*g).$
]

#proof(append: " of (a)")[
  We first show that for fixed $epsilon >0$, there exists a $delta > 0$ such that for $x, x' in RR$ with $|x-x'|<delta$ then we have $sup_(y in [0,1]) |g(x-y) - g(x'-y)| <= epsilon.$ Fix some $epsilon > 0$. Since $g in C(RR\/ZZ; CC)$, then it is continuous on the compact set $[0,1]$, so by Theorem 2.3.4 we have that $g$ is uniformly continuous on $[0,1]$. By periodicity of $g$ we can extend the uniform continuity to all of $RR.$ So there exists $delta>0$ such that for any $u,v in RR$ with $|u-v|<delta$, then $|g(u) - g(v)|<epsilon.$ Now fix a $y in [0,1].$ Then for abirtary $x, x' in RR$ with $|x-x'|<delta$, we have that $|(x-y) - (x' -y)| = |x-x'| < delta.$ So by uniform continuity we have $|g(x-y) - g(x'-y)|<epsilon.$ Since this bound did not depend on $y$, then we can take the supremum over all $y$ and still get the same bound, i.e., $sup_(y in [0,1]) |g(x-y) - g(x'-y)| <= epsilon.$
  #v(1em)
  Now we prove continuity of $f*g$. Let $epsilon >0, x in RR.$ Note that since $f in C(RR\/ZZ; CC)$, then we have that $f$ is bounded, that is there exists som $M>0$ such that for all $x in RR$ we have $|f(x)|< M$. By the above statement we get a $delta>0$ such that for all $x' in RR$ with $|x-x'|<delta$, then $sup_(y in [0,1])|g(x-y) - g(x'-y)| <= epsilon\/(M+1).$ Then we have for all $x' in RR$ such that $|x-x'| < delta$, we have $ |(f*g)(x) - (f*g)(x')| &= abs(integral_0^1 f(y)g(x-y)d y - integral_0^1 f(y)g(x'-y) d y)\ &= abs(integral_0^1 f(y)(g(x-y) - g(x' - y)) d y)\ &<= integral_0^1 abs(f(y))abs(g(x-y) - g(x'-y)) d y\ &<= sup_(y in [0,1])abs(g(x-y) - g(x'-y)) integral_0^1 abs(f(y))d y\ &<= epsilon/(M+1) dot M < epsilon. $ This shows continuity. Now we show that $f*g$ is $ZZ$ periodic. Let $k in ZZ$. Then we have $ (f*g)(x + k) &= integral_0^1 f(y)g(x + k -y) d y\ &= integral_0^1 f(y)g(x-y) d y && "(periodicity of" g")"\ &= (f*g)(x). $ We are done.
]

#proof(append: " of (b)")[
  Note that $(f*g)(x) = integral_0^1 f(y)g(x-y)d y.$ Let $y' = x-y$. Then $d y  = -d y'.$ So we have $integral_0^1 f(y)g(x-y)d y = integral_(x)^(x-1) -g(y')f(x-y')d y'.$ By periodicity we have $integral_(x-1)^x g(y')f(x-y')d y = integral_0^1 g(y')g(x-y') d y = (g*f)(x).$
]

#proof(append: " of (c)")[
  We have $ (f*(g+h))(x) &= integral_0^1 f(y)[(g+h)(x-y)]d y\ &= integral_0^1 f(y)[g(x-y) + h(x-y)] d y\ &= integral_0^1 f(y)g(x-y) d y +  integral_0^1 f(y)h(x-y) d y\ &= (f*g)(x) + (f*h)(x). $

  From the above derivation and (b) we have $ ((f+g)*h)(x) = (h*(f+g))(x) = (h*f)(x) + (h*g)(x) = (f*h)(x) + (g*h)(x). $

  Now let $c in CC$. We have, $ c(f*g)(x) &= c integral_0^1 f(y)g(x-y)d y\ &= integral_0^1 (c f)(y) g(x-y) d y\ &= ((c f) * g)(x). $ Symmetrically we have $ c(f*g)(x) &= c integral_0^1 f(y)g(x-y)d y\ &= integral_0^1 f(y)[(c g)(x-y)] d y\ &= (f * (c g))(x). $
]
