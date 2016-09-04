function [ s ] = f4( x )
%algorithmos athroishs Pichat & Neumaier's
    
    s = x(1);
    e = 0;
    n = length(x);
    
    for i=2:n
        
        if(abs(s)>=abs(x(i)))
            [s, ei] = fast2sum(s, x(i));
        else
            [s, ei] = fast2sum(x(i), s);
        end
        
        e = e + ei;
    end
    
    s = s + e;
end

