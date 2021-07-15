%% Basic I/O and Image Manipulations
%load image
image = imread('./imageshw1/flower.jpg');

%extract image
image = im2double(image);
%figure;
%imshow(image); 

%enlarge the image twice with bicubic interpolation
twice_img = imresize(image,2,'bicubic');
% figure;
% imshow(twice_img)

%convert the image to grayscale
gray = rgb2gray(twice_img);
% figure;
% imshow(gray); 

%rotate 90 degrees clockwise & save
rotate_img = imrotate(gray,-90);
figure;
imshow(rotate_img); 
imwrite(rotate_img,'./imageshw1/rose1.jpg')

%normalize & save
meanval = mean2(rotate_img);
stdval = std2(rotate_img);
[row,col] = size(rotate_img);
norm_img = (rotate_img - meanval * ones(row,col)) ./ (stdval * ones(row,col));
figure;
imshow(norm_img); 
imwrite(norm_img,'./imageshw1/rose2.jpg')

%edge &save
edge_img = edge(norm_img,'sobel');
figure;
imshow(edge_img); 
imwrite(edge_img,'./imageshw1/rose3.jpg')

%histogran equalization & save
figure;
imhist(rotate_img);
histeq_img = histeq(rotate_img);
figure;
imhist(histeq_img);
imwrite(histeq_img,'./imageshw1/rose4.jpg')

%add noise & save
noise_img = imnoise(norm_img,'gaussian',0,0.2);
imwrite(noise_img,'./imageshw1/rose5.jpg')

%filter
%rose6a is with 3 by 3 mean filter, rose 6b is with 7 by 7 filter
[r c] = size(noise_img);
zero_row =  zeros(1,c);
zero_col = zeros(r,1);
z_pad_img = [0,zero_row,0;zero_col,noise_img,zero_col;0,zero_row,0];

ave3by3 = 1/9 * ones(3);
rose6a = zeros(r,c);
for i = 1:r
    for j = 1:c
        rose6a(i,j) = sum(sum(ave3by3 .* z_pad_img(i:i+2,j:j+2)));
    end
end
figure;
imshow(rose6a);
imwrite(rose6a,'./imageshw1/rose6a.jpg')

zero_row3 =  zeros(3,c);
zero_col3 = zeros(r,3);
zero_sq = zeros(3);
z_pad_img2 = [zero_sq,zero_row3,zero_sq;zero_col3,noise_img,zero_col3;zero_sq,zero_row3,zero_sq];

ave7by7 = 1/49 * ones(7);
rose6b = zeros(r,c);
for i = 1:r
    for j = 1:c
        rose6b(i,j) = sum(sum(ave7by7 .* z_pad_img2(i:i+6,j:j+6)));
    end
end
figure;
imshow(rose6b);
imwrite(rose6b,'./imageshw1/rose6b.jpg')

% rose6c is with 3 by 3 median filter, rose6d is with 7 by 7 median filter
rose6c = zeros(r,c);
for i = 1:r
    for j = 1:c
        rose6c(i,j) = median(z_pad_img(i:i+2,j:j+2),'all');
    end
end
figure;
imshow(rose6c);
imwrite(rose6c,'./imageshw1/rose6c.jpg')

rose6d = zeros(r,c);
for i = 1:r
    for j = 1:c
        rose6d(i,j) = median(z_pad_img2(i:i+6,j:j+6),'all');
    end
end
figure;
imshow(rose6d);
imwrite(rose6d,'./imageshw1/rose6d.jpg')

% thresholding & save
thresh_img = thresh(0,norm_img);
figure;
imshow(thresh_img);
imwrite(thresh_img,'./imageshw1/rose7.jpg')

% contrast normalization & save
mini = min(min(noise_img));
maxi = max(max(noise_img));
connor_img = con_norm(noise_img, mini, maxi);
figure;
imshow(connor_img);
imwrite(connor_img,'./imageshw1/rose8.jpg')

% 3D
figure;
mesh(connor_img)
figure;
mesh(edge_img)
figure;
mesh(gray)

%% derivative operator
A = norm_img;
[numr numc] = size(norm_img);
B = [A(:,2:numc),zeros(numr,1)]; %[1 -1]
dx = A - B;  
C = [A(2:numr,:);zeros(1,numc)]; %[1;-1]
dy = A - C;
temp = abs(dx) + abs(dy);
threshold = 0.5;
result = thresh(threshold,temp);
figure;
imshow(result);
imwrite(result,'deriedge.jpg')
