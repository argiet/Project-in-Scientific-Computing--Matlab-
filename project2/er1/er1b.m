n = [15:2:25]; %dunameis poluwnumou : 15,17,19,21,23,25

for i=1:length(n)
    %epistrefontai sto dianusma p 
    %oi syntelestes tou poluwnumou 
    p = poly(0:n(i));
    %p'
    
    %timh poluwnumou gia x=1
    p1(i) = polyval(p, 1);
    
    %timh poluwnumou gia x=n
    p2(i) = polyval(p, n(i));
  
end
%gia na fainontai kalutera ta apotelesmata 
%emfanizoume ton anastrofo(dianusma sthlh)
p1'
p2'