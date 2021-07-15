function newimg = con_norm(image, low, high)
[nor noc] = size(image);
tobesubtracted = low * ones(nor, noc);
tobedivided = (high - low) * ones(nor, noc);
newimg = (image - tobesubtracted) ./ tobedivided;

end