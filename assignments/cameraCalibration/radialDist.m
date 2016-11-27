I = imread('IMG_5459.JPG');

a = 0.0;%-0.007715;
b = 0.026731;
c = 0.0;
d = 1.0 - a - b - c; % 1 for no scale of image

gray = rgb2gray(I);
gray = imresize(gray, 0.5);
rows = size(gray,1);
cols = size(gray,2);
output = zeros(rows, cols);
for x = 1:cols
    for y = 1:rows
        d = min(rows, cols) / 2;
        centerX = cols/2;
        centerY = rows/2;
        distXDest = (x - centerX) / d;
        distYDest = (y - centerY) / d;
        distDest = sqrt(distXDest^2 + distYDest^2);
        distSource = (a* distDest^3 + b* distDest^2 + c*distDest^1 + d) *distDest;
        scale = abs(distDest / distSource);
        srcX = round(centerX + (distXDest * scale * d));
        srcY = round(centerY + (distYDest * scale * d));
        srcX = min(srcX, cols);
        srcY = min(srcY, rows);
        output(y, x)  = gray(srcY, srcX);
    end
end
figure;
imshow(mat2gray(output));