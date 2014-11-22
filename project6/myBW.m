function myHist = myBW(Y,n)
if nargin == 1
    myHist = zeros(size(Y,1),1);
else 
    myHist = zeros(n,1);
end
for i=1:size(Y,1) 
    for j=1:size(Y,2)
        myHist(Y(i,j)+1,1) = myHist(Y(i,j)+1,1)+1;
    end
end