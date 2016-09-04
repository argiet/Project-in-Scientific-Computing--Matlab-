n = 2.^[7:10];

%preallocation
time_div_1 = zeros(1,length(n));
time_div_2 = zeros(1,length(n));
time_div_3 = zeros(1,length(n));

%loop gia tis 4 diaforetikes diastaseis pou einai apothikeumenes sto vector n
for i=1:length(n);
    
    A = rand(n(i)); %tyxaio matrix A
    b = rand(n(i), 1); %tyxaio vector b
    
    f = @() mldivide(A,b); %handler for timeit
    time_div_1(i) = timeit(f); %apothikeysh xronometrhshs s auto to vector
    
    L = tril(A); %metatroph matrix A se lower triangular matrix me th synarthsh tril()
    x = @() mldivide(L,b); %handler for timeit
    time_div_2(i) = timeit(x);%apothikeysh xronometrhshs s auto to vector
    
    P = L(:, randperm(n(i))); %metatroph matrix A se psychologically lower triangular matrix me th synarthsh tril()
    z = @() mldivide(P,b); %handler for timeit
    time_div_3(i) = timeit(z);%apothikeysh xronometrhshs s auto to vector
end


%Emfanish apotelesmatwn xronometrhsewn
time_div_1
time_div_2
time_div_3

% new logarithmic figure
figure
%koinh grafikh parastash gia tous treis typous matrix, diastaseis pros t 
semilogy(n, time_div_1, 'b*-', n, time_div_2, 'r*-', n, time_div_3, 'y*-'); %entolh gia grafikh parastash me logarithmikous aksones
legend('time for random matrix','time for lower triangular matrix', 'time for psychologically lower triangular matrix'); %upomnima
title('time for mldivide'); %titlos grafikhs parastashs
xlabel('n'); % etiketa aksona x
ylabel('t'); % etiketa aksona y


