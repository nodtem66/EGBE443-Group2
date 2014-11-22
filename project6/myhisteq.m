function img = myhisteq(I, L)
    img = I;
    % Generate T(r) from histogram
    if nargin == 1
        L = 2 ^ nextpow2( double(max(img(:))) );
    end
    
    [M,N] = size(img);
    T = zeros(1, L);
    for i = 1:M
        for j = 1:N
            r = img(i,j);
            T(r+1) = T(r+1) + 1;
        end
    end

    %CDF from T(r)
    T = cumsum(T) ./ (M*N) .* (L-1);

    for i = 1:M
        for j = 1:N
            r = img(i,j);
            img(i,j) = T(r+1);
        end
    end
end