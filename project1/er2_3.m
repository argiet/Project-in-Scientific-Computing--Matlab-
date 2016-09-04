%vector n pou periexei tis diastaseis gia tis opoies theloume na kanoume xronometrhseis 
n = 2.^[7:10];

%loop gia tis length(n) diaforetikes diastaseis
for i=1:length(n)
   
   %tyxaia kataxwrhsh arithmwn sto matrix A 
   A = rand(n(i));
    
   %handler gia thn timeit
   f = @() lu(A);
   time_lu(i) = timeit(f); %telos xronometrhshs
   %apothikeush se auto to vector to xrono ths ekastote ekteleshs ths lu(A)
   
   %tyxaia kataxwrhsh arithmwn sto vector b 
   b = rand(n(i),1);
   
   %handler gia thn timeit
   x = @() A*b;
   time_Ab(i) = timeit(x); %telos xronometrhshs
   %apothikeush se auto to vector to xrono ths ekastote ekteleshs ths lu(A)
    
end

%Emfanish apotelesmatwn xronometrhsewn
time_lu
time_Ab

% % new figure
% figure
% semilogy(n, time_lu, 'b*-', n, time_Ab, 'rx-');
% legend('time for lu','time for Axb');
% %title('Cosine and Sine')
% xlabel('n');
% ylabel('t');

% new logarithmic figure
figure
semilogy(n, time_lu, 'b*-', n, time_Ab, 'rx-'); %entolh gia grafikh parastash me logarithmikous aksones
%koinh grafikh parastash
legend('time for lu','time for Axb');%upomnima
title('Time for lu(A) and A*b using function timeit'); %titlos grafikhs parastashs
xlabel('n'); % etiketa aksona x
ylabel('t'); % etiketa aksona y


