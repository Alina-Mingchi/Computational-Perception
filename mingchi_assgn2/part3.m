load('mystery_images.mat');
mix1 = cell2mat(mystery_images(1));
mix2 = cell2mat(mystery_images(2));
mix3 = cell2mat(mystery_images(3));
mix4 = cell2mat(mystery_images(4));
mix5 = cell2mat(mystery_images(5));
mix6 = cell2mat(mystery_images(6));
mix7 = 1/2*(mix1 + mix2);

% figure()
% imshow(mix1)
% figure()
% imshow(mix2)
% figure()
% imshow(mix3)
% figure()
% imshow(mix4)
% figure()
% imshow(mix5)
% figure()
% imshow(mix6)

x1 = reshape(mix1,1,234*256);
x2 = reshape(mix2,1,234*256);
x3 = reshape(mix3,1,234*256);
x4 = reshape(mix4,1,234*256);
x5 = reshape(mix5,1,234*256);
x6 = reshape(mix6,1,234*256);
x7 = reshape(mix7,1,234*256);

X = [x1;x2;x3;x4;x5;x6;x7];

%% RUN ICA 1
[S1,A1,W1] = fastica(X,'displayMode','off');

S_1 = S1(1,:);
S_2 = S1(2,:);
S_3 = S1(3,:);
S_4 = S1(4,:);
S_5 = S1(5,:);
S_6 = S1(6,:);
S_7 = S1(7,:);

img_s1 = reshape(S_1,234,256);
img_s2 = reshape(S_2,234,256);
img_s3 = reshape(S_3,234,256);
img_s4 = reshape(S_4,234,256);
img_s5 = reshape(S_5,234,256);
img_s6 = reshape(S_6,234,256);
img_s7 = reshape(S_7,234,256);

figure()
subplot(4, 2, 1);
imagesc(img_s1);
title('1');
subplot(4, 2, 2);
imagesc(img_s2);
title('2');
subplot(4, 2, 3);
imagesc(img_s3);
title('3');
subplot(4, 2, 4);
imagesc(img_s4);
title('4');
subplot(4, 2, 5);
imagesc(img_s5);
title('5');
subplot(4, 2, 6);
imagesc(img_s6);
title('6');
subplot(4, 2, 7);
imagesc(img_s7);
title('7');
%% RUN ICA 2
[S2,A2,W2] = fastica(X,'displayMode','off');
S_21 = S2(1,:);
S_22 = S2(2,:);
S_23 = S2(3,:);
S_24 = S2(4,:);
S_25 = S2(5,:);
S_26 = S2(6,:);

img_s21 = reshape(S_21,234,256);
img_s22 = reshape(S_22,234,256);
img_s23 = reshape(S_23,234,256);
img_s24 = reshape(S_24,234,256);
img_s25 = reshape(S_25,234,256);
img_s26 = reshape(S_26,234,256);

figure()
subplot(3, 2, 1);
imagesc(img_s21);
title('1');
subplot(3, 2, 2);
imagesc(img_s22);
title('2');
subplot(3, 2, 3);
imagesc(img_s23);
title('3');
subplot(3, 2, 4);
imagesc(img_s24);
title('4');
subplot(3, 2, 5);
imagesc(img_s25);
title('5');
subplot(3, 2, 6);
imagesc(img_s26);
title('6');

%% RUN ICA 3
[S3,A3,W3] = fastica(X,'displayMode','off');
S_31 = S3(1,:);
S_32 = S3(2,:);
S_33 = S3(3,:);
S_34 = S3(4,:);
S_35 = S3(5,:);
S_36 = S3(6,:);

img_s31 = reshape(S_31,234,256);
img_s32 = reshape(S_32,234,256);
img_s33 = reshape(S_33,234,256);
img_s34 = reshape(S_34,234,256);
img_s35 = reshape(S_35,234,256);
img_s36 = reshape(S_36,234,256);

figure()
subplot(3, 2, 1);
imagesc(img_s31);
title('1');
subplot(3, 2, 2);
imagesc(img_s32);
title('2');
subplot(3, 2, 3);
imagesc(img_s33);
title('3');
subplot(3, 2, 4);
imagesc(img_s34);
title('4');
subplot(3, 2, 5);
imagesc(img_s35);
title('5');
subplot(3, 2, 6);
imagesc(img_s36);
title('6');




save('img_s23.mat','img_s23')
save('img_s24.mat','img_s24')
save('img_s25.mat','img_s25')
save('img_s26.mat','img_s26')
