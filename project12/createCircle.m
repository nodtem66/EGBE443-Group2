function mask = createCircle(radius)
<<<<<<< HEAD
w = (radius*2)+1;
centerW = ceil(w/2);
[W,H] = meshgrid(1:w,1:w);
tempmask = ((W-centerW).^2 + (H-centerW).^2) <= (radius^2);
mask = tempmask(1:w,1:w);
mask = double(mask);
=======
w = radius*2;
centerW = w/2;
[W,H] = meshgrid(1:w,1:w);
tempmask = sqrt((W-centerW).^2 + (H-centerW).^2) < radius;
mask = tempmask(1:w-1,1:w-1);
mask = double(mask);

%% Edit
% function mask = createCircle(radius)
% w = (radius*2)+1;
% centerW = ceil(w/2);
% [W,H] = meshgrid(1:w,1:w);
% tempmask = ((W-centerW).^2 + (H-centerW).^2) <= (radius^2);
% mask = tempmask(1:w,1:w);
% mask = double(mask);
>>>>>>> 7d39bbeda2ac56d4221ac9f9e38a5baf59761e6e
