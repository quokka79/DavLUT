filename = 'Candy_LUT';

do_inverted = false;

%% Colourmap specifications:
   Fs = 64;                   % total samples (colormap bins)
   dt = 1/Fs;                   % bin-width
   t = (0:dt:1-dt)';     % array of samples
   
%% Create channels:
   Fc = 0.5;                     % frequency, set to half a period
   
   r = 0.5 * (sin(2*pi*Fc *t) + 1);
   g = 0.5 * (-cos(2*pi*Fc*t) + 1);
   b = linspace(1,0,Fs)';

% generate a brightness gradient
% for Candy:        Min=0.5 Max=1.0
% for CandyBright:  Min=1.0 Max=1.0 Use the regular LUT for printing on dark backgrounds
% for Candy_inv:    Min=1.0 Max=0.5 Use the inverted LUT for printing on
% white backgrounds, i.e. construct your image with a black background and
% invert the image afterwards, such us SMLM reconstructions...
BrightnessMin=1;
BrightnessMax=1;

gs_mask = linspace(BrightnessMin,BrightnessMax,Fs)';

r = r .* gs_mask;
g = g .* gs_mask;
b = b .* gs_mask;

if do_inverted
    r = 1 - r;
    g = 1 - g;
    b = 1 - b;
    filename = [filename, '_inverted'];
end
   
   % Plot the channels
   figure('Position',[100 100 1200 400]);
   subplot(1,2,1)
   plot(t,r,'r');
   hold on
   plot(t,g,'g');
   xlabel('Colourmap Bin');
   ylabel('Intensity');
   title(filename);
   zoom xon;
   plot(t,b,'b');
   axis square
   
   cmap = horzcat(r,g,b);
   
   subplot(1,2,2)
    surf(peaks(500), 'EdgeColor', 'none')
    colormap(cmap);
    axis square tight
    colorbar
     axis square
     saveas(gcf,[filename,'.png'])
     
% convert to 8-bit RGB values (n.b. check LUT_bins matches your intent!
% i.e. set to 256 for 8-bit indexed images)
CustomColorMap_8bit = floor(cmap * 255);
csvwrite([filename,'.csv'],CustomColorMap_8bit);