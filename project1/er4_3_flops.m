%apothikeush sto vector n twn zhtoumenwn diastasewn 
n = 2.^[8:11];

%preallocation
t_1 = zeros(1, length(n)); 
t_2 = zeros(1, length(n));
m_1 = zeros(1, length(n));
m_2 = zeros(1, length(n));
flops_1 = 0;
flops_2 = 0;

%opws upodeixthike thetoume to p = 3
p = 3; 

%loop gia tis 4 diaforetikes diastaseis
for i=1:length(n)
    
    %upologismos apaitoumenwn praksewn gia thn praksh (I-uv')^p
    flops_1 = n(i)^2 * (2*n(i)*(p+1)+ 3 - p);  
    %upologismos apaitoumenwn praksewn gia th sthlh
    flops_2 = 3 * p * n(i)^2;
    
    u = rand(n(i), 1); %paragwgh tyxaiou vector u
    v = rand(n(i), 1); %paragwgh tyxaiou vector v
    
    %paragwgh tuxaiou k (gia ton upologismo ths k-osths sthlhs tou I)
    col = randi(n(i), 1);

    f = @() my_func(p, u, v); %handler for timeit
    
    %xronos ekteleshs my_func me 3 orismata xwris th sthlh
    t_1(i) = timeit(f); 
    
    %ypologismos twn flops/sec gia thn praksh A^p
    m_1(i) = flops_1 / t_1(i); 
    
    %ypologismos twn Mflops/sec
    m_1(i) = m_1(i) / 10^6; 
    
    x = @() my_func(p, u, v, col); %handler for timeit
    
    %xronos ekteleshs my_func me 4 orismata 
    t_2(i) = timeit(x); 
    
    %ypologismos twn flops/sec gia thn praksh (I-uv')^p
    m_2(i) = flops_2 / t_2(i); 
    
    %ypologismos twn Mflops/sec gia thn praksh me th sthlh
    m_2(i) = m_2(i) / 10^6; 
    
end

%emfanish apotelesmatwn xronoi ekteleseis
t_1
t_2

%emfanish apotelesmatwn Mflops/sec
m_1
m_2


% new logarithmic figure for time measurement
figure
%koinh grafikh parastash
semilogy(n, t_1, 'b*-', n, t_2, 'rx-');
legend('3 arguments','4 arguments'); %upomnima
title('Time'); %titlos grafikhs parastashs
xlabel('n'); % etiketa aksona x
ylabel('t'); % etiketa aksona y

% new logarithmic figure for Mflops/sec
figure
%koinh grafikh parastash gia tis 2 periptwseis 
semilogy(n, m_1, 'b*-', n, m_2, 'rx-');
legend('3 arguments','4 arguments'); %upomnima
title('Mflops/s') %titlos grafikhs parastashs
xlabel('n'); % etiketa aksona x
ylabel('Mflops/s'); % etiketa aksona y




