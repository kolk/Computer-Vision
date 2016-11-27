function I2 = radial(I, k, varargin)

p = inputParser;
p.CaseSensitive = false;
addRequired(p,'I',@isnumeric);
addRequired(p,'k',@isnumeric);
defaultFtype = 4;
defaultBorder = 'crop';
defaultInterpolation = 'cubic';
defaultPadmethod = 'fill';
defaultCenter = [0,0];
validBorder = {'fit','crop'};
validInterpolation = {'cubic','linear', 'nearest'};
validPadmethod = {'bound','circular', 'fill', 'replicate', 'symmetric'};
checkBorder = @(x) any(validatestring(x,validBorder));
checkInterpolation = @(x) any(validatestring(x,validInterpolation));
checkPadmethod = @(x) any(validatestring(x,validPadmethod));
addParamValue(p,'bordertype',defaultBorder,checkBorder);
addParamValue(p,'interpolation',defaultInterpolation,checkInterpolation);
addParamValue(p,'padmethod',defaultPadmethod,checkPadmethod);
addParamValue(p,'ftype',defaultFtype,@isnumeric);
addParamValue(p,'ImCenter',defaultCenter,@isnumeric);
parse(p,I,k,varargin{:});
imcenter = p.Results.ImCenter;
I2 = radialCorrect(I,k);
end

    function I3 = radialCorrect(I,k)
   
    [M N]=size(I);
     center = [0 0];
    [xi,yi] = meshgrid(1:N,1:M);
    xt = xi(:) - center(1);
    yt = yi(:) - center(2);
    [theta,r] = cart2pol(xt,yt);
    R = sqrt(center(1)^2 + center(2)^2);
    r = r/R;
     s = r.*(1+k.*(r.^2));
    s2 = s * R;
    [ut,vt] = pol2cart(theta,s2);
    u = reshape(ut,size(xi)) + center(1);
    v = reshape(vt,size(yi)) + center(2);
    tmap_B = cat(3,u,v);
    resamp = makeresampler(p.Results.interpolation, p.Results.padmethod);
    I3 = tformarray(I,[],resamp,[2 1],[1 2],[],tmap_B,255);
    end


