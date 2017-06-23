filename = 'Passionfruit_LUT';

%% Colourmap specifications:
   Fs = 256;                   % total samples (colormap bins)
   dt = 1/Fs;                   % bin-width
   t = (0:dt:1-dt)';     % array of samples
   
%% Create channels:
   Fc = 0.5;                     % frequency, set to half a period
 
    %r = 0.5 * (sin(2*pi*Fc *t) + 1);

    r = sigmf(t,[7 0.3]);
    g = 0.5 * (-cos(2*pi*Fc*t) + 1);
    b = linspace(1,0,Fs)';

%     tt = 0.5 * (tan(2*pi*Fc*t) + 1);
%     plot(t,tt);
    
% generate a brightness gradient
BrightnessMin=0.5;
BrightnessMax=1;
gs_mask_r = linspace(BrightnessMin,BrightnessMax,Fs)';
gs_mask_g = linspace(BrightnessMin,BrightnessMax,Fs)';
gs_mask_b = (3 .^(10*t) / (3^10*t(end)));
b2 = (t .^0.2);

r = r .* gs_mask_r;
g = g .* gs_mask_g;
% b = (g + (b2 .* b + gs_mask_b)/2); % purple
% b = (b2 .* b + gs_mask_b)/2; % golden
b = 1.3 * (b2 .* b + gs_mask_b);

% ff = g + b;
% plot(t,ff);
  
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
   cmap(cmap > 1) = 1; % flatten saturated
   
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