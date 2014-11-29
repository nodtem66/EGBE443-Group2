function newIm = myClosing(pic,mask)
newIm = myDilation(pic,mask);
newIm = myErosion(newIm,mask);
