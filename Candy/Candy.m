function cmap_Candy = Candy(ColourBins,BrightnessMin,BrightnessMax)
% Generates a colormap (cmap_Candy)
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
    % for Candy:        Min=0.5 Max=1.0
    % for CandyBright:  Min=1.0 Max=1.0 Use the regular LUT for printing on dark backgrounds
    % for Candy_inv:    Min=1.0 Max=0.5 Use the inverted LUT for printing on
    % white backgrounds, i.e. construct your image with a black background and
    % invert the image afterwards. Works nice with SMLM

    dt = 1/ColourBins;
    t = (0:dt:1-dt)';

    % Create channels:
    r = 0.5 * (sin(pi * t) + 1);
    g = 0.5 * (-cos(pi * t) + 1);
    b = linspace(1,0,ColourBins)';

    % brightness gradient
    gs_mask = linspace(BrightnessMin,BrightnessMax,ColourBins)';

    r = r .* gs_mask;
    g = g .* gs_mask;
    b = b .* gs_mask;
    
    cmap_Candy = horzcat(r,g,b);