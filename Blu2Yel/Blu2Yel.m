filename = 'Blu2Yel_LUT';

%% Colourmap specifications:
   Fs = 256;                   % total samples (colormap bins)
   dt = 1/Fs;                   % bin-width
   t = (0:dt:1-dt)';     % array of samples
   
%% Create channels:
   Fc = 0.5;                     % frequency, set to half a period
 
   r = 0.5 * (cos(2*pi*Fc*t - pi) + 1);
   g = 0.5 * (cos(2*pi*Fc*t - pi) + 1);
   % g_old = 0.5 * (-sin(2*pi*(Fc * 1.5) *t) + 1);
   b = linspace(1,0,Fs)';

   
%    % Plot the original signal versus time:
%    figure;
%    plot(t,g,'g');
%    hold on
%    plot(t,r,'r');
%    xlabel('time (in seconds)');
%    title('Signal versus Time');
%    zoom xon;
%    plot(t,b,'b');
   
   cmap = horzcat(r,g,b);
   
   % generate a brightness gradient
   BrightnessMin=0.2;
   BrightnessMax=1;
   
%    gs_mask = repmat(linspace(BrightnessMin,BrightnessMax,Fs)',1,3);
%    cmap = cmap .* gs_mask;
gs_mask = linspace(BrightnessMin,BrightnessMax,Fs)';

% cmap(:,1) = cmap(:,1) .* gs_mask;
cmap(:,2) = cmap(:,2) .* gs_mask;
% cmap(:,3) = cmap(:,3) .* gs_mask;
   
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