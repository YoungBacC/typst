#import "../../templates/hwt.typ": *
#show: conf.with("Math 132", "Jack Olson", "May 26, 2026", "7")

== #underline("V.6")
#v(1em)
#problem(1)[
  Calculate the terms through order seven of the power series expansion about $z=0$ of the function $1\/cos(z)$.
]

#solution()[
  We can write $ 1/cos(z) &= 1/(1-z^2/2! + z^4/4! - z^6/6! + O(z^8))\ &=1/(1 - (z^2/2! - z^4/4! + z^6/6! + O(z^8)))\ &= 1 + (z^2/2! - z^4/4! + z^6/6! + O(z^8)) + (z^2/2! - z^4/4! + z^6/6! + O(z^8))^2\ &+ (z^2/2! - z^4/4! + z^6/6! + O(z^8))^3 + O(z^8)\ &= 1 + 1/2 z^2 + 5/24 z^4 + 61/720 z^6 + O(z^8) $
]

#problem(3)[
  Show that $ e^z/(1+z) = 1 + 1/2 z^2 - 1/3 z^3 + 3/8 z^4 -11/30 z^5 + dots $ Show that the general term of the power series is given by $a_n = (-1)^n [1/2! - 1/3! + dots + (-1)^n/n!], n>=2.$ What is the radius of convergence of the series?
]
 #solution()[
  Note that $ e^z = 1 + z + 1/2 z^2 + 1/6 z^3 + 1/24 z^4 + 1/120 z^5 + dots $ and $ 1/(1+x) = 1/(1-(-x)) = 1 - z + z^2 - z^3 + z^4 - z^5 + dots $ So we have, $ e^z/(1+z) &= (1 + z + 1/2 z^2 + 1/6 z^3 + 1/24 z^4 + 1/120 z^5 + dots)(1 - z + z^2 - z^3 + z^4 - z^5 + dots)\ &= 1 + 1/2 z^2 -1/3 z^3 + 3/8 z^4 - 11/30 z^5 + dots $ Note that in general we have $ e^z = sum_(n=0)^oo z^n/n! " and " 1/(1+x) = sum_(n=0)^oo (-1)^n z^n. $ In general we have, $ a_n &= 1 dot (-1)^n + 1 dot (-1)^(n-1) + 1/2! (-1)^(n-2) + 1/3! (-1)^(n-3) + dots +1/n!(-1)^0 \ &= (-1)^n [1 - 1 + 1/2! (-1)^(-2) + 1/3! (-1)^(-3) + dots + 1/n! (-1)^(-n)]\ &= (-1)^n [1/2! - 1/3! + dots + (-1)^n/n!]. $ Since $1/(1+z) = sum_(n=0)^oo (-1)^n z^n$ has radius of convergence of $1$, so we must have that $e^z/(1+z) = sum_(n=0)^oo a_n z^n$ has a radius of convergence of at least $1$.
 ]

 #problem(6)[
  Show that the coefficients of a power series "depend continuously" on the function they represent, in the following sense. If $(f_m (z))_m$ is a sequence of functions which are analytic and converge uniformly to $f(z)$ for $|z|< rho$, and $f_m(z) = sum_(k=0)^oo a_(k,m) z^k, space f(z) = sum_(k=0)^oo a_m z^k,$ then for each $k>=0 $ we have $a_(k,m) --> a_k$ as $m --> oo$. 
 ]

 #proof()[
  Let $epsilon>0$, $0<r<rho$, and $k>=0$. By uniform convergence we have that there exists $M in NN$ such that for all $m>M$, $z in CC$ we have $|f_m (z) - f(z)| < epsilon r^k$. Note by Cauchy's integral formula we have that $ a_k = 1/(2 pi i) integral_(|z|= r) f(z)/z^(k+1) d z " and " a_(k,m) = 1/(2 pi i) integral_(|z|= r) f_m(z)/z^(k+1) d z. $ Then we have $ |a_(k,m) - a_m| &= 1/(2pi) abs(integral_(|z|= 1) (f_m (z) - f(z))/z^(k+1) d z)\ &<= 1/(2pi) integral_(|z|= 1) abs(f_m (z) - f(z))/abs(z^(k+1)) |d z|\  &<1/(2pi) integral_(|z|=1) (epsilon r^k)/r^(k+1) |d z|\ &= epsilon/r 1/(2pi) 2 pi r = epsilon. $ So we are done.
 ]

