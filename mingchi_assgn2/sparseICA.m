load('IMAGES.mat');
im1 = IMAGES(:,:,1);
im2 = IMAGES(:,:,2);
im3 = IMAGES(:,:,3);
im4 = IMAGES(:,:,4);
im5 = IMAGES(:,:,5);
im6 = IMAGES(:,:,6);
im7 = IMAGES(:,:,7);
im8 = IMAGES(:,:,8);
im9 = IMAGES(:,:,9);
im10 = IMAGES(:,:,10);

im_1 = reshape(im1,1,512*512);
im_2 = reshape(im2,1,512*512);
im_3 = reshape(im3,1,512*512);
im_4 = reshape(im4,1,512*512);
im_5 = reshape(im5,1,512*512);
im_6 = reshape(im6,1,512*512);
im_7 = reshape(im7,1,512*512);
im_8 = reshape(im8,1,512*512);
im_9 = reshape(im9,1,512*512);
im_10 = reshape(im10,1,512*512);

[E1,D1] = pcamat(im_1);
[E2,D2] = pcamat(im_2);
[E3,D3] = pcamat(im_3);
[E4,D4] = pcamat(im_4);
[E5,D5] = pcamat(im_5);
[E6,D6] = pcamat(im_6);
[E7,D7] = pcamat(im_7);
[E8,D8] = pcamat(im_8);
[E9,D9] = pcamat(im_9);
[E10,D10] = pcamat(im_10);

[nV1,~,~] = whitenv(im_1, E1, D1); %whitening
[nV2,~,~] = whitenv(im_2, E2, D2);
[nV3,~,~] = whitenv(im_3, E3, D3);
[nV4,~,~] = whitenv(im_4, E4, D4);
[nV5,~,~] = whitenv(im_5, E5, D5);
[nV6,~,~] = whitenv(im_6, E6, D6);
[nV7,~,~] = whitenv(im_7, E7, D7);
[nV8,~,~] = whitenv(im_8, E8, D8);
[nV9,~,~] = whitenv(im_9, E9, D9);
[nV10,~,~] = whitenv(im_10, E10, D10);

iim1 = reshape(nV1,512,512);
iim2 = reshape(nV2,512,512);
iim3 = reshape(nV3,512,512);
iim4 = reshape(nV4,512,512);
iim5 = reshape(nV5,512,512);
iim6 = reshape(nV6,512,512);
iim7 = reshape(nV7,512,512);
iim8 = reshape(nV8,512,512);
iim9 = reshape(nV9,512,512);
iim10 = reshape(nV10,512,512);

[patches1,~] = read_patch(iim1,12,1000); %get 1000 patches from each image
[patches2,~] = read_patch(iim2,12,1000);
[patches3,~] = read_patch(iim3,12,1000);
[patches4,~] = read_patch(iim4,12,1000);
[patches5,~] = read_patch(iim5,12,1000);
[patches6,~] = read_patch(iim6,12,1000);
[patches7,~] = read_patch(iim7,12,1000);
[patches8,~] = read_patch(iim8,12,1000);
[patches9,~] = read_patch(iim9,12,1000);
[patches10,~] = read_patch(iim10,12,1000);

patches = [patches1,patches2,patches3,patches4,patches5,patches6,patches7,patches8,patches9,patches10];

[~,A,~] = fastica(patches,'displayMode','off');
%% plot 144 basis vectors

figure()
for i = 1:144
    subplot(12, 12, i);
    imshow(0.4453+reshape(A(:,i),12,12));
    %since the images are too dark, I roughly shift it so that all values
    %are in the range of [0,1]
end



