%% van gogh
van = double(imread('van.jpg'));
van = imresize(van, 0.25);
n1 = size(van,1);
n2 = size(van,2);
index = find(van > 0);
mask = ones(n1,n2);
gray_threshold = 1;
color_threshold = 1;
[shading, ref] = color_retinex(van, mask, gray_threshold, color_threshold);
figure(1)
subplot(1, 2, 1);
imagesc(shading);
title('shading');
subplot(1, 2, 2);
imagesc(ref);
title('ref');


