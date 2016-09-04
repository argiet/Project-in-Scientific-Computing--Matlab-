%vector n pou periexei tis diastaseis gia tis opoies theloume na kanoume xronometrhseis 
n = 2.^[7:10];

%loop gia tis length(n) diaforetikes diastaseis
for i=1:length(n)
    
    %tyxaia kataxwrhsh arithmwn sto matrix A kai sto vector b
    A = rand(n(i));
    b = rand(n(i),1);
  
    %arxh xronometrhshs me th synarthsh tic
    tic
        lu(A);
    time_lu(i) = toc; %telos xronometrhshs
    %apothikeush se auto to vector to xrono ths ekastote ekteleshs ths lu(A)
       
    tic
        A*b;
    time_Ab(i) = toc; %telos xronometrhshs
    %apothikeush se auto to vector to xrono ths ekastote ekteleshs tou A*b
end
 
%Emfanish apotelesmatwn xronometrhsewn
time_lu
time_Ab

% new figure
figure
plot(n, time_lu, 'b*-', n, time_Ab, 'rx-'); %thetoume ston aksona twn x tis diastaseis kai ston aksona twn y to xrono
%koinh grafikh parastash
legend('time for lu','time for Axb'); %upomnima
title('Time for lu(A) and A*b'); %titlos grafikhs parastashs
xlabel('n'); % etiketa aksona x
ylabel('t'); % etiketa aksona y

% new logarithmic figure
figure
semilogy(n, time_lu, 'b*-', n, time_Ab, 'rx-'); %entolh gia grafikh parastash me logarithmikous aksones
legend('time for lu','time for Axb');%upomnima
title('Time for lu(A) and A*b'); %titlos grafikhs parastashs
xlabel('n'); % etiketa aksona x
ylabel('t'); % etiketa aksona y
