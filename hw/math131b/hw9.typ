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
  Let $f$ be a function in $C(RR\/ZZ; CC)$, and define the trigonometric Fourier coefficients $a_n, b_n$ for $n = 0,1,2,dots$ by $ a_n := 2 integral_0^1 f(x)cos(2 pi n x) d x; space space b_n := integral_0^1 f(x) sin(2 pi n x) d x. $ 
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


#problem(3)[
  Let $f(x)$ be the function defined by $f(x) = (1-2x)^2$ when $x in [0,1)$, and extend to be $ZZ$ periodic for the rest of the real line.
  + Using exercise 5.5.1, show that $1\/3 + sum_(n=1)^oo 4/(pi^2 n^2) cos(2 pi n x)$ converges uniformly to $f.$
  + Conclude that $sum_(n=1)^oo 1/n^2 = pi^2/6.$
  + Conclude that $sum_(n=1)^oo 1/n^4 = pi^2/90.$
]

#proof(append: " of (a)")[
  We shall find $a_n$ and $b_n$ from the previous problem. For $a_n$ we have $ 2integral_0^1 (1-2x)^2 cos(2pi n x) d x = underbrace(2 integral_0^1 cos(2pi n x), (1)) - underbrace(8 integral_0^1 x cos(2pi n x) d x, (2)) + underbrace(8 integral_0^1 x^2 cos(2 pi n x) d x, (3)). $ We will solve (1), (2), and (3) independently. For (1) we have, $ 2 integral_0^1 cos(2 pi n x) d x = 2 [sin(2pi n x)/(2 pi n)]_0^1 = 0. $ For (2) we have, $ 8 integral_0^1 x cos(2 pi n x) d x &= 8 integral_0^1 x d(sin(2 pi n x)/(2 pi n))\ &=^("IBP") 8((x sin(2pi n x))/(2 pi n) stretch(|, size: #250%)_0^1 - integral_0^1 sin(2pi n x)/(2pi n) d x)\ &= 8(0 - 0)\ &= 0. $ For (3) we have, $ 8 integral_0^1 x^2 cos(2pi n x) &= 8 integral_0^1 x^2 d (sin(2pi n x)/(2 pi n))\ &= 8((x^2 sin(2pi n x))/(2 pi n) stretch(|, size: #250%)_0^1 - integral_0^1 2 x sin(2 pi n x)/(2 pi n) d x)\ &= 8(0 - 1/(pi n)integral_0^1 x d(-cos(2pi n x)/(2 pi n)))\ &= -8/(pi n)((- x cos(2pi n x))/(2pi n) stretch(|, size: #250%)_0^1 + 1/(2 pi n) integral_0^1 cos(2 pi n x) d x)\ &= -8/(pi n)(-1/(2 pi n) + 0)\ &= 4/(pi^2 n^2). $ So we have that $a_n = 4\/(pi^2 n^2).$ We will now find $b_n.$ We have, $ 2integral_0^1 (1-2x)^2 sin(2 pi n x) d x &= underbrace(2 integral_0^1 sin(2pi n x), (1)) - underbrace(8 integral_0^1 x sin(2pi n x) d x, (2)) + underbrace(8 integral_0^1 x^2 sin(2 pi n x) d x, (3)). $ Similaryly we will solve (1), (2), and (3) independently. For (1) we have,
  $ 2 integral_0^1 sin(2 pi n x) = -2[cos(2 pi n x)/(2 pi n)]_0^1 = 0. $ For (2) we have, $ -8 integral_0^1 x sin(2 pi n x) d x &= 4integral_0^1 x d(-cos(2 pi n x)/(2 pi n))\ &= -8((-x cos(2pi n x))/(2 pi n) stretch(bar, size: #250%)_0^1 + integral_0^1 cos(2 pi n x)/(2 pi n) d x)\ &= -8(-1/(2 pi n) +0)\ &= 4/(2 pi n). $ For (3) we have, $ 8 integral_0^1 x^2 sin(2 pi n x) d x &= 8integral_0^1 x^2 d(-cos(2 pi n x)/(2 pi n))\ &= 8((-x^2 cos(2 pi n x))/(2pi n) stretch(bar, size: #250%)_0^1 + underbrace(integral_0^1 2 x cos(2 pi n x)/(2 pi n)d x, "0 from" a_n "calculation"))\ &= 8(-1/(2 pi n) +0)\ &= -4/(2pi n). $ So we have that $b_n = 4/(2pi n) - 4/(2pi n) = 0.$ Now we need $a_0.$ We have $ a_0 &= 2 integral_0^1 (1-2x)^2 d x = [-(1-2x)^3/3]_0^1 = 2/3. $ Since both $ sum_(n=1)^oo abs(a_n) = sum_(n=1)^oo abs(4/(pi^2 n^2)) " and " sum_(n=1)^oo abs(b_n) = sum_(n=1)^oo 0 $ both converge absolutely, then by problem 2, we have that $ 1/2 dot 2/3 + sum_(n=1)^oo 4/(pi^2 n^2) cos(2 pi n x) = 1/3 + sum_(n=1)^oo 4/(pi^2 n^2)cos(2 pi n x) $ converges uniformly to $(1-2x)^2.$ 
  ]

  #proof(append: " of (b)")[
    We have $f(x) = (1-2x)^2 = 1/3 + sum_(n=1)^oo 4/(pi^2 n^2) cos(2 pi n x)$ where $x in [0,1)$. For $x =0$ we have $ 1=sum_(n=1)^oo 4/(pi^2 n^2) ==> pi^2/4 = sum_(n=1)^oo 1/n^2. $
  ]

  #proof(append: " of (c)")[
    We can expand the series into its exponential parts. We have $ 1/3 + sum_(n=1)^oo 4/(pi^2 n^2)cos(2 pi n x) &= 1/3 + sum_(n=1)^oo 4/(2 pi^2 n^2)(e_n + e_(-n))/2\ &= 1/3 + sum_(n=1)^oo 2/(pi^2 n^2)e_n + sum_(n=1)^oo 2/(pi^2 n^2)e_(-n)\ &= 1/3 + sum_(n=1)^oo 2/(pi^2 n^2) e_n + sum_(n=-oo)^(-1) 2/(pi^2 n^2) e_n. $ So then $hat(f)(n) = 2/(pi^2 n^2)$ when $n != 0$ and $hat(f)(0) = 1/3.$ Now we find $norm(f)_2^2.$ We have, $ norm(f)_2^2 &= ip(f,f)\ &= ip((1-2x)^2, (1-2x)^2)\ &= integral_0^1 (1-2x)^4 d x\ &= -1/10(1-2x)^5 stretch(|, size: #150%)_0^1\ &= 1/5. $ So by Plancherel's Theorem we have, $ 1/5 &= 1/9 + sum_(n=1)^oo 4/(pi^4 n^4) + sum_(n=-oo)^(-1) 4/(pi^4 n^4)\ 4/45 &= sum_(n=1)^oo 4/(pi^4 n^4) + sum_(n=1)^oo 4/(pi^4 n^4)\ 4/45 &= 2sum_(n=1)^oo 4/(pi^4 n^4)\ pi^4/90 &= sum_(n=1)^oo 1/n^4. $
  ]

  #problem(4)[
    If $f in C(RR\/ZZ; CC)$ and $P$ is a trigonometric polynomial, show that $ hat(f * p)(n) = hat(f)(n) c_n = hat(f)(n) hat(P)(n) $ for all integers $n.$ More generally, if $f,g in C(RR\/ZZ; CC),$ show that $ hat(f*g)(n) = hat(f)(n)hat(g)(n) $ for all integers $n.$
  ]

  #proof()[
    Let $P(x) = sum_(m=-M)^M c_m e_m.$ Then we want to find $hat(f*P)(n).$ Note by definition we have $hat(f*P)(n) = ip(f*P, e_n).$ Let this be equation (1). We will simplify $f*P(x)$ first. We have, $ f*P(x) &= (f* sum_(m=-M)^M c_m e^(2 pi i m x))(x)\ &= integral_0^1 f(y) sum_(m=-M)^M c_m e^(2 pi i m (x-y)) d y\ &= sum_(m=-M)^M c_m e^(2 pi i m x) integral_0^1 f(y) e^(-2 pi i m y) d y\ &= sum_(m=-M)^M c_m e^(2 pi i m x) hat(f)(m). $ Plugging this result into (1) gives, $ hat(f * P)(n) &= integral_0^1 sum_(m=-M)^M c_m e^(2 pi m x) hat(f)(m) e^(-2 pi i n x) d x\ &= sum_(m=-M)^M c_m hat(f)(m) integral_0^1 e^(2 pi i (m-n) x) d x\ &= sum_(m=-M)^M c_m hat(f)(m) ip(e_m, e_n) $ where $ip(e_m, e_n) = 1$ if $m = n$ and $0$ otherwise. So if $abs(n)<= M$ then we have that $ hat(f * P)(n) = sum_(m=-M)^M c_m hat(f)(m) ip(e_m, e_n) = cases(c_n hat(f)(m) "  if" abs(n)<= M, 0 "          else") $ Note that $ hat(P)(n) = ip(P, e_n) = integral_0^1 sum_(m=-M)^M c_m e_m e_(-n) d x = sum_(m=-M)^M c_m integral_0^1 e_m e_(-n) d x = sum_(m=-M)^M c_m ip(e_m, e_n) = cases(c_n "if" abs(n)<= M, 0 "else"). $ So then we can write $ hat(f * P)(n) = hat(f)(n) hat(P)(n) $ for all $n in ZZ$.\ Now we prove the general case. Let $g in C(RR\/ZZ; CC)$. By Weierstrass approximation theorem we have that there exists a sequence of trigonometric polynomials $(P_N)_(N in NN)$ such that $norm(g - P_N)_oo --> 0$. So for fixed $N in NN$ we have that $hat(f*P_N)(n) = hat(f)(n)hat(P_N)(n)$ by the first part. If we can show that as $N->oo$ we have that $hat(f*P_N)(n) --> hat(f * g)(n)$ and $hat(f)(n)hat(P_N)(n) --> hat(f)(n)hat(g)(n)$ then we are done. We will show each side separately.\ 
    *Lemma:* If $h_k --> h$ uniformly, then $hat(h_k)(n) --> hat(h)(n)$ for fixed $n in ZZ$. \
    Let $epsilon>0$. Since $h_k --> h$ uniformly, then there is a $K$ such that for all $k>K$ and $x in RR$ we have that $norm(h_k (x) - h(x))_oo < epsilon.$ Notice, $ abs(hat(h_k)(n) - hat(h)(n)) &= abs(integral_0^1 h_k (x) e^(-2 pi i n x) d x - integral_0^1 h(x) e^(-2 pi i n x) d x)\ &= abs(integral_0^1 (h_k (x) - h(x))e^(-2 pi i n x) d x)\ &<= integral_0^1 abs(h_k (x) - h(x)) underbrace(abs(e^(- 2pi i n x)), =1) d x\ &= integral_0^1 abs(h_k (x) - h(x)) d x\ &<= norm(h_k (x) - h(x))_oo < epsilon. $ *Claim:* $f*P_N --> f*g$ uniformly. Indeed we have, $ abs(f*P_N (x) - f*g ) &= abs(integral_0^1 f(y) P_N (x - y) d y - integral_0^1 f(x)g(x-y) d y)\ &= abs(integral_0^1 f(y)(P_N (x-y) - g(x-y))d y)\ &<= integral_0^1 abs(f(y)) abs(P_N (x-y) - g(x-y)) d y\ &<= norm(f)_oo norm(P_N - g)_oo. $ Since $f$ bounded and $P_N --> g$ uniformly then we have proven the claim. So we can apply $f*P_N$ to our lemma above. We have that $hat(f*P_N) --> hat(f* g).$ Now since $P_N --> g$ uniformly, then from the lemma we have $hat(P_N) --> hat(g)$. Hence we have $hat(f)(n) hat(P_N)(n) --> hat(f)(n) hat(g)(n). $ So we are done.
    
  ]

