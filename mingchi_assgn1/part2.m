%% Hermann grid illusion

I = imread('./imageshw1/hg1.jpg');
image = im2double(I);
gray = rgb2gray(image);

for i = 2:7
    % h is filter
    hs1 = fspecial('log',5*i,3); 
    hs11 = fspecial('log',5*i,3*1.75);
    
    %normalize contrast
    c = filter2(hs1,gray);
    c = c - min(min(c));  
    c = c / max(max(c));  
    I1 = c;
    
    cc = filter2(hs11,gray);
    cc = cc - min(min(cc));  
    cc = cc / max(max(cc));  
    I2 = cc;
    
    %on center response is [I1 - I2]+
    oncenter = I1 - I2;
    index = find(oncenter < 0);
    oncenter(index) = 0;
    
   
    oo = oncenter;
    oo = oo - min(min(oo));  %subtract each pixel by the global min of the image.
    oo = oo / max(max(oo));  %divide each resulting pixel by the max of the image.
    temp = oo;
    figure(5*i)
    imshow(temp);
    title('adjust on center response');
    
    %off center response is [I2 - I1]+
    offcenter = I2 - I1;
    num = find(offcenter < 0);
    offcenter(num) = 0;
    
    
    ff = offcenter;
    ff = ff - min(min(ff));  %subtract each pixel by the global min of the image.
    ff = ff / max(max(ff));  %divide each resulting pixel by the max of the image.
    tempp = ff;
    figure(5*i+1)
    imshow(tempp);
    title('adjust off center response');

end

%% attempt 2
I = imread('./imageshw1/hg1.jpg');
image = im2double(I);
gray = rgb2gray(image);

for i = 1:0.2:3
    % h is filter, aka receptive field
    hs1 = fspecial('log',20,i); 
    hs11 = fspecial('log',20,i*1.75);
    
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
    figure
    imshow(temp);
    title('adjust on center response');
    
    offcenter = I2 - I1;
    num = find(offcenter < 0);
    offcenter(num) = 0;
    thresh_off = max(max(offcenter))*0.03;
    result = thresh(thresh_off,offcenter);
    
    ff = result;
    ff = ff - min(min(ff));  %subtract each pixel by the global min of the image.
    ff = ff / max(max(ff));  %divide each resulting pixel by the max of the image.
    tempp = ff;
    figure
    imshow(tempp);
    title('adjust off center response');

end