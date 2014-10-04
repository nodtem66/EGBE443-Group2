function [data_R, data_G, data_B] = myRGB(R,G,B)
maxVal_R = 0;
maxVal_G = 0;
maxVal_B = 0;
for i=1:size(R,1) 
    for j=1:size(R,2)
        if R(i,j)>=maxVal_R
            maxVal_R = R(i,j);
        end
        if G(i,j)>=maxVal_G
            maxVal_G = G(i,j);
        end
        if B(i,j)>=maxVal_B
            maxVal_B = B(i,j);
        end
    end
end
maxVal_R = maxVal_R+1;
maxVal_G = maxVal_G+1;
maxVal_B = maxVal_B+1;

data_R = zeros(maxVal_R,2);
data_G = zeros(maxVal_G,2);
data_B = zeros(maxVal_B,2);

data_R(:,1) = (1:maxVal_R);
data_G(:,1) = (1:maxVal_G);
data_B(:,1) = (1:maxVal_B);

for i=1:size(R,1)
    for j=1:size(R,2)
        data_R(R(i,j)+1,2) = data_R(R(i,j)+1,2)+1;
        data_G(G(i,j)+1,2) = data_G(G(i,j)+1,2)+1;
        data_B(B(i,j)+1,2) = data_B(B(i,j)+1,2)+1;
    end
end