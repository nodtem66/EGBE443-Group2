function newIm = myOpening(pic,mask)
newIm = myErosion(pic,mask);
newIm = myDilation(newIm,mask);