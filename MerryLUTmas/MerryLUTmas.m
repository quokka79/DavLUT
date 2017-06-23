function cmap_DavLUT = DavLUTgen(ColourBins,BrightnessMin,BrightnessMax)
% Generates a colormap (cmap_DavLUT) which should be colorblind-accessible
% and greyscale compatible.
%
% When called without any arguments, defaults are applied:
%
%   ColourBins     Total number of LUT indicies to cover. MATLAB usually
%                  uses 64 but more gives a smoother gradient.
%                  Default = 256 bins
%
%   BrightnessMin  Brightness of the lowest LUT index will be reduced to
%                  this value.
%                  Default = 0.4
%
%   BrightnessMax  From BrightnessMin, the intensity will scale linearly up
%                  to BrightnessMax.
%                  Default = 1.0

if nargin < 1
    ColourBins = 256;
end

if nargin < 2
    BrightnessMin = 0.2;
    BrightnessMax = 1;
end

% if nargin < 3 || nargin > 3
%     error('Need to supply 0, 1, or 3 arguments!');
% end

LUT_idx = 0:(ColourBins-1);

% generate the red
Amplitude_Red = 1;
Freq_Red = 1 / ((ColourBins - 1) * Amplitude_Red);
Values_Red = cos(2 * pi * Freq_Red * LUT_idx)';
Values_Red = (Values_Red - min(Values_Red)) / (max(Values_Red) - min(Values_Red)) ;
% gs_mask_red = repmat(linspace(BrightnessMin,0.75*BrightnessMax,ColourBins)',1,1);
% Values_Red = gs_mask_red .* Values_Red;

% generate the green
Amplitude_Grn = 3;
Freq_Grn = 1 / ((ColourBins - 1) * Amplitude_Grn);
Values_G = 1 + cos(2 * pi * Freq_Grn * LUT_idx)';
Values_G = (Values_G - min(Values_G)) / (max(Values_G) - min(Values_G)) ;

% generate the blue
Amplitude_Blu = 3;
Freq_Blue = 1/(ColourBins*Amplitude_Blu);
Values_B = 1 - sin(2 * pi * Freq_Blue * LUT_idx)';
Values_B = 0.75*((Values_B - min(Values_B)) / (max(Values_B) - min(Values_B))) ;

% generate a brightness gradient
gs_mask = repmat(linspace(BrightnessMin,BrightnessMax,ColourBins)',1,3);


cmap_DavLUT = flipud(horzcat(Values_Red,Values_G,Values_B));
cmap_DavLUT = gs_mask .* cmap_DavLUT;

% % Show RGB values before any intensity correction
% figure
% hold on
% plot(1:64,CustomColorMap(:,1),'r')
% plot(1:64,CustomColorMap(:,2),'g')
% plot(1:64,CustomColorMap(:,3),'b')
% 
% title('DaveMap')
% xlabel('Bin ID')
% ylabel('Intensity')
% axis([0 255 0 1])

