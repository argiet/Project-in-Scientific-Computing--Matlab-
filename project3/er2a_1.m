n=512;

Q=orth(rand(n)); %tyxaio orthokanoniko mhtrwo
%diagwnio mhtrwo
L=diag([0.7*ones(1,n/4), 1.2*ones(1,n/4), 2*ones(1,n/2)]);

A=hess(Q'*L*Q); %mhtrwo hessenberg
F=A*ones(n,1); %ypologismos deksiou melous 

%thewrhtikh lush
u=ones(n,1);

%sxetiko kataloipo oxi mikrotero tou 10^-8
tol=10^-8;

%arxikh lush: mhdeniko dianusma
%parametros eisodou stis synarthseis
U=zeros(512,1);

%Preallocation
time_cg = 0;
time_jacobi = 0;

%First evaluations do not count
%klhsh ths cg
[U1,error,iter_cg,flag,e_cg,oe_cg,kataloipo_cg] = cg(A,U,F,eye(n),n,tol,u);
%klhsh ths jacobi
[U2,error,iter_jacobi,flag,e_jacobi,oe_jacobi,kataloipo_jacobi] = jacobi(A,U,F,n,tol,u);

    
%loop gia 10 epanalhpseis gia na upologisoume meta to meso oro twn xronwn 
for j=1:10

    %arxh xronometrhshs ths cg me th synarthsh tic
    tic
        %klhsh ths cg
        [U1,error,iter_cg,flag,e_cg,oe_cg,kataloipo_cg] = cg(A,U,F,eye(n),n,tol,u);
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

%dianusmata me times 1-arithmo epanalipsewn
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



