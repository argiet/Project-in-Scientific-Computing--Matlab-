function [x, error, iter, flag, e_s, oe_s, s_k]  = jacobi(A, x, b, max_it, tol,u)

%  -- Iterative template routine --
%     Univ. of Tennessee and Oak Ridge National Laboratory
%     October 1, 1993
%     Details of this algorithm are described in "Templates for the
%     Solution of Linear Systems: Building Blocks for Iterative
%     Methods", Barrett, Berry, Chan, Demmel, Donato, Dongarra,
%     Eijkhout, Pozo, Romine, and van der Vorst, SIAM Publications,
%     1993. (ftp netlib2.cs.utk.edu; cd linalg; get templates.ps).
%
% [x, error, iter, flag]  = jacobi(A, x, b, max_it, tol)
%
% jacobi.m solves the linear system Ax=b using the Jacobi Method.
%
% input   A        REAL matrix
%         x        REAL initial guess vector
%         b        REAL right hand side vector
%         max_it   INTEGER maximum number of iterations
%         tol      REAL error tolerance
%
% output  x        REAL solution vector
%         error    REAL error norm
%         iter     INTEGER number of iterations performed
%         flag     INTEGER: 0 = solution found to tolerance
%                           1 = no convergence given max_it

  iter = 0;                                       % initialization
  flag = 0;

  bnrm2 = norm( b );
  if  ( bnrm2 == 0.0 ), bnrm2 = 1.0; end

  r = b - A*x;
  error(1,1) = norm( r ) / bnrm2;
  if ( error(1,1) < tol ) return, end
  
  %lush ths mldivide
  %gia na upologisoume argotera to empros sxetiko sfalma
  %thewrwntas ayth ws thewrhtika swsth lush
  xmldivide = mldivide(A,b);

  [m,n]=size(A);
  [ M, N ] = split( A , b, 1.0, 1 ); % matrix splitting

  for iter = 1:max_it,   % begin iteration

     x_1 = x;
     x   = M \ (N*x + b);  % update approximation

     %ypologismos empros sxetikou sfalmatos
     %e_s = ||fprog(x)-f(x)|| / ||f(x)||
     e_s(iter,1) = norm(x - xmldivide) / norm(xmldivide);
     
     %ypologismos olikou sxetikou empros sfalmatos
     %oe_s = ||thewrhtikh timh - upologismenh timh|| / ||thewrhtikh timh||
     oe_s(iter,1) = norm(u - x) / norm(u);
     
     %ypologismos sxetikou kataloipou
     %s_k = ||F-A*U|| / ||F|| = ||b-A*x|| /||b||
     s_k(iter,1) = norm( b - A*x) / bnrm2;
     
     error = norm( x - x_1 ) / norm( x );         % compute error
     if ( error <= tol ), break, end              % check convergence

  end

  if ( error > tol ) flag = 1; end                % no convergence

% END jacobi.m