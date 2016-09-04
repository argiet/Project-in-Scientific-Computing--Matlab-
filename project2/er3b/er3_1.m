%tetragwniko mhtrwo me xrhsh rand gia n=1024
%double precision by default
A=rand(1024);
B=rand(1024);

% pol/smos me xrhsh ths mtimes
C = mtimes(A,B);


%single precision
A_single = single(A);
B_single = single(B);

% pol/smos me xrhsh ths mtimes
C_single = mtimes(A_single,B_single);

%upologismos empros sxetikou sfalmatos
%||fprog(x*)-f(x)|| / ||f(x)||

e = norm(C_single - C, inf) / norm(C, inf);

%strassen
C_strassen = strassen(A_single, B_single);

%upologismos empros sxetikou sfalmatos
%||fprog(x*)-f(x)|| / ||f(x)||
e_strassen = norm(C_strassen - C, inf) / norm(C, inf);