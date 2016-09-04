n=512;
h=pi/(6*(n+1));

% u(0) = -6
F(1,1)= 3*exp(h) * (3*sin(3*(h)) - 2*cos(3*(h))) - (-1/h^2 *(-6));
for j=2:n-1
    F(j,1)= 3*exp(j*h) * (3*sin(3*(j*h)) - 2*cos(3*(j*h)));
end

%u(pi/6)= 9 * exp(pi/6)
F(n,1) = 3*exp(h) * (3*sin(3*(h)) - 2*cos(3*(h)))-(-1/h^2 * 9 * exp(pi/6));

for j=1:n
    u(j,1)= exp(j*h) * sin(3*(j*h)); 
end


g(1:n,1) = -1/h^2;
a(1:n,1)= 1 + 2/h^2;
b(1:n,1)= -1/h^2;
A = spdiags([g a b], -1:1, n, n);

%sxetiko kataloipo oxi mikrotero tou 10^-8
tol=10^-8;

%arxikh lush: mhdeniko dianusma
U=zeros(512,1);

%Preallocation
time_cg = 0;
time_jacobi = 0;


%First evaluations do not count
%klhsh ths cg
[U1,kataloipo_cg,iter_cg,flag,e_cg,oe_cg] = cg(A,U,F,eye(n),n,tol,u);
%klhsh ths jacobi
[U2,error,iter_jacobi,flag,e_jacobi,oe_jacobi,kataloipo_jacobi] = jacobi(A,U,F,n,tol,u);

    
%loop gia 10 epanalhpseis gia na upologisoume meta to meso oro twn xronwn 
for j=1:10

    %arxh xronometrhshs ths cg me th synarthsh tic
    tic
        %klhsh ths cg
        [U1,error,iter_cg,flag,e_cg,oe_cg,kataloipo_cg,] = cg(A,U,F,eye(n),n,tol,u);
    time_cg = toc; %telos xronometrhshs
    
    %arxh xronometrhshs ths jacobi me th synarthsh tic
    tic
        %klhsh ths jacobi
        [U2,error,iter_jacobi,flag,e_jacobi,oe_jacobi,kataloipo_jacobi] = jacobi(A,U,F,n,tol,u);
    time_jacobi = toc; %telos xronometrhshs
end

%upologismos mesou orou xronwn twn diaforwn ektelesewn twn praksewn
acc_time_cg = sum(time_cg)/j; 
acc_time_jacobi = sum(time_jacobi)/j;

iter1 = [1:iter_cg];
iter2 = [1:iter_jacobi];

% new figure
%sxetiko kataloipo pros epanalhpseis
figure
semilogy(iter1, kataloipo_cg, 'b*-', iter2, kataloipo_jacobi, 'rx-');
legend('sxetiko kataloipo cg','sxetiko kataloipo jacobi');
title('sxetiko kataloipo')
xlabel('iterations');
ylabel('sxetiko kataloipo');

% new figure
%empros sfalma pros epanalhpseis
figure
semilogy(iter1, e_cg, 'b*-', iter2, e_jacobi, 'rx-');
legend('empros sfalma cg','empros sfalma jacobi');
title('sxetiko empros sfalma');
xlabel('iterations');
ylabel('empros sfalma');

% new figure
%oliko sxetiko empros sfalma pros epanalhpseis
figure
semilogy(iter1, oe_cg, 'b*-', iter2, oe_jacobi, 'rx-');
legend('oliko sfalma cg','oliko sfalma jacobi');
title('oliko sxetiko empros sfalma');
xlabel('iterations');
ylabel('oliko sxetiko empros sfalma');

% new figure
% xronos pros epanalhpseis
figure
plot(iter_cg, acc_time_cg, 'b*-', iter_jacobi, acc_time_jacobi, 'rx-');
legend('time for cg','time for jacobi');
title('Time');
xlabel('iterations');
ylabel('time');





