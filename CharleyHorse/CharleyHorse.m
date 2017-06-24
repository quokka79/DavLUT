function cmap_CharleyHorse = CharleyHorse(ColourBins,BrightnessMin,BrightnessMax)
% Generates a colormap (cmap_CharleyHorse)
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
        BrightnessMin = 0.5;
        BrightnessMax = 1;
    end

    dt = 1/ColourBins;
    t = (0:dt:1-dt)';

    % Create channels:
    r = sigmf(t,[7 0.3]);
    g = 0.5 * (-cos(pi * t) + 1);
    b = linspace(1,0,ColourBins)';

    % generate a brightness gradient
    gs_mask_rg = linspace(BrightnessMin,BrightnessMax,ColourBins)';
    gs_mask_b = (3 .^(10*t) / (3^10*t(end)));
    b2 = (t .^0.2);

    r = r .* gs_mask_rg;
    g = g .* gs_mask_rg;
    % b = (g + (b2 .* b + gs_mask_b)/2); % purple
    % b = (b2 .* b + gs_mask_b)/2; % golden
    b = 1.3 * (b2 .* b + gs_mask_b);

    cmap_CharleyHorse = horzcat(r,g,b);
    cmap_CharleyHorse(cmap_CharleyHorse > 1) = 1; % flatten saturated