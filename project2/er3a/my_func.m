function [ c, e, p, f ] = my_func( A )
    
    %gia ton upologismo tou deikth katastashs
    %upologismos normas megistou tou mhtrwou x
    %(norma megistou = norma apeirou)
    %n = norm(A, inf);
    %xrhsh synarthshs cond gia ton upologismo 
    %tou deikth katastashs ws pros th norma megistou
    %2 orismata: mhtrwo x kai norma
    c = cond(A, inf);
    
    %gia ton upologismo tou empros sfalmatos
    %thewroume oti h lush mas einai 
    %to monadiaio dianusma x=ones(512,1)
    %opote epilegoume katallhla to b
    x = ones(512,1);
    b = A*x;
    
    %eksagwgh lushs me ton telesth '\'
    x = A\b;
    
    %eyresh sfalmatos metaksu thewrhtikou 
    %apotelesmatos kai peiramatikou
    %x: thewrhtiko apotelesma 
    %xprog: peiramatiko apotelesma
    
    %empros sfalma
    e = norm(ones(512,1)- x, inf)/norm(ones(512,1),inf);
    
    %upologismos pisw sfalmatos apo tupo ths thewrias
    p = norm(A*x - b, inf) / (norm(A, inf) * norm(x, inf) + norm(b, inf));
    
    %upologismos fragmatos gia to empros sfalma : 
    %empros sfalma <= deikths katastashs * pisw sfalma
    f = c * p;
end

