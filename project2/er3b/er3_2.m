%mhtrwo vandermonde gia n=1024
%double precision by default
V1=vander(rand(1024,1));
V2=vander(rand(1024,1));

% pol/smos me xrhsh ths mtimes
C = mtimes(V1,V2);

%single precision
V1_single = single(V1);
V2_single = single(V2);

% pol/smos me xrhsh ths mtimes
C_single = mtimes(V1_single, V2_single);

%upologismos empros sxetikou sfalmatos
%||fprog(x*)-f(x)|| / ||f(x)||

e = norm(C_single - C, inf) / norm(C, inf);

%strassen
C_strassen = strassen(V1_single, V2_single);

%upologismos empros sxetikou sfalmatos
%||fprog(x*)-f(x)|| / ||f(x)||
e_strassen = norm(C_strassen - C, inf) / norm(C, inf);
