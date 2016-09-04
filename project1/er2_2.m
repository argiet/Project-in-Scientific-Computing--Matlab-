%vector n pou periexei tis diastaseis gia tis opoies theloume na kanoume xronometrhseis 
n = 2.^[7:10];

%Preallocation
acc_time_lu = zeros(1, length(n));
acc_time_Ab = zeros(1, length(n));

%loop gia tis length(n) diaforetikes diastaseis
for i=1:length(n)
    
    %tyxaia kataxwrhsh arithmwn sto matrix A kai sto vector b
    A = rand(n(i));
    b = rand(n(i),1);
    
    %Preallocation
    time_lu = zeros(10,1);
    time_Ab = zeros(10,1);
    
    %First evaluations
    %do not count
    lu(A);
    A*b;
    
    %loop gia 10 epanalhpseis gia na upologisoume meta to meso oro twn xronwn 
    for j=1:10
        
        %arxh xronometrhshs me th synarthsh tic
        tic
            lu(A);
        time_lu(j) = toc; %telos xronometrhshs
        %apothikeush se auto to vector to xrono ths ekastote ekteleshs ths lu(A)
       
        %arxh xronometrhshs me th synarthsh tic
        tic
            A*b;
        time_Ab(j) = toc; %telos xronometrhshs
        %apothikeush se auto to vector to xrono ths ekastote ekteleshs tou A*b
                          
    end
    
    %upologismos mesou orou xronwn twn diaforwn ektelesewn twn praksewn
    acc_time_lu(i) = sum(time_lu)/j; 
    acc_time_Ab(i) = sum(time_Ab)/j;

end

%Emfanish apotelesmatwn xronometrhsewn
acc_time_lu
acc_time_Ab

% % new figure
% figure
% plot(n, acc_time_lu, 'b*-', n, acc_time_Ab, 'rx-'); %thetoume ston aksona twn x tis diastaseis kai ston aksona twn y to xrono
% %koinh grafikh parastash
% legend('time for lu','time for A*b'); %upomnima
% title('Accurate time for lu(A) and A*b'); %titlos grafikhs parastashs
% xlabel('n'); % etiketa aksona x
% ylabel('t'); % etiketa aksona y


% new logarithmic figure
figure
semilogy(n, acc_time_lu, 'b*-', n, acc_time_Ab, 'rx-'); %entolh gia grafikh parastash me logarithmikous aksones
%koinh grafikh parastash
legend('time for lu','time for Axb');%upomnima
title('Accurate time for lu(A) and A*b'); %titlos grafikhs parastashs
xlabel('n'); % etiketa aksona x
ylabel('t'); % etiketa aksona y


