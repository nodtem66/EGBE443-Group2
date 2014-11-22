function mask = createDaimon(r)
w = abs(linspace(-r,r,2*r+1));
h = abs(linspace(-r,r,2*r+1));
[X Y] = meshgrid(w,h);
mask = X+Y;
mask(mask<=r) = 1;
mask(mask>r) = 0;

        
