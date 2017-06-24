function cmap_DavLUT = DavLUT(ColourBins,BrightnessMin,BrightnessMax)
% Generates a colormap (cmap_DavLUT) which should be colorblind-accessible
% and reasonably greyscale compatible (with BrightnessMin=0.5).
%
% When called without any arguments, defaults are applied:
%
%   ColourBins     Total number of LUT indicies to cover. MATLAB usually
%                  uses 64 but more gives a smoother gradient.
%
%   BrightnessMin  Brightness of the lowest LUT index will be reduced to
%                  this value.
%                  For something like a scatter plot, it's good to set this
%                  to value like 1.0 so that you can see all the points
%                  easily. However this does demolish the greyscale
%                  contrast.
%
%   BrightnessMax  From BrightnessMin, the intensity will scale linearly up
%                  to BrightnessMax.

if nargin < 1
    ColourBins = 256;
end

if nargin < 2
    BrightnessMin = 0.5;
    BrightnessMax = 1;
end

LUT_idx = 0:(ColourBins-1);

% red
Amplitude_Red = 1;
Freq_Red = 1 / ((ColourBins - 1) * Amplitude_Red);
Values_R = cos(2 * pi * Freq_Red * LUT_idx)';
Values_R = (Values_R - min(Values_R)) / (max(Values_R) - min(Values_R)) ;

% green
Amplitude_Grn = 4;
Freq_Grn = 1 / ((ColourBins - 1) * Amplitude_Grn);
Values_G = 1 + cos(2 * pi * Freq_Grn * LUT_idx)';
Values_G = (Values_G - min(Values_G)) / (max(Values_G) - min(Values_G)) ;

% blue
Amplitude_Blu = 4;
Freq_Blue = 1/(ColourBins*Amplitude_Blu);
Values_B = 1 +sin(2 * pi * Freq_Blue * LUT_idx)';
Values_B = (Values_B - min(Values_B)) / (max(Values_B) - min(Values_B)) ;

% generate a brightness gradient
gs_mask = repmat(linspace(BrightnessMin,BrightnessMax,ColourBins)',1,3);

cmap_DavLUT = flipud(horzcat(Values_R,Values_G,Values_B));
cmap_DavLUT = gs_mask .* cmap_DavLUT;
















