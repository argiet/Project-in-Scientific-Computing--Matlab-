function [ sum ] = f2( x )
%h eisodos taksinomeitai 
%se auksousa seira prwta


    %taksinomhsh kata auksousa seira thw eisodou me th sort()
    y = sort(x, 'ascend');
    
    %xrhsimpoihsh prohgoumenhs methodou f1 tou prwtou erwthmatos
    sum = f1(y); 
    
end

