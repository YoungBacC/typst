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
#v(2em)
#problem(2)[
  Let $f$ be a function in $C(RR\/ZZ; CC)$, and define the trigonometric Forier coefficients $a_n, b_n$ for $n = 0,1,2,dots$ by $ a_n := 2 integral_0^1 f(x)cos(2 pi n x) d x; space space b_n := integral_0^1 f(x) sin(2 pi n x) d x. $ 
  + Show that the series $1\/2 a_0 + sum_(n=1)^oo a_n cos(2pi n x) + b_n sin(2pi n x)$ converges to $f$ in the $L^2$ metric.
  + Show that if  $ sum_(n=1)^oo a_n "and" sum_(n=1)^oo b_n$ are absolutely convergent, then the above series actually converges uniformly to $f$, and not just in $L^2$ metric
]

#proof(append: " of (a)")[
  By the Forier Theorem we have that the series $sum_(n=-oo)^oo hat(f)(n) e_n$ converges to $f$ in the $L^2$ metric. For simplicity sake denote $I_"cos"^n := integral_0^1 f(x)cos(2pi n x) d x$ and $I_"sin"^n := integral_0^1 f(x) sin(2 pi n x) d x.$ By definition we have $hat(f)(n) e _n = ip(f, e_n)e_n = e^(2 pi i n x)integral_0^1 f(x)e^(-2 pi n x) d x.$ We shall expand this integral into sines and cosines. We have, $ hat(f)(n) e_n &= (cos(2pi n x) + i sin(2pi n x))integral_0^1 f(x)(cos(2pi n x) - i sin(2pi n x)) d x\ &= (cos(2pi n x) + i sin(2pi n x)(I_"cos"^n - i I_"sin"^n)\ &= cos(2pi n x) I_"cos"^n - i cos(2 pi n x) I_"sin"^n + i sin(2pi n x)I_"cos"^n + sin(2pi n x)I_"sin"^n. $ Now we can split the infinite sum into three parts: $ sum_(n=-oo)^oo hat(f)e_n = sum_(n=-oo)^(-1) hat(f)(n)e_n + hat(f)(0)e_0 + sum_(n=1)^oo hat(f)(n)e_n. $ In the sum from $-oo$ to $-1$ all $n<0$, so in particular we have $ sum_(n=-oo)^(-1) hat(f)(n)e_n = sum_(n=1)^oo hat(f)(-n)e_(-n). $ In the expansion of $hat(f)(-n) e_(-n)$, the first term stays the same since $cos$ is even, the second term gets a negative sign since $cos$ even and $sin$ odd, the third term also gets a negative sign by the same logic, and the last term stays the same since both $sin$ is odd and they are being multiplied. So we get
  #set math.equation(numbering: "(1)") 
   $ sum_(n=-oo)^(-1) hat(f)(n)e_(n) &= sum_(n=1)^oo hat(f)(-n)e_(-n)\ &= sum_(n=1)^oo [cos(2pi n x) I_"cos"^n + i cos(2 pi n x) I_"sin"^n - i sin(2pi n x)I_"cos"^n + sin(2pi n x)I_"sin"^n]. $

  For the positive sum we can keep it the same. We have, $ sum_(n=1)^oo hat(f)(n) e_n = sum_(n=1)^oo [cos(2pi n x) I_"cos"^n - i cos(2 pi n x) I_"sin"^n + i sin(2pi n x)I_"cos"^n + sin(2pi n x)I_"sin"^n]. $ #set math.equation(numbering: none) 
  Adding equation (1) and (2) yields $ sum_(n=-oo)^oo hat(f)(n)e_n &= hat(f)(0)e_0 + sum_(n=-oo)^(-1) hat(f)(n)e_n + sum_(n=1)^oo hat(f)(n)e_n\ &= hat(f)(0)e_0 + sum_(n=1)^oo 2 cos(2pi n x)I_"cos"^n + 2 sin(2 pi n x) I_"sin"^n. $ Note that $ hat(f)(0)e_0 = ip(f, e_0)e_0 = e^0 integral_0^1 f(x)e^0 d x = integral_0^1 f(x) = integral_0^1 f(x) cos(2 pi (0)x) d x = 1/2 a_0 $. Since $a_n = 2 I_"cos"^n$ and $b_n = 2 I_"sin"^n$ we get, $ sum_(n=-oo)^oo hat(f)(n)e_n = 1/2 a_0 + sum_(n=1)^oo cos(2pi n x)a_0 + sin(2 pi n x)b_0. $ We are done.
]

#proof(append: " of (b)")[
  By Theorem 5.5.3 if we show that $sum_(n=-oo)^oo abs(hat(f)(n))$, then we have that $sum_(n=-oo)^oo hat(f)(n) e_n$ uniformly converges to $f.$ So by equality we will have that the series in (a) will also coverge uniformly to $f.$
  As done in (a) we have that $sum_(n=-oo)^oo |hat(f)(n)| = |hat(f)(0)| + sum_(n=-oo)^(-1) |hat(f)(n)| + sum_(n=1)^oo |hat(f)(n)|.$ Since $hat(f)(0)$ is just a constant, then if we show that $sum_(n=-oo)^(-1) |hat(f)(n)| " and " sum_(n=1)^oo |hat(f)(n)|$ both converge absolutely then we are done. We can write $ sum_(n=-oo)^(-1) |hat(f)(n)| &= sum_(n=1)^oo |hat(f)(-n)|\ &= sum_(n=1)^oo abs(integral_0^1 f(x)(cos(2pi n x) - i sin(2pi n x))d x)\ &= sum_(n=1)^oo abs(integral_0^1 f(x)cos(2 pi n x) d x -i integral_0^1 f(x)sin(2 pi n x) d x)\ &<=^(triangle) sum_(n=1)^oo abs(integral_0^1 f(x)cos(2 pi n x) d x) + abs(integral_0^1 f(x) sin(2 pi n x))\ &= sum_(n=1)^oo 1/2abs(a_n) + 1/2abs(b_n). $ Note that by assumption $sum_(n=1)^oo |a_n|$ and $sum_(n=1)^oo abs(b_n)$ coverge absolutely, so by comparison we have that $sum_(n=-oo)^(-1) abs(hat(f)(n))$ also converges absolutely. The proof for why $sum_(n=1)^oo abs(hat(f)(n))$ converges is symmetric to the one done above. So we are done.
]


