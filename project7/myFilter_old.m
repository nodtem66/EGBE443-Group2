function newIm = myFilter(offset,scale,sizeWindow,pic)
%%
mn = sizeWindow*sizeWindow;
myWin = ones(sizeWindow,sizeWindow);
myWin = myWin*(1/mn);
[m n] = size(pic);
edge = sizeWindow-2;
pic = padarray(pic,[sizeWindow sizeWindow]);

for i=1:m-edge
    for j=1:n-edge
        mytemp{i,j} = pic(i:i+sizeWindow-1,j:j+sizeWindow-1); 
        newIm(i,j) = sum(sum(double(mytemp{i,j}).*myWin));
        newIm(i,j) = (scale*newIm(i,j))+offset;
    end
end
        
       

