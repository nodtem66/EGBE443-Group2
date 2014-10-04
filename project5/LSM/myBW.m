function data = myBW(Y)

maxVal = 0;
for i=1:size(Y,1)
    for j=1:size(Y,2)
        if Y(i,j)>=maxVal
            maxVal = Y(i,j);
        end
    end
end
maxVal = maxVal+1;

data = zeros(maxVal,2);
data(:,1) = (1:maxVal);
for i=1:size(Y,1)
    for j=1:size(Y,2)
        data(Y(i,j)+1,2) = data(Y(i,j)+1,2)+1;
    end
end