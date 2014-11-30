clear; clc; close;
f = imread('../raw_data/print.jpg');

size_img = size(f);
Fhsv = zeros(size_img, 'double');
f = double(f);
% Checek if RBG Layer
if (length(size_img) == 3)
    Cmax = max(max(max(f)));
    for i = 1:size_img(1)
        for j = 1:size_img(2)
            Chigh = max(f(i,j,:));
            Clow = min(f(i,j,:));
            Crng = Chigh - Clow;
            % calculation Saturation
            if Chigh > 0
                Shsv = Crng / Chigh;
            else
                Shsv = 0;
            end
            
            % calculation brighness
            Vhsv = Chigh / Cmax;
            
            % calculation preliminary hue
            H = 0;
            if Crng > 0
                Hdash = (Chigh - f(i,j,:)) ./ Crng;
                if Chigh == f(i,j,1)
                    H = Hdash(3) - Hdash(2);
                elseif Chigh == f(i,j,2)
                    H = Hdash(1) - Hdash(3) + 2;
                elseif Chigh == f(i,j,3)
                    H = Hdash(2) - Hdash(1) + 4;
                end
                if (H < 0)
                    H = H + 6;
                end
                Hhsv = 1/6*H;
            end
            Fhsv(i,j,:) = [Hhsv Shsv Vhsv];
        end
    end
end