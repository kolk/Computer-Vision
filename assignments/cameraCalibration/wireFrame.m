I = imread('measurements.jpg');
imgEstimated = imgEst;
imshow(I);
hold on;
for i = 1:size(imgEst,1)
   plot(imgEstimated(i,1), imgEstimated(i,2), 'r*', imgPts(i,1), imgPts(i, 2), 'b*');  
end

legend('Estimated Points','Corner Points')

%wall = imgEstimated(1:15,:);

% [sortX, sortXind] = sort(wall(:,1));
% i = 1;
% n = size(sortX,1);
% while i < n
%    indx = intersect(find(sortX < (sortX(i) + 80)), find(sortX >= sortX(i)));
%    plot(wall(sortX(indx)), wall(sortXind(indx),2),'r-');
% %    [sortX, sortXind] = sort(imgEstimated(sortYind(indx),1));
% %    %imgEstimated(sortYind(indx),:)
% %    %plot(imgEstimated(sortX), sortY(indx), 'r-');
%     i = i + size(indx,1);
%    
% end

% % % % % [sortY, sortYind] = sort(wall(:,2));
% % % % % i = 1;
% % % % % n = size(sortY,1);
% % % % % while i < n
% % % % %    
% % % % %    indx = intersect(find(sortY < (sortY(i) + 50)), find(sortY >= sortY(i)));
% % % % %    plot(wall(sortYind(indx),1), sortY(indx),'r-');
% % % % % %    [sortX, sortXind] = sort(imgEstimated(sortYind(indx),1));
% % % % % %    %imgEstimated(sortYind(indx),:)
% % % % % %    %plot(imgEstimated(sortX), sortY(indx), 'r-');
% % % % %     i = i + size(indx,1);
% % % % %    
% % % % % end





% for i = 1:size(imgEstimated,1)
%     currentVec = repmat(imgEstimated(i,:),size(imgEstimated,1),1);
%     
%     %[~, indx] = sort(sqrt(sum((imgEstimated - currentVec).^2,2)));
%     sum(imgEstimated - currentVec,2) < 
%     plot([imgEstimated(i,1), imgEstimated(indx(2),1)], [imgEstimated(i,2), imgEstimated(indx(2),2)], 'r-');
%     plot([imgEstimated(i,1), imgEstimated(indx(3),1)], [imgEstimated(i,2), imgEstimated(indx(3),2)],'r-');
%     plot([imgEstimated(i,1), imgEstimated(indx(4),1)], [imgEstimated(i,2), imgEstimated(indx(4),2)],'r-');
% end

floor = imgEstimated(15:size(imgEstimated,1),:);
for i = 1:size(floor, 1)
    minR = 10000;
    minX = i;
    for j = i+1:size(floor,1)
        ratio = (floor(j,2) - floor(i,2))/(floor(j,1) - floor(i,1));
        if ratio -102/13 < minR
            minR = ratio - 102/13;
            minX = j;
        end
    end
    plot([floor(i,1), floor(minX,1)], [floor(i,2), floor(minX,2)], 'r-');
end


for i = 1:size(floor, 1)
    minR = 10000;
    minX = i;
    for j = i+1:size(floor,1)
        ratio = (floor(j,2) - floor(i,2))/(floor(j,1) - floor(i,1));
        if ratio -(307-357)/(453-298) < minR
            minR = ratio - (307-357)/(453-298);
            minX = j;
        end
    end
    plot([floor(i,1), floor(minX,1)], [floor(i,2), floor(minX,2)], 'r-');
end