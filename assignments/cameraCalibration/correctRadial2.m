function I2 = correctRadial2(I, k, varargin)
%I = imread('distort.jpg');
%k = 0.1;


     for i=1:3
       I2(:,:,i) = imdistcorrect(I(:,:,i),k, [0,0]);
     end   
end

    function I3 = imdistcorrect(I,k, center)
    % Determine the size of the image to be distorted
    [M N]=size(I);
    %If Center is (0,0) then we use the center of the image, otherwise it
    %should will be the coordintes of the image center
    center = [round(N/2) round(M/2)];

    %center = [1592,656];
    % Creates N x M (#pixels) x-y points
    [xi,yi] = meshgrid(1:N,1:M);
    % Creates converst the mesh into a colum vector of coordiantes relative to
    % the center
    xt = xi(:) - center(1);
    yt = yi(:) - center(2);
    % Converts the x-y coordinates to polar coordinates
    [theta,r] = cart2pol(xt,yt);
    % Calculate the maximum vector (image center to image corner) to be used
    % for normalization
    R = sqrt(center(1)^2 + center(2)^2);
    % Normalize the polar coordinate r to range between 0 and 1 
    r = r/R;
    % Aply the r-based transformation
    
    s = r.*(1./(1+k.*(r.^2)));
    % un-normalize s
    s2 = s * R;
      
    % Convert back to cartesian coordinates
    [ut,vt] = pol2cart(theta,s2);
  
    u = reshape(ut,[M N]) + center(1);
    v = reshape(vt,[M N]) + center(2);
    tmap_B = cat(3,u,v);
    resamp = makeresampler('cubic', 'fill');
    I3 = tformarray(I,[],resamp,[2 1],[1 2],[],tmap_B,255);
    end

%end