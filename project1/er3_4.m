n = 2.^[7:10];

%preallocation
time_IA = zeros(1,length(n));
time_AA = zeros(1,length(n));

%loop gia tis 4 diaforetikes diastaseis pou einai apothikeumenes sto vector n
for i=1:length(n)
    
    I = eye(n(i)); %taytotiko mhtrwo
    A = rand(n(i)); %tyxaio matrix A
    
    f = @() I*A; %handler for timeit
    time_IA(i) = timeit(f); %apothikeysh xronometrhshs s auto to vector
    
    z = @() A*A; %handler for timeit
    time_AA(i) = timeit(f); %apothikeysh xronometrhshs s auto to vector
    
end

%Emfanish apotelesmatwn xronometrhsewn
time_IA
time_AA

