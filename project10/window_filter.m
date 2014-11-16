function f = window_filter( I , filter, window_size, useConv2)
%GASS_FILTER Summary of this function goes here
%   Detailed explanation goes here
    isGenerateMode = false;
    %tic;
    if strcmp(class(I), 'function_handle')
        lambda = I;
        isGenerateMode = true;
        if nargin == 2
            window_size = filter;
        end
    else
        if nargin <= 2
            window_size = [3 3];
        end
        if nargin <= 3
            useConv2 = false;
        end
    end
    
    W = window_size(1);
    H = window_size(2);
    
    window = zeros(W,H);
    pos_w = zeros(W, 1);
    pos_h = zeros(H, 1);
    padding = floor(max([W H]) / 2);
   
    if (~mod(W,2))
        pos_w(:) = -(W-1)/2:1:(W-1)/2;
        offset_w = [W/2-1 W/2];
    else
        pos_w(:) = -floor(W/2):1:floor(W/2);
        offset_w = [(W-1)/2 (W-1)/2];
    end

    if (~mod(H,2))
        pos_h(:) = -(H-1)/2:1:(H-1)/2;
        offset_h = [H/2-1 H/2];
    else
        pos_h(:) = -floor(H/2):1:floor(H/2);
        offset_h = [(H-1)/2 (H-1)/2];
    end

    [window_x window_y] = meshgrid(pos_w, pos_h);
   
    if isGenerateMode
        f = lambda(window_x, window_y);
        f = f ./ sum(sum(f));
    else
    [M N] = size(I);
    window = filter(window_x, window_y);
    window = window ./ sum(sum(window));
    if useConv2
        % Use optimized matlab function conv2
        f = conv2(I, window, 'same');
    else
    % Manual Loop convolution
    f = padarray(I ,[padding padding]);
    for i = 1:M
        for j = 1:N
            ii = i + padding;
            jj = j + padding;
            try
                f(ii,jj) = sum(sum(double(f(ii-offset_w(1):ii+offset_w(2),jj-offset_h(1):jj+offset_h(2))) .* window));
            catch ME
                fprintf('f(%d,%d) = f(%d:%d,%d:%d)\n', ii,jj,ii-offset_w(1),ii+offset_w(2),jj-offset_h(1),jj+offset_h(2));
                fprintf('M=%d N=%d padding=%d\n', M,N, padding);
                fprintf('size(f) = %d %d\n', size(f,1), size(f,2));
                return;
            end
        end
    end
    
    %crop result images
    f = f(1+padding:end-padding, 1+padding:end-padding);
    end
    %toc
    %}
end

