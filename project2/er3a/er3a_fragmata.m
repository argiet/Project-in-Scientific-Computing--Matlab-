
%1.
%tyxaio mhtrwo A pou paragetai apo th randn
A = randn(512);

[c, e, p, f] = my_func(A);
c
e
p
f

%2.
%tyxaio katw trigwniko mhtrwo B pou paragetai apo thn trill
B = tril(randn(512));
[c, e, p, f] = my_func(B);
c
e
p
f

%3.
%tyxaio anw trigwniko mhtrwo pou paragetai apo thn lu
[L,U] = lu(randn(512));
[c, e, p, f] = my_func(U);
c
e
p
f
%4.
%mhtrwo pou paragetai apo thn gfpp function
D = gfpp(512);
[c, e, p, f] = my_func(D);
c
e
p
f
%5.(i)
%mhtrwo vandermonde pou paragetai apo dianusma pou epistrefei h linspace function
%isapexouses times [-1,1]
l = linspace(-1,1,512);
v1 = vander(l);
[c, e, p, f] = my_func(v1);
c
e
p
f
%5.(ii)
%mhtrwo vandermonde pou paragetai apo times Chebyshev
d = cos([1:512] * pi/513);
v2 = vander(d);
[c, e, p, f] = my_func(v2);
c
e
p
f
