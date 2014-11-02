function F = nonlinear_filter( filter, f, window_size )
%NONLINEAR_FILTER Summary of this function goes here
%   Detailed explanation goes here
if strcmp(filter, 'median') || strcmp(filter, 'med')
    lambda = @median;
elseif strcmp(filter, 'minimum') || strcmp(filter, 'min')
    lambda = @min;
elseif strcmp(filter, 'maximum') || strcmp(filter, 'max')
    lambda = @max;
end

if nargin <= 2
    window_size = [3 3];
end

W = window_size(1);
H = window_size(2);

if (~mod(W,2))
    pos_w = [-W/2+1 W/2];
else
    pos_w = [-floor(W/2) floor(W/2)];
end

if (~mod(H,2))
    pos_h = [-H/2+1 H/2];
else
    pos_h = [-floor(H/2) floor(H/2)];
end

[M N] = size(f);
F = zeros(size(f), class(f));
for i = 1:M
    for j = 1:N
        pos_i = i + pos_w;
        pos_j = j + pos_h;
        if pos_i(1) <= 0
            pos_i(1) = 1;
        end
        if pos_i(2) > M
            pos_i(2) = M;
        end
        if pos_j(1) <= 0
            pos_j(1) = 1;
        end
        if pos_j(2) > N
            pos_j(2) = N;
        end
        g = f(pos_i(1):pos_i(2), pos_j(1):pos_j(2));
        F(i,j) = lambda(g(:));
    end
end