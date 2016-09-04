%definition of my_func
function [ A ] = my_func(p, u, v, col)

    % orismos tou I ws tautotikou mhtrwou me diastash osh to mhkos tou vector u
    I = eye(length(u)); 
  
    %an h synarthsh exei klithei me 3 orismata
    if nargin == 3 
       
       A = I - u * transpose(v);
       %upologismos ginomenou p fores me upswsh tou A eis thn p
       %to A pollaplasiazetai me ton eauto tou p fores
       A = A^p; 
       
    %an h synarthsh exei klithei me 4 orismata
    elseif nargin == 4 
        
        %k-osth sthlh tou tautotikou mhtrwou
        e = I(:,col); 
        
        % A = (I - u * transpose(v)) * e
        A = e - u * transpose(v) *e; 
        
         %o enas pollaplasiasmos exei ginei apo panw 
         %opote theloume allous p-1 pollaplasiasmous tou apotelesmatos me to I - u * transpose(v)
         
        for i=1:p-1
            
            %(I - u * transpose(v)) * A = (I - u * transpose(v)) * (e - u *
            %transpose(v) *e)
            
            A = A - u * transpose(v) *A;
            
        end
    end

end
