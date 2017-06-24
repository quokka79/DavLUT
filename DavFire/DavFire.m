function cmap_DavFire = DavFire(ColourBins,BrightnessMin,BrightnessMax)
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

    dt = 1/ColourBins;
    t = (0:dt:1-dt)';

    % Create channels
    r = 0.5 * (cos(pi * t - pi) + 1);
    g = 0.5 * (-sin(pi * t) + 1);
    b = linspace(1,0,ColourBins)';

    % brightness gradient
    gs_mask = linspace(BrightnessMin,BrightnessMax,ColourBins)';
    r = r .* gs_mask;
    g = g .* gs_mask;
    b = b .* gs_mask;
    
    cmap_DavFire = horzcat(r,g,b);