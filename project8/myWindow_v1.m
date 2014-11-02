function newIm = myWindow_v1(sizeWindow,pic)
%%
mn = sizeWindow*sizeWindow;
myWin = ones(sizeWindow,sizeWindow);
myWin = myWin*(1/mn);
[m n] = size(pic);
edge = sizeWindow-2;
pic = padarray(pic,[sizeWindow-1 sizeWindow-1]);
for i=1:m
    for j=1:n
        mytemp{i,j} = pic(i:i+sizeWindow-1,j:j+sizeWindow-1); 
        newIm(i,j) = sum(sum(double(mytemp{i,j}).*myWin));
    end
end