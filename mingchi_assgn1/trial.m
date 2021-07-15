% %% Hermann grid illusion
% 
% I = imread('./images_hw1/hg1.jpg');
% image = im2double(I);
% gray = rgb2gray(image);
% 
% % h is filter, aka receptive field
% hs1 = fspecial('log',20,3); % center-off
% hs11 = fspecial('log',20,3*1.75);%center-off
% hs2 = fspecial('log',100,3); % center-off
% hs22 = fspecial('log',100,3*1.75);%center-off
% %% 
% %normalize contrast
% c = filter2(hs1,gray);
% c = c - min(min(c));  %subtract each pixel by the global min of the image.
% c = c / max(max(c));  %divide each resulting pixel by the max of the image.
% I1 = c;
% figure(1);
% imshow(I1);
% title('size a sigma off');
% 
% cc = filter2(hs11,gray);
% cc = cc - min(min(cc));  %subtract each pixel by the global min of the image.
% cc = cc / max(max(cc));  %divide each resulting pixel by the max of the image.
% I2 = cc;
% figure(2);
% imshow(I2);
% title('size a sigma multi off');
% 
% oncenter = I1 - I2;
% index = find(oncenter < 0);
% oncenter(index) = 0;
% figure(3);
% imshow(oncenter);
% title('size a response on center neuron');
% figure(4);
% mesh(oncenter)
% title('Visualization of on center neuron');
% oo = oncenter;
% oo = oo - min(min(oo));  %subtract each pixel by the global min of the image.
% oo = oo / max(max(oo));  %divide each resulting pixel by the max of the image.
% temp = oo;
% figure(5);
% imshow(temp);
% title('adjust on center response');
% 
% offcenter = I2 - I1;
% num = find(offcenter < 0);
% offcenter(num) = 0;
% figure(6);
% imshow(offcenter);
% title('size a response off center neuron');
% figure(7);
% mesh(offcenter)
% title('Visualization of off center neuron');
% ff = offcenter;
% ff = ff - min(min(ff));  %subtract each pixel by the global min of the image.
% ff = ff / max(max(ff));  %divide each resulting pixel by the max of the image.
% tempp = ff;
% figure(8);
% imshow(tempp);
% title('adjust off center response');
% %% 
% %normalize contrast
% c = filter2(hs2,gray);
% c = c - min(min(c));  %subtract each pixel by the global min of the image.
% c = c / max(max(c));  %divide each resulting pixel by the max of the image.
% I1 = c;
% figure(11);
% imshow(I1);
% title('size a sigma off');
% 
% cc = filter2(hs22,gray);
% cc = cc - min(min(cc));  %subtract each pixel by the global min of the image.
% cc = cc / max(max(cc));  %divide each resulting pixel by the max of the image.
% I2 = cc;
% figure(12);
% imshow(I2);
% title('size a sigma multi off');
% 
% oncenter = I1 - I2;
% index = find(oncenter < 0);
% oncenter(index) = 0;
% figure(13);
% imshow(oncenter);
% title('size a response on center neuron');
% figure(14);
% mesh(oncenter)
% title('Visualization of on center neuron');
% oo = oncenter;
% oo = oo - min(min(oo));  %subtract each pixel by the global min of the image.
% oo = oo / max(max(oo));  %divide each resulting pixel by the max of the image.
% temp = oo;
% figure(15);
% imshow(temp);
% title('adjust on center response');
% 
% offcenter = I2 - I1;
% num = find(offcenter < 0);
% offcenter(num) = 0;
% figure(16);
% imshow(offcenter);
% title('size a response off center neuron');
% figure(17);
% mesh(offcenter)
% title('Visualization of off center neuron');
% ff = offcenter;
% ff = ff - min(min(ff));  %subtract each pixel by the global min of the image.
% ff = ff / max(max(ff));  %divide each resulting pixel by the max of the image.
% tempp = ff;
% figure(18);
% imshow(tempp);
% title('adjust off center response');





I = imread('./imageshw1/hg1.jpg');
image = im2double(I);
gray = rgb2gray(image);

for i = 1:0.1:2
    % h is filter, aka receptive field
    hs1 = fspecial('log',20,i); % center-off
    hs11 = fspecial('log',20,i*1.75);%center-off
    
    %normalize contrast
    c = filter2(hs1,gray);
    c = c - min(min(c));  %subtract each pixel by the global min of the image.
    c = c / max(max(c));  %divide each resulting pixel by the max of the image.
    I1 = c;
    
    cc = filter2(hs11,gray);
    cc = cc - min(min(cc));  %subtract each pixel by the global min of the image.
    cc = cc / max(max(cc));  %divide each resulting pixel by the max of the image.
    I2 = cc;
 
    oncenter = I1 - I2;
    index = find(oncenter < 0);
    oncenter(index) = 0;
    thresh_on = max(max(oncenter))*0.03;
    result = thresh(thresh_on,oncenter);
    
    
    oo = result;
    oo = oo - min(min(oo));  %subtract each pixel by the global min of the image.
    oo = oo / max(max(oo));  %divide each resulting pixel by the max of the image.
    temp = oo;
    figure(10*i)
    imshow(temp);
    title('adjust on center response');
    
    offcenter = I2 - I1;
    num = find(offcenter < 0);
    offcenter(num) = 0;
    
    
    ff = offcenter;
    ff = ff - min(min(ff));  %subtract each pixel by the global min of the image.
    ff = ff / max(max(ff));  %divide each resulting pixel by the max of the image.
    tempp = ff;

end


% %% Hermann grid illusion
% 
% I = imread('./imageshw1/hg1.jpg');
% image = im2double(I);
% gray = rgb2gray(image);
% 
% for i = 1:30
%     % h is filter, aka receptive field
%     hs1 = fspecial('log',20,i); % center-off
%     hs11 = fspecial('log',20,i*1.75);%center-off
%     
%     %normalize contrast
%     c = filter2(hs1,gray);
%     c = c - min(min(c));  %subtract each pixel by the global min of the image.
%     c = c / max(max(c));  %divide each resulting pixel by the max of the image.
%     I1 = c;
%     
%     cc = filter2(hs11,gray);
%     cc = cc - min(min(cc));  %subtract each pixel by the global min of the image.
%     cc = cc / max(max(cc));  %divide each resulting pixel by the max of the image.
%     I2 = cc;
%  
%     oncenter = I1 - I2;
%     index = find(oncenter < 0);
%     oncenter(index) = 0;
%     
%     
%     oo = oncenter;
%     oo = oo - min(min(oo));  %subtract each pixel by the global min of the image.
%     oo = oo / max(max(oo));  %divide each resulting pixel by the max of the image.
%     temp = oo;
%     figure(i)
%     imshow(temp);
%     title('adjust on center response');
%     
%     offcenter = I2 - I1;
%     num = find(offcenter < 0);
%     offcenter(num) = 0;
%     
%     
%     ff = offcenter;
%     ff = ff - min(min(ff));  %subtract each pixel by the global min of the image.
%     ff = ff / max(max(ff));  %divide each resulting pixel by the max of the image.
%     tempp = ff;
% 
% end