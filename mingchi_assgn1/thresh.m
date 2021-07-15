function result = thresh(threshold,im)
result = im;
m = find(im > threshold);
result(m) = 1;
n = find(im < threshold);
result(n) = 0;
end