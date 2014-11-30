function mask = createLine(length,degree)
% Degree input is 0, 45, 90, 135
% Length is odd number
if mod(length,2)==0
    length=length+1;
end

if degree==0
    mask = ones(1,length);
elseif degree==90
    mask = ones(length,1);
elseif degree==45
    mask = zeros(length,length);
    j=length;
    for i=1:length
        mask(i,j)=1;
        j=j-1;
    end
elseif degree==135
    mask = zeros(length,length);
    mask = zeros(length,length);
    j=1;
    for i=1:length
        mask(i,j)=1;
        j=j+1;
    end
end

