function newIm = myDilation(pic,mask)
p = size(mask,1);
u = floor(p/2);
pic_a = padarray(pic,[u u]);
[m n] = size(pic_a);
tempIm = zeros(m,n); 
for i=1+u:m-u
    for j=1+u:n-u
        tempIm(i,j) = sum(sum(pic_a(i-u:i+u,j-u:j+u).*mask));
        if tempIm(i,j)>0
            tempIm(i,j)=1;
        end
    end
end
newIm = tempIm(1+u:m-u,1+u:n-u);

            


