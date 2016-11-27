function [p, K, R, C, imgEstimated] = ransac2(img2Pts, img1Pts, I1, I2)
close all;

err = 0;
mnErr = 5000000;
p = zeros(3,3);

m = size(img1Pts,1)
n = randperm(m);

im1 = img1Pts(n,:);
im2 = img2Pts(n,:);
choseni = 1;

ptsChosenIndx = [];
outlierIn = [];
for iter = 1:10
    
   indices = randperm(m, 4);
   while((ismember(indices, outlierIn) == repmat([1], 1, 4)))
       indices = randperm(m,4);
       oulierIn
   end
   imP1 = im1(indices,:);
   imP2 = im2(indices, :);
    P = dlt(imP2, imP1);
   estimatedI2 = P*im1';
   estimatedI2 = round(estimatedI2 ./ repmat(estimatedI2(3,:),3,1))';
   diff = im2 - estimatedI2;
   
   thresh = [5, 5, 0];%max(diff)*0.7;
  
   inlierIndices = diff < repmat([thresh], m, 1)
   inlierIndices = find(inlierIndices > 0);
   outlierIndices = find(inlierIndices < 0)

   ptsChosenIndx = unique([ptsChosenIndx; inlierIndices]);
   outlierIn = unique([outlierIn; outlierIndices]);
   err = sum(sqrt(sum((im2 - estimatedI2).^2,2)))/(m*3);
   if mnErr >= err
       p = P;
       mnErr = err;
       choseni = iter;
   end
   
   
% figure;
% imshow(I2);
% hold on;
% plot(im2(:,1), im2(:,2), 'r*', 'LineWidth',3);
% plot(estimatedI2(:,1), estimatedI2(:,2), 'bo', 'LineWidth',2);  

end




outlierIndices
mnErr
'finalP'
p

ptsChosenIndx = unique(ptsChosenIndx);
max(ptsChosenIndx)
%img1Pts = img1Pts(ptsChosenIndx,:);
%img2Pts = img2Pts(ptsChosenIndx,:);
estimatedImg = p*img1Pts';
imgEstimated = round(estimatedImg ./ repmat(estimatedImg(3,:),3,1))';
H = p(:,1:3);
invH = inv(H);
[invR, invK] = qr(invH);
 R = invR'
 K = inv(invK)
 C = invH*p(:,3)


figure;
imshow(I2);
hold on;
plot(img2Pts(:,1), img2Pts(:,2), 'r*', 'LineWidth',5);
plot(imgEstimated(:,1), imgEstimated(:,2), 'yo', 'LineWidth',2);  
legend('actual Points','estimated points')  
end