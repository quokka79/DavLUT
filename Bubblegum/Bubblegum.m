function cmap_Bubblegum = Bubblegum(ColourBins,BrightnessMin,BrightnessMax)
% Generates a colormap (cmap_Bubblegum)
%
% When called without any arguments, defaults are applied:
%
%   ColourBins     Total number of LUT indicies to cover. MATLAB usually
%                  uses 64 but more gives a smoother gradient.
%
%   BrightnessMin  Brightness of the lowest LUT index will be reduced to
%                  this value.
%
%   BrightnessMax  From BrightnessMin, the intensity will scale linearly up
%                  to BrightnessMax.

    if nargin < 1
        ColourBins = 256;
    end

    if nargin < 2
        BrightnessMin = 1;
        BrightnessMax = 1;
    end

    LUT_idx = 0:(ColourBins-1);

    % red
    Amplitude_Red = 1;
    Freq_Red = 1 / ((ColourBins - 1) * Amplitude_Red);
    Values_Red = cos(2 * pi * Freq_Red * LUT_idx)';
    Values_Red = (Values_Red - min(Values_Red)) / (max(Values_Red) - min(Values_Red)) ;

    % green
    Amplitude_Grn = 4;
    Freq_Grn = 1 / ((ColourBins - 1) * Amplitude_Grn);
    Values_G = 1 + cos(2 * pi * Freq_Grn * LUT_idx)';
    Values_G = (Values_G - min(Values_G)) / (max(Values_G) - min(Values_G)) ;

    % blue
    Values_B = repmat(0.75,ColourBins,1);

    % brightness gradient
    gs_mask = repmat(linspace(BrightnessMin,BrightnessMax,ColourBins)',1,3);
    cmap_Bubblegum = flipud(horzcat(Values_Red,Values_G,Values_B));
    cmap_Bubblegum = gs_mask .* cmap_Bubblegum;
