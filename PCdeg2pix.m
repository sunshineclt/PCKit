function pixs = PCdeg2pix(degree, inch, vdist)
% deg2pix is a function that translate degree to pixel
% @param degree degree that need translating
% @param inch(monitor size)
% @param vdist viewing distance(in cm)
[width, height] = Screen('WindowSize', 0);
screenWidth = inch * 2.54 / sqrt(1 + (height / width)^2);
pix = screenWidth / width;
pixs = round(2*tan((degree/2)*pi/180) * vdist / pix);