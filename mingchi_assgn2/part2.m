
%% 
image = imread('MarylinEinstein.jpg');
img = rgb2gray(image);
img = double(img);
[r,c] = size(img);
% maximum = max(max(img));
% minimum = min(min(img));
% imshow(img/255);

% % % % [x,y] = mesh(1:256,1:256);
% % % % g = exp(-(((x-128.5).^2+(y-128.5).^2)./(2*sigma^2)));

sigma = 1; %Einstein
% sigma = 8; %Monroe
for x = 1:r
    for y = 1:c
        g(x,y) = exp(-(((x-r/2).^2+(y-c/2).^2)./(2*sigma^2)));
        
    end
end

figure(3)
imshow(g);

g_norm = g/sum(sum(g));
g2 = fftshift(g_norm);
figure(1)
imagesc(g_norm);
gf = fft2(g2);
figure(2)
imagesc(fftshift(real(gf)));


F = fft2(img);
figure(10)
plot(abs(F));
title('Power Spectrum');
%%
Fg = F.*gf;
figure(11)
imagesc(log(abs(Fg)))
figure(18)
imagesc(real(ifft2(Fg)))
title('Einstein')
% title('Monroe')