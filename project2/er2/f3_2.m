function [ z ] = f3_2( x )
%taksinomhsh ths eisodou 
%kai tou ekastote apotelesmatos

    
    y = sort(x, 'ascend');

    for i=1:(length(y)-1)   
        y(2) = y(1) + y(2);
        y(1) = [];
        y=sort(y, 'ascend');
    end
    z=y(end);
end

