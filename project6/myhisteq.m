function img = myhisteq(I)
    img = double(I);
    % Generate T(r) from histogram
    L = 2 ^ nextpow2( max(img(:)) );
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
    img = uint8(img);
end