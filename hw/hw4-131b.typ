#import "../templates/hwt.typ": *
#show: conf.with("May 6, 2026", 4)

#problem(1)[
  Explain all the why's in the example of a sequence of differentiable functions converging uniformly to a non-differentiable function given in *$section text(3.7)$* in the textbook.
]

Define $f_n:[-1,1]-> RR$ defined by $f_n (x) = sqrt(1/n^2 + x^2)$. These functions are differentiable. (Why?)  We can take the derivative to show that it exists: 

$ f_n '(x)=1/2 (1/n^2 + x^2)^(-1/2) dot 2x = x (1/n^2 + x^2)^(-1/2) $

These functions is defined for all $x in [-1,1]$. Thus the derivatives exist for all $n$. 

Also one can check that 

$ |x| <= f_n (x) <= |x| + 1/n $ for all $x  in [-1,1].$ (Why?) Its clear that we have 

$ f_n (x) = sqrt(1/n^2 + x^2) >= sqrt(x^2) = |x| $ since $1/n^2$ is just a positive number. For the second inequaltiy we have 

$ & f_n (x) = sqrt(1/n^2 + x^2) \
<==> quad & (f_n (x))^2   = 1/n^2 + x^2 
   <= 1/n^2 + 2 1/n |x| + x^2 = (1/n + |x|)^2 \
<==> quad & f_n (x) <= 1/n + |x|. $

Thus we have $ |x| <= f_n (x) <= 1/n + |x|. $

So by the squeeze theorem $f_n (x) --> f(x) := |x|$ uniformly. But this function is not differentiable at $x=0$ (why?). Note how $|x|$ is defined: 

$ |x| := cases(-x "if" x < 0, x "if" x > 0). $

We see that as $x$ approaches $0$ from the left, the derivative is $-1$, but from the right the derivative is $1$. Hence there is a mismatch in the limits from both sides which implies that such a limit does not exist. We conclude that the uniform limit of a differentiable function need not be differentiable.

#v(1cm)

#problem(2)[
  Let $[a,b]$ be an interval, and for every integer $n>=1$, let $f_n : [a,b] -> RR$ be a differentiable function whose derivative $f_n ' : [a,b]-> RR$ is continuous. Suppose that the derivatives $f_n '$ converge uniformly to a function $g : [a,b]-> RR.$ Suppose that there also exists a point $x_0$ such that the limit $lim_(n -> infinity) f_n (x_0)$ exists. Then the functions $f_n$ converge uniformly to a differentiable function $f$, and the derivative of $f$ equals $g$.
]

#proof()[
  Since $f'_n$ continuous, then by FTC we have $f_n (x) - f_n (x_0) = integral_([x_0,x])f'_n$ when $ x in [x_0, x]$, and $f_n (x) - f_n (x_0) = -integral_([x,x_0])f_n '$ when $ x in [x, x_0].$ Let $L:= lim_(n -> infinity)f_n (x_0).$ By the hypothesis, $L$ exists. Since each $f_n '$ is continuous and $f'_n --> g$ uniformly, then g is also continuous. Now define $f(x) := L + integral_([x_0,x])g$, for all $x in [a,b]$. Let $epsilon >0.$ Then by the uniform convergence of $f'_n$ to $g$, we have there exists an $N_1$ such that for all $n>N_1, x in [a,b]$, $|f'_n (x) - g(x)|< epsilon$. Since $f_n (x_0)$ converges to $L$, then we have that there exists $N_2$ such that for all $n>N_2$, $|f_n (x_0) - L| < epsilon.$ Then we have, 

  $ abs(integral_([x_0,x])(f'_n - g)) & <=^((triangle)) integral_([x_0,x])abs((f'_n - g)) \ 
  & < integral_([x_0,x]) epsilon space d t\
  & = epsilon|x-x_0|. $

  Note that $|x-x_0|<= (b-a)$ since $x,x_0 in [a,b]$. So we get, 

  $ abs(integral_([x_0,x])(f'_n - g)) < epsilon(b-a). $

  Take $N:=max(N_1, N_2)$. Then we have for all $n>N, x in [a,b],$

  $ abs(f_n (x) - f(x)) & = abs(f_n (x_0) + integral_([x_0, x])f'_n - L - integral_([x_0,x])g)\
  & <= abs(f_n (x_0) - L) + abs(integral_([x_0,x])(f'_n - g))\
  & <epsilon + epsilon(b-a) = epsilon(b-a+1). $

  Since $epsilon$ was taken to be arbitrary, then we have that

  $ abs(f_n (x) - f(x)) --> 0 $

  Thus, $f_n --> f(x)$ uniformly. It remains to show that we have $f'(x)=g.$ We can simply take the derivative of $f$: $f'(x) = (L + integral_([x_0,x])g)' stretch(=)^("FTC") 0 + g(x) = g(x)$. 
]

