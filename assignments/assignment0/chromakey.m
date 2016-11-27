
%mov = VideoReader('me3.webm');
nFrames = 162%mov.NumberOfFrames;

for i = 1:1%nFrames 
   name = ['me/frame' num2str(i) '.jpg'];
   frame = imread(name); 
   ycbcr =  rgb2ycbcr(frame);
   figure,imshow(ycbcr(:,:,2));
   figure,imshow(ycbcr(:,:,3));
    
   
   %{
    for p = 1:size(frame,1)
    for q = 1:size(frame,2)
        
        if((i(p,q,1) > 110 && i(p,q,2) > 110 && i(p,q,3) > 110 && i(p,q,1) < 200 && i(p,q,2) < 200 && i(p,q,3) < 200))
            b(p+x,q,:) = i(p,q,:);
        end
        
    end
    %}
end
%end