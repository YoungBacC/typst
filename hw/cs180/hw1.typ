#import "../../templates/hwt.typ": *
#show: conf.with("CS 180", "Jack Olson", "Jun 26, 2026", "1")
Student ID: 706709610

#set enum(numbering:"(a)")
#problem(1)[
 + Prove by induction on $n$ that for all integers $n>=1,$ $1 + 4 + 7 + dots + (3n - 2) = n(3n - 1)\/2.$

 + Let $x$ and $y$ be positive real numbers. Prove by contradiction: if $x^2 - y^2 = 1$, then $x$ or $y$ (or both) are not integers. 
]

#proof(append: " of (a)")[
We first prove the base case, i.e., $n = 1$. When $n = 1$, the LHS is $1$. The RHS is $(1)(3(1) - 1)\/2 = 1.$ \
Now assume we have $1 + 4 + 7 + dots + (3n - 2) = n(3n -1)\/2$ up to some $n >=1$. Then $ 1 + 4 + 7 + dots + (3n - 2) + (3(n+1) - 2) &= n(3n - 1)/2 + 3(n + 1) - 2\ &= (n(3n - 1) + 6(n + 1) - 2)/2\ &= (3n^2 - n + 6n + 6 - 4)/2\ &= (3n^2 +5n + 2)/2\ &= ((n+1)(3n +2))/2\ &= ((n+1)(3(n+1) - 1))/2. $ By induction on $n$ we are done. 
]

#proof(append: " of (b)")[
  Let $x$ and $y$ be positive real numbers such that $x^2 - y^2 = 1$. Suppose for the sake of contradiction that $x,y in ZZ.$ By difference of squares formula we have $x^2 - y^2 = (x - y)(x+y).$ Then by assumption we have $(x-y)(x+y) = 1.$ Since $x,y in ZZ$ then $x-y, x+y in ZZ$. We have two cases, $x-y = 1$ and $x+y = 1$ or $x-y = -1$ and $x +y = -1$.\
  *Case 1:* $x-y =1 $ and $x+y = 1$ means that $x = 1$ and $y =0$. This is a contradiction since $x$ and $y$ must be both positive.\
  *Case 2:* $x-y = -1$ and $x+y = -1$ means that $x=-1$ and $y = 0$. This is a contradiction since both $x$ and $y$ must be positive.\
  Since we have covered all cases and have a contradiction in both, then it follows that our assumption must be false and we have that $x$ or $y$ (or both) are not integers.
]

#problem(2)[
  Indicate the relationships between each pair of functions $(A,B)$ listed below.
]

#solution()[
  #table(columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  [$A$],[$B$], [$A in o(B)$], [$A in O(B)$], [$A in theta(B)$], [$A in Omega(B)$], [$A in omega(B)$],
  [$log_2 (n)$], [$log_5 (n)$], [No], [Yes], [Yes], [Yes], [No],
  [$log log (n)$], [$sqrt(log (n))$], [Yes], [Yes], [No], [No], [No],
  [$n^(3\/4)log(n)$], [$n^log(n)$], [Yes], [Yes], [No], [No], [No],
  [$2^(log^6(n))$], [$n^6$], [No], [No], [No], [Yes], [Yes],
  [$n^3 2^n$], [$3^n$], [Yes], [Yes], [No], [No], [No]
  )
]

#set enum(numbering: "(a)")

#problem(3)[
  For each of the psuedocode snippets below, give the asymmtotic running time in $Theta$ notation and explain how you derived it.

  + ``` 
    for i = 1 to n do
      j = 0;
      while j <= i do
        j = j + 2;
      end
    end
    ```

  + ```
    i = 2;
    while i <= n do
      i = i^2;
    end
    ```
]

#solution()[\
  + Claim: the algorithm is $Theta(n^2)$.\ For fixed $i$, the inner loop does $floor(i\/2) + 1$ iterations. I figured this out through trial and error of different $i$ values. Since this happens for each iteration of the outer loop and the outer loop does $n$ iterations, then we have $sum_(i=1)^n (floor(i\/2) + 1)$ total iterations. The floor function only adds a constant factor so we can get rid of it. We will have $Theta(sum_(i=1)^n i + 1) = Theta(n(n+1)\/2 + n) = Theta(n^2).$
  + Claim: the algorithm is $Theta(log log (n)).$\ We can trace through the while loop and see what happens to $i$ after each iteration. We get: $i_0 = 2$, $i_1 = 2^2$, $i_2 = 2^4$, $i_3 = 2^8, dots$, $i_n = 2^(2^n)$. So the stopping point is $log log (n)$ iterations, i.e., the algorithm is $Theta(log log (n))$ as we claimed.
]

