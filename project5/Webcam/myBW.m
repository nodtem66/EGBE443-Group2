function myHist = myBW(Y)
myHist = zeros(size(Y,1),1);
for i=1:size(Y,1) 
    for j=1:size(Y,2)
        myHist(Y(i,j)+1,1) = myHist(Y(i,j)+1,1)+1;
    end
end