== #underline("V.7")
#v(1em)

#set enum(numbering: "(a)")
#problem(1)[
  Find the zeros and orders of zeros of the following:\
  (a) $(z^2 +1)/(z^2 -1)$. (c) $z^2 sin(z).$ (e) $(cos(z) - 1)/z.$
]

#solution(append: " to (a)")[
  Notice that we can write $ (z^2 + 1)/(z^2-1) = ((z-i)(z+i))/(z^2 - 1). $
  So we clearly have that $i, -i$ are zeros. Since $1/(z^2-1)$ doesn't have any zeros than these are all of them. Notice that we can write $ (z^2 +1)/(z^2-1) = (z-i) (z+i)/(z^2 -1) "and" (z^2 +1)/(z^2-1) = (z-(-i)) (z-i)/(z^2 -1). $ So by definition of the order of zeros, we have that both $i "and" -i$ are roots of order $1.$
]

#solution(append: " to (c)")[
  Note that $z^2$ has an zero at $z=0$ with order $2.$ We can also observe that $sin(z)$ has a zero at $z=0$ with order $1$ since $(sin(z))'|_(z=0) = cos(z)|_(z=0) = 1 != 0$. So to get the order of $z=0$ for $z^2 sin(z)$ we simply add the orders for each function. Hence the $z=0$ is a zero of order $3.$ Also observe that $z^2$ only has a zero at $z=0$, but $sin(z)$ has a zero at every integer multiple of $pi$, i.e. $z=k pi$, for $k in ZZ$. We already took care of the $k=0$ case, so we focus on $ in ZZ\\{0}.$ Notice, $(sin(z))'|_(z=k pi) = cos(z)|_(z=k pi) = (-1)^k != 0$. Hence $sin(z)$ has zero $z = k pi$ of order $1$ for $k in ZZ\\{0}.$ Thus $z^2sin(z)$ also has zero $z = k pi$ of order $1$ for $k in ZZ\\{0}$.  
]

#solution(append: " to (e)")[
  Note that $1/z$ has no zeros. So it suffices to find the zeros and their orders for $cos(z) - 1.$ Notice that this happens when $cos(z) = 1$. So $z = 2 pi k$ are the zeros for $cos(z) - 1$ where $k in ZZ$. However we must disclude $z=0$ since $1/z$ is undefined there. So the zeros of $(cos(z) -1)/z$ are at $z=2 pi k$ for $k in ZZ\\{0}$. Notice that $(cos(z) - 1)' = -sin(z)$ which is $0$ at $z = 2 pi k$ for any $k != 0$. But, $(cos(z) - 1)''|_(z=2pi k) = -cos(z)|_(z=2 pi k) = -1. != 0$. Hence the $z = 2pi k$ is a zero of order $2$ for every $k in ZZ\\{0}.$
]

#problem(3)[
  Show that the zeros $sin(z)$ and $tan(z)$ are all simple.
]

#proof()[
  Note that the zeros of $sin(z)$ are $z = n pi$ for $n in ZZ$. They each have order $1$ since $(sin(z))' = (cos(z))$ which is not zero for any $n pi$. So, each $z = n pi$ is of order $1$. Note, $tan(z) = sin(z)/cos(z)$. We know $1/cos(z)$ has no zeros and $cos(z) != 0 $ for any $n pi$, i.e. $1/cos(z)$ is defined for all the zeros of $sin(z).$ So the same conclusions for $sin$ also follow for $tan$.
]