#problem(4)[
  Let $A$ be an array of size $n$ which contains only positive integer. Give an algorithm which takes as input such an array $A$ and finds the SMALLEST element with MINUMUM frequency. Additionally, provide the time complexity of your algorithm in terms of $n$.
]

#solution()[
  #block(stroke:1pt, inset: 15pt)[
  ```
  input: Let A be the array of size n

  let F be an empty hash-map/dictionary

  // set all frequencies
  for item in A do
    F[item] = F[item] + 1;
  end

  //get min freq
  let min_freq = n;
  for item in A do 
    if F[item] < min_freq do
      min_freq = F[item];
  end

  //get all elements with min frequency
  let M be an empty list;
  for item in A do
    if F[item] == min_freq do
      add item to M;
  end

  //find min value among min frequencies
  let num be the first element of M;
  for item in M do
    if item < num do
     num = item;
  end

return num;
```
  ]
*Complexity Analysis:* The first loop we iterate over all $n$ elements on $A$ and perform some arithmetic operation. This loop is $O(n)$. The next loop we also iterate over every element of $A$ and perform $O(1)$ operations. So this loop is also $O(n).$ The next loop we again loop over $A$ and perform $O(1)$ operations. This loop is $O(n).$ The last loop we iterate over $M$ which is at most of size $n$ so the loop is $O(n)$ since it only contains $O(1)$ operations. So in total our algorithm is $O(n).$ We must note that this complexity analysis assumes that hash-map/dictionary operations are $O(1)$ which is expected, but at worst they can be $O(n)$. In that case our algorithm would be $O(n^2)$.
]

#problem(5)[
  Gale and Shapely published their paper on the Stable Matching Problem in 1962; but a version of their algorithm had already been in use for ten years by the National Resident Matching Program, for the problem of assigning medical residents to hospitals.
  
  Basically, the situation was the following. There were $m$ hospitals, each with a certain number of available positions for hiring residents. There were $n$ medical students graduating in a given year, each interested in joining one of the hospitals. Each hospital had a ranking of the students in order of preference, and each student had a ranking of the hospitals in order of preference. We will assume there were more students graduating than there were slots available in the $m$ hospitals.
  
  The interest, naturally, was in finding a way of assigning each student to at most one hospital, in such a way that all available positions in all hospitals were filled. (Since we are assuming a surplus of students, there would be some students who do not get assigned to any hospital.)

  We say that an assignment of students to hospitals is stable if neither of the following situations arises.
  - First type of instability: There are students $s$ and $s'$ and a hospital $h$ such that
    - $s$ is assigned to $h$, and
    - $s'$ is assigned to no hospital, and
    - $h$ prefers $s'$ to $s$.
  - Second type of instability: There are students $s$ and $s'$ and hospitals $h$ and $h'$ such that 
    - $s$ is assigned to $h$, and
    - $s'$ is assigned to $h'$, and
    - $h$ prefers $s'$ to $s$, and
    - $s'$ prefers $h$ to $h'$.

  Show that there is always a stable assignment of students to hospitals, and give an algorithm to find one. Additionally provide a time complexity analysis of the algorithm.
]

#solution()[
  #block(stroke: 1pt, inset:10pt)[
  ```
  Algorithm(Preference list for n Students and m Hospitals)
  let M be an empty map;
  while (some student s is unmatched and hasn't proposed to every hospital on their preference list) do
    let h be the first hospital on s's preference list which they haven't proposed to;
    if (M[h] isn't full) add s to h's matches in M;
    else 
      let s' be h's least preferred student;
      if (h prefers s to s') remove s' from M[h] and replace add s to M[h];
      else h rejects s, M stays the same
  ```
  ]
  We now prove that this algorithm always finds a stable matching.
  #proof()[
    Assume for the sake of contradiction that algorithm outputs a matching $M$ which is not stable, i.e., it has at least one instability. We have two cases.\
    *Case 1:* There is a student $s$ and hospital $h$ with $s in M[h]$ and some $s'$ not assigned to any hospital such that $h$ prefers $s'$ to $s$. We have two subcases
    - $s'$ was never matched to a hospital. Then everytime $s'$ came up in the while loop, all hospitals were full and rejected $s.$ This means that 
  ]

]