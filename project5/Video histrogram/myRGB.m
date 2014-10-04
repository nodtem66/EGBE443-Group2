function [data_R, data_G, data_B] = myRGB(R,G,B,maxVal_R,maxVal_G,maxVal_B)

% data_R = zeros(size(R,1),1);
% data_G = zeros(size(G,1),1);
% data_B = zeros(size(B,1),1);

% data_R = zeros(500,1);
% data_G = zeros(500,1);
% data_B = zeros(500,1);

data_R = zeros(maxVal_R,1);
data_G = zeros(maxVal_G,1);
data_B = zeros(maxVal_B,1);

for i=1:size(R,1)
    for j=1:size(R,2)
        data_R(R(i,j)+1,1) = data_R(R(i,j)+1,1)+1;
        data_G(G(i,j)+1,1) = data_G(G(i,j)+1,1)+1;
        data_B(B(i,j)+1,1) = data_B(B(i,j)+1,1)+1;
    end
end