#v(2cm)

#problem(3)[
  Suppose $f_n : [a,b]-> RR$ is differentiable and $f'_n:[a,b]->RR$ is continuous for every $n$. If $sum_(n=1)^infinity||f'_n||_infinity$ is absolutely convergent, and $sum_(n=1)^infinity f(x_0)$ converges for some $x_0 in [a,b],$ then $sum f_n$ converges uniformly to some differentiable function on $[a,b],$ and 

  $ dif/(dif x) sum_(n=1)^infinity f_n (x) = sum_(n=1)^infinity dif/(dif x) f_n(x) = sum_(n=1)^infinity f'_n(x) $
]

#proof()[
  Since all $f_n$ is differentiable, then a finite sum $sum_(n=1)^N f_n$ is also differentiable for every $N$. Similarly, since all $f'_n$ are continuous, then $sum_(n=1)^N f'_n$ also is continuous. Additionally by assumption since $sum_(n=1)^infinity ||f'_n||_infinity$ converges, then by the Weierstrass M-Test $sum_(n=1)^N f'_n$ converges uniformly to $sum_(n=1)^infinity f'_n$. By assumption we have $sum_(n=1)^infinity f_n (x_0)$ exists for some $x_0 in [a,b]$. Then $sum_(n=1)^N f_n$ and $sum_(n=1)^N f'_n$ satisfy the hypothesis of Theorem 3.7.1. So we have that $sum_(n=1)^N f_n$ converges uniformly to $sum_(n=1)^infinity f_n$ which is differentiable, and $ dif/(dif x) sum_(n=1)^infinity f_n = sum_(n=1)^infinity f'_n = sum_(n=1)^infinity dif/(dif x) f_n $
  This is what we wanted to show.
]

#problem(4)[
  Show that $sum_(n=1)^infinity 4^(-n) cos(32^n pi x)$ converges uniformly.
]

#proof()[
  Note, $sum_(n=1)^infinity ||4^(-n) cos(32^n pi x)||_infinity = sum_(n=1)^infinity 4^(-n)$ since $|cos(32^n pi x)|<=1$. We know that $sum_(n=1)^infinity 4^(-n)$ converges, so by Weierstrass M-Test we have that $sum_(n=1)^infinity 4^(-n) cos(32^n pi x)$ converges uniformly.
]

#set enum(numbering: "(a)")
#problem(5)[
  Let $sum_(n=0)^infinity C_n (x-a)^n$ be a formal power series, and let $R$ be its radius of convergence.

  + If $x in RR$ is such that $|x-a|>R$, then $sum_(n=0)^infinity C_n (x-a)^n$ is divergent for that value of $x$.

  + If $|x-a|<R$, then $sum_(n=0)^infinity C_n (x-a)^n$ converges absolutely.

  + For any $0<r<R$, the series $sum_(n=0)^infinity C_n (x-a)^n$ converges uniformly to $f$ on the compact interval $[a-r, a+r]$. In particular $f$ is continuous on $(a-R, a+R)$.
  
]

#proof(append: " of (a)")[
  
]

