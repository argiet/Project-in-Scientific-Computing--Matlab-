% %block mhtrwo
% I=eye(512);%taytotiko mhtrwo
% 
% %dhmiourgia prwtou block mhtrwou me xrhsh ths blkdiag
% %me 2 mhtrwa I sth diagwno
% B1=blkdiag(I,I);

%double precision by default
%block mhtrwo
A=eye(1024);%taytotiko mhtrwo megethous n=1024

M=10^7;
A1=rand(512);
A2=rand(512);
A3=rand(512);
A4=rand(512);

%arxikopoihsh tou 2ou block mhtrwou
B=zeros(1024);

B=[M*A1,A2;A3,A4];


% pol/smos me xrhsh ths mtimes
C = mtimes(A,B);

%single precision
A_single = single(A);
B_single = single(B);

% pol/smos me xrhsh ths mtimes
C_single = mtimes(A_single, B_single);

%upologismos empros sxetikou sfalmatos
%||fprog(x*)-f(x)|| / ||f(x)||

e = norm(C_single - C, inf) / norm(C, inf);


%pol/smos me xrhsh ths strassen
C_strassen = strassen(A_single, B_single);

%upologismos empros sxetikou sfalmatos
%||fprog(x*)-f(x)|| / ||f(x)||
e_strassen = norm(C_strassen - C, inf) / norm(C, inf);



