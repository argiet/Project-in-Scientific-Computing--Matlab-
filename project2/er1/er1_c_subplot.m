n = [15:2:25]; %dunameis poluwnumou : 15,17,19,21,23,25


colors1 = ['yo';'mo';'co';'ro';'go';'bo'];
colors2 = ['y*';'m*';'c*';'r*';'g*';'b*'];

% hold on
for i=1:2
    
    %epistrefontai sto dianusma p 
    %oi syntelestes tou poluwnumou 
    p = poly([1:n(i)]);
    
    r = roots(p);
    k = [n(i):-1:1];
    figure
    subplot(2,1,i);
    plot(k, zeros(n(i), 1), colors2(i,:), real(r), imag(r), colors1(i,:));
    xlabel('Real');
    ylabel('Imag');
    legend('pragmatikes rizes', 'rizes apo th roots');
    title('Pragmatikes rizes kai rizes pou epistrefei h roots');
    
    
end

for i=3:4
    
    %epistrefontai sto dianusma p 
    %oi syntelestes tou poluwnumou 
    p = poly([1:n(i)]);
    
    r = roots(p);
    k = [n(i):-1:1];
    figure
    subplot(2,1,i-2);
    plot(k, zeros(n(i), 1), colors2(i,:), real(r), imag(r), colors1(i,:));
    xlabel('Real');
    ylabel('Imag');
    legend('pragmatikes rizes', 'rizes apo th roots');
    title('Pragmatikes rizes kai rizes pou epistrefei h roots');
    
    
end

for i=5:6
    
    %epistrefontai sto dianusma p 
    %oi syntelestes tou poluwnumou 
    p = poly([1:n(i)]);
    
    r = roots(p);
    k = [n(i):-1:1];
    figure
    subplot(2,1,i-4);
    plot(k, zeros(n(i), 1), colors2(i,:), real(r), imag(r), colors1(i,:));
    xlabel('Real');
    ylabel('Imag');
    legend('pragmatikes rizes', 'rizes apo th roots');
    title('Pragmatikes rizes kai rizes pou epistrefei h roots');
    
    
end

% hold off


%gia na fainontai kalutera ta apotelesmata 
%emfanizoume ton anastrofo(dianusma sthlh)
% p1'
% p2'