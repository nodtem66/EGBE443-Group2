clear; clc; close;
window = 7;
window_step = 1;
sigma = 0.71;

maxican_hat_f = @(sigma) (@(x,y) ((2/(sqrt(3*sigma)*pi^0.25)) .* (1-(x.^2+y.^2)/sigma^2) .* exp(-1/2 .* (x.^2+y.^2)/sigma^2)));
m2_hat_f = @(sigma) (@(x,y) (-1/pi/sigma^2 .* (1 - (x.^2+y.^2)/(2*sigma)) .* exp(-(x.^2+y.^2)/(2*sigma))));
t = -floor(window/2):window_step:floor(window/2);
[Gx Gy]  = meshgrid(t,t);
%f = maxican_hat_f(sigma);
f = m2_hat_f(sigma);
a = f(t,zeros(size(t)));
figure('Position', [100 300 1000 400]);
subplot(1,2,1), mesh(f(Gx,Gy));
subplot(1,2,2), plot(a);
fprintf('Diff: %.3f\n',max(a) - min(a));