function [ hhn, shn ] = rgb2hsnorm( I )
%RGB2HSNORM Converts and normalizes a RGB image into HS.
%   This function takes an image I as an argument, and returns the
%   normalized hue and saturation histograms.

I_HS = rgb2hsv(I);
hhn = imhist(I_HS(:,:,1)/trapz(I_HS(:,:,1)));
shn = imhist(I_HS(:,:,2)/trapz(I_HS(:,:,2)));

end