function myhsv = myrgb2hsv(rgbi)

rgb = double(rgbi);

r = rgb(:,:,1)/255; 
g = rgb(:,:,2)/255; 
b = rgb(:,:,3)/255;

cmax = max(max(r,g),b);
cmin = min(min(r,g),b);

[i,j] = size(r);

v = cmax;

for ii = 1:i
    for jj = 1:j
    s(ii,jj) = 1-cmin(ii,jj)/cmax(ii,jj);
    end
end

h = zeros(size(v));

for ii = 1:i
    for jj = 1:j
        
        c(ii,jj) = cmax(ii,jj) - cmin(ii,jj);
        
        if cmax(ii,jj) == r(ii,jj)
            h(ii,jj) = (g(ii,jj) - b(ii,jj)) / c(ii,jj);
        elseif cmax(ii,jj) == g(ii,jj)
            h(ii,jj) = (2+ (b(ii,jj) - r(ii,jj))/c(ii,jj));
        elseif cmax(ii,jj) == b(ii,jj)
            h(ii,jj) = (4+ (r(ii,jj) - g(ii,jj))/c(ii,jj));
        end
        
        h(ii,jj) = h(ii,jj)/6;
        
        if h(ii,jj) < 0
            h(ii,jj) = (1+h(ii,jj));
        else
            h(ii,jj) = h(ii,jj);
        end
      
    end
end     



h(isnan(h)) = 0;

myhsv(:,:,1) = h;
myhsv(:,:,2) = s;
myhsv(:,:,3) = v;
