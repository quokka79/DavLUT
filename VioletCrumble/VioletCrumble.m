function cmap_VioletCrumble = VioletCrumble(ColourBins,BrightnessMin,BrightnessMax)
% Generates a colormap (cmap_VioletCrumble)
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
        BrightnessMin = 0.2;
        BrightnessMax = 1;
    end

    dt = 1/ColourBins;
    t = (0:dt:1-dt)';

    % Create channels:
    r = 0.5 * (cos(pi * t - pi) + 1);
    g = 0.5 * (-sin(1.5 * pi * t) + 1);
    b = linspace(1,0,ColourBins)';

    % brightness gradient
    gs_mask = linspace(BrightnessMin,BrightnessMax,ColourBins)';
    g = g .* gs_mask;

    cmap_VioletCrumble = horzcat(r,g,b);
