% image = double(imread('data/mit_3.png'));
image = imread('data/mit_3.png');
img = imresize(image, 0.25);
n1 = size(img,1);
n2 = size(img,2);
n3 = size(img,3);
index = find(img < 250);
mask = zeros(n1,n2,n3);
mask(index) = 1;
img = double(img);

color_threshold = 0.03;
gray_threshold = 0.18;
[shading003, refl003] = color_retinex(img, mask, gray_threshold, color_threshold);
figure(1)
subplot(1, 2, 1);
imagesc(color2gray(shading003),[0 255]);
title('shading');
subplot(1, 2, 2);
imagesc(refl003,[0 255]);
title('refl');

color_threshold = 0.18;
[shading018, refl018] = color_retinex(img, mask, gray_threshold, color_threshold);

figure(2)
subplot(1, 2, 1);
imagesc(color2gray(shading018),[0 255]);
title('shading');
subplot(1, 2, 2);
imagesc(refl018,[0 255]);
title('refl');

color_threshold = 1;
[shading1, refl1] = color_retinex(img, mask, gray_threshold, color_threshold);
figure(3)
subplot(1, 2, 1);
imagesc(color2gray(shading1),[0 255]);
title('shading');
subplot(1, 2, 2);
imagesc(refl1,[0 255]);
title('refl');

%% frog
data = load('data/P2.mat');
frog = data.frog;
frog_mask = data.frog_mask;
mask = imresize(frog_mask,0.25);
f_img = imresize(frog, 0.25);
img = color2gray(f_img);
n1 = size(f_img,1);
n2 = size(f_img,2);
index = find(f_img < 250);
color_threshold = 0.18;
gray_threshold = 0.18;
[shadingf, reflf] = color_retinex(f_img, mask, gray_threshold, color_threshold);
figure()
imagesc(shadingf);
title('shading');
figure()
imagesc(reflf);
title('refl');

%% tea
data = load('data/P2.mat');
tea = data.tea;
tea_mask = data.tea_mask;
mask = imresize(tea_mask,0.25);
f_img = imresize(tea, 0.25);
img = color2gray(f_img);
n1 = size(f_img,1);
n2 = size(f_img,2);
index = find(f_img < 250);
color_threshold = 0.18;
gray_threshold = 0.18;
[shadingt, reflt] = color_retinex(f_img, mask, gray_threshold, color_threshold);
figure()
imagesc(shadingt);
title('shading');
figure()
imagesc(reflt);
title('refl');

%% potato
data = load('data/P2.mat');
potato = data.potato;
potato_mask = data.potato_mask;
mask = imresize(potato_mask,0.25);
f_img = imresize(potato, 0.25);
img = color2gray(f_img);
n1 = size(f_img,1);
n2 = size(f_img,2);
index = find(f_img < 250);
color_threshold = 0.18;
gray_threshold = 0.18;
[shadingp, reflp] = color_retinex(f_img, mask, gray_threshold, color_threshold);
figure()
imagesc(shadingp);
title('shading');
figure()
imagesc(reflp);
title('refl');

%% shadow
shadow_ill = double(imread('data/shadow_illusion.png'));
% shadow_ill = imresize(shadow_ill, 0.25);
n1 = size(shadow_ill,1);
n2 = size(shadow_ill,2);
index = find(shadow_ill > 0);
mask = ones(n1,n2);
gray_threshold = 0.2;
color_threshold = 1;
[shading, ref] = color_retinex(shadow_ill, mask, gray_threshold, color_threshold);
figure(8)
subplot(1, 2, 1);
imagesc(shading);
title('shading');
subplot(1, 2, 2);
imagesc(ref);
title('ref');

%% cross 
cross_ill = double(imread('data/cross_illusion.png'));
cross_ill = imresize(cross_ill, 0.25);
n1 = size(cross_ill,1);
n2 = size(cross_ill,2);
index = find(cross_ill > 0);
mask = ones(n1,n2);
gray_threshold = 1;
color_threshold = 1;
[shading, ref] = color_retinex(cross_ill, mask, gray_threshold, color_threshold);
figure(1)
subplot(1, 2, 1);
imagesc(shading);
title('shading');
subplot(1, 2, 2);
imagesc(ref);
title('ref');

%% lena
lena = double(imread('data/lena.png'));
% lena = imresize(lena, 0.25);
n1 = size(lena,1);
n2 = size(lena,2);
index = find(lena > 0);
mask = ones(n1,n2);
gray_threshold = 0.2;
color_threshold = 1;
[shading, ref] = color_retinex(lena, mask, gray_threshold, color_threshold);
figure(5)
subplot(1, 2, 1);
imagesc(shading);
title('shading');
subplot(1, 2, 2);
imagesc(ref);
title('ref');



